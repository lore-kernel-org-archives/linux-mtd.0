Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6FACD54B5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EOxkapVZgKF+jOuhwZYbr1AGs6Xr9HtUDVXYnZCPmg=; b=mgYnsgTPqQYivxf9ikHj0YvzcR
	xDGWu6wsTLV82Vw3hC7JZLWaBWOkWonDi+ioh4xOcctIRsGfK1D+xSKHjRx0+XfwgAO9INB/NAFex
	z4eN9lRLSfGH828IsYfPyaygDw0ANomEsqI7OgkVG/nrs8apPq6jbXlzWZ1rAVsQEtrBoxoqsm5Aj
	ttgqqcPgqJoDVG0S1L9QopEPhHYUzvug2hTSJYREanfgmxICK3MTBwWw8D8Nb6zWQ4EvhYEyni4wh
	1hpBcrGStab7FqIov4E/Pd7A0CbOdL+Et265eGYYyEvkJ1ivrf4CFLUk87NgQQZEO7+kAFXAaQzTN
	D2qy+1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYkE-000Gh0-1Z;
	Tue, 19 Sep 2023 11:18:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYkA-000Gg3-0v
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 11:18:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0A5A7CE1287;
	Tue, 19 Sep 2023 11:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7467C433C7;
	Tue, 19 Sep 2023 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695122290;
	bh=FBr/duLnMLUp4OEqEvn7ySuq3D9P7mkz4j8Di64T388=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CDQ8604phgwnal+8wn8eyt7s6Q6m8OeIUl2WjSIrDoLL+6JEDIC1xnTHkZvlwovYH
	 hMB3VMQfp0OY1e9LAR7fWwVhMfo1GjtUAf24Uoob96jVXdJLFwpCQgjUNHPY7mgye2
	 k6ah0F/2cT6Xs2MRlcZRpToJgyD/yC7DJTwu4x8yPCosuEDC+A2qS+WF1XgCiSzzF/
	 D2UCPh4+rZYTxuKtenAB5SBNs7GMM3EH01faF6msjeVo7Qe7wNn+ad9alGlRXgudTR
	 bmM23Ub5MY3pAQ79s2pzOCpY4DY4LZwhY5ck3ERnyzLnDt6EEAE603CT+3T0TbCscH
	 VLUs3IbjuBszw==
MIME-Version: 1.0
Date: Tue, 19 Sep 2023 13:18:05 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 05/41] mtd: spi-nor: convert .n_sectors to .size
In-Reply-To: <80641a1c-d922-22cc-edd4-76d475e1aac8@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
 <20230807-mtd-flash-info-db-rework-v3-5-e60548861b10@kernel.org>
 <80641a1c-d922-22cc-edd4-76d475e1aac8@linaro.org>
Message-ID: <beccab49f4c7dd1ac403d5e88a348724@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_041814_700085_8812905A 
X-CRM114-Status: GOOD (  26.25  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2023-09-19 11:24, schrieb Tudor Ambarus:
> On 08.09.2023 13:16, Michael Walle wrote:
>> .n_sectors is rarely used. In fact it is only used in swp.c and to
>> calculate the flash size in the core. The use in swp.c might be
>> converted to use the (largest) flash erase size. For now, we just
>> locally calculate the sector size.
>> 
>> Simplify the flash_info database and set the size of the flash 
>> directly.
>> This also let us use the SZ_x macros.
>> 
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>>  drivers/mtd/spi-nor/core.c   | 2 +-
>>  drivers/mtd/spi-nor/core.h   | 8 ++++----
>>  drivers/mtd/spi-nor/swp.c    | 9 +++++----
>>  drivers/mtd/spi-nor/xilinx.c | 4 ++--
>>  4 files changed, 12 insertions(+), 11 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 286155002cdc..f4cc2eafcc5e 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2999,7 +2999,7 @@ static void spi_nor_init_default_params(struct 
>> spi_nor *nor)
>> 
>>  	/* Set SPI NOR sizes. */
>>  	params->writesize = 1;
>> -	params->size = (u64)info->sector_size * info->n_sectors;
>> +	params->size = info->size;
>>  	params->bank_size = params->size;
>>  	params->page_size = info->page_size;
>> 
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index dfc20a3296fb..12c35409493b 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -443,9 +443,9 @@ struct spi_nor_fixups {
>>   * @id:             the flash's ID bytes. The first three bytes are 
>> the
>>   *                  JEDIC ID. JEDEC ID zero means "no ID" (mostly 
>> older chips).
>>   * @id_len:         the number of bytes of ID.
>> + * @size:           the size of the flash in bytes.
>>   * @sector_size:    the size listed here is what works with 
>> SPINOR_OP_SE, which
>>   *                  isn't necessarily called a "sector" by the 
>> vendor.
>> - * @n_sectors:      the number of sectors.
>>   * @n_banks:        the number of banks.
>>   * @page_size:      the flash's page size.
>>   * @addr_nbytes:    number of address bytes to send.
>> @@ -505,8 +505,8 @@ struct flash_info {
>>  	char *name;
>>  	u8 id[SPI_NOR_MAX_ID_LEN];
>>  	u8 id_len;
>> +	size_t size;
>>  	unsigned sector_size;
>> -	u16 n_sectors;
>>  	u16 page_size;
>>  	u8 n_banks;
>>  	u8 addr_nbytes;
>> @@ -556,8 +556,8 @@ struct flash_info {
>>  	.id_len = 6
>> 
>>  #define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
>> +	.size = (_sector_size) * (_n_sectors),				\
>>  	.sector_size = (_sector_size),					\
>> -	.n_sectors = (_n_sectors),					\
>>  	.page_size = 256,						\
>>  	.n_banks = (_n_banks)
>> 
>> @@ -575,8 +575,8 @@ struct flash_info {
>>  	SPI_NOR_GEOMETRY((_sector_size), (_n_sectors), 1),
>> 
>>  #define CAT25_INFO(_sector_size, _n_sectors, _page_size, 
>> _addr_nbytes)	\
>> +		.size = (_sector_size) * (_n_sectors),			\
>>  		.sector_size = (_sector_size),				\
>> -		.n_sectors = (_n_sectors),				\
>>  		.page_size = (_page_size),				\
>>  		.n_banks = 1,						\
>>  		.addr_nbytes = (_addr_nbytes),				\
>> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
>> index 5ab9d5324860..40bf52867095 100644
>> --- a/drivers/mtd/spi-nor/swp.c
>> +++ b/drivers/mtd/spi-nor/swp.c
>> @@ -34,17 +34,18 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor 
>> *nor)
>>  static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
>>  {
>>  	unsigned int bp_slots, bp_slots_needed;
>> +	unsigned int sector_size = nor->info->sector_size;
> 
> this should use nor->params instead, but we can do it later on.

I didn't do that because there is no need to change sector_size. We
have erase maps, which are already part of the params. So that should
be changed. Just in the non-SFDP case we infer the erase map from
sector_size.

> New
> flash additions must specify the sector size, otherwise we get a
> division by zero below. I see you introduce a default value in patch 
> 10,
> which will guard us.

Yes the assumption is that - for now - if locking is supported, we
need a nor->info->sector_size.

> I assume  you checked that there's no flash that
> specifies BP and sector size of zero up to patch 9 inclusively,
> otherwise we'll break bisect-ability. Let me know if yes, and I'll
> update the commit message when applying.

Yes. The assumption above was already a requirement.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
