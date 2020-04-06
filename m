Return-Path: <SRS0=p/wV=5W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C8AC2BA17
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 01:20:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 726B520678
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 01:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oz7tkbb4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="HBkyOKI6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 726B520678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Da9BRgAMgZ/C0OuY+xNKc7u2wo05BAepkBhvrJWg/Z0=; b=oz7tkbb4lsTmNo
	yG7/FRWbdUK0DIHxWFyztbnwL9lJ+O0HdMlnHY01murMCWhx1JI9Yk6cqagCJ4q069qzV1vb7GGW3
	pSqR/zj1f8VfyuXuSBKQTy/Z6OnseTAJPZYIQaBn+w61dqlo2dHasLbSAURFMHZJoOtuH0061sRPo
	MUs1GEEe+4/TlhGsphe4zVkYY66RBxBY+HS/Iv3Woe53QL0kb1RCMtw8SIsbVRrN4M8Ze0d8ykEz2
	uq3dy0vcDz4ptmznM6kWyBq4uLPRWj8aJYL6uJqc91CTg3I0yivUGT7mQbyMsEfB6/OfzkqTUwviF
	xjcFT8eMQt2tXY2rizng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLGR4-0007s7-6k; Mon, 06 Apr 2020 01:20:22 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLGR0-0007r4-5H
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2020 01:20:20 +0000
Received: by mail-qk1-x744.google.com with SMTP id k134so4093799qke.2
 for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2020 18:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PsmsZgemCvhriIQAgZ8Jrnu1V0u0Uy80i+4ks6YOumc=;
 b=HBkyOKI64T1XZ3uIg75dUY22JSUM5cbP/qn1UGHhdCmjF6sSrR7GhfznJT9SM18EX/
 B8iSH7m45ijOV4k+bl14QNVToBrmSm8lS+yfkMmLvmb02xYDo7M1o7hCikdokcKz1pez
 aOf8ZZ2Os4xtY2wKma46hfx3yoTH4wNjTBwvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PsmsZgemCvhriIQAgZ8Jrnu1V0u0Uy80i+4ks6YOumc=;
 b=BN4VlhCu5SNPAAf77j+ab6Nmf4E4Q/MD/ZgF+qFPIW4kIQqrfokaTA2AHXh5mXhqIS
 gOwEeu2iPkLKWtaLCXh9jOh0rqIQjF93Y18opRMpyAKkWQLrCZVaqpZWiZE3FlNQYw5C
 m2/OJjCsgV3izqLtnJZOxcD/7z5AjVbnQ1eyYW6ZpGAEY+khQ4rodt7wH3knoLgnK8Me
 +TgT157LW16SE4hJH86yk6LxN0QVgHxcjaDsUZ9nyT8U4sScBo/62Pk666Pur87KLh7g
 IGOe6MQMA7FaiifcUdSnUpgk8MGHpcHzxvNy8y1wFge3ZCWg22DXVd5sEJfTMb2GkUTx
 FMFg==
X-Gm-Message-State: AGi0PuZ6Xp67e8PrurwFVg+jdRZA5OhLnChWrgkb79iYbtmYaRaI2raJ
 2YEGlbeWzhZoPmx/0tvWamWCVol8quOXwL0rLOA=
X-Google-Smtp-Source: APiQypJ3e6qTmPGYSNjcv8HM2bboVabW4Mrp2r84r0j7tlusts/GgMm6UHPe2ubJX85/zQRv4hnNIBAI+Hss+FJs/DI=
X-Received: by 2002:a37:2f43:: with SMTP id v64mr7863822qkh.330.1586136013201; 
 Sun, 05 Apr 2020 18:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200404153631.103549-1-linux@roeck-us.net>
In-Reply-To: <20200404153631.103549-1-linux@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Apr 2020 01:20:01 +0000
Message-ID: <CACPK8Xdmjp0qg0JHHnR1MJp7zmuZHCHTOs7+qn5_16oLbe+r+g@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Compile files in controllers/ directory
To: Guenter Roeck <linux@roeck-us.net>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_182018_393428_42ECEDA7 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 4 Apr 2020 at 15:37, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Commit a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code
> split") moved various files into a new directory, but did not add the new
> directory to its parent directory Makefile. The moved files no longer
> build, and affected flash chips no longer instantiate.
>
> Adding the new directory to the parent directory Makefile fixes the
> problem.
>
> Fixes: a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code split")
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thanks Guenter. I just discovered this too.

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/mtd/spi-nor/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 7ddb742de1fe..653923896205 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -18,3 +18,5 @@ spi-nor-objs                  += winbond.o
>  spi-nor-objs                   += xilinx.o
>  spi-nor-objs                   += xmc.o
>  obj-$(CONFIG_MTD_SPI_NOR)      += spi-nor.o
> +
> +obj-$(CONFIG_MTD_SPI_NOR)      += controllers/
> --
> 2.17.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
