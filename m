Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AD2EB8FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yu1ZF4pocNqHPvc3O4oo3lZUfx85oxuLOzYnTlZhm0=; b=vFRIgacOHaDBsLVyZ9gQZnCADF
	AKQmZh8CDrMzUwatTp8mrueeMjy1RN3qO1ngJRNN7UcIsiZzvzaElUn+Xxp2zfneLCOegzL/gMaF5
	KbwNxf79j6HlRfYRGHF9MhNA8eoR965I8fQkw2pHrRJECZUGp6EUCPgMwPc7gYhyaBMd3brnoFgvC
	XaKkpVTaoFsRVBxvlhABxJZ7jAT253FecitnL/zJWoelRjv2QLMibjz1HuELWth5GNkctH7//u1fj
	7KHvpNEBr8Ayw7uTamOtbGHJUEKrQq7ywzNQPjzih6SJDvEhfdL2OobA08F4AhpLc0oRtSFMwbegN
	IItARZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmj7-007SVB-1s;
	Wed, 06 Sep 2023 07:13:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmj3-007SUE-1h
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:13:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2C7BB8179C;
	Wed,  6 Sep 2023 07:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6526CC433C7;
	Wed,  6 Sep 2023 07:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693984398;
	bh=FDUJ6vQco0twOnEjgoBr4JDFKNau6b/BdAOMAHbDPr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h+b7+UxOMyEBzcJgorFf4LHBITGKiayAn8jMsFUeQPl0wV0IdtPe8/R0+Ov+LGLhp
	 BYqGB2BOk9aPvMXIXqQ/MNSp+NJSKLYHknobJkq2QiEbmlkY0RoV/50qPjYYZwlCw6
	 OLRIaHDdTtkwO3Cv65Jhq54oshCpCB86Xqh6+oCF8KryAEm+FTPnC+VNtXAS9OC5N8
	 BB5MPUjR9mSoZRCCsmNfngh5aurAJ3F6bRVVGHUJmlogjeoxVOM5N3u1AX6IfdmUDU
	 eYgjxisZGUaUc1qkWaBeUBUjxS+PVnlrjihb97sbqR6RZ47g6hS8OEvRZs2V4Uo/+p
	 Wj9aGKMyfToiQ==
MIME-Version: 1.0
Date: Wed, 06 Sep 2023 09:13:14 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 13/41] mtd: spi-nor: move the .id and .id_len into an
 own structure
In-Reply-To: <4cbc9c03-7b47-48e9-8a91-f08c44284579@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-13-291a0f39f8d8@kernel.org>
 <4cbc9c03-7b47-48e9-8a91-f08c44284579@linaro.org>
Message-ID: <bbf76bffaa699b2a8f4f9e33809dea06@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_001321_825050_A33D2EF2 
X-CRM114-Status: GOOD (  31.90  )
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

Am 2023-09-06 08:12, schrieb Tudor Ambarus:
> On 8/22/23 08:09, Michael Walle wrote:
>> Create a new structure to hold a flash ID and its length. The goal is 
>> to
>> have a new macro SNOR_ID() which can have a flexible id length. This 
>> way
>> we can get rid of all the individual INFOx() macros.
>> 
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>>  drivers/mtd/spi-nor/core.c      |  6 +++---
>>  drivers/mtd/spi-nor/core.h      | 33 
>> ++++++++++++++++++++++++---------
>>  drivers/mtd/spi-nor/micron-st.c |  4 ++--
>>  drivers/mtd/spi-nor/spansion.c  |  4 ++--
>>  drivers/mtd/spi-nor/sysfs.c     |  6 +++---
>>  drivers/mtd/spi-nor/winbond.c   |  1 -
>>  6 files changed, 34 insertions(+), 20 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 4ba1778eda4b..80c340c7863a 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2028,8 +2028,8 @@ static const struct flash_info 
>> *spi_nor_match_id(struct spi_nor *nor,
>>  	for (i = 0; i < ARRAY_SIZE(manufacturers); i++) {
>>  		for (j = 0; j < manufacturers[i]->nparts; j++) {
>>  			part = &manufacturers[i]->parts[j];
>> -			if (part->id_len &&
>> -			    !memcmp(part->id, id, part->id_len)) {
>> +			if (part->id &&
>> +			    !memcmp(part->id->bytes, id, part->id->len)) {
>>  				nor->manufacturer = manufacturers[i];
>>  				return part;
>>  			}
>> @@ -3370,7 +3370,7 @@ static const struct flash_info 
>> *spi_nor_get_flash_info(struct spi_nor *nor,
>>  	 * If caller has specified name of flash model that can normally be
>>  	 * detected using JEDEC, let's verify it.
>>  	 */
>> -	if (name && info->id_len) {
>> +	if (name && info->id) {
>>  		const struct flash_info *jinfo;
>> 
>>  		jinfo = spi_nor_detect(nor);
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index c42b65623da7..81535f31907f 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -446,12 +446,22 @@ struct spi_nor_fixups {
>>  	int (*late_init)(struct spi_nor *nor);
>>  };
>> 
>> +/**
>> + * struct spi_nor_id - SPI NOR flash ID.
>> + *
>> + * @bytes: the flash's ID bytes. The first three bytes are the JEDIC 
>> ID.
> 
> typo, JEDIC. But are there 3 bytes of ID specified by JEDEC? I remeber
> there's only the MFR ID specified, the rest are flash specific, which
> are not mentioned by JEDEC.

I just moved the description from flash_info :p

As far as I know, this isn't really specified at all, is it? I couldn't
even find that the "read jedec id" command 9F is specified anywhere. Do
you know more?

Also the first three bytes is also wrong. It might be more or less. I'd
treat it as opaque - the SNOR_ID() can now have an arbitrary length -
but I would mention that this *typically* has the form of
<1 byte mfr id> <2 byte flash part id>

I.e.
@bytes: the bytes returned by the flash when issuing command 9F.
         Typically, the first byte is the manufacturer ID code (see
         JEP106) and the next two bytes are a flash part specific ID.

>> + * @len:   the number of bytes of ID.
>> + */
>> +struct spi_nor_id {
>> +	const u8 *bytes;
>> +	u8 len;
>> +};
>> +
>>  /**
>>   * struct flash_info - SPI NOR flash_info entry.
>> + * @id:   pointer to struct spi_nor_id or NULL, which means "no ID" 
>> (mostly
>> + *        older chips).
>>   * @name: the name of the flash.
>> - * @id:             the flash's ID bytes. The first three bytes are 
>> the
>> - *                  JEDIC ID. JEDEC ID zero means "no ID" (mostly 
>> older chips).
>> - * @id_len:         the number of bytes of ID.
>>   * @size:           the size of the flash in bytes.
>>   * @sector_size:    (optional) the size listed here is what works 
>> with
>>   *                  SPINOR_OP_SE, which isn't necessarily called a 
>> "sector" by
>> @@ -510,8 +520,7 @@ struct spi_nor_fixups {
>>   */
>>  struct flash_info {
>>  	char *name;
>> -	u8 id[SPI_NOR_MAX_ID_LEN];
>> -	u8 id_len;
>> +	const struct spi_nor_id *id;
>>  	size_t size;
>>  	unsigned sector_size;
>>  	u16 page_size;
>> @@ -554,12 +563,18 @@ struct flash_info {
>>  #define SPI_NOR_ID_3ITEMS(_id) ((_id) >> 16) & 0xff, 
>> SPI_NOR_ID_2ITEMS(_id)
>> 
>>  #define SPI_NOR_ID(_jedec_id, _ext_id)					\
>> -	.id = { SPI_NOR_ID_3ITEMS(_jedec_id), SPI_NOR_ID_2ITEMS(_ext_id) }, 
>> \
>> -	.id_len = !(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0))
>> +	.id = &(const struct spi_nor_id){				\
>> +		.bytes = (const u8[]){ SPI_NOR_ID_3ITEMS(_jedec_id),	\
>> +				       SPI_NOR_ID_2ITEMS(_ext_id) },	\
>> +		.len = !(_jedec_id) ? 0 : (3 + ((_ext_id) ? 2 : 0)),	\
>> +	}
>> 
>>  #define SPI_NOR_ID6(_jedec_id, _ext_id)					\
>> -	.id = { SPI_NOR_ID_3ITEMS(_jedec_id), SPI_NOR_ID_3ITEMS(_ext_id) }, 
>> \
>> -	.id_len = 6
>> +	.id = &(const struct spi_nor_id){				\
>> +		.bytes = (const u8[]){ SPI_NOR_ID_3ITEMS(_jedec_id),	\
>> +				       SPI_NOR_ID_3ITEMS(_ext_id) },	\
>> +		.len = 6,						\
>> +	}
>> 
>>  #define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
>>  	.size = (_sector_size) * (_n_sectors),				\
>> diff --git a/drivers/mtd/spi-nor/micron-st.c 
>> b/drivers/mtd/spi-nor/micron-st.c
>> index 5406a3af2ce0..229c951efcce 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -78,7 +78,7 @@ static int micron_st_nor_octal_dtr_en(struct spi_nor 
>> *nor)
>>  		return ret;
>>  	}
>> 
>> -	if (memcmp(buf, nor->info->id, nor->info->id_len))
>> +	if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
>>  		return -EINVAL;
>> 
>>  	return 0;
>> @@ -114,7 +114,7 @@ static int micron_st_nor_octal_dtr_dis(struct 
>> spi_nor *nor)
>>  		return ret;
>>  	}
>> 
>> -	if (memcmp(buf, nor->info->id, nor->info->id_len))
>> +	if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
>>  		return -EINVAL;
>> 
>>  	return 0;
>> diff --git a/drivers/mtd/spi-nor/spansion.c 
>> b/drivers/mtd/spi-nor/spansion.c
>> index e6468569f178..d7012ab3de2c 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -228,7 +228,7 @@ static int cypress_nor_octal_dtr_en(struct spi_nor 
>> *nor)
>>  		return ret;
>>  	}
>> 
>> -	if (memcmp(buf, nor->info->id, nor->info->id_len))
>> +	if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
>>  		return -EINVAL;
>> 
>>  	return 0;
>> @@ -272,7 +272,7 @@ static int cypress_nor_octal_dtr_dis(struct 
>> spi_nor *nor)
>>  		return ret;
>>  	}
>> 
>> -	if (memcmp(buf, nor->info->id, nor->info->id_len))
>> +	if (memcmp(buf, nor->info->id->bytes, nor->info->id->len))
>>  		return -EINVAL;
>> 
>>  	return 0;
>> diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
>> index c09bb832b3b9..2dfdc555a69f 100644
>> --- a/drivers/mtd/spi-nor/sysfs.c
>> +++ b/drivers/mtd/spi-nor/sysfs.c
>> @@ -35,8 +35,8 @@ static ssize_t jedec_id_show(struct device *dev,
>>  	struct spi_device *spi = to_spi_device(dev);
>>  	struct spi_mem *spimem = spi_get_drvdata(spi);
>>  	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
>> -	const u8 *id = nor->info->id_len ? nor->info->id : nor->id;
>> -	u8 id_len = nor->info->id_len ?: SPI_NOR_MAX_ID_LEN;
>> +	const u8 *id = nor->info->id ? nor->info->id->bytes : nor->id;
>> +	u8 id_len = nor->info->id ? nor->info->id->len : SPI_NOR_MAX_ID_LEN;
>> 
>>  	return sysfs_emit(buf, "%*phN\n", id_len, id);
>>  }
>> @@ -78,7 +78,7 @@ static umode_t spi_nor_sysfs_is_visible(struct 
>> kobject *kobj,
>> 
>>  	if (attr == &dev_attr_manufacturer.attr && !nor->manufacturer)
>>  		return 0;
>> -	if (attr == &dev_attr_jedec_id.attr && !nor->info->id_len && 
>> !nor->id)
>> +	if (attr == &dev_attr_jedec_id.attr && !nor->info->id && !nor->id)
>>  		return 0;
>> 
>>  	return 0444;
>> diff --git a/drivers/mtd/spi-nor/winbond.c 
>> b/drivers/mtd/spi-nor/winbond.c
>> index c21fed842762..7873cc394f07 100644
>> --- a/drivers/mtd/spi-nor/winbond.c
>> +++ b/drivers/mtd/spi-nor/winbond.c
>> @@ -121,7 +121,6 @@ static const struct flash_info winbond_nor_parts[] 
>> = {
>>  	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16)
>>  		NO_SFDP_FLAGS(SECT_4K) },
>>  	{ "w25q128", INFO(0xef4018, 0, 0, 0)
>> -		PARSE_SFDP
> 
> this is a leftover that should be squashed in a previous commit.

oops :) good catch.

-michael

> 
> I'm fine with the overal idea, but please fix the comment about the 3
> bytes of jedec id.
> 
>>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>  	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512)
>>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
