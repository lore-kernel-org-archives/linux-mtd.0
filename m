Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4CAC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 09:03:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F3A20811
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 09:03:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JKdAxfOS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30F3A20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSlju+kpglN/ANe4dzGLQ3FXUkHOHD2AclsomICqPwQ=; b=JKdAxfOSJHMKxq
	cgS5T/uhYvMQx0WOe3dBTQx8mmgA8O1Jwe8E9eGXm/rEJRbKRQXhkMFi06gXOfgV6pXMgFIK78jeZ
	OY8mrN9xRmTEbE9QNxCgaFVNgSzl79/BcacIORXuDvbmFZLL36qyrtrmebgkcVF/6x+z4lzwfbJHa
	bJkx29NN1FLmQd5xuMzAG/6jktRMh+JnkCFqqjbR3RaEmTi+r3qq9nBCEc1Aykq3+vnF5OvjwL3F+
	DPb2SrKijxDeLuVMdcxGxh4UToOxaenq+iycOF6zApvQwI4X3FajSC9GNAaPOGPb4h8L62/cG6dUH
	8AqRXdnHPMSYtgggvAQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6tbk-0004bv-4p; Thu, 21 Mar 2019 09:03:28 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6tbZ-0004Te-BH; Thu, 21 Mar 2019 09:03:20 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id C46A762631A;
 Thu, 21 Mar 2019 10:03:13 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 21 Mar
 2019 10:03:13 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Thu, 21 Mar 2019 10:03:13 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "Marek
 Vasut" <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 07/15] mtd: rawnand: Fill memorg during detection
Thread-Topic: [PATCH v2 07/15] mtd: rawnand: Fill memorg during detection
Thread-Index: AQHU0scmCtWYyrGUnkq9qOmgcmIB/qYV04AA
Date: Thu, 21 Mar 2019 09:03:13 +0000
Message-ID: <0fdd410f-6fa1-22b1-c7dd-16088b9f7de5@kontron.de>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
 <20190304201522.11323-8-miquel.raynal@bootlin.com>
In-Reply-To: <20190304201522.11323-8-miquel.raynal@bootlin.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.43]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <C24B535BB7EB164FA40D6AFA50A3C829@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: C46A762631A.A23BF
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, juliensu@mxic.com.tw,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, masonccyang@mxic.com.tw,
 miquel.raynal@bootlin.com, richard@nod.at,
 thomas.petazzoni@bootlin.com, tudor.ambarus@microchip.com,
 vigneshr@ti.com, yamada.masahiro@socionext.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_020317_722447_2D15A64D 
X-CRM114-Status: GOOD (  23.25  )
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
Cc: Vignesh R <vigneshr@ti.com>, Julien Su <juliensu@mxic.com.tw>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 04.03.19 21:15, Miquel Raynal wrote:
> From: Boris Brezillon <bbrezillon@kernel.org>
> 
> If we want to use the generic NAND layer, we need to have the memorg
> struct appropriately filled. Patch the detection code to fill this
> struct.
> 
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   drivers/mtd/nand/raw/denali.c       |  5 +++
>   drivers/mtd/nand/raw/diskonchip.c   |  4 ++
>   drivers/mtd/nand/raw/jz4740_nand.c  |  4 ++
>   drivers/mtd/nand/raw/nand_amd.c     | 11 +++--
>   drivers/mtd/nand/raw/nand_base.c    | 64 ++++++++++++++++++++++++++---
>   drivers/mtd/nand/raw/nand_hynix.c   | 48 ++++++++++++++--------
>   drivers/mtd/nand/raw/nand_jedec.c   | 22 +++++++---
>   drivers/mtd/nand/raw/nand_onfi.c    | 23 ++++++++---
>   drivers/mtd/nand/raw/nand_samsung.c | 24 +++++++----
>   drivers/mtd/nand/raw/nand_toshiba.c |  9 +++-
>   drivers/mtd/nand/raw/nandsim.c      |  5 +++
>   11 files changed, 175 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index eebac35304c6..86e5df403beb 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1119,6 +1119,9 @@ static int denali_multidev_fixup(struct denali_nand_info *denali)
>   {
>   	struct nand_chip *chip = &denali->nand;
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
> +
> +	memorg = nanddev_get_memorg(&chip->base);
>   
>   	/*
>   	 * Support for multi device:
> @@ -1148,6 +1151,8 @@ static int denali_multidev_fixup(struct denali_nand_info *denali)
>   	}
>   
>   	/* 2 chips in parallel */
> +	memorg->pagesize <<= 1;
> +	memorg->oobsize <<= 1;
>   	mtd->size <<= 1;
>   	mtd->erasesize <<= 1;
>   	mtd->writesize <<= 1;
> diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
> index 53f57e0f007e..e9767e06415d 100644
> --- a/drivers/mtd/nand/raw/diskonchip.c
> +++ b/drivers/mtd/nand/raw/diskonchip.c
> @@ -1028,6 +1028,7 @@ static inline int __init nftl_partscan(struct mtd_info *mtd, struct mtd_partitio
>   {
>   	struct nand_chip *this = mtd_to_nand(mtd);
>   	struct doc_priv *doc = nand_get_controller_data(this);
> +	struct nand_memory_organization *memorg;
>   	int ret = 0;
>   	u_char *buf;
>   	struct NFTLMediaHeader *mh;
> @@ -1036,6 +1037,8 @@ static inline int __init nftl_partscan(struct mtd_info *mtd, struct mtd_partitio
>   	unsigned blocks, maxblocks;
>   	int offs, numheaders;
>   
> +	memorg = nanddev_get_memorg(&this->base);
> +
>   	buf = kmalloc(mtd->writesize, GFP_KERNEL);
>   	if (!buf) {
>   		return 0;
> @@ -1082,6 +1085,7 @@ static inline int __init nftl_partscan(struct mtd_info *mtd, struct mtd_partitio
>   	   implementation of the NAND layer.  */
>   	if (mh->UnitSizeFactor != 0xff) {
>   		this->bbt_erase_shift += (0xff - mh->UnitSizeFactor);
> +		memorg->pages_per_eraseblock <<= (0xff - mh->UnitSizeFactor);
>   		mtd->erasesize <<= (0xff - mh->UnitSizeFactor);
>   		pr_info("Setting virtual erase size to %d\n", mtd->erasesize);
>   		blocks = mtd->size >> this->bbt_erase_shift;
> diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
> index f92ae5aa2a54..76a32ad2cf83 100644
> --- a/drivers/mtd/nand/raw/jz4740_nand.c
> +++ b/drivers/mtd/nand/raw/jz4740_nand.c
> @@ -313,8 +313,11 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
>   	uint32_t ctrl;
>   	struct nand_chip *chip = &nand->chip;
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
>   	u8 id[2];
>   
> +	memorg = nanddev_get_memorg(&chip->base);
> +
>   	/* Request I/O resource. */
>   	sprintf(res_name, "bank%d", bank);
>   	ret = jz_nand_ioremap_resource(pdev, res_name,
> @@ -352,6 +355,7 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
>   
>   		/* Update size of the MTD. */
>   		chip->numchips++;
> +		memorg->ntargets++;
>   		mtd->size += chip->chipsize;
>   	}
>   
> diff --git a/drivers/mtd/nand/raw/nand_amd.c b/drivers/mtd/nand/raw/nand_amd.c
> index 890c5b43e03c..e008fd662ee6 100644
> --- a/drivers/mtd/nand/raw/nand_amd.c
> +++ b/drivers/mtd/nand/raw/nand_amd.c
> @@ -20,6 +20,9 @@
>   static void amd_nand_decode_id(struct nand_chip *chip)
>   {
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
> +
> +	memorg = nanddev_get_memorg(&chip->base);
>   
>   	nand_decode_ext_id(chip);
>   
> @@ -31,9 +34,11 @@ static void amd_nand_decode_id(struct nand_chip *chip)
>   	 */
>   	if (chip->id.data[4] != 0x00 && chip->id.data[5] == 0x00 &&
>   	    chip->id.data[6] == 0x00 && chip->id.data[7] == 0x00 &&
> -	    mtd->writesize == 512) {
> -		mtd->erasesize = 128 * 1024;
> -		mtd->erasesize <<= ((chip->id.data[3] & 0x03) << 1);
> +	    memorg->pagesize == 512) {
> +		memorg->pages_per_eraseblock = 256;
> +		memorg->pages_per_eraseblock <<= ((chip->id.data[3] & 0x03) << 1);
> +		mtd->erasesize = memorg->pages_per_eraseblock *
> +				 memorg->pagesize;
>   	}
>   }
>   
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index d3092c9a3e21..5aba1cf38a4b 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4530,21 +4530,30 @@ static int nand_get_bits_per_cell(u8 cellinfo)
>    */
>   void nand_decode_ext_id(struct nand_chip *chip)
>   {
> +	struct nand_memory_organization *memorg;
>   	struct mtd_info *mtd = nand_to_mtd(chip);
>   	int extid;
>   	u8 *id_data = chip->id.data;
> +
> +	memorg = nanddev_get_memorg(&chip->base);
> +
>   	/* The 3rd id byte holds MLC / multichip data */
> +	memorg->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
>   	chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
>   	/* The 4th id byte is the important one */
>   	extid = id_data[3];
>   
>   	/* Calc pagesize */
> -	mtd->writesize = 1024 << (extid & 0x03);
> +	memorg->pagesize = 1024 << (extid & 0x03);
> +	mtd->writesize = memorg->pagesize;
>   	extid >>= 2;
>   	/* Calc oobsize */
> -	mtd->oobsize = (8 << (extid & 0x01)) * (mtd->writesize >> 9);
> +	memorg->oobsize = (8 << (extid & 0x01)) * (mtd->writesize >> 9);
> +	mtd->oobsize = memorg->oobsize;
>   	extid >>= 2;
>   	/* Calc blocksize. Blocksize is multiples of 64KiB */
> +	memorg->pages_per_eraseblock = ((64 * 1024) << (extid & 0x03)) /
> +				       memorg->pagesize;
>   	mtd->erasesize = (64 * 1024) << (extid & 0x03);
>   	extid >>= 2;
>   	/* Get buswidth information */
> @@ -4561,12 +4570,19 @@ EXPORT_SYMBOL_GPL(nand_decode_ext_id);
>   static void nand_decode_id(struct nand_chip *chip, struct nand_flash_dev *type)
>   {
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
>   
> +	memorg = nanddev_get_memorg(&chip->base);
> +
> +	memorg->pages_per_eraseblock = type->erasesize / type->pagesize;
>   	mtd->erasesize = type->erasesize;
> -	mtd->writesize = type->pagesize;
> -	mtd->oobsize = mtd->writesize / 32;
> +	memorg->pagesize = type->pagesize;
> +	mtd->writesize = memorg->pagesize;
> +	memorg->oobsize = memorg->pagesize / 32;
> +	mtd->oobsize = memorg->oobsize;
>   
>   	/* All legacy ID NAND are small-page, SLC */
> +	memorg->bits_per_cell = 1;
>   	chip->bits_per_cell = 1;
>   }
>   
> @@ -4595,15 +4611,27 @@ static bool find_full_id_nand(struct nand_chip *chip,
>   			      struct nand_flash_dev *type)
>   {
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
>   	u8 *id_data = chip->id.data;
>   
> +	memorg = nanddev_get_memorg(&chip->base);
> +
>   	if (!strncmp(type->id, id_data, type->id_len)) {
> -		mtd->writesize = type->pagesize;
> +		memorg->pagesize = type->pagesize;
> +		mtd->writesize = memorg->pagesize;
> +		memorg->pages_per_eraseblock = type->erasesize /
> +					       type->pagesize;
>   		mtd->erasesize = type->erasesize;
> -		mtd->oobsize = type->oobsize;
> +		memorg->oobsize = type->oobsize;
> +		mtd->oobsize = memorg->oobsize;
>   
> +		memorg->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
>   		chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
>   		chip->chipsize = (uint64_t)type->chipsize << 20;
> +		memorg->eraseblocks_per_lun =
> +			DIV_ROUND_DOWN_ULL((u64)type->chipsize << 20,
> +					   memorg->pagesize *
> +					   memorg->pages_per_eraseblock);
>   		chip->options |= type->options;
>   		chip->ecc_strength_ds = NAND_ECC_STRENGTH(type);
>   		chip->ecc_step_ds = NAND_ECC_STEP(type);
> @@ -4632,7 +4660,12 @@ static void nand_manufacturer_detect(struct nand_chip *chip)
>   	 */
>   	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
>   	    chip->manufacturer.desc->ops->detect) {
> +		struct nand_memory_organization *memorg;
> +
> +		memorg = nanddev_get_memorg(&chip->base);
> +
>   		/* The 3rd id byte holds MLC / multichip data */
> +		memorg->bits_per_cell = nand_get_bits_per_cell(chip->id.data[2]);
>   		chip->bits_per_cell = nand_get_bits_per_cell(chip->id.data[2]);
>   		chip->manufacturer.desc->ops->detect(chip);
>   	} else {
> @@ -4682,10 +4715,20 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>   {
>   	const struct nand_manufacturer *manufacturer;
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
>   	int busw, ret;
>   	u8 *id_data = chip->id.data;
>   	u8 maf_id, dev_id;
>   
> +	/*
> +	 * Let's start by initializing memorg fields that might be left
> +	 * unassigned by the ID-based detection logic.
> +	 */
> +	memorg = nanddev_get_memorg(&chip->base);
> +	memorg->planes_per_lun = 1;
> +	memorg->luns_per_target = 1;
> +	memorg->ntargets = 1;
> +
>   	/*
>   	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
>   	 * after power-up.
> @@ -4790,6 +4833,11 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>   	/* Get chip options */
>   	chip->options |= type->options;
>   
> +	memorg->eraseblocks_per_lun =
> +			DIV_ROUND_DOWN_ULL((u64)type->chipsize << 20,
> +					   memorg->pagesize *
> +					   memorg->pages_per_eraseblock);
> +
>   ident_done:
>   	if (!mtd->name)
>   		mtd->name = chip->parameters.model;
> @@ -5016,10 +5064,13 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
>   			   struct nand_flash_dev *table)
>   {
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
>   	int nand_maf_id, nand_dev_id;
>   	unsigned int i;
>   	int ret;
>   
> +	memorg = nanddev_get_memorg(&chip->base);
> +
>   	/* Assume all dies are deselected when we enter nand_scan_ident(). */
>   	chip->cur_cs = -1;
>   
> @@ -5081,6 +5132,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
>   		pr_info("%d chips detected\n", i);
>   
>   	/* Store the number of chips and calc total size for mtd */
> +	memorg->ntargets = i;
>   	chip->numchips = i;
>   	mtd->size = i * chip->chipsize;
>   
> diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
> index 343f477362d1..94ea8c593589 100644
> --- a/drivers/mtd/nand/raw/nand_hynix.c
> +++ b/drivers/mtd/nand/raw/nand_hynix.c
> @@ -418,24 +418,27 @@ static void hynix_nand_extract_oobsize(struct nand_chip *chip,
>   				       bool valid_jedecid)
>   {
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
>   	u8 oobsize;
>   
> +	memorg = nanddev_get_memorg(&chip->base);
> +
>   	oobsize = ((chip->id.data[3] >> 2) & 0x3) |
>   		  ((chip->id.data[3] >> 4) & 0x4);
>   
>   	if (valid_jedecid) {
>   		switch (oobsize) {
>   		case 0:
> -			mtd->oobsize = 2048;
> +			memorg->oobsize = 2048;
>   			break;
>   		case 1:
> -			mtd->oobsize = 1664;
> +			memorg->oobsize = 1664;
>   			break;
>   		case 2:
> -			mtd->oobsize = 1024;
> +			memorg->oobsize = 1024;
>   			break;
>   		case 3:
> -			mtd->oobsize = 640;
> +			memorg->oobsize = 640;
>   			break;
>   		default:
>   			/*
> @@ -450,25 +453,25 @@ static void hynix_nand_extract_oobsize(struct nand_chip *chip,
>   	} else {
>   		switch (oobsize) {
>   		case 0:
> -			mtd->oobsize = 128;
> +			memorg->oobsize = 128;
>   			break;
>   		case 1:
> -			mtd->oobsize = 224;
> +			memorg->oobsize = 224;
>   			break;
>   		case 2:
> -			mtd->oobsize = 448;
> +			memorg->oobsize = 448;
>   			break;
>   		case 3:
> -			mtd->oobsize = 64;
> +			memorg->oobsize = 64;
>   			break;
>   		case 4:
> -			mtd->oobsize = 32;
> +			memorg->oobsize = 32;
>   			break;
>   		case 5:
> -			mtd->oobsize = 16;
> +			memorg->oobsize = 16;
>   			break;
>   		case 6:
> -			mtd->oobsize = 640;
> +			memorg->oobsize = 640;
>   			break;
>   		default:
>   			/*
> @@ -492,8 +495,10 @@ static void hynix_nand_extract_oobsize(struct nand_chip *chip,
>   		 * the actual OOB size for this chip is: 640 * 16k / 8k).
>   		 */
>   		if (chip->id.data[1] == 0xde)
> -			mtd->oobsize *= mtd->writesize / SZ_8K;
> +			memorg->oobsize *= memorg->pagesize / SZ_8K;
>   	}
> +
> +	mtd->oobsize = memorg->oobsize;
>   }
>   
>   static void hynix_nand_extract_ecc_requirements(struct nand_chip *chip,
> @@ -609,9 +614,12 @@ static void hynix_nand_extract_scrambling_requirements(struct nand_chip *chip,
>   static void hynix_nand_decode_id(struct nand_chip *chip)
>   {
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
>   	bool valid_jedecid;
>   	u8 tmp;
>   
> +	memorg = nanddev_get_memorg(&chip->base);
> +
>   	/*
>   	 * Exclude all SLC NANDs from this advanced detection scheme.
>   	 * According to the ranges defined in several datasheets, it might
> @@ -625,7 +633,8 @@ static void hynix_nand_decode_id(struct nand_chip *chip)
>   	}
>   
>   	/* Extract pagesize */
> -	mtd->writesize = 2048 << (chip->id.data[3] & 0x03);
> +	memorg->pagesize = 2048 << (chip->id.data[3] & 0x03);
> +	mtd->writesize = memorg->pagesize;
>   
>   	tmp = (chip->id.data[3] >> 4) & 0x3;
>   	/*
> @@ -635,12 +644,19 @@ static void hynix_nand_decode_id(struct nand_chip *chip)
>   	 * The only exception is when ID[3][4:5] == 3 and ID[3][7] == 0, in
>   	 * this case the erasesize is set to 768KiB.
>   	 */
> -	if (chip->id.data[3] & 0x80)
> +	if (chip->id.data[3] & 0x80) {
> +		memorg->pages_per_eraseblock = (SZ_1M << tmp) /
> +					       memorg->pagesize;
>   		mtd->erasesize = SZ_1M << tmp;
> -	else if (tmp == 3)
> +	} else if (tmp == 3) {
> +		memorg->pages_per_eraseblock = (SZ_512K + SZ_256K) /
> +					       memorg->pagesize;
>   		mtd->erasesize = SZ_512K + SZ_256K;
> -	else
> +	} else {
> +		memorg->pages_per_eraseblock = (SZ_128K << tmp) /
> +					       memorg->pagesize;
>   		mtd->erasesize = SZ_128K << tmp;
> +	}
>   
>   	/*
>   	 * Modern Toggle DDR NANDs have a valid JEDECID even though they are
> diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
> index 38b5dc22cb30..61e33ee7ee19 100644
> --- a/drivers/mtd/nand/raw/nand_jedec.c
> +++ b/drivers/mtd/nand/raw/nand_jedec.c
> @@ -22,12 +22,15 @@
>   int nand_jedec_detect(struct nand_chip *chip)
>   {
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
>   	struct nand_jedec_params *p;
>   	struct jedec_ecc_info *ecc;
>   	int jedec_version = 0;
>   	char id[5];
>   	int i, val, ret;
>   
> +	memorg = nanddev_get_memorg(&chip->base);
> +
>   	/* Try JEDEC for unknown chip or LP */
>   	ret = nand_readid_op(chip, 0x40, id, sizeof(id));
>   	if (ret || strncmp(id, "JEDEC", sizeof(id)))
> @@ -81,17 +84,26 @@ int nand_jedec_detect(struct nand_chip *chip)
>   		goto free_jedec_param_page;
>   	}
>   
> -	mtd->writesize = le32_to_cpu(p->byte_per_page);
> +	memorg->pagesize = le32_to_cpu(p->byte_per_page);
> +	mtd->writesize = memorg->pagesize;
>   
>   	/* Please reference to the comment for nand_flash_detect_onfi. */
> -	mtd->erasesize = 1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
> -	mtd->erasesize *= mtd->writesize;
> +	memorg->pages_per_eraseblock =
> +			1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
> +	mtd->erasesize = memorg->pages_per_eraseblock * memorg->pagesize;
>   
> -	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
> +	memorg->oobsize = le16_to_cpu(p->spare_bytes_per_page);
> +	mtd->oobsize = memorg->oobsize;
> +
> +	memorg->luns_per_target = p->lun_count;
> +	memorg->planes_per_lun = 1 << p->multi_plane_addr;
>   
>   	/* Please reference to the comment for nand_flash_detect_onfi. */
> -	chip->chipsize = 1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
> +	memorg->eraseblocks_per_lun =
> +		1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
> +	chip->chipsize = memorg->eraseblocks_per_lun;
>   	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
> +	memorg->bits_per_cell = p->bits_per_cell;
>   	chip->bits_per_cell = p->bits_per_cell;
>   
>   	if (le16_to_cpu(p->features) & JEDEC_FEATURE_16_BIT_BUS)
> diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
> index d8184cf591ad..f3f59cf37d7f 100644
> --- a/drivers/mtd/nand/raw/nand_onfi.c
> +++ b/drivers/mtd/nand/raw/nand_onfi.c
> @@ -140,12 +140,15 @@ static void nand_bit_wise_majority(const void **srcbufs,
>   int nand_onfi_detect(struct nand_chip *chip)
>   {
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
>   	struct nand_onfi_params *p;
>   	struct onfi_params *onfi;
>   	int onfi_version = 0;
>   	char id[4];
>   	int i, ret, val;
>   
> +	memorg = nanddev_get_memorg(&chip->base);
> +
>   	/* Try ONFI for unknown chip or LP */
>   	ret = nand_readid_op(chip, 0x20, id, sizeof(id));
>   	if (ret || strncmp(id, "ONFI", 4))
> @@ -221,21 +224,31 @@ int nand_onfi_detect(struct nand_chip *chip)
>   		goto free_onfi_param_page;
>   	}
>   
> -	mtd->writesize = le32_to_cpu(p->byte_per_page);
> +	memorg->pagesize = le32_to_cpu(p->byte_per_page);
> +	mtd->writesize = memorg->pagesize;
>   
>   	/*
>   	 * pages_per_block and blocks_per_lun may not be a power-of-2 size
>   	 * (don't ask me who thought of this...). MTD assumes that these
>   	 * dimensions will be power-of-2, so just truncate the remaining area.
>   	 */
> -	mtd->erasesize = 1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
> -	mtd->erasesize *= mtd->writesize;
> +	memorg->pages_per_eraseblock =
> +			1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
> +	mtd->erasesize = memorg->pages_per_eraseblock * memorg->pagesize;
>   
> -	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
> +	memorg->oobsize = le16_to_cpu(p->spare_bytes_per_page);
> +	mtd->oobsize = memorg->oobsize;
> +
> +	memorg->luns_per_target = p->lun_count;
> +	memorg->planes_per_lun = 1 << p->interleaved_bits;
>   
>   	/* See erasesize comment */
> -	chip->chipsize = 1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
> +	memorg->eraseblocks_per_lun =
> +		1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
> +	memorg->max_bad_eraseblocks_per_lun = le32_to_cpu(p->blocks_per_lun);
> +	chip->chipsize = memorg->eraseblocks_per_lun;
>   	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
> +	memorg->bits_per_cell = p->bits_per_cell;
>   	chip->bits_per_cell = p->bits_per_cell;
>   
>   	chip->max_bb_per_die = le16_to_cpu(p->bb_per_lun);
> diff --git a/drivers/mtd/nand/raw/nand_samsung.c b/drivers/mtd/nand/raw/nand_samsung.c
> index e46d4c492ad8..9a9ad43cc97d 100644
> --- a/drivers/mtd/nand/raw/nand_samsung.c
> +++ b/drivers/mtd/nand/raw/nand_samsung.c
> @@ -20,6 +20,9 @@
>   static void samsung_nand_decode_id(struct nand_chip *chip)
>   {
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
> +
> +	memorg = nanddev_get_memorg(&chip->base);
>   
>   	/* New Samsung (6 byte ID): Samsung K9GAG08U0F (p.44) */
>   	if (chip->id.len == 6 && !nand_is_slc(chip) &&
> @@ -27,29 +30,30 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
>   		u8 extid = chip->id.data[3];
>   
>   		/* Get pagesize */
> -		mtd->writesize = 2048 << (extid & 0x03);
> +		memorg->pagesize = 2048 << (extid & 0x03);
> +		mtd->writesize = memorg->pagesize;
>   
>   		extid >>= 2;
>   
>   		/* Get oobsize */
>   		switch (((extid >> 2) & 0x4) | (extid & 0x3)) {
>   		case 1:
> -			mtd->oobsize = 128;
> +			memorg->oobsize = 128;
>   			break;
>   		case 2:
> -			mtd->oobsize = 218;
> +			memorg->oobsize = 218;
>   			break;
>   		case 3:
> -			mtd->oobsize = 400;
> +			memorg->oobsize = 400;
>   			break;
>   		case 4:
> -			mtd->oobsize = 436;
> +			memorg->oobsize = 436;
>   			break;
>   		case 5:
> -			mtd->oobsize = 512;
> +			memorg->oobsize = 512;
>   			break;
>   		case 6:
> -			mtd->oobsize = 640;
> +			memorg->oobsize = 640;
>   			break;
>   		default:
>   			/*
> @@ -62,8 +66,14 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
>   			break;
>   		}
>   
> +		mtd->oobsize = memorg->oobsize;
> +
>   		/* Get blocksize */
>   		extid >>= 2;
> +		memorg->pages_per_eraseblock = (128 * 1024) <<
> +					       (((extid >> 1) & 0x04) |
> +						(extid & 0x03)) /
> +					       memorg->pagesize;
>   		mtd->erasesize = (128 * 1024) <<
>   				 (((extid >> 1) & 0x04) | (extid & 0x03));
>   
> diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
> index d068163b64b3..d8465049dfd6 100644
> --- a/drivers/mtd/nand/raw/nand_toshiba.c
> +++ b/drivers/mtd/nand/raw/nand_toshiba.c
> @@ -101,6 +101,9 @@ static void toshiba_nand_benand_init(struct nand_chip *chip)
>   static void toshiba_nand_decode_id(struct nand_chip *chip)
>   {
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> +	struct nand_memory_organization *memorg;
> +
> +	memorg = nanddev_get_memorg(&chip->base);
>   
>   	nand_decode_ext_id(chip);
>   
> @@ -114,8 +117,10 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
>   	 */
>   	if (chip->id.len >= 6 && nand_is_slc(chip) &&
>   	    (chip->id.data[5] & 0x7) == 0x6 /* 24nm */ &&
> -	    !(chip->id.data[4] & 0x80) /* !BENAND */)
> -		mtd->oobsize = 32 * mtd->writesize >> 9;
> +	    !(chip->id.data[4] & 0x80) /* !BENAND */) {
> +		memorg->oobsize = 32 * memorg->pagesize >> 9;
> +		mtd->oobsize = memorg->oobsize;
> +	}
>   
>   	/*
>   	 * Extract ECC requirements from 6th id byte.
> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
> index 933d1a629c51..07144c992d54 100644
> --- a/drivers/mtd/nand/raw/nandsim.c
> +++ b/drivers/mtd/nand/raw/nandsim.c
> @@ -2302,6 +2302,10 @@ static int __init ns_init_module(void)
>   
>   	if (overridesize) {
>   		uint64_t new_size = (uint64_t)nsmtd->erasesize << overridesize;
> +		struct nand_memory_organization *memorg;
> +
> +		memorg = nanddev_get_memorg(&chip->base);
> +
>   		if (new_size >> overridesize != nsmtd->erasesize) {
>   			NS_ERR("overridesize is too big\n");
>   			retval = -EINVAL;
> @@ -2309,6 +2313,7 @@ static int __init ns_init_module(void)
>   		}
>   		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
>   		nsmtd->size = new_size;
> +		memorg->eraseblocks_per_lun = 1 << overridesize;
>   		chip->chipsize = new_size;
>   		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
>   		chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
