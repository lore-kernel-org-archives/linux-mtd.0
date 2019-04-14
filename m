Return-Path: <SRS0=XyTp=SQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8173BC10F13
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2019 08:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D5D2206B6
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2019 08:50:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SiHHYM6E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D5D2206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKqI67Mn91LG0Xlq4MZoHBJCUgK+Ifzi+dRNo7ArN5M=; b=SiHHYM6E+p0rlR
	Q2ulmZOnDTukKI6q+9dpg0krURFKXc42hJ8fmAc2OSU7ZRp22OAqugtNl7qHl1CsdR2A8HCrHu5jM
	teNBBnl9liZn5Kc8BQlwN/jXtANVwyQlJqW88UX/m6Y7kNRthl8XadIxvdCW6mLUhNiF884wmlN4F
	X6yDuAusiA5VUaKpgPlzxPuOHBMMQcGn7jLGBKtA8nzRa7LzuaR73MbhyS8aucIP6Soc9AIUARtNb
	JlGPeMLJYI49roEexDlGCMBDdq0iwsecPHoZHQOpLZgBBvk3NX7fLbR8SrFSJRMIeIKeuRHNAn3ui
	PdfkVAiaHGPoFNjJBQuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFaqL-0007in-GY; Sun, 14 Apr 2019 08:50:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFaqF-0007iP-Fk
 for linux-mtd@lists.infradead.org; Sun, 14 Apr 2019 08:50:27 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E9FC7263959;
 Sun, 14 Apr 2019 09:50:21 +0100 (BST)
Date: Sun, 14 Apr 2019 10:50:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: Clean the controller state
 before each operation
Message-ID: <20190414105019.5bac65d3@collabora.com>
In-Reply-To: <20190408083145.13178-1-miquel.raynal@bootlin.com>
References: <20190408083145.13178-1-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_015023_659424_3E4C496B 
X-CRM114-Status: GOOD (  19.91  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  8 Apr 2019 10:31:45 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Since the migration of the driver to stop using the legacy
> ->select_chip() hook, there is nothing deselecting the target anymore,  
> thus the selection is not forced at the next access. Ensure the ND_RUN
> bit and the interrupts are always in a clean state.
> 
> Cc: Daniel Mack <daniel@zonque.org>
> Cc: stable@vger.kernel.org
> Fixes: b25251414f6e00 ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> 
> Changes in v2:
> * Also include the reset of the interrupts each time
>   marvell_nfc_select_target() is called.
> 
>  drivers/mtd/nand/raw/marvell_nand.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index f38e5c1b87e4..d984538980e2 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -722,12 +722,6 @@ static void marvell_nfc_select_target(struct nand_chip *chip,
>  	struct marvell_nfc *nfc = to_marvell_nfc(chip->controller);
>  	u32 ndcr_generic;
>  
> -	if (chip == nfc->selected_chip && die_nr == marvell_nand->selected_die)
> -		return;
> -
> -	writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
> -	writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
> -
>  	/*
>  	 * Reset the NDCR register to a clean state for this particular chip,
>  	 * also clear ND_RUN bit.
> @@ -739,6 +733,12 @@ static void marvell_nfc_select_target(struct nand_chip *chip,
>  	/* Also reset the interrupt status register */
>  	marvell_nfc_clear_int(nfc, NDCR_ALL_INT);
>  
> +	if (chip == nfc->selected_chip && die_nr == marvell_nand->selected_die)
> +		return;
> +
> +	writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
> +	writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);
> +
>  	nfc->selected_chip = chip;
>  	marvell_nand->selected_die = die_nr;
>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
