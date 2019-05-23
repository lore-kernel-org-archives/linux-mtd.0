Return-Path: <SRS0=uaub=TX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB02C04AAC
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 06:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C82020879
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 06:42:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sa1r5slR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C82020879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBmhcq15B12NbBtC8ZXbi5noJ9D9KnJHxi3Cx+Ijp+8=; b=sa1r5slRD+4hMw
	YWQowfGd861j1mpyKch85j7jiwFspt6GG5UqE3oX36Vl+diKThqqCTp3rIDb/wAizdRquFXy0qSnT
	lYThwQEFrwD8yje24/bCVwmid+8Ss/H1xiyUbM6bqx3iqZzpDX8TLviv4/lyZ9Hv8fLJcwlUZ7n+f
	xFV5qiaWubs5JkOQdKRXETYAFlI1alzyqAC4xLxbVQL4nlG9KXCBHXUTjkwk7iXGrMy59u7Fdb9S4
	RTMJ+0WMuZGrW8KZYPGgwRSqHxU2NM/qmHnS9an/c2nCTUQ+jR31uHRp2Gd/66XlMg8GqEN3kmGzQ
	j22pFca/Yh9Ztp4IRn8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hThR6-0004gX-61; Thu, 23 May 2019 06:42:44 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hThR1-0004fk-1T
 for linux-mtd@lists.infradead.org; Thu, 23 May 2019 06:42:41 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id DD9C766117C;
 Thu, 23 May 2019 08:42:28 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 23 May
 2019 08:42:28 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Thu, 23 May 2019 08:42:28 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Jeff Kletsky <lede@allycomm.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, 
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4 3/3] mtd: spinand: Add support for GigaDevice
 GD5F1GQ4UFxxG
Thread-Topic: [PATCH v4 3/3] mtd: spinand: Add support for GigaDevice
 GD5F1GQ4UFxxG
Thread-Index: AQHVEOq8ofUdXvC9RUu5vDDV8HwpMaZ4IfUA
Date: Thu, 23 May 2019 06:42:28 +0000
Message-ID: <e438022f-3444-9aae-adac-2dd3dd0071b7@kontron.de>
References: <20190522220555.11626-1-lede@allycomm.com>
 <20190522220555.11626-4-lede@allycomm.com>
In-Reply-To: <20190522220555.11626-4-lede@allycomm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <CBAF63A6B8C5AA4FBC0513A5C5012884@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: DD9C766117C.A3716
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: computersforpeace@gmail.com, dwmw2@infradead.org,
 git-commits@allycomm.com, lede@allycomm.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 lkp@intel.com, marek.vasut@gmail.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_234239_426064_6BFB9AB0 
X-CRM114-Status: GOOD (  21.82  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jeff Kletsky <git-commits@allycomm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 kbuild test robot <lkp@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 23.05.19 00:05, Jeff Kletsky wrote:
> From: Jeff Kletsky <git-commits@allycomm.com>
> 
> The GigaDevice GD5F1GQ4UFxxG SPI NAND is in current production devices
> and, while it has the same logical layout as the E-series devices,
> it differs in the SPI interfacing in significant ways.
> 
> This support is contingent on previous commits to:
> 
>    * Add support for two-byte device IDs
>    * Define macros for page-read ops with three-byte addresses
> 
> http://www.gigadevice.com/datasheet/gd5f1gq4xfxxg/
> 
> Signed-off-by: Jeff Kletsky <git-commits@allycomm.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> 
> Reported-by: kbuild test robot <lkp@intel.com>

I dont't think that this Reported-by tag should be used here. The bot 
reported build errors caused by your patch and you fixed it in a new 
version. As far as I understand this tag, it references someone who 
reported a flaw/bug that led to this change in the first place.
The version history of the changes won't be visible in the git history 
later, but the tag will be and would be rather confusing.

> ---
>   drivers/mtd/nand/spi/gigadevice.c | 79 +++++++++++++++++++++++++------
>   1 file changed, 64 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
> index e5586390026a..b0c26eb5e8b6 100644
> --- a/drivers/mtd/nand/spi/gigadevice.c
> +++ b/drivers/mtd/nand/spi/gigadevice.c
> @@ -9,11 +9,17 @@
>   #include <linux/mtd/spinand.h>
>   
>   #define SPINAND_MFR_GIGADEVICE			0xC8
> +
>   #define GD5FXGQ4XA_STATUS_ECC_1_7_BITFLIPS	(1 << 4)
>   #define GD5FXGQ4XA_STATUS_ECC_8_BITFLIPS	(3 << 4)
>   
>   #define GD5FXGQ4UEXXG_REG_STATUS2		0xf0
>   
> +#define GD5FXGQ4UXFXXG_STATUS_ECC_MASK		(7 << 4)
> +#define GD5FXGQ4UXFXXG_STATUS_ECC_NO_BITFLIPS	(0 << 4)
> +#define GD5FXGQ4UXFXXG_STATUS_ECC_1_3_BITFLIPS	(1 << 4)
> +#define GD5FXGQ4UXFXXG_STATUS_ECC_UNCOR_ERROR	(7 << 4)
> +
>   static SPINAND_OP_VARIANTS(read_cache_variants,
>   		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
>   		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
> @@ -22,6 +28,14 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
>   		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
>   		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
>   
> +static SPINAND_OP_VARIANTS(read_cache_variants_f,
> +		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_X4_OP_3A(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(true, 0, 1, NULL, 0),
> +		SPINAND_PAGE_READ_FROM_CACHE_OP_3A(false, 0, 0, NULL, 0));
> +
>   static SPINAND_OP_VARIANTS(write_cache_variants,
>   		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
>   		SPINAND_PROG_LOAD(true, 0, NULL, 0));
> @@ -59,6 +73,11 @@ static int gd5fxgq4xa_ooblayout_free(struct mtd_info *mtd, int section,
>   	return 0;
>   }
>   
> +static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout = {
> +	.ecc = gd5fxgq4xa_ooblayout_ecc,
> +	.free = gd5fxgq4xa_ooblayout_free,
> +};
> +
>   static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
>   					 u8 status)
>   {
> @@ -83,7 +102,7 @@ static int gd5fxgq4xa_ecc_get_status(struct spinand_device *spinand,
>   	return -EINVAL;
>   }
>   
> -static int gd5fxgq4uexxg_ooblayout_ecc(struct mtd_info *mtd, int section,
> +static int gd5fxgq4_variant2_ooblayout_ecc(struct mtd_info *mtd, int section,
>   				       struct mtd_oob_region *region)
>   {
>   	if (section)
> @@ -95,7 +114,7 @@ static int gd5fxgq4uexxg_ooblayout_ecc(struct mtd_info *mtd, int section,
>   	return 0;
>   }
>   
> -static int gd5fxgq4uexxg_ooblayout_free(struct mtd_info *mtd, int section,
> +static int gd5fxgq4_variant2_ooblayout_free(struct mtd_info *mtd, int section,
>   					struct mtd_oob_region *region)
>   {
>   	if (section)
> @@ -108,6 +127,11 @@ static int gd5fxgq4uexxg_ooblayout_free(struct mtd_info *mtd, int section,
>   	return 0;
>   }
>   
> +static const struct mtd_ooblayout_ops gd5fxgq4_variant2_ooblayout = {
> +	.ecc = gd5fxgq4_variant2_ooblayout_ecc,
> +	.free = gd5fxgq4_variant2_ooblayout_free,
> +};
> +
>   static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
>   					u8 status)
>   {
> @@ -150,15 +174,25 @@ static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
>   	return -EINVAL;
>   }
>   
> -static const struct mtd_ooblayout_ops gd5fxgq4xa_ooblayout = {
> -	.ecc = gd5fxgq4xa_ooblayout_ecc,
> -	.free = gd5fxgq4xa_ooblayout_free,
> -};
> +static int gd5fxgq4ufxxg_ecc_get_status(struct spinand_device *spinand,
> +					u8 status)
> +{
> +	switch (status & GD5FXGQ4UXFXXG_STATUS_ECC_MASK) {
> +	case GD5FXGQ4UXFXXG_STATUS_ECC_NO_BITFLIPS:
> +		return 0;
>   
> -static const struct mtd_ooblayout_ops gd5fxgq4uexxg_ooblayout = {
> -	.ecc = gd5fxgq4uexxg_ooblayout_ecc,
> -	.free = gd5fxgq4uexxg_ooblayout_free,
> -};
> +	case GD5FXGQ4UXFXXG_STATUS_ECC_1_3_BITFLIPS:
> +		return 3;
> +
> +	case GD5FXGQ4UXFXXG_STATUS_ECC_UNCOR_ERROR:
> +		return -EBADMSG;
> +
> +	default: /* (2 << 4) through (6 << 4) are 4-8 corrected errors */
> +		return ((status & GD5FXGQ4UXFXXG_STATUS_ECC_MASK) >> 4) + 2;
> +	}
> +
> +	return -EINVAL;
> +}
>   
>   static const struct spinand_info gigadevice_spinand_table[] = {
>   	SPINAND_INFO("GD5F1GQ4xA", 0xF1,
> @@ -195,25 +229,40 @@ static const struct spinand_info gigadevice_spinand_table[] = {
>   					      &write_cache_variants,
>   					      &update_cache_variants),
>   		     0,
> -		     SPINAND_ECCINFO(&gd5fxgq4uexxg_ooblayout,
> +		     SPINAND_ECCINFO(&gd5fxgq4_variant2_ooblayout,
>   				     gd5fxgq4uexxg_ecc_get_status)),
> +	SPINAND_INFO("GD5F1GQ4UFxxG", 0xb148,
> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
> +		     NAND_ECCREQ(8, 512),
> +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_f,
> +					      &write_cache_variants,
> +					      &update_cache_variants),
> +		     0,
> +		     SPINAND_ECCINFO(&gd5fxgq4_variant2_ooblayout,
> +				     gd5fxgq4ufxxg_ecc_get_status)),
>   };
>   
>   static int gigadevice_spinand_detect(struct spinand_device *spinand)
>   {
>   	u8 *id = spinand->id.data;
> +	u16 did;
>   	int ret;
>   
>   	/*
> -	 * For GD NANDs, There is an address byte needed to shift in before IDs
> -	 * are read out, so the first byte in raw_id is dummy.
> +	 * Earlier GDF5-series devices (A,E) return [0][MID][DID]
> +	 * Later (F) devices return [MID][DID1][DID2]
>   	 */
> -	if (id[1] != SPINAND_MFR_GIGADEVICE)
> +
> +	if (id[0] == SPINAND_MFR_GIGADEVICE)
> +		did = (id[1] << 8) + id[2];
> +	else if (id[0] == 0 && id[1] == SPINAND_MFR_GIGADEVICE)
> +		did = id[2];
> +	else
>   		return 0;
>   
>   	ret = spinand_match_and_init(spinand, gigadevice_spinand_table,
>   				     ARRAY_SIZE(gigadevice_spinand_table),
> -				     id[2]);
> +				     did);
>   	if (ret)
>   		return ret;
>   
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
