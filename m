Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38E8C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B44362173C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/M+HZ3d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B44362173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBPuUddio2zyJX7+cCh7d89XyWY+Flg2cVuEF+chUXs=; b=R/M+HZ3dGv04t3
	8VA9f3+tWoCQ9wdx/sMzGJaD+61airP0KKdgGTdOZqYRuJGor5Yt3cx6qHsB5yknWJTZ0d7Q+5zG8
	Jj4suriv7y96UCOWMoTklbbCuJ4JQOLR7GyR1MT0QsxNvUdyRRGzOZzWqbCJqWine5750ZrxlAD6Y
	JuDKHIqQS9B1kyR0A2nvcEDagd7zy0AhDlYDuiwjggtBfUeIO7nh0p0434x4kglvjoOXBnmkZMBWa
	93Evk8dWdCOj912n0N14bAuveLE8atdBRF9EnNIzKo+zyucDWxM/HgffGdX3WJJLHhcLxwBE2Kj+d
	fCb+9mesEzlGELSGVECA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT0OQ-0007lK-Ce; Tue, 21 May 2019 08:45:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT0ON-000755-UT
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 08:45:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 38959263C04;
 Tue, 21 May 2019 09:45:01 +0100 (BST)
Date: Tue, 21 May 2019 10:44:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2] mtd: rawnand: initialize ntargets with maxchips
Message-ID: <20190521104458.71b25f36@collabora.com>
In-Reply-To: <20190521084335.15026-1-s.hauer@pengutronix.de>
References: <20190521084335.15026-1-s.hauer@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_014504_241561_0AA96919 
X-CRM114-Status: GOOD (  18.88  )
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

On Tue, 21 May 2019 10:43:35 +0200
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
> Fixes: 32813e288414 ("mtd: rawnand: Get rid of chip->numchips")
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

And thanks for the fix.

Boris

> ---
> 
> Changes since v1:
> 
> - initialize memorg->ntargets directly in nand_scan_ident() rather than
>   passing it as argument to nand_detect()
> - Fix Fixes: committish, leading '3' was missing
> 
>  drivers/mtd/nand/raw/nand_base.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 7db0f04cf52b..a8a7e81be710 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4638,7 +4638,6 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  	memorg = nanddev_get_memorg(&chip->base);
>  	memorg->planes_per_lun = 1;
>  	memorg->luns_per_target = 1;
> -	memorg->ntargets = 1;
>  
>  	/*
>  	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
> @@ -5003,6 +5002,8 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
>  	if (ret)
>  		return ret;
>  
> +	memorg->ntargets = maxchips;
> +
>  	/* Read the flash type */
>  	ret = nand_detect(chip, table);
>  	if (ret) {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
