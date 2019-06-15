Return-Path: <SRS0=lAOP=UO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BD1C31E50
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jun 2019 22:22:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4745721473
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jun 2019 22:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KMS089Kk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="PNJT8Rmf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4745721473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5fQaa2ZcOPI8OEeDC3NRNMcZn561aPf4A696nILZjog=; b=KMS089Kkop0uiARH3kgr4fAIH
	67FZs8TehXIBC0FwAcA2KwrlYa+GKWe8MaD/yy8865XBwGcrCUSyqknI1tnMz5JHl0jThAIBTimCJ
	Kj5+kIcwkQxc39vgwHMsBS4kkNB/QHgHd8W/wKWPb5svjHmmJZolXfacJ2rUUmF2HK8yfZ+mAWoNf
	FP/uGUJGnvXBIqMpbzFwD+SCjVsESaul3t2OTEsnZ3yhI++Dc5zr2xF8gO1Bp+DJR3aK1wjmY0OdY
	JmwxRFmUlq+k4VMN67YL8p0RyYWvpA75mrgFamTNDKBe7/Q0vM8WiqKJZY5KLjB7KOu4FfgvgLfp5
	u8QbufBLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcH4W-0004Tf-QH; Sat, 15 Jun 2019 22:22:52 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcH4S-0004Sh-Ch
 for linux-mtd@lists.infradead.org; Sat, 15 Jun 2019 22:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1560637359; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVyIFnScoxPXqLI9tBcjmS2//cgjT4c+m2gvnY81jCs=;
 b=PNJT8Rmfq1mOruQzkh5Clw9tA/Z4vAL+pEWIUuYcjUpwrJc7pt/GEWrTpyR0ZenAm8XnEA
 ZLC1dNozXtdj12dyU0QI3aNZlLsAKfVDjhFmLQuQHp2eE7NtWdJzYM77fDagcdBXlaUKgp
 Tj3ubec6/ZEBD4ATunaPH7OZRsyopo0=
Date: Sun, 16 Jun 2019 00:22:33 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Fix build error
To: YueHaibing <yuehaibing@huawei.com>
Message-Id: <1560637353.3745.0@crapouillou.net>
In-Reply-To: <20190615134430.30384-1-yuehaibing@huawei.com>
References: <20190615134430.30384-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_152248_825379_898032B2 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

I don't think the patch is correct. We want to be able to build
the ingenic_nand driver without the ingenic_ecc code.

The actual problem is that if the ingenic_nand driver is built-in,
then the ingenic_ecc driver must be built-in too (if enabled),
and we don't verify that constraint.

Something like that should work better:

config MTD_NAND_INGENIC_ECC
	def_tristate m if MTD_NAND_JZ4780=3Dm
	def_tristate y if MTD_NAND_JZ4780=3Dy

Thanks,
-Paul


Le sam. 15 juin 2019 =E0 15:44, YueHaibing <yuehaibing@huawei.com> a =

=E9crit :
> If MTD_NAND_JZ4780 is y and MTD_NAND_JZ4780_BCH is m,
> which select CONFIG_MTD_NAND_INGENIC_ECC to m, building fails:
> =

> drivers/mtd/nand/raw/ingenic/ingenic_nand.o: In function =

> `ingenic_nand_remove':
> ingenic_nand.c:(.text+0x177): undefined reference to =

> `ingenic_ecc_release'
> drivers/mtd/nand/raw/ingenic/ingenic_nand.o: In function =

> `ingenic_nand_ecc_correct':
> ingenic_nand.c:(.text+0x2ee): undefined reference to =

> `ingenic_ecc_correct'
> =

> Select MTD_NAND_INGENIC_ECC if MTD_NAND_JZ4780 is set
> =

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fiexes: 15de8c6efd0e ("mtd: rawnand: ingenic: Separate top-level and =

> SoC specific code")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/mtd/nand/raw/ingenic/Kconfig | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> =

> diff --git a/drivers/mtd/nand/raw/ingenic/Kconfig =

> b/drivers/mtd/nand/raw/ingenic/Kconfig
> index 19a96ce..d0b1909 100644
> --- a/drivers/mtd/nand/raw/ingenic/Kconfig
> +++ b/drivers/mtd/nand/raw/ingenic/Kconfig
> @@ -9,6 +9,7 @@ config MTD_NAND_JZ4740
>  config MTD_NAND_JZ4780
>  	tristate "JZ4780 NAND controller"
>  	depends on JZ4780_NEMC
> +	select MTD_NAND_INGENIC_ECC
>  	help
>  	  Enables support for NAND Flash connected to the NEMC on JZ4780 SoC
>  	  based boards, using the BCH controller for hardware error =

> correction.
> @@ -20,7 +21,6 @@ config MTD_NAND_INGENIC_ECC
> =

>  config MTD_NAND_JZ4740_ECC
>  	tristate "Hardware BCH support for JZ4740 SoC"
> -	select MTD_NAND_INGENIC_ECC
>  	help
>  	  Enable this driver to support the Reed-Solomon error-correction
>  	  hardware present on the JZ4740 SoC from Ingenic.
> @@ -30,7 +30,6 @@ config MTD_NAND_JZ4740_ECC
> =

>  config MTD_NAND_JZ4725B_BCH
>  	tristate "Hardware BCH support for JZ4725B SoC"
> -	select MTD_NAND_INGENIC_ECC
>  	help
>  	  Enable this driver to support the BCH error-correction hardware
>  	  present on the JZ4725B SoC from Ingenic.
> @@ -40,7 +39,6 @@ config MTD_NAND_JZ4725B_BCH
> =

>  config MTD_NAND_JZ4780_BCH
>  	tristate "Hardware BCH support for JZ4780 SoC"
> -	select MTD_NAND_INGENIC_ECC
>  	help
>  	  Enable this driver to support the BCH error-correction hardware
>  	  present on the JZ4780 SoC from Ingenic.
> --
> 2.7.4
> =

> =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
