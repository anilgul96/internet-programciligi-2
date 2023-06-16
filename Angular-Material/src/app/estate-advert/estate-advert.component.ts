import { Component, TemplateRef, ViewChild } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { ilanlar } from '../models/ilanlar';
import { DataService } from '../data.service';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { kategoriler } from '../models/kategoriler';


@Component({
  selector: 'app-estate-advert',
  templateUrl: './estate-advert.component.html',
  styleUrls: ['./estate-advert.component.css']
})
export class EstateAdvertComponent {

  dataSource = new MatTableDataSource<ilanlar>();
  ilanlar: ilanlar = new ilanlar();
  kategoriler: kategoriler[] = [];


  displayedColumns: string[] = ["ilanAdi","ilanDetay","ilanFiyati","ilanResim", "actions"];

  constructor(private dataService: DataService, private dialog: MatDialog, private snackBar: MatSnackBar,private router: Router) { }

  @ViewChild('lessonDialog') lessonDialog!: TemplateRef<any>;
  @ViewChild('editLessonDialog') editLessonDialog!: TemplateRef<any>;

  ngOnInit() {
    this.getIlanlar();
    this.getKategoriler();
  }

  getKategoriler(): void {
    this.dataService.getKategoriler().subscribe(
      (response) => {
        this.kategoriler = response;
      },
      (error) => {
        console.log(error);
      }
    );
  }

  openDialog(): void {
    this.dialog.open(this.lessonDialog);
  }
  openEditDialog(kullanici: ilanlar): void {
    this.ilanlar = { ...kullanici }; // Seçilen kullanıcıyı düzenlemek için mevcut kullanıcı bilgilerini atayalım
    this.dialog.open(this.editLessonDialog);
  }

  getIlanlar(): void {
    this.dataService.getIlanlar().subscribe(
      (response) => {
        this.dataSource = new MatTableDataSource<ilanlar>(response);
      },
      (error) => {
        console.log(error);
      }
    );
  }

  addIlan() {
    this.dataService.postIlanlar(this.ilanlar).subscribe(
      response => {
        this.snackBar.open('Ilan başarıyla eklendi.', 'Kapat', {
          duration: 2000
        });
        this.dialog.closeAll();
         this.getIlanlar();
      },
      error => {
        console.error('Hata:', error);
      }
    );
  }




  updateIlan() {
    if (this.ilanlar.id) { // id tanımlıysa güncelleme işlemini gerçekleştir
      this.dataService.putIlanlar(this.ilanlar.id, this.ilanlar).subscribe(
        response => {
          this.snackBar.open('Kullanıcı başarıyla güncellendi.', 'Kapat', {
            duration: 2000
          });
          this.dialog.closeAll();
          this.getIlanlar(); // Kullanıcıları yeniden yükle
        },
        error => {
          console.error('Hata:', error);
        }
      );
    } else {
      console.error('Hata: Kullanıcı id tanımlı değil.'); // Hata durumunu ele al
    }
  }

  deleteIlan(id: number) {
    if (confirm('Dersi silmek istediğinize emin misiniz?')) {
      this.dataService.deleteIlan(id).subscribe(
        response => {
          console.log('Kategori silindi:', response);
          this.snackBar.open('Kategori başarıyla silindi.', 'Kapat', { duration: 2000 });
          this.getIlanlar();
        },
        error => {
          console.error('Hata:', error);
        }
      );
    }
  }



  

}
