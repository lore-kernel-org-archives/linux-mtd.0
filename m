Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6DAC25B75
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2024 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFvMIl1aif8VU4iBzotr1ysvLADq6xVJ/D/HO+XTqnM=; b=IFuKC+4XEOEQJi
	wcqQw2Mf39nHKxYC6SXS1SUhIodY9flRsVy7QsylP64qoe5pvtyEdaZZfjt1vYnK0eIKEW/UfeQFv
	YlN+RFqSYq+2q+HUoinlm7mBAw5LFFe7UVCF9mpTOcd/yQJ5/9fYpiuGQhv/5Kdnu9jCDmhCDdCwA
	pUgjgooh5Awqg/BAA4wDpCS/vfeQX1Bsk3ddwyo5WH2/gEqMsNt0QYRyXxEfScvWj+9VLicyIepjL
	yPZwH1mw1wdH+cpuWyYAjV4y7YZp4rSqgwl422NJwu2OtzNPrFqLpcxjxwHSaTwO8rsYfLIQpWufy
	T8L20JuIdV3SgnmjjZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6rES-0000000FsHJ-29FJ;
	Tue, 14 May 2024 12:26:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6rEP-0000000FsFv-122P
	for linux-mtd@lists.infradead.org;
	Tue, 14 May 2024 12:26:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1s6rEI-0003vR-FR; Tue, 14 May 2024 14:26:02 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1s6rEF-001Lt1-B9; Tue, 14 May 2024 14:25:59 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1s6rEF-00BGaC-0m;
	Tue, 14 May 2024 14:25:59 +0200
Date: Tue, 14 May 2024 14:25:59 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
	Steven Seeger <steven.seeger@flightsystems.net>
Subject: Re: [PATCH 2/2] mtd: rawnand: Bypass a couple of sanity checks
 during NAND identification
Message-ID: <ZkNYV65Z_ZTSGH4k@pengutronix.de>
References: <20240507160546.130255-1-miquel.raynal@bootlin.com>
 <20240507160546.130255-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507160546.130255-3-miquel.raynal@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_052609_320225_A6FB3ACB 
X-CRM114-Status: GOOD (  29.26  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Tue, May 07, 2024 at 06:05:46PM +0200, Miquel Raynal wrote:
> Early during NAND identification, mtd_info fields have not yet been
> initialized (namely, writesize and oobsize) and thus cannot be used for
> sanity checks yet. Of course if there is a misuse of
> nand_change_read_column_op() so early we won't be warned, but there is
> anyway no actual check to perform at this stage as we do not yet know
> the NAND geometry.
> 
> So, if the fields are empty, especially mtd->writesize which is *always*
> set quite rapidly after identification, let's skip the sanity checks.
> 
> nand_change_read_column_op() is subject to be used early for ONFI/JEDEC
> identification in the very unlikely case of:
> - bitflips appearing in the parameter page,
> - the controller driver not supporting simple DATA_IN cycles.
> 
> Fixes: c27842e7e11f ("mtd: rawnand: onfi: Adapt the parameter page read to constraint controllers")
> Fixes: daca31765e8b ("mtd: rawnand: jedec: Adapt the parameter page read to constraint controllers")
> Cc: stable@vger.kernel.org
> Reported-by: Alexander Dahl <ada@thorsis.com>
> Closes: https://lore.kernel.org/linux-mtd/20240306-shaky-bunion-d28b65ea97d7@thorsis.com/
> Reported-by: Steven Seeger <steven.seeger@flightsystems.net>
> Closes: https://lore.kernel.org/linux-mtd/DM6PR05MB4506554457CF95191A670BDEF7062@DM6PR05MB4506.namprd05.prod.outlook.com/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 248e654ecefd..a66e73cd68cb 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1440,12 +1440,14 @@ int nand_change_read_column_op(struct nand_chip *chip,
>  	if (len && !buf)
>  		return -EINVAL;
>  
> -	if (offset_in_page + len > mtd->writesize + mtd->oobsize)
> -		return -EINVAL;
> +	if (mtd->writesize) {
> +		if ((offset_in_page + len > mtd->writesize + mtd->oobsize))
> +			return -EINVAL;
>  
> -	/* Small page NANDs do not support column change. */
> -	if (mtd->writesize <= 512)
> -		return -ENOTSUPP;
> +		/* Small page NANDs do not support column change. */
> +		if (mtd->writesize <= 512)
> +			return -ENOTSUPP;
> +	}

This is not enough. A few lines further down nand_fill_column_cycles()
is called which also uses mtd->writesize. This function also needs to
know if we have a large page or small page NAND, so bypassing the checks
won't be enough there.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
