Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EFBC4BA24
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 01:59:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64EC324670
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 01:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RukODh9r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="fotHPoKl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64EC324670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dauXu/E8EXBN+LkJezPdIqN5CSjWWdbDgVgQXSWekY=; b=RukODh9rbCKYwJ
	yiQlke53jDqzdTJI5jgusSU3OUXz3v4h9G3kwXRVcwz9NXDpf0pa7M8CKeGedCK3fR13ZF9Nggd0w
	wQJIq5INcf0ujVELmKGCjPYygAYu94J1UKAARwOrJYyCCsmtATkWVxmLt2hFKIufDdZPReETxzZnC
	/So+xvofMZYeK1TNNOjvFDcyEKskJ8LHp/+ZHIeMndX5q6zihYkqGp919Dfu+kzjUYE5fyaLo51pq
	4pv3LZjOL5fUUFVa0WpBKHPqDdQt3RJqsm5nZjmT81FC3qHFOSvzIAHlz9zmbwz1zXb3nbixBsSkL
	tZn8CbADTXnwNEdvuYgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j78SK-0001Gi-7j; Thu, 27 Feb 2020 01:59:16 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j78SG-0001GI-Hp
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 01:59:14 +0000
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 01R1wrX5028616
 for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2020 10:58:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 01R1wrX5028616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1582768734;
 bh=f0RtcMm91pUvRhf0tWvY0RBgrv1rYufzVOjyf6MfCfg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fotHPoKlYAO5kpyEqqKLQOXS4F/trfYkFriNsEWjC86UpYW6cQasCHv2DFLLr1D0J
 H7orBEvT3m+1md0mVNi8XrLewttMhYJ0XAV7schvaPn4q0//2tvN3lF/jzee8DsVJp
 H3dvA8ewfQDfOm1iKOzIjECi2kuBadKwrrZ/iBcYx/5j4yDxBpQDRWdqHBNjnc8M+Z
 dir83QBiVumV71W01EbLyqnTiAnaDLZ09EOmNYQbrYv6IKpDgO1tXQgVe4V5fecItU
 RXehyFhUWWVHMYjmUzUduwaa2PVppj4rF3ld9qZZZZgrdPCXU7kwsnbN1onAvDvJyS
 9wamCJyToPgqA==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id u26so834718vsg.2
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2020 17:58:54 -0800 (PST)
X-Gm-Message-State: APjAAAVvwv72hLCvk0LAxCpPG+yoCwoYjmvM1c9F3AT4mVbzklkg0YWa
 XbcKSWlio2XQbqGM4rzVbCo0nGFACfsepmguipc=
X-Google-Smtp-Source: APXvYqxS/NpYKxdzB2PqcLVxTMrbA3ernXND+XDm0KOzE5cfpSGY5b+4SUxf9m2c26wWKmdvddCFLKtYmXd2gSO7fhk=
X-Received: by 2002:a05:6102:3102:: with SMTP id
 e2mr1183258vsh.179.1582768733281; 
 Wed, 26 Feb 2020 17:58:53 -0800 (PST)
MIME-Version: 1.0
References: <20200222141927.3868-1-yamada.masahiro@socionext.com>
In-Reply-To: <20200222141927.3868-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 27 Feb 2020 10:58:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmzYzK_A4iF6b-LxTT-o5Ut2=TyBeRQPSfCdj7FHhgBQ@mail.gmail.com>
Message-ID: <CAK7LNAQmzYzK_A4iF6b-LxTT-o5Ut2=TyBeRQPSfCdj7FHhgBQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Convert Denali NAND controller to
 json-schema
To: Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_175912_824357_9D27AC91 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,


This was applied, but I just noticed one stupid mistake.



On Sat, Feb 22, 2020 at 11:20 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Convert the Denali NAND controller binding to DT schema format.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  .../devicetree/bindings/mtd/denali,nand.yaml  | 149 ++++++++++++++++++
>  .../devicetree/bindings/mtd/denali-nand.txt   |  61 -------
>  2 files changed, 149 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/denali,nand.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/denali-nand.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/denali,nand.yaml b/Documentation/devicetree/bindings/mtd/denali,nand.yaml
> new file mode 100644
> index 000000000000..b41b7e4bfe78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/denali,nand.yaml
> @@ -0,0 +1,149 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/denali,nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Denali NAND controller
> +
> +maintainers:
> +  - Masahiro Yamada <yamada.masahiro@socionext.com>
> +
> +properties:
> +  compatible:
> +    description: version 2.91, 3.1, 3.1.1, respectively


Please delete this description.

This is a copy-paste mistake, which
came from my other patch
"dt-bindings: mmc: Convert UniPhier SD controller to json-schema"




> +    enum:
> +      - altr,socfpga-denali-nand
> +      - socionext,uniphier-denali-nand-v5a
> +      - socionext,uniphier-denali-nand-v5b
> +




-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
