Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0314C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 09:04:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A456E20643
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 09:04:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oux3K4q8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A456E20643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvhNIec9i2KuNsRlIs4oPIFA/VwO28ISdKmHVQUB54E=; b=Oux3K4q8BUlNuK
	3iSMiGy6rlBbdEsxbGN3prJxuU1PXFKhAU0GZRPHOAlSIhUDzTYzMckHCPEGRkw8U3k33Zmstzj29
	HY/dIpFTTbrTRh6UqW1ZyrF79uzDs13bllVcPwMMjmYcr8C0DXdmOT/7GOnAz9cWAoYyPRd0Gtm+7
	7aGq6MN4zoXRjBup/IE2Cwua+X9ml4+hqBhqwSHOrTbR0KkwpgX/Xa9S1g+3pAVKRIwB2ynrBfEYc
	dQCPZPFTP7eZLSENV/lX6W6LKGzyZN+VOniugq5oq8XuiXsHX31IWh69IsPNqRhFNZnfRJzIdG2vJ
	ScQ19/WzWF7lJ9DZztSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6tcT-0005Gs-KV; Thu, 21 Mar 2019 09:04:13 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6tbw-0004rG-27; Thu, 21 Mar 2019 09:03:51 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 7D56A67A91B;
 Thu, 21 Mar 2019 10:03:32 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 21 Mar
 2019 10:03:32 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Thu, 21 Mar 2019 10:03:32 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "Marek
 Vasut" <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 13/15] mtd: rawnand: Get rid of chip->chipsize
Thread-Topic: [PATCH v2 13/15] mtd: rawnand: Get rid of chip->chipsize
Thread-Index: AQHU0sdL2W2yOr1rlEeDaPgi4AlxbqYV05aA
Date: Thu, 21 Mar 2019 09:03:31 +0000
Message-ID: <11e71206-6957-0c4b-8289-73f6db929a6c@kontron.de>
References: <20190304201522.11323-1-miquel.raynal@bootlin.com>
 <20190304201522.11323-14-miquel.raynal@bootlin.com>
In-Reply-To: <20190304201522.11323-14-miquel.raynal@bootlin.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.43]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <68D20DD5B437E444ADFB27D41D35909A@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 7D56A67A91B.A137C
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
X-CRM114-CacheID: sfid-20190321_020340_596184_D430AB3B 
X-CRM114-Status: GOOD (  22.78  )
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
> The target size can now be returned by nanddev_get_targetsize(). Get
> rid of the chip->chipsize field and use this helper instead.
> 
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  |  2 +-
>   drivers/mtd/nand/raw/denali.c                 |  1 -
>   drivers/mtd/nand/raw/fsl_elbc_nand.c          |  2 +-
>   drivers/mtd/nand/raw/fsl_ifc_nand.c           |  2 +-
>   drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c    |  2 +-
>   drivers/mtd/nand/raw/jz4740_nand.c            |  2 +-
>   drivers/mtd/nand/raw/nand_base.c              | 17 ++++++-------
>   drivers/mtd/nand/raw/nand_bbt.c               | 25 ++++++++++++-------
>   drivers/mtd/nand/raw/nand_jedec.c             |  2 --
>   drivers/mtd/nand/raw/nand_onfi.c              |  2 --
>   drivers/mtd/nand/raw/nandsim.c                |  6 +++--
>   drivers/mtd/nand/raw/sh_flctl.c               |  9 ++++---
>   include/linux/mtd/rawnand.h                   |  2 --
>   13 files changed, 38 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
> index a37cbfe56567..a53ffb3d64b0 100644
> --- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
> +++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
> @@ -428,7 +428,7 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnflash *b47n)
>   	}
>   
>   	/* Configure FLASH */
> -	chipsize = b47n->nand_chip.chipsize >> 20;
> +	chipsize = nanddev_target_size(&b47n->nand_chip.base) >> 20;
>   	tbits = ffs(chipsize); /* find first bit set */
>   	if (!tbits || tbits != fls(chipsize)) {
>   		pr_err("Invalid flash size: 0x%lX\n", chipsize);
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index 86e5df403beb..3ec0242b0aa2 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1157,7 +1157,6 @@ static int denali_multidev_fixup(struct denali_nand_info *denali)
>   	mtd->erasesize <<= 1;
>   	mtd->writesize <<= 1;
>   	mtd->oobsize <<= 1;
> -	chip->chipsize <<= 1;
>   	chip->page_shift += 1;
>   	chip->phys_erase_shift += 1;
>   	chip->bbt_erase_shift += 1;
> diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
> index 70f0d2b450ea..1d960a6cd691 100644
> --- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
> @@ -655,7 +655,7 @@ static int fsl_elbc_attach_chip(struct nand_chip *chip)
>   	dev_dbg(priv->dev, "fsl_elbc_init: nand->numchips = %d\n",
>   	        chip->numchips);
>   	dev_dbg(priv->dev, "fsl_elbc_init: nand->chipsize = %lld\n",
> -	        chip->chipsize);
> +	        nanddev_target_size(&chip->base));
>   	dev_dbg(priv->dev, "fsl_elbc_init: nand->pagemask = %8x\n",
>   	        chip->pagemask);
>   	dev_dbg(priv->dev, "fsl_elbc_init: nand->legacy.chip_delay = %d\n",
> diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> index e65d274399f9..a9e8f89aeebd 100644
> --- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
> @@ -724,7 +724,7 @@ static int fsl_ifc_attach_chip(struct nand_chip *chip)
>   	dev_dbg(priv->dev, "%s: nand->numchips = %d\n", __func__,
>   							chip->numchips);
>   	dev_dbg(priv->dev, "%s: nand->chipsize = %lld\n", __func__,
> -							chip->chipsize);
> +	        nanddev_target_size(&chip->base));
>   	dev_dbg(priv->dev, "%s: nand->pagemask = %8x\n", __func__,
>   							chip->pagemask);
>   	dev_dbg(priv->dev, "%s: nand->legacy.chip_delay = %d\n", __func__,
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 05f6f68e4e0d..6151214eddec 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -1753,7 +1753,7 @@ static int mx23_boot_init(struct gpmi_nand_data  *this)
>   	dev_dbg(dev, "Transcribing bad block marks...\n");
>   
>   	/* Compute the number of blocks in the entire medium. */
> -	block_count = chip->chipsize >> chip->phys_erase_shift;
> +	block_count = nanddev_eraseblocks_per_target(&chip->base);
>   
>   	/*
>   	 * Loop over all the blocks in the medium, transcribing block marks as
> diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
> index 76a32ad2cf83..06690b3603b1 100644
> --- a/drivers/mtd/nand/raw/jz4740_nand.c
> +++ b/drivers/mtd/nand/raw/jz4740_nand.c
> @@ -356,7 +356,7 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
>   		/* Update size of the MTD. */
>   		chip->numchips++;
>   		memorg->ntargets++;
> -		mtd->size += chip->chipsize;
> +		mtd->size += nanddev_target_size(&chip->base);
>   	}
>   
>   	dev_info(&pdev->dev, "Found chip %zu on bank %i\n", chipnr, bank);
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 91fd508cf406..427c80abef3f 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4587,7 +4587,6 @@ static bool find_full_id_nand(struct nand_chip *chip,
>   		mtd->oobsize = memorg->oobsize;
>   
>   		memorg->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
> -		chip->chipsize = (uint64_t)type->chipsize << 20;
>   		memorg->eraseblocks_per_lun =
>   			DIV_ROUND_DOWN_ULL((u64)type->chipsize << 20,
>   					   memorg->pagesize *
> @@ -4678,6 +4677,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>   	int busw, ret;
>   	u8 *id_data = chip->id.data;
>   	u8 maf_id, dev_id;
> +	u64 targetsize;
>   
>   	/*
>   	 * Let's start by initializing memorg fields that might be left
> @@ -4782,8 +4782,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>   	if (!chip->parameters.model)
>   		return -ENOMEM;
>   
> -	chip->chipsize = (uint64_t)type->chipsize << 20;
> -
>   	if (!type->pagesize)
>   		nand_manufacturer_detect(chip);
>   	else
> @@ -4825,14 +4823,15 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>   	/* Calculate the address shift from the page size */
>   	chip->page_shift = ffs(mtd->writesize) - 1;
>   	/* Convert chipsize to number of pages per chip -1 */
> -	chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
> +	targetsize = nanddev_target_size(&chip->base);
> +	chip->pagemask = (targetsize >> chip->page_shift) - 1;
>   
>   	chip->bbt_erase_shift = chip->phys_erase_shift =
>   		ffs(mtd->erasesize) - 1;
> -	if (chip->chipsize & 0xffffffff)
> -		chip->chip_shift = ffs((unsigned)chip->chipsize) - 1;
> +	if (targetsize & 0xffffffff)
> +		chip->chip_shift = ffs((unsigned)targetsize) - 1;
>   	else {
> -		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32));
> +		chip->chip_shift = ffs((unsigned)(targetsize >> 32));
>   		chip->chip_shift += 32 - 1;
>   	}
>   
> @@ -4848,7 +4847,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>   	pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
>   		chip->parameters.model);
>   	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
> -		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
> +		(int)(targetsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
>   		mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
>   	return 0;
>   
> @@ -5093,7 +5092,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
>   	/* Store the number of chips and calc total size for mtd */
>   	memorg->ntargets = i;
>   	chip->numchips = i;
> -	mtd->size = i * chip->chipsize;
> +	mtd->size = i * nanddev_target_size(&chip->base);
>   
>   	return 0;
>   }
> diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
> index 0b96c4cab967..e3308857b2ee 100644
> --- a/drivers/mtd/nand/raw/nand_bbt.c
> +++ b/drivers/mtd/nand/raw/nand_bbt.c
> @@ -264,6 +264,7 @@ static int read_abs_bbt(struct nand_chip *this, uint8_t *buf,
>   			struct nand_bbt_descr *td, int chip)
>   {
>   	struct mtd_info *mtd = nand_to_mtd(this);
> +	u64 targetsize = nanddev_target_size(&this->base);
>   	int res = 0, i;
>   
>   	if (td->options & NAND_BBT_PERCHIP) {
> @@ -271,11 +272,11 @@ static int read_abs_bbt(struct nand_chip *this, uint8_t *buf,
>   		for (i = 0; i < this->numchips; i++) {
>   			if (chip == -1 || chip == i)
>   				res = read_bbt(this, buf, td->pages[i],
> -					this->chipsize >> this->bbt_erase_shift,
> +					targetsize >> this->bbt_erase_shift,
>   					td, offs);
>   			if (res)
>   				return res;
> -			offs += this->chipsize >> this->bbt_erase_shift;
> +			offs += targetsize >> this->bbt_erase_shift;
>   		}
>   	} else {
>   		res = read_bbt(this, buf, td->pages[0],
> @@ -459,6 +460,7 @@ static int scan_block_fast(struct nand_chip *this, struct nand_bbt_descr *bd,
>   static int create_bbt(struct nand_chip *this, uint8_t *buf,
>   		      struct nand_bbt_descr *bd, int chip)
>   {
> +	u64 targetsize = nanddev_target_size(&this->base);
>   	struct mtd_info *mtd = nand_to_mtd(this);
>   	int i, numblocks, numpages;
>   	int startblock;
> @@ -481,7 +483,7 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
>   			       chip + 1, this->numchips);
>   			return -EINVAL;
>   		}
> -		numblocks = this->chipsize >> this->bbt_erase_shift;
> +		numblocks = targetsize >> this->bbt_erase_shift;
>   		startblock = chip * numblocks;
>   		numblocks += startblock;
>   		from = (loff_t)startblock << this->bbt_erase_shift;
> @@ -529,6 +531,7 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
>   static int search_bbt(struct nand_chip *this, uint8_t *buf,
>   		      struct nand_bbt_descr *td)
>   {
> +	u64 targetsize = nanddev_target_size(&this->base);
>   	struct mtd_info *mtd = nand_to_mtd(this);
>   	int i, chips;
>   	int startblock, block, dir;
> @@ -548,7 +551,7 @@ static int search_bbt(struct nand_chip *this, uint8_t *buf,
>   	/* Do we have a bbt per chip? */
>   	if (td->options & NAND_BBT_PERCHIP) {
>   		chips = this->numchips;
> -		bbtblocks = this->chipsize >> this->bbt_erase_shift;
> +		bbtblocks = targetsize >> this->bbt_erase_shift;
>   		startblock &= bbtblocks - 1;
>   	} else {
>   		chips = 1;
> @@ -576,7 +579,7 @@ static int search_bbt(struct nand_chip *this, uint8_t *buf,
>   				break;
>   			}
>   		}
> -		startblock += this->chipsize >> this->bbt_erase_shift;
> +		startblock += targetsize >> this->bbt_erase_shift;
>   	}
>   	/* Check, if we found a bbt for each requested chip */
>   	for (i = 0; i < chips; i++) {
> @@ -626,6 +629,7 @@ static void search_read_bbts(struct nand_chip *this, uint8_t *buf,
>   static int get_bbt_block(struct nand_chip *this, struct nand_bbt_descr *td,
>   			 struct nand_bbt_descr *md, int chip)
>   {
> +	u64 targetsize = nanddev_target_size(&this->base);
>   	int startblock, dir, page, numblocks, i;
>   
>   	/*
> @@ -637,7 +641,7 @@ static int get_bbt_block(struct nand_chip *this, struct nand_bbt_descr *td,
>   		return td->pages[chip] >>
>   				(this->bbt_erase_shift - this->page_shift);
>   
> -	numblocks = (int)(this->chipsize >> this->bbt_erase_shift);
> +	numblocks = (int)(targetsize >> this->bbt_erase_shift);
>   	if (!(td->options & NAND_BBT_PERCHIP))
>   		numblocks *= this->numchips;
>   
> @@ -717,6 +721,7 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
>   		     struct nand_bbt_descr *td, struct nand_bbt_descr *md,
>   		     int chipsel)
>   {
> +	u64 targetsize = nanddev_target_size(&this->base);
>   	struct mtd_info *mtd = nand_to_mtd(this);
>   	struct erase_info einfo;
>   	int i, res, chip = 0;
> @@ -737,7 +742,7 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
>   		rcode = 0xff;
>   	/* Write bad block table per chip rather than per device? */
>   	if (td->options & NAND_BBT_PERCHIP) {
> -		numblocks = (int)(this->chipsize >> this->bbt_erase_shift);
> +		numblocks = (int)(targetsize >> this->bbt_erase_shift);
>   		/* Full device write or specific chip? */
>   		if (chipsel == -1) {
>   			nrchips = this->numchips;
> @@ -1099,6 +1104,7 @@ static int nand_update_bbt(struct nand_chip *this, loff_t offs)
>    */
>   static void mark_bbt_region(struct nand_chip *this, struct nand_bbt_descr *td)
>   {
> +	u64 targetsize = nanddev_target_size(&this->base);
>   	struct mtd_info *mtd = nand_to_mtd(this);
>   	int i, j, chips, block, nrblocks, update;
>   	uint8_t oldval;
> @@ -1106,7 +1112,7 @@ static void mark_bbt_region(struct nand_chip *this, struct nand_bbt_descr *td)
>   	/* Do we have a bbt per chip? */
>   	if (td->options & NAND_BBT_PERCHIP) {
>   		chips = this->numchips;
> -		nrblocks = (int)(this->chipsize >> this->bbt_erase_shift);
> +		nrblocks = (int)(targetsize >> this->bbt_erase_shift);
>   	} else {
>   		chips = 1;
>   		nrblocks = (int)(mtd->size >> this->bbt_erase_shift);
> @@ -1159,6 +1165,7 @@ static void mark_bbt_region(struct nand_chip *this, struct nand_bbt_descr *td)
>    */
>   static void verify_bbt_descr(struct nand_chip *this, struct nand_bbt_descr *bd)
>   {
> +	u64 targetsize = nanddev_target_size(&this->base);
>   	struct mtd_info *mtd = nand_to_mtd(this);
>   	u32 pattern_len;
>   	u32 bits;
> @@ -1187,7 +1194,7 @@ static void verify_bbt_descr(struct nand_chip *this, struct nand_bbt_descr *bd)
>   	}
>   
>   	if (bd->options & NAND_BBT_PERCHIP)
> -		table_size = this->chipsize >> this->bbt_erase_shift;
> +		table_size = targetsize >> this->bbt_erase_shift;
>   	else
>   		table_size = mtd->size >> this->bbt_erase_shift;
>   	table_size >>= 3;
> diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
> index 030f178c7a97..99e2f017c79b 100644
> --- a/drivers/mtd/nand/raw/nand_jedec.c
> +++ b/drivers/mtd/nand/raw/nand_jedec.c
> @@ -101,8 +101,6 @@ int nand_jedec_detect(struct nand_chip *chip)
>   	/* Please reference to the comment for nand_flash_detect_onfi. */
>   	memorg->eraseblocks_per_lun =
>   		1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
> -	chip->chipsize = memorg->eraseblocks_per_lun;
> -	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
>   	memorg->bits_per_cell = p->bits_per_cell;
>   
>   	if (le16_to_cpu(p->features) & JEDEC_FEATURE_16_BIT_BUS)
> diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
> index a6b9fc9a335b..7b468e7214c7 100644
> --- a/drivers/mtd/nand/raw/nand_onfi.c
> +++ b/drivers/mtd/nand/raw/nand_onfi.c
> @@ -246,8 +246,6 @@ int nand_onfi_detect(struct nand_chip *chip)
>   	memorg->eraseblocks_per_lun =
>   		1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
>   	memorg->max_bad_eraseblocks_per_lun = le32_to_cpu(p->blocks_per_lun);
> -	chip->chipsize = memorg->eraseblocks_per_lun;
> -	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
>   	memorg->bits_per_cell = p->bits_per_cell;
>   
>   	if (le16_to_cpu(p->features) & ONFI_FEATURE_16_BIT_BUS)
> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
> index 07144c992d54..670abe8d59ca 100644
> --- a/drivers/mtd/nand/raw/nandsim.c
> +++ b/drivers/mtd/nand/raw/nandsim.c
> @@ -2303,6 +2303,7 @@ static int __init ns_init_module(void)
>   	if (overridesize) {
>   		uint64_t new_size = (uint64_t)nsmtd->erasesize << overridesize;
>   		struct nand_memory_organization *memorg;
> +		u64 targetsize;
>   
>   		memorg = nanddev_get_memorg(&chip->base);
>   
> @@ -2311,12 +2312,13 @@ static int __init ns_init_module(void)
>   			retval = -EINVAL;
>   			goto err_exit;
>   		}
> +
>   		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
>   		nsmtd->size = new_size;
>   		memorg->eraseblocks_per_lun = 1 << overridesize;
> -		chip->chipsize = new_size;
> +		targetsize = nanddev_target_size(&chip->base);
>   		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
> -		chip->pagemask = (chip->chipsize >> chip->page_shift) - 1;
> +		chip->pagemask = (targetsize >> chip->page_shift) - 1;
>   	}
>   
>   	if ((retval = setup_wear_reporting(nsmtd)) != 0)
> diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
> index cf6b1be1cf9c..3f610040f0c3 100644
> --- a/drivers/mtd/nand/raw/sh_flctl.c
> +++ b/drivers/mtd/nand/raw/sh_flctl.c
> @@ -986,6 +986,7 @@ static void flctl_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
>   
>   static int flctl_chip_attach_chip(struct nand_chip *chip)
>   {
> +	u64 targetsize = nanddev_target_size(&chip->base);
>   	struct mtd_info *mtd = nand_to_mtd(chip);
>   	struct sh_flctl *flctl = mtd_to_flctl(mtd);
>   
> @@ -998,11 +999,11 @@ static int flctl_chip_attach_chip(struct nand_chip *chip)
>   
>   	if (mtd->writesize == 512) {
>   		flctl->page_size = 0;
> -		if (chip->chipsize > (32 << 20)) {
> +		if (targetsize > (32 << 20)) {
>   			/* big than 32MB */
>   			flctl->rw_ADRCNT = ADRCNT_4;
>   			flctl->erase_ADRCNT = ADRCNT_3;
> -		} else if (chip->chipsize > (2 << 16)) {
> +		} else if (targetsize > (2 << 16)) {
>   			/* big than 128KB */
>   			flctl->rw_ADRCNT = ADRCNT_3;
>   			flctl->erase_ADRCNT = ADRCNT_2;
> @@ -1012,11 +1013,11 @@ static int flctl_chip_attach_chip(struct nand_chip *chip)
>   		}
>   	} else {
>   		flctl->page_size = 1;
> -		if (chip->chipsize > (128 << 20)) {
> +		if (targetsize > (128 << 20)) {
>   			/* big than 128MB */
>   			flctl->rw_ADRCNT = ADRCNT2_E;
>   			flctl->erase_ADRCNT = ADRCNT_3;
> -		} else if (chip->chipsize > (8 << 16)) {
> +		} else if (targetsize > (8 << 16)) {
>   			/* big than 512KB */
>   			flctl->rw_ADRCNT = ADRCNT_4;
>   			flctl->erase_ADRCNT = ADRCNT_2;
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 24ecd9a4f952..a127eb773b1a 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1015,7 +1015,6 @@ struct nand_legacy {
>    *			      ONFI compliant or deduced from the datasheet if
>    *			      the NAND chip is not ONFI compliant.
>    * @numchips:		[INTERN] number of physical chips
> - * @chipsize:		[INTERN] the size of one chip for multichip arrays
>    * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
>    * @data_buf:		[INTERN] buffer for data, size is (page size + oobsize).
>    * @pagecache:		Structure containing page cache related fields
> @@ -1062,7 +1061,6 @@ struct nand_chip {
>   	int bbt_erase_shift;
>   	int chip_shift;
>   	int numchips;
> -	uint64_t chipsize;
>   	int pagemask;
>   	u8 *data_buf;
>   
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
