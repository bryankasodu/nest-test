import { Injectable } from '@nestjs/common';

export interface Account {
  account_id: number;
  account_name: string;
}

@Injectable()
export class AppService {
  private account: Account[] = [
    { account_id: 1, account_name: 'Gilbert'},
    { account_id: 2, account_name: 'Nicholas'},
  ];

  getAccount(): Account[] {
    return this.account;
  }

  getHello(): string {
    return 'Hello World!';
  }
}
