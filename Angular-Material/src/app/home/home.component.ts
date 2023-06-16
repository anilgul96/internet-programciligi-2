import { Component } from '@angular/core';
import { ilanlar } from '../models/ilanlar';
import { DataService } from '../data.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {
  ilanlar: ilanlar[] = [];

  constructor(private dataService: DataService) { }

  ngOnInit() {
    this.getIlanlar();
  }


  getIlanlar(): void {
    this.dataService.getIlanlar().subscribe(
      (response) => {
        this.ilanlar = response;
      },
      (error) => {
        console.log(error);
      }
    );
  }


}
