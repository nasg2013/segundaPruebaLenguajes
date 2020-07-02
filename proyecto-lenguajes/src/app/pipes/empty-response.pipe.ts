import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'emptyResponse'
})
export class EmptyResponsePipe implements PipeTransform {

  transform(value: string): string {
    
    if(!value){
      return 'Pendiente';
    }
    return value;
  }

}
