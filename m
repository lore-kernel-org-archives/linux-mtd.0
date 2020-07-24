Return-Path: <SRS0=mo6j=BD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E45CC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 15:20:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC7E62065F
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 15:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RBCetfeg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="VvX6/7bg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC7E62065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cGJaeMaGgMTsQhvoSuxPakH4UpCydZGyFoTHPFEslmk=; b=RBCetfeg7e9/VRrVG7KVXMvWK
	ZYtXNqZ07xiWrnj1AZFy0/nfZlYisAMLK1ZiHtNIzGAKbe+qrUtVdGbdjiVbzSJb2Scib2L+4OB/L
	VVgt9W21gtKIx3uN4URZxCi1iB8WoAT+/zbp2cRaXwvTGl44BTjrgd23nl9yf9djPbbINImJ1HU4v
	VUwWIM+OIxz1dOlq3nnLVx3RDojOLfJrKNLBfjDZSuuSz2CQSQhI2wFE5kPBuIeJzO1hBqt337Hb6
	RgsPFIiGgJDXAqKW5GXIWBhBubWBPfCoUkD0/HGbhcCa8Hl/is3qMTe5/yKKkqOTMcFidChw3LBcS
	R6LN0AmbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyzUI-0004Bg-DK; Fri, 24 Jul 2020 15:19:54 +0000
Received: from crapouillou.net ([89.234.176.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyzUF-0004AZ-Oa
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2020 15:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595603986; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yY2mSWGinvjgTNeh7YWWVKQZmHFDXNi71wQPqYSlDZg=;
 b=VvX6/7bgcPTOLqqKlyAXWf/NK+RZUV58KP9A+f9O6IuizKR9arED+yv52Il1dmfRqt1fEg
 q2Dp9hr34bi0dWJA5gxIAq4shfyduACqNBJIBsbBqc5I5hbC4eg7bgwrfoewtrks0w3Ao9
 a+8bHQw+fBzuW1/AFzSXIU1ym/9ipmg=
Date: Fri, 24 Jul 2020 17:19:37 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
In-Reply-To: <20200724145401.2566-3-krzk@kernel.org>
References: <20200724145401.2566-1-krzk@kernel.org>
 <20200724145401.2566-3-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_111952_034969_CA463F50 
X-CRM114-Status: GOOD (  13.54  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,


Le ven. 24 juil. 2020 =E0 16:54, Krzysztof Kozlowski <krzk@kernel.org> a =

=E9crit :
> Enabling the MTD_NAND_JZ4780 driver makes sense only for specific
> hardware - the Ingenic SoC architecture.  Set it's dependency to
> MACH_INGENIC so it will not appear on unrelated architectures (easier
> job for downstream/distro kernel engineers).

Disagreed. It was done this way so that distro kernels can support =

multiple SoCs.

-Paul

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> =

> ---
> =

> Changes since v2:
> 1. New patch
> ---
>  drivers/mtd/nand/raw/ingenic/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/mtd/nand/raw/ingenic/Kconfig =

> b/drivers/mtd/nand/raw/ingenic/Kconfig
> index 96c5ae8b1bbc..2e3936543ba6 100644
> --- a/drivers/mtd/nand/raw/ingenic/Kconfig
> +++ b/drivers/mtd/nand/raw/ingenic/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config MTD_NAND_JZ4780
>  	tristate "JZ4780 NAND controller"
> -	depends on MIPS || COMPILE_TEST
> +	depends on MACH_INGENIC || COMPILE_TEST
>  	depends on JZ4780_NEMC
>  	help
>  	  Enables support for NAND Flash connected to the NEMC on JZ4780 SoC
> --
> 2.17.1
> =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
