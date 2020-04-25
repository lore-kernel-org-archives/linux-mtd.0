Return-Path: <SRS0=IAjr=6J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9C6C55185
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 08:29:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED90920706
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 08:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hgcvmf3f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED90920706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BOPtSw744b8Tk2vyGbSClUARUsQseUMoKpI+sR1/3c=; b=hgcvmf3f1ZBqNw
	DPRgSmO11+t99vU1nJVnewANmagsTAdYAnbMTRnCqj0MbwXUBCw1w1Ie/Toblu2d7demSVMqXUC4x
	pkPd3lgrydD9srHln8V6x+QC9g8ydR0DEpLmBYZuIyV7UMZIo8c+K/WfeFx6S9nE1NeUTS3ylDxM9
	waA+pxVJLV0COG0EmLyquRNWJU0u/cigk9MMEYlXPobKM7VE0b9/RUjDGTFeqGDRUZsrw0w0D98/p
	lSUksPUuWG1spFrezZG9KIMC8GTS6rkaZaFSYoP74MvRXRY7ndFdvR73SRzbYKH94aYsmYw8xtZcQ
	y6Um78Q3a7TXqIibCrig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSGBo-0006BE-2n; Sat, 25 Apr 2020 08:29:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSGBl-00069l-OH
 for linux-mtd@lists.infradead.org; Sat, 25 Apr 2020 08:29:31 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5515D2A2E93;
 Sat, 25 Apr 2020 09:29:28 +0100 (BST)
Date: Sat, 25 Apr 2020 10:29:24 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 4/6] mtd: rawnand: marvell: Fix probe error path
Message-ID: <20200425102924.493fe9b6@collabora.com>
In-Reply-To: <20200424164501.26719-5-miquel.raynal@bootlin.com>
References: <20200424164501.26719-1-miquel.raynal@bootlin.com>
 <20200424164501.26719-5-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_012929_925286_0B8C3DED 
X-CRM114-Status: GOOD (  16.72  )
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

On Fri, 24 Apr 2020 18:44:59 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Ensure all chips are deregistered and cleaned in case of error during
> the probe.
> 
> Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index 350949b34eee..10b7f43d28e6 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -2673,6 +2673,16 @@ static int marvell_nand_chip_init(struct device *dev, struct marvell_nfc *nfc,
>  	return 0;
>  }
>  
> +static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
> +{
> +	struct marvell_nand_chip *entry, *temp;
> +
> +	list_for_each_entry_safe(entry, temp, &nfc->chips, node) {
> +		nand_release(&entry->chip);
> +		list_del(&entry->node);
> +	}
> +}
> +
>  static int marvell_nand_chips_init(struct device *dev, struct marvell_nfc *nfc)
>  {
>  	struct device_node *np = dev->of_node;
> @@ -2707,21 +2717,16 @@ static int marvell_nand_chips_init(struct device *dev, struct marvell_nfc *nfc)
>  		ret = marvell_nand_chip_init(dev, nfc, nand_np);
>  		if (ret) {
>  			of_node_put(nand_np);
> -			return ret;
> +			goto cleanup_chips;
>  		}
>  	}
>  
>  	return 0;
> -}
>  
> -static void marvell_nand_chips_cleanup(struct marvell_nfc *nfc)
> -{
> -	struct marvell_nand_chip *entry, *temp;
> +cleanup_chips:
> +	marvell_nand_chips_cleanup(nfc);
>  
> -	list_for_each_entry_safe(entry, temp, &nfc->chips, node) {
> -		nand_release(&entry->chip);
> -		list_del(&entry->node);
> -	}
> +	return ret;
>  }
>  
>  static int marvell_nfc_init_dma(struct marvell_nfc *nfc)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
