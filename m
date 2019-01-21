Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E54C282E9
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 08:13:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8A62085A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 08:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="shMNlxLx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2TR12+jl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8A62085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=am6xstYm7bEzVlnGmUfznPbwqplnSWIyyek47uOEv7U=; b=shMNlxLxUeR4Nh
	7zqth/ty/adrc5ANJa05hnpESYX80r3zK0sJ+ObsLANFfY8rOjf35zMqjiztDLzv2wjBkINcba5Wi
	dl9kP43tSRGF51mH+mQSVh8GaUlZCBekhHFdEOIaQJsLi+R8ykcnnU/ntZq/bXsAlnLtqWcCWZs6y
	xS96rhzFRGzhjXhwQuxtf71EVIgaikF9DLoqBsVBGzPF/VGuGrHENYFVvz0j9Ns6yg5GnCy52+Q2X
	sUHXn0K03rfRGkLbJSiulVEnNvCiaj2cVctb32IFMUwjuZkTB0gGxyiCiwpQQ6pwdjX7njet8sl+a
	Di4uuReMSW7py5UAySow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glUhr-0003vd-JV; Mon, 21 Jan 2019 08:13:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glUhn-0003nM-SP
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 08:13:18 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 730DB20855;
 Mon, 21 Jan 2019 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548058395;
 bh=djyfNTCllQpKBZzzvuMRvitbEHsIQegNt3mk5IAXHhQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2TR12+jlu6L2TkPPPeeu3MjyIyi10TixwG3/7fjlCbnQ8XCPUZ0NJScoctesW06S2
 ttid3jFlBfO4C/xM/6L/KY2Vm1ryJi418KOKiiqOk0jRBmtyG9bNQ9vSGrM9nu+mn2
 23I1e7BopQ4wdEQtwGXKNsp7AjvyDKtTLaIprruU=
Date: Mon, 21 Jan 2019 09:13:04 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] mtd: rawnand: remove ->legacy.erase and single_erase()
Message-ID: <20190121091304.63673375@bbrezillon>
In-Reply-To: <1548052327-26483-1-git-send-email-yamada.masahiro@socionext.com>
References: <1548052327-26483-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_001316_325005_B3CF424F 
X-CRM114-Status: GOOD (  25.20  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 21 Jan 2019 15:32:07 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Now that the last user of this hook, denali.c, stopped using it,
> we can remove the erase hook from nand_legacy.
> 
> I squashed single_erase() because only the difference between
> single_erase() and nand_erase_op() is the number of bit shifts.
> 
> The status/ret conversion in nand_erase_nand() is unneeded since
> commit eb94555e9e97 ("mtd: nand: use usual return values for the
> ->erase() hook"). Cleaned it up now.

Yeah! One less field in nand_legacy :-). 

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
> 
> This depends on the denali patch:
> http://patchwork.ozlabs.org/patch/1028264/
> 
> 
> Changes in v2:
>   - I noticed the masking by chip->pagemask is still needed
> 
>  drivers/mtd/nand/raw/nand_base.c | 31 ++++---------------------------
>  include/linux/mtd/rawnand.h      |  2 --
>  2 files changed, 4 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index cca4b24..7ea3f10 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4155,23 +4155,6 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
>  }
>  
>  /**
> - * single_erase - [GENERIC] NAND standard block erase command function
> - * @chip: NAND chip object
> - * @page: the page address of the block which will be erased
> - *
> - * Standard erase command for NAND chips. Returns NAND status.
> - */
> -static int single_erase(struct nand_chip *chip, int page)
> -{
> -	unsigned int eraseblock;
> -
> -	/* Send commands to erase a block */
> -	eraseblock = page >> (chip->phys_erase_shift - chip->page_shift);
> -
> -	return nand_erase_op(chip, eraseblock);
> -}
> -
> -/**
>   * nand_erase - [MTD Interface] erase block(s)
>   * @mtd: MTD device structure
>   * @instr: erase instruction
> @@ -4194,7 +4177,7 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
>  int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
>  		    int allowbbt)
>  {
> -	int page, status, pages_per_block, ret, chipnr;
> +	int page, pages_per_block, ret, chipnr;
>  	loff_t len;
>  
>  	pr_debug("%s: start = 0x%012llx, len = %llu\n",
> @@ -4246,17 +4229,11 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
>  		    (page + pages_per_block))
>  			chip->pagebuf = -1;
>  
> -		if (chip->legacy.erase)
> -			status = chip->legacy.erase(chip,
> -						    page & chip->pagemask);
> -		else
> -			status = single_erase(chip, page & chip->pagemask);
> -
> -		/* See if block erase succeeded */
> -		if (status) {
> +		ret = nand_erase_op(chip, (page & chip->pagemask) >>
> +				    (chip->phys_erase_shift - chip->page_shift));
> +		if (ret) {
>  			pr_debug("%s: failed erase, page 0x%08x\n",
>  					__func__, page);
> -			ret = -EIO;
>  			instr->fail_addr =
>  				((loff_t)page << chip->page_shift);
>  			goto erase_exit;
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 33e240a..5e37534 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -936,7 +936,6 @@ static inline void nand_controller_init(struct nand_controller *nfc)
>   * @waitfunc: hardware specific function for wait on ready.
>   * @block_bad: check if a block is bad, using OOB markers
>   * @block_markbad: mark a block bad
> - * @erase: erase function
>   * @set_features: set the NAND chip features
>   * @get_features: get the NAND chip features
>   * @chip_delay: chip dependent delay for transferring data from array to read
> @@ -962,7 +961,6 @@ struct nand_legacy {
>  	int (*waitfunc)(struct nand_chip *chip);
>  	int (*block_bad)(struct nand_chip *chip, loff_t ofs);
>  	int (*block_markbad)(struct nand_chip *chip, loff_t ofs);
> -	int (*erase)(struct nand_chip *chip, int page);
>  	int (*set_features)(struct nand_chip *chip, int feature_addr,
>  			    u8 *subfeature_para);
>  	int (*get_features)(struct nand_chip *chip, int feature_addr,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
