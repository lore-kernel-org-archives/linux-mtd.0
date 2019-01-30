Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB382C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 13:28:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B57220989
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 13:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qTW1IQFu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="udQRjtYq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B57220989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBaObZr9X6nWe4pyHNSom13RZeVJi26Q/RO0sG2Ap0U=; b=qTW1IQFu/7j/qk
	O+GopzDIQQm0r8P4DXvNRPaQ3/FSnvYckL73jmGwvP8B0okSdONg+cIi9UTPAiW2jpOUUwiyrgGuY
	SQ+l8WkarS5ST2kJo9ji3FYx3ukBqKKJQU4vMabGbabUwZv6KEU1Y+D5E9OV3K4ngzdXb7oju9cX4
	nvGmfwmPZWJVOLKTUvZOdKUmZ++ZOBO3G6ojR7PANvGGOGlnKMjPWqVZMTrrbEAXKsr3dmMBPAeBB
	k5STKydT2lTe+hv5E4AUoszNbupLEih4NTOs2rTq5ViZoVLhZsBILYUQUX2TUWsi+zjjXVnwc7K2+
	OsxM4i+aN8ZY2+9z2ajw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gopvC-0007zp-9w; Wed, 30 Jan 2019 13:28:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gopv9-0007z5-Qb
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 13:28:53 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF82920989;
 Wed, 30 Jan 2019 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548854929;
 bh=qavFVLHOnztYwoAr490K7QpDJg81d45YuBOQPHprG6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=udQRjtYqYAV3tiBLoPP6EeR8oRLUeKGt9IiKjpyIDwcCZkXEvDg5yzIJQhuXwJ05m
 R2QWjJ/P14lwKTeinjzUVce5lp3havNOTTOSW1jy+uUl3jti/Q5VvVHQI4xVGyaqhk
 RhEJnhFTTMANOINH4gdtgDb3PKmP/x2g6WHh5MoQ=
Date: Wed, 30 Jan 2019 14:28:38 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v3 1/5] mtd: nand: Always store info about bad block
 markers in chip struct
Message-ID: <20190130142838.5590f8b4@bbrezillon>
In-Reply-To: <20190130130111.32724-2-frieder.schrempf@kontron.de>
References: <20190130130111.32724-1-frieder.schrempf@kontron.de>
 <20190130130111.32724-2-frieder.schrempf@kontron.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_052851_894466_E779D3DC 
X-CRM114-Status: GOOD (  21.68  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 30 Jan 2019 13:01:44 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> The information about where the manufacturer puts the bad block
> markers inside the bad block and in the OOB data is stored in
> different places. Let's move this information to nand_chip.options
> and nand_chip.badblockpos.
> 
> As this chip-specific information is not directly related to the
> bad block table (BBT), we also rename the flags to NAND_BBM_*.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  drivers/mtd/nand/onenand/onenand_base.c |  2 +-
>  drivers/mtd/nand/onenand/onenand_bbt.c  |  2 +-
>  drivers/mtd/nand/raw/nand_amd.c         |  2 +-
>  drivers/mtd/nand/raw/nand_base.c        | 12 ++++++------
>  drivers/mtd/nand/raw/nand_bbt.c         |  4 ++--
>  drivers/mtd/nand/raw/nand_esmt.c        |  2 +-
>  drivers/mtd/nand/raw/nand_hynix.c       |  4 ++--
>  drivers/mtd/nand/raw/nand_macronix.c    |  2 +-
>  drivers/mtd/nand/raw/nand_micron.c      |  2 +-
>  drivers/mtd/nand/raw/nand_samsung.c     |  4 ++--
>  drivers/mtd/nand/raw/nand_toshiba.c     |  2 +-
>  drivers/mtd/nand/raw/sh_flctl.c         |  4 ++--
>  include/linux/mtd/bbm.h                 | 14 +-------------
>  include/linux/mtd/rawnand.h             | 15 +++++++++++++++

Might be better to split that in 2 patches:
- update onenand logic
- update rawnand logic

>  14 files changed, 37 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
> index 4ca4b194e7d7..d6701b8f031f 100644
> --- a/drivers/mtd/nand/onenand/onenand_base.c
> +++ b/drivers/mtd/nand/onenand/onenand_base.c
> @@ -2458,7 +2458,7 @@ static int onenand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
>                  bbm->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
>  
>          /* We write two bytes, so we don't have to mess with 16-bit access */
> -        ofs += mtd->oobsize + (bbm->badblockpos & ~0x01);
> +        ofs += mtd->oobsize + (this->badblockpos & ~0x01);

Looks like the ->badblockpos field does not exist in struct
onenand_chip, which means you didn't compile test this part ;-).

>  	/* FIXME : What to do when marking SLC block in partition
>  	 * 	   with MLC erasesize? For now, it is not advisable to
>  	 *	   create partitions containing both SLC and MLC regions.
> diff --git a/drivers/mtd/nand/onenand/onenand_bbt.c b/drivers/mtd/nand/onenand/onenand_bbt.c
> index dde20487937d..880b0abd36c8 100644
> --- a/drivers/mtd/nand/onenand/onenand_bbt.c
> +++ b/drivers/mtd/nand/onenand/onenand_bbt.c
> @@ -191,7 +191,7 @@ static int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
>  		return -ENOMEM;
>  
>  	/* Set the bad block position */
> -	bbm->badblockpos = ONENAND_BADBLOCK_POS;
> +	this->badblockpos = NAND_BBM_POS_ONENAND;

This should be done in onenand_base.c not onenand_bbt.c.

>  
>  	/* Set erase shift */
>  	bbm->bbt_erase_shift = this->erase_shift;

...

> diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
> index 1b722fe9213c..862eaa3a0552 100644
> --- a/drivers/mtd/nand/raw/nand_bbt.c
> +++ b/drivers/mtd/nand/raw/nand_bbt.c
> @@ -466,7 +466,7 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
>  
>  	pr_info("Scanning device for bad blocks\n");
>  
> -	if (bd->options & NAND_BBT_SCAN2NDPAGE)
> +	if (this->options & NAND_BBM_SECONDPAGE)
>  		numpages = 2;
>  	else
>  		numpages = 1;
> @@ -487,7 +487,7 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
>  		from = (loff_t)startblock << this->bbt_erase_shift;
>  	}
>  
> -	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
> +	if (this->bbt_options & NAND_BBM_LASTPAGE)

You're not checking the right field here:

	if (this->options & NAND_BBM_LASTPAGE)

>  		from += mtd->erasesize - (mtd->writesize * numpages);
>  
>  	for (i = startblock; i < numblocks; i++) {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
