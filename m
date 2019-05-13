Return-Path: <SRS0=6cMw=TN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAE5C04AA7
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 13:56:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC18208CA
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 13:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTSkniDv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC18208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=036vuMWObXXZa966wrErncYMhDZ02iSmLcykNFVy5ls=; b=rTSkniDvFdXBqT
	MZGKXATSDozfxmBlnGdMilSFFyEtBDayuZoQ+hA6psKuy+ocn30b3Jkjgx/FtAj+uX0/aDDr26+vI
	WyubdJ2FU6ZefxnmYMLLHUKPXjoTe3CnJBw+5YuH/fv4R3t8kmpiYByZqei6969wzBb+RlEAorvup
	fYHEN7rj5e0M755BNeOUvbRB0JjXIxqisjWxWG8TP03GGknggq1+7+IdKxFdlAU6Aot61e+EeyLw0
	JBiJI+lni8IT0DGG5wusXIB9RbTXIzUziZ5YZ4AOdhavfTEsbZ4jopKUOWnb98g3vkS7ihd9m+dxq
	lqGzzBWQL98fgOlXgwrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQBRJ-0005RL-4B; Mon, 13 May 2019 13:56:25 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQBRD-0005QW-DA
 for linux-mtd@lists.infradead.org; Mon, 13 May 2019 13:56:21 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 7D1146024E8;
 Mon, 13 May 2019 15:56:12 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 13 May
 2019 15:56:12 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Mon, 13 May 2019 15:56:12 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "lede@allycomm.com" <lede@allycomm.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, "Brian
 Norris" <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG
Thread-Topic: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG
Thread-Index: AQHVBypxyGCaW3KLokGl7ivY8UUpB6Zo92KA
Date: Mon, 13 May 2019 13:56:11 +0000
Message-ID: <3cb32209-f246-e562-2aee-fdf566a60b30@kontron.de>
References: <20190510121727.29834-1-lede@allycomm.com>
In-Reply-To: <20190510121727.29834-1-lede@allycomm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <678DD99A82C0934E8CBFCFC0CC6A1E7C@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 7D1146024E8.AEF02
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, lede@allycomm.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_065619_773253_BCE3BEF5 
X-CRM114-Status: GOOD (  21.01  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jeff,

I just noticed I hit the wrong button and my previous reply was only 
sent to the MTD list, so I'm resending with fixed recipients...

On 10.05.19 14:17, lede@allycomm.com wrote:
> From: Jeff Kletsky <git-commits@allycomm.com>
> 
> The GigaDevice GD5F1GQ4UFxxG SPI NAND is in current production devices
> and, while it has the same logical layout as the E-series devices,
> it differs in the SPI interfacing in significant ways.
> 
> To accommodate these changes, this patch also:
> 
>    * Adds support for two-byte manufacturer IDs
>    * Adds #define-s for three-byte addressing for read ops
> 
> http://www.gigadevice.com/datasheet/gd5f1gq4xfxxg/
> 
> Signed-off-by: Jeff Kletsky <git-commits@allycomm.com>

Maybe it would be better to split this patch into three parts:
* Add support for two-byte device IDs
* Add #define-s for three-byte addressing for read ops
* Add support for GD5F1GQ4UFxxG

Anyway the content looks good to me, so:

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   drivers/mtd/nand/spi/core.c       |  2 +-
>   drivers/mtd/nand/spi/gigadevice.c | 79 +++++++++++++++++++++++++++++++--------
>   include/linux/mtd/spinand.h       | 34 ++++++++++++++++-
>   3 files changed, 97 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index fa87ae28cdfe..a13154785dad 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -853,7 +853,7 @@ spinand_select_op_variant(struct spinand_device *spinand,
>    */
>   int spinand_match_and_init(struct spinand_device *spinand,
>   			   const struct spinand_info *table,
> -			   unsigned int table_size, u8 devid)
> +			   unsigned int table_size, u16 devid)
>   {
>   	struct nand_device *nand = spinand_to_nand(spinand);
>   	unsigned int i;
> diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
> index 0b49d8264bef..d6497ac4c5d8 100644
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
> +		     NAND_MEMORG(1, 2048, 128, 64, 1024, 1, 1, 1),
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
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index b92e2aa955b6..8901ba272538 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -68,30 +68,60 @@
>   		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>   		   SPI_MEM_OP_DATA_IN(len, buf, 1))
>   
> +#define SPINAND_PAGE_READ_FROM_CACHE_OP_3A(fast, addr, ndummy, buf, len) \
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(fast ? 0x0b : 0x03, 1),		\
> +		   SPI_MEM_OP_ADDR(3, addr, 1),				\
> +		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
> +		   SPI_MEM_OP_DATA_IN(len, buf, 1))
> +
>   #define SPINAND_PAGE_READ_FROM_CACHE_X2_OP(addr, ndummy, buf, len)	\
>   	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
>   		   SPI_MEM_OP_ADDR(2, addr, 1),				\
>   		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>   		   SPI_MEM_OP_DATA_IN(len, buf, 2))
>   
> +#define SPINAND_PAGE_READ_FROM_CACHE_X2_OP_3A(addr, ndummy, buf, len)	\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
> +		   SPI_MEM_OP_ADDR(3, addr, 1),				\
> +		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
> +		   SPI_MEM_OP_DATA_IN(len, buf, 2))
> +
>   #define SPINAND_PAGE_READ_FROM_CACHE_X4_OP(addr, ndummy, buf, len)	\
>   	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6b, 1),				\
>   		   SPI_MEM_OP_ADDR(2, addr, 1),				\
>   		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>   		   SPI_MEM_OP_DATA_IN(len, buf, 4))
>   
> +#define SPINAND_PAGE_READ_FROM_CACHE_X4_OP_3A(addr, ndummy, buf, len)	\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6b, 1),				\
> +		   SPI_MEM_OP_ADDR(3, addr, 1),				\
> +		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
> +		   SPI_MEM_OP_DATA_IN(len, buf, 4))
> +
>   #define SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(addr, ndummy, buf, len)	\
>   	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),				\
>   		   SPI_MEM_OP_ADDR(2, addr, 2),				\
>   		   SPI_MEM_OP_DUMMY(ndummy, 2),				\
>   		   SPI_MEM_OP_DATA_IN(len, buf, 2))
>   
> +#define SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP_3A(addr, ndummy, buf, len) \
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),				\
> +		   SPI_MEM_OP_ADDR(3, addr, 2),				\
> +		   SPI_MEM_OP_DUMMY(ndummy, 2),				\
> +		   SPI_MEM_OP_DATA_IN(len, buf, 2))
> +
>   #define SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(addr, ndummy, buf, len)	\
>   	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
>   		   SPI_MEM_OP_ADDR(2, addr, 4),				\
>   		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
>   		   SPI_MEM_OP_DATA_IN(len, buf, 4))
>   
> +#define SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP_3A(addr, ndummy, buf, len) \
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
> +		   SPI_MEM_OP_ADDR(3, addr, 4),				\
> +		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
> +		   SPI_MEM_OP_DATA_IN(len, buf, 4))
> +
>   #define SPINAND_PROG_EXEC_OP(addr)					\
>   	SPI_MEM_OP(SPI_MEM_OP_CMD(0x10, 1),				\
>   		   SPI_MEM_OP_ADDR(3, addr, 1),				\
> @@ -260,7 +290,7 @@ struct spinand_ecc_info {
>    */
>   struct spinand_info {
>   	const char *model;
> -	u8 devid;
> +	u16 devid;
>   	u32 flags;
>   	struct nand_memory_organization memorg;
>   	struct nand_ecc_req eccreq;
> @@ -415,7 +445,7 @@ static inline void spinand_set_of_node(struct spinand_device *spinand,
>   
>   int spinand_match_and_init(struct spinand_device *dev,
>   			   const struct spinand_info *table,
> -			   unsigned int table_size, u8 devid);
> +			   unsigned int table_size, u16 devid);
>   
>   int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
>   int spinand_select_target(struct spinand_device *spinand, unsigned int target);
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
