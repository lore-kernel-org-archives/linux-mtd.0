Return-Path: <SRS0=DDtA=BE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801B0C433DF
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 12:39:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B8B6206C1
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 12:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aVB3EpMM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="ghKqg4gz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B8B6206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZLr214N2+GiIqETCVzppgneSXgIKC4v+brOmhl8Mqlo=; b=aVB3EpMMkicoxwJ32tG7L0gl8
	/KWo4ZzIb5L174rbuYGzcgfQwgpXMuvlpfmFmvFcGrZvLqFZ/xMB8kpNx02ob3LZ3w3946qjMlb1+
	JoUbjesIgWfoWz1KUlFU1qOtZnC5qZE1YErYc4K5PkizC8AJ6P/naEO50v9FN2obTkw8GPOfbOH5U
	QllLcxRZMUwbDQE42XxpLR0SqgYCcfO0hBb3wHEeQR5HUv2x8xzX99dw/LwxssXj5dhkly3TU2z12
	FtQXuMPfawqTg2GfzpX/qdUO3XjpnBaLbOsIzPfgt06ltl/jqeoGRfNN0gZ5/Z76ALeMvsfT7BTCZ
	3U3lrE/PA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzJRW-0006Mh-TK; Sat, 25 Jul 2020 12:38:22 +0000
Received: from crapouillou.net ([89.234.176.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzJRT-0006Lt-W2
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2020 12:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595680698; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/K1S5tO51vq/D+dmrYz3As5SIimWsQTOvR+jAS/StA=;
 b=ghKqg4gz7SdSK24i50kGFGHfl0MbRKgPV2np40eRUeza0f0TdUyz45XbZpXG5OlPfgznXU
 sG6U+iHaq0jl/vWp1adyDthxFqD1UGwCDFSZLJjhHYIUrHRgNmqW4KcWGUvsmphNv0mMtZ
 prdsEhlSIza2jpawcun6cR9uVHf9VnU=
Date: Sat, 25 Jul 2020 14:38:07 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MAINTAINERS: Add linux-mips mailing list to JZ47xx entries
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <J3Z0EQ.V70YLMM6L6RR2@crapouillou.net>
In-Reply-To: <20200724155816.8125-1-krzk@kernel.org>
References: <20200724155816.8125-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_083820_181740_F8E5F283 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 Richard Weinberger <richard@nod.at>, linux-mips@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

Le ven. 24 juil. 2020 =E0 17:58, Krzysztof Kozlowski <krzk@kernel.org> a =

=E9crit :
> The entries for JZ47xx SoCs and its drivers lacked MIPS mailing list.
> Only MTD NAND driver pointed linux-mtd.  Add linux-mips so the =

> relevant
> patches will get attention of MIPS developers.
> =

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index cba0ed77775b..f41fc775a3c9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8543,17 +8543,20 @@ F:	samples/bpf/ibumad_user.c
> =

>  INGENIC JZ4780 DMA Driver
>  M:	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> +L:	linux-mips@vger.kernel.org
>  S:	Maintained
>  F:	drivers/dma/dma-jz4780.c

This entry can be removed completely, Zubair specified that he does not =

maintain this driver anymore. Besides this e-mail address is no more =

valid.

With that said:
Acked-by: Paul Cercueil <paul@crapouillou.net>

> =

>  INGENIC JZ4780 NAND DRIVER
>  M:	Harvey Hunt <harveyhuntnexus@gmail.com>
>  L:	linux-mtd@lists.infradead.org
> +L:	linux-mips@vger.kernel.org
>  S:	Maintained
>  F:	drivers/mtd/nand/raw/ingenic/
> =

>  INGENIC JZ47xx SoCs
>  M:	Paul Cercueil <paul@crapouillou.net>
> +L:	linux-mips@vger.kernel.org
>  S:	Maintained
>  F:	arch/mips/boot/dts/ingenic/
>  F:	arch/mips/include/asm/mach-jz4740/
> --
> 2.17.1
> =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
