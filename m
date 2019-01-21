Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19201C2F3A0
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 13:14:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD2DD2084C
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jan 2019 13:14:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ato2YeD+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PI707eWF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD2DD2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNXkTY0IUHuC0C18VpPcYYC9ezHYZn1xOb+wEdxKnjU=; b=Ato2YeD+Ei4TtA
	VuzpyvOrJMyWb7xUcsUZTrNXf4iIl9kn3CLhBDOKkrPElUhngJkmS1c7B/A9y8+R5mGZh7bvQwQVM
	X2FRqvZMQUBkRydzE1LglmwxTRsJhYiT7YIysKIOtVgTht3sRyxMlQJRJLz3E4cZ++sgo/fWRVyFP
	sNTeBEGFLFhYYqt1nIBJrFE1MzqIwcR+O7VfYcEk74CVpDgt2rPn3WzQxHkVtDyCmTI7uG00B4BA0
	tOJWsWKow88eBPodPdEzWy9i1EPs/shxAxOSefvdb9CZvukeA1x7FFAdDg3a90h1v6cvqUNI1t0fB
	JvrcaHw0nUzf46lf/kUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glZPE-0003PX-4s; Mon, 21 Jan 2019 13:14:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glZP4-0003M2-Ox
 for linux-mtd@lists.infradead.org; Mon, 21 Jan 2019 13:14:22 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F1242084C;
 Mon, 21 Jan 2019 13:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548076454;
 bh=Lq9h2aOh3VJJxFH+SuBIWbWBthqGszQjSGW4+XxgGrI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PI707eWF0YqzjUfjqxtvgc8ac3E/bk8p2vM7gf9rK3vNQELq3dqH8jXCS3RS+89sh
 cslE30cwgCnxeakD34kyL6e4D9PCjeANVnwz6FJd3r3kMdmWjCiwlCpvU2t4+HqbLt
 DzUE1Hyqph1tZzEDbrThY2Mthrxhx1pXv+hUyNu4=
Date: Mon, 21 Jan 2019 14:14:03 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mtd: rawnand: check return code of nand_reset() and
 nand_readid_op()
Message-ID: <20190121141403.20f6107b@bbrezillon>
In-Reply-To: <1548075934-19963-1-git-send-email-yamada.masahiro@socionext.com>
References: <1548075934-19963-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_051415_069899_80AD6B61 
X-CRM114-Status: GOOD (  26.75  )
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

On Mon, 21 Jan 2019 22:05:34 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> nand_scan_ident() iterates over maxchips to find as many homogeneous
> chips as possible.
> 
> Currently, this loop bails out only when manufacturer or device ID
> unmatches. The reason of unmatch is most likely no chip is connected
> to that chip select. In this case, nand_reset() has already failed,
> and the following nand_readid_op() is pointless.

While I agree with the following diff, I'd also like to point out that
nand_scan() callers should know how many controller CS lines are
connected to the chip (board file or DT description). The check we do in
nand_scan_ident() should only be here to clamp this value if the board
desc is wrong (maybe we should even fail in that case instead of
silently fixing things).

> 
> Before ->exec_op hook was introduced, drivers had no way to tell
> the failure of NAND_CMD_RESET to the framework because the legacy
> ->cmdfunc() has void return type. Now drivers implementing ->exec_op  
> hook can return the error code. You can save nand_readid_op() by
> checking the return value of nand_reset(). The return value of
> nand_readid_op() should be checked as well. If it fails, probably
> id[0] and id[1] are undefined values.
> 
> Just for consistency, it should be sensible to check the return
> code in nand_do_write_oob() as well.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
> 
>  drivers/mtd/nand/raw/nand_base.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 7ea3f10..3407523 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -457,7 +457,7 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
>  			     struct mtd_oob_ops *ops)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> -	int chipnr, page, status, len;
> +	int chipnr, page, status, len, ret;
>  
>  	pr_debug("%s: to = 0x%08x, len = %i\n",
>  			 __func__, (unsigned int)to, (int)ops->ooblen);
> @@ -479,7 +479,9 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
>  	 * if we don't do this. I have no clue why, but I seem to have 'fixed'
>  	 * it in the doc2000 driver in August 1999.  dwmw2.
>  	 */
> -	nand_reset(chip, chipnr);
> +	ret = nand_reset(chip, chipnr);
> +	if (ret)
> +		return ret;
>  
>  	nand_select_target(chip, chipnr);
>  
> @@ -5037,11 +5039,15 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
>  		u8 id[2];
>  
>  		/* See comment in nand_get_flash_type for reset */
> -		nand_reset(chip, i);
> +		ret = nand_reset(chip, i);
> +		if (ret)
> +			break;
>  
>  		nand_select_target(chip, i);
>  		/* Send the command for reading device ID */
> -		nand_readid_op(chip, 0, id, sizeof(id));
> +		ret = nand_readid_op(chip, 0, id, sizeof(id));
> +		if (ret)
> +			break;
>  		/* Read manufacturer and device IDs */
>  		if (nand_maf_id != id[0] || nand_dev_id != id[1]) {
>  			nand_deselect_target(chip);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
