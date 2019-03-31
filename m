Return-Path: <SRS0=WHT+=SC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440B4C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 11:16:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B8D20870
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 11:16:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y8CljcpV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B8D20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDpB1gDd8/yQd5d2lWirn7uthrQq8pxgKeyAQWDSq/Q=; b=Y8CljcpVIAM3Wa
	nIJ4TAZXiGbm40rG/MBYs0VwaWxGfIjVAeqlwypXiyiSeOW8zYDmWW0ApioODci2NrdbIUt2wgjWZ
	ck7/RNUusdVBH6oUzYWroh5stmwYRjX4QvdIdbcuq7T5hwKpHo7TPrSV4vmzjKmjAW9CXECJ7PG1V
	qpnd7paBTZlMiUZ+/16IsK9HVUuC/mw6XeGQQAXsWp9lJTRKc0QQStWi4viI5xufx5IpE/6eaPjII
	LLV3sW3z34bN69lgnZpA5GxBxTU+ud8Ad4PSRDHMeQMR4ZtarcP57yrgTxFHMJo43jaTrcnJov1xs
	mKDOq/Bu0CzpdfSQwuFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAYRY-0004Rn-MM; Sun, 31 Mar 2019 11:16:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAYRQ-0004JX-EM; Sun, 31 Mar 2019 11:15:57 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B90A1280B61;
 Sun, 31 Mar 2019 12:15:53 +0100 (BST)
Date: Sun, 31 Mar 2019 13:15:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 03/36] mtd: nand: Drop useless 'depends on' in Kconfig
Message-ID: <20190331131550.770b641d@collabora.com>
In-Reply-To: <20190304222841.13899-4-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
 <20190304222841.13899-4-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_041556_621400_FA77F722 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  4 Mar 2019 23:28:08 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Both oneNAND and raw NAND bits can be compiled if MTD is enabled

	^ OneNAND		  ^ can't		   ^ disabled

> because of the if/endif logic in drivers/mtd/Kconfig. There is no need
> for an extra "depends on MTD" in their respective Kconfig files.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

With this addressed

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/onenand/Kconfig | 1 -
>  drivers/mtd/nand/raw/Kconfig     | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/onenand/Kconfig b/drivers/mtd/nand/onenand/Kconfig
> index 9dc15748947b..c168f3b4b296 100644
> --- a/drivers/mtd/nand/onenand/Kconfig
> +++ b/drivers/mtd/nand/onenand/Kconfig
> @@ -1,6 +1,5 @@
>  menuconfig MTD_ONENAND
>  	tristate "OneNAND Device Support"
> -	depends on MTD
>  	depends on HAS_IOMEM
>  	help
>  	  This enables support for accessing all type of OneNAND flash
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 510a6b32820d..ebb8a3da9fa5 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -11,7 +11,6 @@ config MTD_NAND_ECC_SW_HAMMING_SMC
>  
>  menuconfig MTD_RAW_NAND
>  	tristate "Raw/Parallel NAND Device Support"
> -	depends on MTD
>  	select MTD_NAND_ECC_SW_HAMMING
>  	help
>  	  This enables support for accessing all type of raw/parallel


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
