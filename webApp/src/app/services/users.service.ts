import { Injectable } from '@angular/core';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError, tap } from 'rxjs/operators';
import { UserModel } from '../models/user.model';


const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type':  'application/json'
  })
};


@Injectable({
  providedIn: 'root'
})
export class UsersService {

  private _url = 'http://localhost:8080/api/users/';
  constructor(private http: HttpClient) { }

  private extractData(res: Response) {
    let body = res;
    return body || { };
  }

  getById(id): Observable<any> {
    return this.http.get(this._url + 'id/' + id).pipe(
      map(this.extractData),
      catchError(this.handleError<any>('no user by id'))
      );
  }

  getAll(): Observable<any> {
    return this.http.get(this._url + 'getAll').pipe(
      map(this.extractData),
      catchError(this.handleError<any>('getAll'))
      );
  }

  private handleError<T> (operation = 'operation', result?: T) {
		return (error: any): Observable<T> => {
	  
		  // TODO: send the error to remote logging infrastructure
		  console.error(error); // log to console instead
	  
		  // TODO: better job of transforming error for user consumption
		  console.log(`${operation} failed: ${error.message}`);
	  
		  // Let the app keep running by returning an empty result.
		  return of(result as T);
		};
	  }



}
