Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6501ACA0FE6
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 11:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQx3CLmbcD88vFm8/9x/9kDmaJS8YwewPR9uGFhEl1s=; b=O9bAhid8ACwP41XXLzGmNvbC3Q
	+uNQd4aw7jbP8ayFMTJA7yIu6nWlJ1unIHZV0Z/U+A6c8yZEdg0Qsx6PUkiBCRqA6BrNCJiayKxbF
	cicarpMWZ6TlDo4T7rIXkXor6WLLglTHbrzE7trL0+DEOvsfsUj7RnQvafVR3vn8big8fQ9rsA48Q
	DkR4NpLL5awsPQ9C6vrVSLioRT1NvDxdvDFg5qaHz2g5bYemy2CN2o98s5WA33qyOxfn+LxOfkr7u
	j/Vfv9qM9UdWMSG16TOVSrGEMPLgBhora0CnxQXIC2VgyxZfcTMapsUX+L3NvrSmhU0qDB3vg48D2
	Rydn0C/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1tX-00H2f7-08;
	Fri, 01 Sep 2023 11:00:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1tT-00H2cN-2Y
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 11:00:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3B03FB821DA;
	Fri,  1 Sep 2023 11:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88ECCC433C9;
	Fri,  1 Sep 2023 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693566048;
	bh=9wNybEkDrP39FqndXH3ASSh7pRWU+k5rHL6wMWLCDFc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fP0mXdEOAYpOrg8xqTiYbvflR22PvDvzVz+ZOHyEpuq2xJCyoJVpkQ6qAQ6MRe2Iq
	 N/VWigF8A7+cj5XRjcRWxY1QJN8N6XsRp06iyszs4G25WH6IR+eAXhJx3tve+pOIwQ
	 3xaQq7a/0MTvo2KrY2cems3s4wajqsMOqOvYuMoVMAgNhq1RFmaVhra8J57ghnM4YY
	 kHsNiyMqzjk3Zp2IJCmL9k5+aIAyQIf3ee8KJrFn/HrYX92iDJHipQnGne695xU/3E
	 7VfLkC/X8ZXdLto0pktDLqN+jk9Kh28R4MGxEoAYn0CsEgDaRnstXpglZGGJqdRiRl
	 mcn2l/IFP9P2A==
MIME-Version: 1.0
Date: Fri, 01 Sep 2023 13:00:45 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 05/41] mtd: spi-nor: convert .n_sectors to .size
In-Reply-To: <3df0728d-60d8-1cff-a0d9-f3de505dfa17@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-5-291a0f39f8d8@kernel.org>
 <3df0728d-60d8-1cff-a0d9-f3de505dfa17@linaro.org>
Message-ID: <d7985b397e19f66c0692369e20a4fba6@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_040052_094673_E2FCA659 
X-CRM114-Status: GOOD (  26.17  )
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

Am 2023-08-24 10:25, schrieb Tudor Ambarus:
> On 8/22/23 08:09, Michael Walle wrote:
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
> 
> would be good to check the sanity of info->size to not be null and to 
> be
> divisible by sector_size.

Have a look at the later patches, info->size can be zero, indicating
that we need to parse SFDP for this flash.

I could validate that the size is a multiple of sector_size, but
that one might also be zero. Of course you could solve this by
additional logic. But I treated that one as a misconfiguration
of the flash_info entry. It's nothing which can happen during
runtime. Anyway, I have no strong opinion on the "is multiple
of sector_size" check (for now, maybe there's something I didn't
thought of now).

> 
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
>> +	u64 n_sectors = div_u64(nor->params->size, sector_size);
> 
> if params(info)->size is zero here, we get into trouble.

Please note that this is not the info->size, params->size cannot
be zero. If info->size was zero, we have to parse SFDP which hopefully
will give us a sane size.

And regarding the sector_size, which could be zero here. I want to
replace that logic, so we don't rely on the flash_info sector size.
 From a later patch:

         /*
          * sector_size will eventually be replaced with the max erase 
size of
          * the flash. For now, we need to have that ugly default.
          */

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
