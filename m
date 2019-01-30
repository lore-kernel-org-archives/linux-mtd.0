Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E717C282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 13:39:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6B7520855
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 13:39:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UANSZMy6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmThoYpm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6B7520855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CF4r5sLbqc0BuXIHV3gf4AP1YVmjz3KGcaIPT9RCWDA=; b=UANSZMy6cqXUIr
	5E7blVOoaNJZTRQbvsb4b1swGVf5RRCDlHNE4wQ7dLFPZuvgS1KOhjKrEMC39LSvhY05rmtzwCAEN
	CzIP0CWqEzwsH5q3UdSZ2S+txn4mFr380RiaqnGenUDsYUIyCUBF/CiRIS7Pvrcv2LOOI39ON4qhX
	9nQn1R+1MBPzbQ+nL0SAEDFliznlQ00rJZ3dAbcwEpiZgBA15Ku+ewwcagFTkBvk4/7KEehptbE8n
	QTeNtKqWpRtsdapKSnca9nLfBMSe1T7JoIsKskamVi+mwOu2bpS69uEtF/f00FfVEdLwbdP7FT+Rx
	LI+A7KatuKKL0QHXVnOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goq5L-0004uN-5r; Wed, 30 Jan 2019 13:39:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goq4y-0004i9-Bg
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 13:39:03 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EC5820855;
 Wed, 30 Jan 2019 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548855539;
 bh=ANOq4Ks1VkJXQZwpn5WfSy/7ddeh4wvUO4vsJLizLVE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pmThoYpmP6fsqamk8NCXT8ISBKJajscJGIo9LSBi3RdnY2kPTtX0CRQ6pQdwiomyt
 9XDhvMDSxFot/sLpbrpghRzNr4Qo/8hKfpKkxnvsJ/Y6FaxgCQOmLCoDUL8+gPLs7i
 w2PMUBrDC5lxZw7OeymL9CDDvgGeNoxQZdNB1lEk=
Date: Wed, 30 Jan 2019 14:38:49 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v3 2/5] mtd: nand: Make flags for bad block marker
 position more granular
Message-ID: <20190130143849.73501e65@bbrezillon>
In-Reply-To: <20190130130111.32724-3-frieder.schrempf@kontron.de>
References: <20190130130111.32724-1-frieder.schrempf@kontron.de>
 <20190130130111.32724-3-frieder.schrempf@kontron.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_053900_901226_BC062059 
X-CRM114-Status: GOOD (  23.13  )
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
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 30 Jan 2019 13:01:47 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> To be able to check and set bad block markers in the first and
> second page of a block independently of each other, we create
> separate flags for both cases.
> 
> Previously NAND_BBM_SECONDPAGE meant, that both, the first and the
> second page were used. With this patch NAND_BBM_FIRSTPAGE stands for
> using the first page and NAND_BBM_SECONDPAGE for using the second
> page.
> 
> This patch is only for preparation of subsequent changes and does
> not implement the logic to actually handle both flags separately.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  drivers/mtd/nand/raw/nand_amd.c      | 2 +-
>  drivers/mtd/nand/raw/nand_base.c     | 6 ++++--
>  drivers/mtd/nand/raw/nand_bbt.c      | 3 ++-
>  drivers/mtd/nand/raw/nand_esmt.c     | 2 +-
>  drivers/mtd/nand/raw/nand_hynix.c    | 2 +-
>  drivers/mtd/nand/raw/nand_macronix.c | 2 +-
>  drivers/mtd/nand/raw/nand_micron.c   | 2 +-
>  drivers/mtd/nand/raw/nand_samsung.c  | 2 +-
>  drivers/mtd/nand/raw/nand_toshiba.c  | 2 +-
>  drivers/mtd/nand/raw/sh_flctl.c      | 2 +-
>  include/linux/mtd/rawnand.h          | 1 +
>  11 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_amd.c b/drivers/mtd/nand/raw/nand_amd.c
> index 6e248bdcc797..6202cbf7ee8d 100644
> --- a/drivers/mtd/nand/raw/nand_amd.c
> +++ b/drivers/mtd/nand/raw/nand_amd.c
> @@ -40,7 +40,7 @@ static void amd_nand_decode_id(struct nand_chip *chip)
>  static int amd_nand_init(struct nand_chip *chip)
>  {
>  	if (nand_is_slc(chip))
> -		chip->options |= NAND_BBM_SECONDPAGE;
> +		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
>  
>  	return 0;
>  }
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index c6199cc68d2f..9ef7b86cdc42 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -302,7 +302,8 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
>  		ofs += mtd->erasesize - mtd->writesize;
>  
>  	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
> -	page_end = page + ((chip->options & NAND_BBM_SECONDPAGE) ? 2 : 1);
> +	page_end = page + (((chip->options & NAND_BBM_FIRSTPAGE) &&
> +			    (chip->options & NAND_BBM_SECONDPAGE)) ? 2 : 1);
>  
>  	for (; page < page_end; page++) {
>  		res = chip->ecc.read_oob(chip, page);
> @@ -550,7 +551,8 @@ static int nand_default_block_markbad(struct nand_chip *chip, loff_t ofs)
>  
>  		i++;
>  		ofs += mtd->writesize;
> -	} while ((chip->options & NAND_BBM_SECONDPAGE) && i < 2);
> +	} while ((chip->options & NAND_BBM_FIRSTPAGE) &&
> +		 (chip->options & NAND_BBM_SECONDPAGE) && i < 2);
>  
>  	return ret;
>  }
> diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
> index 862eaa3a0552..c095c04d566d 100644
> --- a/drivers/mtd/nand/raw/nand_bbt.c
> +++ b/drivers/mtd/nand/raw/nand_bbt.c
> @@ -466,7 +466,8 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
>  
>  	pr_info("Scanning device for bad blocks\n");
>  
> -	if (this->options & NAND_BBM_SECONDPAGE)
> +	if ((this->options & NAND_BBM_FIRSTPAGE) &&
> +	    (this->options & NAND_BBM_SECONDPAGE))
>  		numpages = 2;
>  	else
>  		numpages = 1;
> diff --git a/drivers/mtd/nand/raw/nand_esmt.c b/drivers/mtd/nand/raw/nand_esmt.c
> index 80d2d3a1b5f2..99a8092969a7 100644
> --- a/drivers/mtd/nand/raw/nand_esmt.c
> +++ b/drivers/mtd/nand/raw/nand_esmt.c
> @@ -36,7 +36,7 @@ static void esmt_nand_decode_id(struct nand_chip *chip)
>  static int esmt_nand_init(struct nand_chip *chip)
>  {
>  	if (nand_is_slc(chip))
> -		chip->options |= NAND_BBM_SECONDPAGE;
> +		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
>  
>  	return 0;
>  }
> diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
> index 2789bf3857c9..e685d70c1618 100644
> --- a/drivers/mtd/nand/raw/nand_hynix.c
> +++ b/drivers/mtd/nand/raw/nand_hynix.c
> @@ -674,7 +674,7 @@ static int hynix_nand_init(struct nand_chip *chip)
>  	if (!nand_is_slc(chip))
>  		chip->options |= NAND_BBM_LASTPAGE;
>  	else
> -		chip->options |= NAND_BBM_SECONDPAGE;
> +		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
>  
>  	hynix = kzalloc(sizeof(*hynix), GFP_KERNEL);
>  	if (!hynix)
> diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
> index 6db7ced4b96b..e287e71347c5 100644
> --- a/drivers/mtd/nand/raw/nand_macronix.c
> +++ b/drivers/mtd/nand/raw/nand_macronix.c
> @@ -62,7 +62,7 @@ static void macronix_nand_fix_broken_get_timings(struct nand_chip *chip)
>  static int macronix_nand_init(struct nand_chip *chip)
>  {
>  	if (nand_is_slc(chip))
> -		chip->options |= NAND_BBM_SECONDPAGE;
> +		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
>  
>  	macronix_nand_fix_broken_get_timings(chip);
>  
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index ea6b6e80d6f8..ca80e09783c7 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -448,7 +448,7 @@ static int micron_nand_init(struct nand_chip *chip)
>  		goto err_free_manuf_data;
>  
>  	if (mtd->writesize == 2048)
> -		chip->options |= NAND_BBM_SECONDPAGE;
> +		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
>  
>  	ondie = micron_supports_on_die_ecc(chip);
>  
> diff --git a/drivers/mtd/nand/raw/nand_samsung.c b/drivers/mtd/nand/raw/nand_samsung.c
> index 3be737139210..ace50522dd19 100644
> --- a/drivers/mtd/nand/raw/nand_samsung.c
> +++ b/drivers/mtd/nand/raw/nand_samsung.c
> @@ -123,7 +123,7 @@ static int samsung_nand_init(struct nand_chip *chip)
>  	if (!nand_is_slc(chip))
>  		chip->options |= NAND_BBM_LASTPAGE;
>  	else
> -		chip->options |= NAND_BBM_SECONDPAGE;
> +		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
>  
>  	return 0;
>  }
> diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
> index 222a66bf0aa6..0031e6727193 100644
> --- a/drivers/mtd/nand/raw/nand_toshiba.c
> +++ b/drivers/mtd/nand/raw/nand_toshiba.c
> @@ -147,7 +147,7 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
>  static int toshiba_nand_init(struct nand_chip *chip)
>  {
>  	if (nand_is_slc(chip))
> -		chip->options |=  NAND_BBM_SECONDPAGE;
> +		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
>  
>  	/* Check that chip is BENAND and ECC mode is on-die */
>  	if (nand_is_slc(chip) && chip->ecc.mode == NAND_ECC_ON_DIE &&
> diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
> index 2017b00fadd8..971d9afd55e5 100644
> --- a/drivers/mtd/nand/raw/sh_flctl.c
> +++ b/drivers/mtd/nand/raw/sh_flctl.c
> @@ -1176,7 +1176,7 @@ static int flctl_probe(struct platform_device *pdev)
>  	if (pdata->flcmncr_val & SEL_16BIT)
>  		nand->options |= NAND_BUSWIDTH_16;
>  
> -	nand->options |= NAND_BBM_SECONDPAGE;
> +	nand->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
>  
>  	pm_runtime_enable(&pdev->dev);
>  	pm_runtime_resume(&pdev->dev);
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index da785d92e26e..23ad4ad790af 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -176,6 +176,7 @@ enum nand_ecc_algo {
>   * Position within the block: Each of these pages needs to be checked for a
>   * bad block marking pattern.
>   */
> +#define NAND_BBM_FIRSTPAGE		0x01000000
>  #define NAND_BBM_SECONDPAGE		0x02000000
>  #define NAND_BBM_LASTPAGE		0x04000000
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
