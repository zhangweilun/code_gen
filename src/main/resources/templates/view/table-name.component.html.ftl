<nb-card>
  <nb-card-header class="title-tools">
    <div>${table.clearRemark}</div>
    <div class="tools-btn-group">
      <button *ngIf="settings.actions.add"  class="btn btn-outline-success btn-icon with-margins"
              routerLink="${app.url.frontend}/new">
        <i class="nb-plus"></i>
      </button>
      <button *ngIf="settings.actions.delete"  class="btn btn-outline-danger btn-icon with-margins"
              (click)="onDeleteForSelect()"><i class="nb-trash"></i></button>
    </div>
  </nb-card-header>

  <nb-card-body>
    <div class="row filter-group">
      <div class="col-md-4 col-sm-4">
        <div class="input-group">
          <input class="form-control " type="text"
                 [(ngModel)]="queryFilter['${searchColumnName}']"
                 placeholder="按字段{{ '${table.lowerCamelCaseName}.${searchColumnName}' | translate }}搜索..." (keyup)="onSearch(queryFilter['${searchColumnName}'], '${searchColumnName}')">
        </div>
      </div>
    </div>
    <div>
      <ngx-alert></ngx-alert>
      <ngx-alert-error></ngx-alert-error>
    </div>

    <ng2-smart-table
        [settings]="settings"
        [source]="source"
        (delete)="onDelete($event)"
        (detail)="onDetail($event)"
        (edit)="onEdit($event)"
        (userRowSelect)="onSelect($event)">
    </ng2-smart-table>
  </nb-card-body>
  <nb-card-footer class="page-warp">
    <div class="dropdown ghost-dropdown" ngbDropdown>
      <button class="btn btn-primary" type="button" ngbDropdownToggle
              ngxTranslate="global.item-count"
              translateValues="{first: {{source.first()}}, second: {{source.second()}}, total: {{source.count()}}}">
      </button>
      <ul class="dropdown-menu" ngbDropdownMenu>
        <li class="dropdown-item" *ngFor="let size of settings.pager.perPages"
            (click)="changePageSize(size)">{{size}}
        </li>
      </ul>
    </div>
  </nb-card-footer>
</nb-card>