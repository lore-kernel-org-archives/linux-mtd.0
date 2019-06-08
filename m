Return-Path: <SRS0=FMIu=UH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE32C28CC5
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Jun 2019 10:22:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D34B214AE
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Jun 2019 10:22:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PgPJ+lu8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="OaOZ2r2m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D34B214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7riQEqxwqMjP2SD9mRQn4htMSXKjAe6L8XnI7/o+sAw=; b=PgPJ+lu8e7ASVGeD/dzIgeB7i
	+J1LjpK9XQTk8OnbRhaAc1DT+aYYikI/j/xNUTwRwriZUGWgI8ifsI6vFGLlY8B92lAz/psCYx/ND
	eVZNLrjA/7uwTOw/POVoAcr7NAoyGrT06j9EEH47NZJV3FTrWZf34Y/hYJ4Hrw/76C+hpmmSPKNYA
	qRala8f3j7POe+fMyaR1gpnUm4TeatzvTRIYDQjW5m3ZlWCYgtj+FW+3CO8jOsUz/tq/pOxQWv3lA
	T9M3cIWCEEhXczUcRIZUXmByrv6XEKOBhk7fOIC6ZE25d5qgBH8T2X61eJcX9bKZ5E6GCPn6vFZ5g
	3W9MW0qzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZYUU-0006iR-JH; Sat, 08 Jun 2019 10:22:26 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZYUR-0006hf-7V
 for linux-mtd@lists.infradead.org; Sat, 08 Jun 2019 10:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1559989339; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pURQs9CY2mpuFiZSCMQU4qI61477m0CbkzHnmzitjaE=;
 b=OaOZ2r2mFo+aasqU+cQsqrt2pBttc3uAgYgAz8aCjebx1PDMOnTsmA38uYlj/A3yutjhzs
 U3x8aemgE01DwEVkXf5sc91C5iNKDH6xfROwKEFpwLBl/jlVK+juICQ/F6BODU7uJslKDs
 czE0pGedx9PZmKlg3PbJt+SqTzmHHmw=
Date: Sat, 08 Jun 2019 12:22:14 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] mtd/rawnand: ingenic-ecc: Make probe function
 __init_or_module
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Message-Id: <1559989334.1815.5@crapouillou.net>
In-Reply-To: <20190607160200.16052-1-paul@crapouillou.net>
References: <20190607160200.16052-1-paul@crapouillou.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_032223_466792_9537580A 
X-CRM114-Status: GOOD (  14.77  )
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
Cc: od@zcrc.me, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I misunderstood what __init_or_module was for. Please ignore this =

patchset. Sorry for the noise.


Le ven. 7 juin 2019 =E0 18:01, Paul Cercueil <paul@crapouillou.net> a =

=E9crit :
> This allows the probe function to be dropped after the kernel finished
> its initialization, in the case where the driver was not compiled as a
> module.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 2 +-
>  drivers/mtd/nand/raw/ingenic/ingenic_ecc.h | 3 ++-
>  drivers/mtd/nand/raw/ingenic/jz4780_bch.c  | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c =

> b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> index d3e085c5685a..74eff8fb5d32 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
> @@ -124,7 +124,7 @@ void ingenic_ecc_release(struct ingenic_ecc *ecc)
>  }
>  EXPORT_SYMBOL(ingenic_ecc_release);
> =

> -int ingenic_ecc_probe(struct platform_device *pdev)
> +int __init_or_module ingenic_ecc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct ingenic_ecc *ecc;
> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h =

> b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h
> index 2cda439b5e11..535eb8f29df6 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.h
> @@ -4,6 +4,7 @@
> =

>  #include <linux/compiler_types.h>
>  #include <linux/err.h>
> +#include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  #include <uapi/asm-generic/errno-base.h>
> @@ -78,6 +79,6 @@ struct ingenic_ecc {
>  	struct mutex lock;
>  };
> =

> -int ingenic_ecc_probe(struct platform_device *pdev);
> +int __init_or_module ingenic_ecc_probe(struct platform_device *pdev);
> =

>  #endif /* __DRIVERS_MTD_NAND_INGENIC_ECC_INTERNAL_H__ */
> diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c =

> b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> index 079266a0d6cf..cc0656ac505d 100644
> --- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> +++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
> @@ -229,7 +229,7 @@ static int jz4780_correct(struct ingenic_ecc *bch,
>  	return ret;
>  }
> =

> -static int jz4780_bch_probe(struct platform_device *pdev)
> +static int __init_or_module jz4780_bch_probe(struct platform_device =

> *pdev)
>  {
>  	struct ingenic_ecc *bch;
>  	int ret;
> --
> 2.21.0.593.g511ec345e18
> =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
