Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E0AC282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:27:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17E5620870
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BOWUVhHL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TO5Gf2/O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17E5620870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXWbophewEG6XXR6/49vn3I8fjxWxQzayWgwMo/98o0=; b=BOWUVhHLeHwYX5
	tMdXB1qwqv81RQlKC1Lwb7CihK7uRw5Hj68AtUWlRtWA/DXZG7ZHlxdCVOUZvGt6Ajp1QQbMiw6G2
	3UOhWFa7Vr7eP2agpED2aMvhinTGQHXMfKb3F5J77u2eQGp19rMZhiamDkw1TzbnyqJtaan/HOpL2
	7uWd8wshaLaFFCZF0h/GCAsrhzcb5d/f4U1Aaj6HV/YYdSBRE7lcS7B7shLMfLb3EVFZxI+YV27nM
	j6OCyNFE1sUu7YZ0FYNWT7qfTkZ97HjsXqdGjaLWTzmw+wem3O4HfeNOv1QQj0UQWZTxRKQalQNM1
	Rgpf372p+Tr8HTuFkyQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glyt6-00040S-Qw; Tue, 22 Jan 2019 16:26:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glyt3-000407-5Z
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 16:26:54 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28CC621726;
 Tue, 22 Jan 2019 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548174412;
 bh=uNOI/dnFI5om+2ahYkWSzmIbJe82Yj46cOMQJSSHOZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TO5Gf2/O7fqRoeAPMwH1yQH8lTNXzUBIFEY2VtFukNu+LKzpVPJ9Uvxe9YgEJEB7Q
 YSqJNuh5Rf40KiiakMyFJbapv0zh+z+y4m2iIBJcYs6iqMGQOevoV6j+JtefzewTiU
 z6fv0XyFi9QTMgMbr8y4GkZjX9CwJImyZ4M2mWo0=
Date: Tue, 22 Jan 2019 17:26:40 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 2/4] mtd: rawnand: Support bad block markers in
 first, second or last page
Message-ID: <20190122172640.6114537f@bbrezillon>
In-Reply-To: <20190122112258.20042-3-frieder.schrempf@kontron.de>
References: <20190122112258.20042-1-frieder.schrempf@kontron.de>
 <20190122112258.20042-3-frieder.schrempf@kontron.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_082653_245158_5CD43439 
X-CRM114-Status: GOOD (  28.38  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 22 Jan 2019 11:23:31 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Currently supported bad block marker positions within the block are:
> * in first page only
> * in last page only
> * in first or second page
> 
> Some ESMT NANDs are known to have been shipped by the manufacturer
> with bad block markers in the first or last page, instead of the
> first or second page.
> 
> Also the datasheets for Cypress/Spansion/AMD NANDs claim that the
> first, second *and* last page needs to be checked.
> 
> Therefore we make it possible to set NAND_BBM_FIRSTPAGE,
> NAND_BBM_SECONDPAGE and NAND_BBM_LASTPAGE independently in any
> combination.
> 
> To simplify the code, the logic to evaluate the flags is moved to a
> a new function nand_bbm_get_next_page().
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  drivers/mtd/nand/raw/internals.h |  1 +
>  drivers/mtd/nand/raw/nand_base.c | 62 ++++++++++++++++++++++++-----------
>  drivers/mtd/nand/raw/nand_bbt.c  | 29 +++++++---------
>  3 files changed, 55 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index fbf6ca015cd7..97ae67e009d5 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -76,6 +76,7 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
>  
>  /* Core functions */
>  const struct nand_manufacturer *nand_get_manufacturer(u8 id);
> +int nand_bbm_get_next_page(struct nand_chip *chip, int page);
>  int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
>  int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
>  		    int allowbbt);
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 9ef7b86cdc42..7bc20c1fe23c 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -285,6 +285,31 @@ static void nand_release_device(struct nand_chip *chip)
>  	spin_unlock(&chip->controller->lock);
>  }
>  
> +/**
> + * nand_bbm_get_next_page - Get the next page for bad block markers
> + * @chip: NAND chip object
> + * @index: Current page, only pages beyond this will be considered
> + *
> + * Returns an integer that corresponds to the page offset within a block, for
> + * a page that is used to store bad block markers. If no more pages are
> + * available, -1 is returned.
> + */
> +int nand_bbm_get_next_page(struct nand_chip *chip, int page)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	int last_page = ((mtd->erasesize - mtd->writesize) >>
> +			 chip->page_shift) & chip->pagemask;
> +
> +	if (page < 0 && chip->options & NAND_BBM_FIRSTPAGE)
> +		return 0;
> +	else if (page < 1 && chip->options & NAND_BBM_SECONDPAGE)
> +		return 1;
> +	else if (page < last_page && chip->options & NAND_BBM_LASTPAGE)
> +		return last_page;
> +
> +	return -1;
> +}
> +
>  /**
>   * nand_block_bad - [DEFAULT] Read bad block marker from the chip
>   * @chip: NAND chip object
> @@ -294,19 +319,14 @@ static void nand_release_device(struct nand_chip *chip)
>   */
>  static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
>  {
> -	struct mtd_info *mtd = nand_to_mtd(chip);
> -	int page, page_end, res;
> +	int page_offset;
> +	int res, first_page = (int)(ofs >> chip->page_shift) & chip->pagemask;
>  	u8 bad;
>  
> -	if (chip->options & NAND_BBM_LASTPAGE)
> -		ofs += mtd->erasesize - mtd->writesize;
> +	page_offset = nand_bbm_get_next_page(chip, -1);
>  
> -	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
> -	page_end = page + (((chip->options & NAND_BBM_FIRSTPAGE) &&
> -			    (chip->options & NAND_BBM_SECONDPAGE)) ? 2 : 1);
> -
> -	for (; page < page_end; page++) {
> -		res = chip->ecc.read_oob(chip, page);
> +	while (page_offset != -1) {
> +		res = chip->ecc.read_oob(chip, first_page + page_offset);
>  		if (res < 0)
>  			return res;
>  
> @@ -318,6 +338,8 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
>  			res = hweight8(bad) < chip->badblockbits;
>  		if (res)
>  			return res;
> +
> +		page_offset = nand_bbm_get_next_page(chip, page_offset);
>  	}
>  
>  	return 0;
> @@ -528,7 +550,7 @@ static int nand_default_block_markbad(struct nand_chip *chip, loff_t ofs)
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	struct mtd_oob_ops ops;
>  	uint8_t buf[2] = { 0, 0 };
> -	int ret = 0, res, i = 0;
> +	int ret = 0, res, page_offset;
>  
>  	memset(&ops, 0, sizeof(ops));
>  	ops.oobbuf = buf;
> @@ -541,18 +563,18 @@ static int nand_default_block_markbad(struct nand_chip *chip, loff_t ofs)
>  	}
>  	ops.mode = MTD_OPS_PLACE_OOB;
>  
> -	/* Write to first/last page(s) if necessary */
> -	if (chip->options & NAND_BBM_LASTPAGE)
> -		ofs += mtd->erasesize - mtd->writesize;
> -	do {
> -		res = nand_do_write_oob(chip, ofs, &ops);
> +	page_offset = nand_bbm_get_next_page(chip, -1);
> +
> +	while (page_offset != -1) {
> +		res = nand_do_write_oob(chip,
> +					ofs + page_offset * mtd->writesize,
> +					&ops);
> +
>  		if (!ret)
>  			ret = res;
>  
> -		i++;
> -		ofs += mtd->writesize;
> -	} while ((chip->options & NAND_BBM_FIRSTPAGE) &&
> -		 (chip->options & NAND_BBM_SECONDPAGE) && i < 2);
> +		page_offset = nand_bbm_get_next_page(chip, page_offset);
> +	}
>  
>  	return ret;
>  }
> diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
> index c095c04d566d..09603c502931 100644
> --- a/drivers/mtd/nand/raw/nand_bbt.c
> +++ b/drivers/mtd/nand/raw/nand_bbt.c
> @@ -415,11 +415,12 @@ static void read_abs_bbts(struct nand_chip *this, uint8_t *buf,
>  
>  /* Scan a given block partially */
>  static int scan_block_fast(struct nand_chip *this, struct nand_bbt_descr *bd,
> -			   loff_t offs, uint8_t *buf, int numpages)
> +			   loff_t offs, uint8_t *buf)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(this);
> +
>  	struct mtd_oob_ops ops;
> -	int j, ret;
> +	int ret, page_offset;
>  
>  	ops.ooblen = mtd->oobsize;
>  	ops.oobbuf = buf;
> @@ -427,12 +428,15 @@ static int scan_block_fast(struct nand_chip *this, struct nand_bbt_descr *bd,
>  	ops.datbuf = NULL;
>  	ops.mode = MTD_OPS_PLACE_OOB;
>  
> -	for (j = 0; j < numpages; j++) {
> +	page_offset = nand_bbm_get_next_page(this, -1);
> +
> +	while (page_offset != -1) {
>  		/*
>  		 * Read the full oob until read_oob is fixed to handle single
>  		 * byte reads for 16 bit buswidth.
>  		 */
> -		ret = mtd_read_oob(mtd, offs, &ops);
> +		ret = mtd_read_oob(mtd, offs + page_offset * mtd->writesize,
> +				   &ops);
>  		/* Ignore ECC errors when checking for BBM */
>  		if (ret && !mtd_is_bitflip_or_eccerr(ret))
>  			return ret;
> @@ -440,8 +444,9 @@ static int scan_block_fast(struct nand_chip *this, struct nand_bbt_descr *bd,
>  		if (check_short_pattern(buf, bd))
>  			return 1;
>  
> -		offs += mtd->writesize;
> +		page_offset = nand_bbm_get_next_page(this, page_offset);
>  	}
> +
>  	return 0;
>  }
>  
> @@ -460,18 +465,11 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
>  		      struct nand_bbt_descr *bd, int chip)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(this);
> -	int i, numblocks, numpages;
> -	int startblock;
> +	int i, numblocks, startblock;
>  	loff_t from;
>  
>  	pr_info("Scanning device for bad blocks\n");
>  
> -	if ((this->options & NAND_BBM_FIRSTPAGE) &&
> -	    (this->options & NAND_BBM_SECONDPAGE))
> -		numpages = 2;
> -	else
> -		numpages = 1;
> -
>  	if (chip == -1) {
>  		numblocks = mtd->size >> this->bbt_erase_shift;
>  		startblock = 0;
> @@ -488,15 +486,12 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
>  		from = (loff_t)startblock << this->bbt_erase_shift;
>  	}
>  
> -	if (this->bbt_options & NAND_BBM_LASTPAGE)
> -		from += mtd->erasesize - (mtd->writesize * numpages);
> -
>  	for (i = startblock; i < numblocks; i++) {
>  		int ret;
>  
>  		BUG_ON(bd->options & NAND_BBT_NO_OOB);
>  
> -		ret = scan_block_fast(this, bd, from, buf, numpages);
> +		ret = scan_block_fast(this, bd, from, buf);
>  		if (ret < 0)
>  			return ret;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
