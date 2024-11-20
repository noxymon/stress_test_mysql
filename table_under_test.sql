create table if not exists table_under_test
(
    id                            bigint auto_increment
        primary key,
    account_id                    int                  null,
    transaction_date              date                 null,
    transaction_id                int                  null,
    to_account_id                 int                  null,
    credit                        decimal(50, 6)       null,
    debit                         decimal(50, 6)       null,
    balance                       decimal(50, 6)       null,
    reconcile_type_id             int                  null,
    created_at                    datetime             null,
    updated_at                    datetime             null,
    version                       int                  null,
    product_inventory_id          int                  null,
    adjustment_id                 int                  null,
    adjustment_type               varchar(255)         null,
    account_reconcile_id          int                  null,
    timestamp_ordering            datetime             null,
    closing_the_book_id           int                  null,
    transaction_account_line_id   int                  null,
    description                   text                 null,
    inventoriable_type            varchar(20)          null,
    is_from_inventory             tinyint(1) default 0 not null,
    is_contra_inventory_account   tinyint(1) default 0 not null,
    account_transaction_header_id bigint               null
)
    collate = utf8_unicode_ci;