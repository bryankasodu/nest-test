import { Controller, Get } from '@nestjs/common';
import { Account, AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getAccount(): Account[] {
    return this.appService.getAccount();
  }

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
}
