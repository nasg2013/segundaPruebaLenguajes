import { EmptyResponsePipe } from './empty-response.pipe';

describe('EmptyResponsePipe', () => {
  it('create an instance', () => {
    const pipe = new EmptyResponsePipe();
    expect(pipe).toBeTruthy();
  });
});
