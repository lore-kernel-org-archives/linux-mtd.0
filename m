Return-Path: <SRS0=Xpy7=6G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FBBC38A30
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 07:07:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66DA5206CD
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2020 07:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xz00mGXP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66DA5206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGHLSvlyKJL7yMzbRcP8Ee2if6/FM04DFd+KlLyy8ow=; b=Xz00mGXPP66V/y
	DgcHAvcJgKmIZZ7qGVaPQnHNxcdXnJvE2baJ+1j2ebvQBcSx2mNabU+m/W2JRLfeJUwMrSz6zG+9J
	AhaWH4WcTs8x1bkktHsIT6JL96/H2mr3MEFiyPJciI3caJhOh5vEp4Vn3uQIVr/m9DCrBps5gYq1e
	/TmMYkXkf7eC7YYRNXtxXTMYLwshu26bd88acPPFZhfUfepP0EPGvn/GiNE0UnMfe21td8M67rKlV
	dEeREtz54Gq+K1Gx9fnRPN8APdi5IzZBbhQRDSNJCe0R1V6J1zNgy58Foe66mfVgEBY6NZvCsNKU4
	SsZwkWaFC/L7rzjc5+yA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR9TR-0000Oc-4Z; Wed, 22 Apr 2020 07:07:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR9TO-0000NV-6V
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2020 07:07:08 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D7CD02A0F90;
 Wed, 22 Apr 2020 08:07:02 +0100 (BST)
Date: Wed, 22 Apr 2020 09:06:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/6] mtd: rawnand: marvell: Use devm_platform_ioremap_res()
Message-ID: <20200422090659.6b2fd058@collabora.com>
In-Reply-To: <20200421164857.8255-3-miquel.raynal@bootlin.com>
References: <20200421164857.8255-1-miquel.raynal@bootlin.com>
 <20200421164857.8255-3-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_000706_362031_CD7BFECC 
X-CRM114-Status: GOOD (  15.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 21 Apr 2020 18:48:53 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Switch from the old platform_get_resource()/devm_ioremap_resource()
> couple to the newer devm_platform_ioremap_resource() helper.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index f2bf88336326..7906bd3fc8cb 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -2854,7 +2854,6 @@ static int marvell_nfc_init(struct marvell_nfc *nfc)
>  static int marvell_nfc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct resource *r;
>  	struct marvell_nfc *nfc;
>  	int ret;
>  	int irq;
> @@ -2869,8 +2868,7 @@ static int marvell_nfc_probe(struct platform_device *pdev)
>  	nfc->controller.ops = &marvell_nand_controller_ops;
>  	INIT_LIST_HEAD(&nfc->chips);
>  
> -	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nfc->regs = devm_ioremap_resource(dev, r);
> +	nfc->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(nfc->regs))
>  		return PTR_ERR(nfc->regs);
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
