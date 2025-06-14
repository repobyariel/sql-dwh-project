/*
Stored Procedure: Load Bronze layer

(CSV Source -> Bronze)

Usage:
	EXEC bronze.load_bronze;

*/

create or alter procedure bronze.load_bronze as
begin
	declare @batch_start_time datetime, @batch_end_time datetime
	begin try

		set @batch_start_time = getdate();

		truncate table bronze.crm_cust_info;
		bulk insert bronze.crm_cust_info
		from 'C:\Users\Ariel\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);


		truncate table bronze.crm_prd_info;
		bulk insert bronze.crm_prd_info
		from 'C:\Users\Ariel\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);


		truncate table bronze.crm_sales_details;
		bulk insert bronze.crm_sales_details
		from 'C:\Users\Ariel\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);


		truncate table bronze.erp_cust_az12;
		bulk insert bronze.erp_cust_az12
		from 'C:\Users\Ariel\Downloads\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);


		truncate table bronze.erp_loc_a101;
		bulk insert bronze.erp_loc_a101
		from 'C:\Users\Ariel\Downloads\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);


		truncate table bronze.erp_px_cat_g1v2;
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\Users\Ariel\Downloads\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);


		set @batch_end_time = getdate();
		print '>> loading bronze layer is completed <<';
		print 'total load duration:'+cast(datediff(second,@batch_start_time,@batch_end_time)as nvarchar)+'seconds';

	end try


	begin catch
		print '====================================';
		print 'error occured during loading bronze layer ';
		print 'error message:' + error_message();
		print 'error message:' + cast(error_number() as nvarchar);
		print 'error message:' + cast(error_state() as nvarchar);
		print '====================================';
	end catch

end;
