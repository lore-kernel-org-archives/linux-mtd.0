Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9724BC4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2024 06:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozltESnfhkIoVRpddnK4k4N/+DCKV2RIvQJ3z0ROW8I=; b=VjvjLDhx2H95Zv
	oamKL2Thjsz6jPo0MPKixeMYNpk50GARZUzRlRLPVw1ZB8dsS070ZNvFf54Yyzx9KvJBnMqEza6N3
	iH0gLpcKtxMm3a0J7a1DAJEp2H6wopL+HZ3kLrrAAV6bNfxvhPICax47/NSuZ58j+sSULUR1O9MGH
	svWE76P5754QooJ4TS4l7agE2Dm3nVbeJLwreGcyeS/WjYaawFPFdcXLNbHokOpRSXSoxiWKSmdWS
	3aZ56Mx+Ie1/auztZNdTKrVbaP01juAcpaOpP0xn08cCQZs45tB55RknEBW4EVckEI8/z+QBjcqFR
	zX1W+FITXRLouOaePTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxLZK-00000001Ayu-22FD;
	Thu, 18 Apr 2024 06:48:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxLZF-00000001Axj-0c3j
	for linux-mtd@lists.infradead.org;
	Thu, 18 Apr 2024 06:48:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1rxLZ3-0001ho-Jz; Thu, 18 Apr 2024 08:48:09 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1rxLZ2-00CvY7-CK; Thu, 18 Apr 2024 08:48:08 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1rxLZ2-001SuO-0u;
	Thu, 18 Apr 2024 08:48:08 +0200
Date: Thu, 18 Apr 2024 08:48:08 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mtd: nand: mxc_nand: disable subpage reads
Message-ID: <ZiDCKGlG4MZ23Tqo@pengutronix.de>
References: <20240417-mtd-nand-mxc-nand-exec-op-v1-0-d12564fe54e9@pengutronix.de>
 <20240417-mtd-nand-mxc-nand-exec-op-v1-4-d12564fe54e9@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240417-mtd-nand-mxc-nand-exec-op-v1-4-d12564fe54e9@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_234821_306596_7DD2D123 
X-CRM114-Status: GOOD (  25.35  )
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

On Wed, Apr 17, 2024 at 09:13:31AM +0200, Sascha Hauer wrote:
> The NAND core enabled subpage reads when a largepage NAND is used with
> SOFT_ECC. The i.MX NAND controller doesn't support subpage reads, so
> clear the flag again.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/raw/mxc_nand.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
> index f44c130dca18d..19b46210bd194 100644
> --- a/drivers/mtd/nand/raw/mxc_nand.c
> +++ b/drivers/mtd/nand/raw/mxc_nand.c
> @@ -1667,6 +1667,8 @@ static int mxcnd_probe(struct platform_device *pdev)
>  	if (err)
>  		goto escan;
>  
> +	this->options &= ~NAND_SUBPAGE_READ;
> +

Nah, it doesn't work like this. It turns out the BBT is read using
subpage reads before we can disable them here.

This is the code in nand_scan_tail() we stumble upon:

	/* Large page NAND with SOFT_ECC should support subpage reads */
	switch (ecc->engine_type) {
	case NAND_ECC_ENGINE_TYPE_SOFT:
		if (chip->page_shift > 9)
			chip->options |= NAND_SUBPAGE_READ;
		break;

	default:
		break;
	}

So the code assumes subpage reads are ok when SOFT_ECC is in use, which
in my case is not true. I guess some drivers depend on the
NAND_SUBPAGE_READ bit magically be set, so simply removing this code is
likely not an option.  Any ideas what to do?

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
