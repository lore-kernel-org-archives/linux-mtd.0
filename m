Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962A9C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:29:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C86F216B7
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oFKuEor7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C86F216B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IqtFXWolLN+WkULAwdDNOM4R3RUFCMqp8clNBL8CBac=; b=oFKuEor7z69lH/
	NOQWDkrXB1Y/c92lguf9lHXxj/9OmztmL2ypQOUfjyFPaeWPuPPfzbC+1aZQBwUgt+zsZYpg3AOOP
	meXC7CK2Bwv+HDMmhF51zsS2wY055TjjESe7vyizw5zzlxlAsgDkJQHJ8FaSV9JIicGZENK4AbpRv
	oYVLOQonflze2VzYAEdmnJCsoma9xdjVo7yVl0V/RZ6279s/hNaTTuIiUg2IY3Sx3EjhtOYSFGA18
	1+XpcM0vovRmGzCqJwWfJm05zFsYBxDMPhXMGLr9MYNaSTnoJz37QWL4AXw1T55/zasEB73HI+oNh
	J6dQuD/Ljl95KimR/8lQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT09I-00061T-Dn; Tue, 21 May 2019 08:29:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT09F-000603-2U
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 08:29:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7D8722676EE;
 Tue, 21 May 2019 09:29:23 +0100 (BST)
Date: Tue, 21 May 2019 10:29:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] mtd: rawnand: initialize ntargets with maxchips
Message-ID: <20190521102921.65353085@collabora.com>
In-Reply-To: <20190521081721.541-1-s.hauer@pengutronix.de>
References: <20190521081721.541-1-s.hauer@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_012925_250192_B30E7F11 
X-CRM114-Status: GOOD (  20.53  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 21 May 2019 10:17:21 +0200
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> memorg->ntargets is initialized with '1'. It should be initialized with
> the maxchips argument from nand_scan() instead. Otherwise multi chip
> support errors out on the secondary chip selects when trying to call
> nand_reset() on them:
> 
> WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/internals.h:114
> nand_reset_op+0x194/0x1c4
> 
> With this memorg->ntargets is initialized with the maximum number of
> chip selects supported by the driver. After having detected the number
> of actually connected chips memory->ntargets is updated with that
> number.
> 
> Fixes: 2813e288414 ("mtd: rawnand: Get rid of chip->numchips")
> 

You an get rid of this blank line.

> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 7db0f04cf52b..0c717f3fb906 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4621,7 +4621,8 @@ nand_manufacturer_name(const struct nand_manufacturer *manufacturer)
>  /*
>   * Get the flash and manufacturer id and lookup if the type is supported.
>   */
> -static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
> +static int nand_detect(struct nand_chip *chip, unsigned int maxchips,
> +		       struct nand_flash_dev *type)
>  {
>  	const struct nand_manufacturer *manufacturer;
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> @@ -4638,7 +4639,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  	memorg = nanddev_get_memorg(&chip->base);
>  	memorg->planes_per_lun = 1;
>  	memorg->luns_per_target = 1;
> -	memorg->ntargets = 1;
> +	memorg->ntargets = maxchips;

I'd rather move this initialization to nand_scan_ident() as I don't like
the idea of passing maxchips to nand_detect(), but if you want to
keep it like that, can we at least rename the argument num_cs.

>  
>  	/*
>  	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
> @@ -5004,7 +5005,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
>  		return ret;
>  
>  	/* Read the flash type */
> -	ret = nand_detect(chip, table);
> +	ret = nand_detect(chip, maxchips, table);
>  	if (ret) {
>  		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
>  			pr_warn("No NAND device found\n");


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
