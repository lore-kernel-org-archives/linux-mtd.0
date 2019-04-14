Return-Path: <SRS0=XyTp=SQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AA2C10F13
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2019 08:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7032C206B6
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Apr 2019 08:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zx1ZuqjD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7032C206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKiLj0wLN/OdyHDODY8HdtT74GVmsZxlJxXb+jSiv0M=; b=Zx1ZuqjDgCM9yC
	sX4zJ4XUe9hQgX6M+ee0q2TG0ygGCXcVXt4boSYKEM2mdbMUWNFM2Ui+BzTVxGCH+S/hbl/Kh0j1K
	VNoJiu1bBVCFHHsSBBLv+dOTjRLqRPOQhzhmNysrznOzCl7BZA95BccMUzLO7sm2TezFWKfNZw5gd
	i3v6Ojvd7B2EIxahUfBY9Kletd+/KwUMk3GgBff1HPvyvhpbJchOlxzkvQk198WsKBrMdikOMVVK2
	ClOEaCzqOTDHo4cAzn8l93J420kv23wKMsVL53M8AL/a3NWgsqbpceKOnj677Ji4QyD83zxQy6xkl
	P+iIjWp+F9jXATW0k/tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFapN-0006CD-H9; Sun, 14 Apr 2019 08:49:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFapK-0006Bp-O8
 for linux-mtd@lists.infradead.org; Sun, 14 Apr 2019 08:49:28 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4F528263959;
 Sun, 14 Apr 2019 09:49:24 +0100 (BST)
Date: Sun, 14 Apr 2019 10:49:21 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: marvell: Fix helper name in comment
Message-ID: <20190414104921.3e35a822@collabora.com>
In-Reply-To: <20190408092849.23478-1-miquel.raynal@bootlin.com>
References: <20190408092849.23478-1-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_014926_917435_DB95A01E 
X-CRM114-Status: GOOD (  19.10  )
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
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  8 Apr 2019 11:28:49 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Since the migration of the driver to stop using the legacy
> ->select_chip() hook, the marvell_nfc_select_chip() helper has been  
> 'renamed' to marvell_nfc_select_target(). Update a left-over reference
> to this helper in a comment in the ->resume() path.
> 
> Fixes: b25251414f6e00 ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/marvell_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index d984538980e2..6796c7015d86 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -2989,7 +2989,7 @@ static int __maybe_unused marvell_nfc_resume(struct device *dev)
>  
>  	/*
>  	 * Reset nfc->selected_chip so the next command will cause the timing
> -	 * registers to be restored in marvell_nfc_select_chip().
> +	 * registers to be restored in marvell_nfc_select_target().
>  	 */
>  	nfc->selected_chip = NULL;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
