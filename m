Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE1FC4725D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1sez7TYro7Jt03/V7HhENIxGNJADgXbzPeOXOois0Hs=; b=qpM3Awavg0gE3v
	wMsP7H6xL4Qh7hwEtVr+hG5HSS9UqYPJhdal7OGKZZo8F5h+cPxsSWD2c0uIsiSH+GuE2YejI8DDL
	gzZ5+fKnzvh8s/Juau8KF3a1URVggnlbG8B484wgJMTDXRNuE6x4zyqjBVU4xTKcsnSxCZUceuYWI
	URnGU5LEZ714McSRYxew+fxb+NwHJxSHG8AzriNbKssoLwzmTffaRPCawQgDDm6xVgPI/pzyrgdCQ
	+CqXMpb//NKDdWflZyawXCKgrA95JGuhMqCRzlWtuaRY5at5w2hP9BKYcesB7NM+LtJstgtQHeSlr
	ipabLePT8VX3NHuGe5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsmz-00BrZ2-1I;
	Mon, 22 Jan 2024 11:48:29 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsmv-00BrRG-3B;
	Mon, 22 Jan 2024 11:48:27 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2909a632e40so325015a91.0;
        Mon, 22 Jan 2024 03:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705924097; x=1706528897; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jmCR5Hs59/0vtuduKlpgs+GpqISPKERHfnKxl2Hek7k=;
        b=NJPjg/cdzHHQu4JVqrCwVdduHGXZcwDn0xJ8rPuCmfD2LkWblvKYOwfQrGXXt0vvhY
         AduV1fEn4Rc7GA5icSVsjmCqsKb5oKp/JfHwlsBIZ/gPMiZOS0cZUfej3UHkSwdmjgBl
         uXAnO7wMkXYvRBZ6+NpMAbQi6n+iaaObOZ5ZG27Zm3VBVNO9fA5teS3JFvgnVl1EdfI5
         GozIR3SU9ZXPt527U9rvNkW40Js976zzPY4V94MS6vOCTi/uKtocji4qmUNw1MAejwNo
         iNOaCycjP7JprAepk5yWrsEHgmLyFiymSb7zGcdPacVKp1vyZwC1YsEoRAp235HbpjF4
         xn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705924097; x=1706528897;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmCR5Hs59/0vtuduKlpgs+GpqISPKERHfnKxl2Hek7k=;
        b=HH0APzkT98b4b4T7mfYVXcTvnpukqVH9/Uvckm9TLNZ91gbEskTWoKOTStQ7PjXhx+
         Miqm8ZdjkEgy0WiHOr6S17oXy4FhvA0qWXjs/+BUJhqUDA3A+ufbEvk/AAW70RPLTj12
         tvM2tANwYyvb70IfrxSkRJijcecz5Qcta6e+jflS99eeRNrD3wqHX9MEa8cZuc9Sj9v9
         ZjXcCO42MJbc3K78EHIj6L0DZM+cZW2ff9s3yB2M4tlOSDXZA1x//8UW2mK8B4IBx/zf
         BbU7VETiYu0bQAy2d+PWVUul9l21XkNl7aAPndfpAGhZgkLzLEh2sbFu9pjXfEbOqRO8
         5IaA==
X-Gm-Message-State: AOJu0YzI3FATdYGNp3CPFxQ/cixx/hVGbBQM0tmF66kun5wfMhmnGB+3
	ZBBQFPX/GrRvWoSg7qarpH4SdSIFswFuLLwJolYJ3TVehaTJLRr4dHHWqX7BlEQGP+r/BBAT/t7
	hVVS5iztdSjpC1CqezT+4tq+Yguc=
X-Google-Smtp-Source: AGHT+IHbJKr0+ESj/7wEsolCjUfhmX5aIfeStUtaEjVhlvaoVw+P+Od3BmO0j+0slKfHsE4bNUCILoUPH2kUJuGqtHk=
X-Received: by 2002:a17:90a:fe95:b0:290:b5b2:b90c with SMTP id
 co21-20020a17090afe9500b00290b5b2b90cmr333726pjb.58.1705924097190; Mon, 22
 Jan 2024 03:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20240118195356.133391-1-dregan@broadcom.com> <20240118195356.133391-2-dregan@broadcom.com>
In-Reply-To: <20240118195356.133391-2-dregan@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 22 Jan 2024 12:48:05 +0100
Message-ID: <CAOiHx=k2Wn+UaVFbB-n2XKmFuBss4LKmLSW45YME07z=7zg0ww@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
To: dregan@broadcom.com
Cc: dregan@mail.com, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, computersforpeace@gmail.com, kdasu.kdev@gmail.com, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com, 
	tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, 
	william.zhang@broadcom.com, anand.gore@broadcom.com, kursad.oney@broadcom.com, 
	florian.fainelli@broadcom.com, rafal@milecki.pl, 
	bcm-kernel-feedback-list@broadcom.com, andre.przywara@arm.com, 
	baruch@tkos.co.il, linux-arm-kernel@lists.infradead.org, 
	dan.carpenter@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_034826_058763_CD5364FA 
X-CRM114-Status: GOOD (  26.87  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, 18 Jan 2024 at 20:56, <dregan@broadcom.com> wrote:
>
> From: William Zhang <william.zhang@broadcom.com>
>
> Update the descriptions to reflect different families of broadband SoC and
> use the general name bcmbca for ARM based SoC.
>
> Add brcm,nand-use-wp property to have an option for disabling this
> feature on broadband board design that does not use write protection.
>
> Add brcm,nand-ecc-use-strap to get ecc setting from board boot strap for
> broadband board designs because they do not specify ecc setting in dts
> but rather using the strap setting.
>
> Remove the requirement of interrupts property to reflect the driver
> code. Also add myself to the list of maintainers.
>
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>
> ---
> Changes in v2:
> - Revert the new compatible string nand-bcmbca
> - Drop the BCM63168 compatible fix to avoid any potential ABI
> incompatibility issue
> - Simplify the explanation for brcm,nand-use-wp
> - Keep the interrupt name requirement when interrupt number is specified
> ---
>  .../bindings/mtd/brcm,brcmnand.yaml           | 36 +++++++++++++++----
>  1 file changed, 30 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> index f57e96374e67..56176ec1a992 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> @@ -9,6 +9,7 @@ title: Broadcom STB NAND Controller
>  maintainers:
>    - Brian Norris <computersforpeace@gmail.com>
>    - Kamal Dasu <kdasu.kdev@gmail.com>
> +  - William Zhang <william.zhang@broadcom.com>
>
>  description: |
>    The Broadcom Set-Top Box NAND controller supports low-level access to raw NAND
> @@ -18,9 +19,10 @@ description: |
>    supports basic PROGRAM and READ functions, among other features.
>
>    This controller was originally designed for STB SoCs (BCM7xxx) but is now
> -  available on a variety of Broadcom SoCs, including some BCM3xxx, BCM63xx, and
> -  iProc/Cygnus. Its history includes several similar (but not fully register
> -  compatible) versions.
> +  available on a variety of Broadcom SoCs, including some BCM3xxx, MIPS based
> +  Broadband SoC (BCM63xx), ARM based Broadband SoC (BCMBCA) and iProc/Cygnus.
> +  Its history includes several similar (but not fully register compatible)
> +  versions.
>
>    -- Additional SoC-specific NAND controller properties --
>
> @@ -53,7 +55,7 @@ properties:
>                - brcm,brcmnand-v7.2
>                - brcm,brcmnand-v7.3
>            - const: brcm,brcmnand
> -      - description: BCM63138 SoC-specific NAND controller
> +      - description: BCMBCA SoC-specific NAND controller
>          items:
>            - const: brcm,nand-bcm63138
>            - enum:
> @@ -65,7 +67,7 @@ properties:
>            - const: brcm,nand-iproc
>            - const: brcm,brcmnand-v6.1
>            - const: brcm,brcmnand
> -      - description: BCM63168 SoC-specific NAND controller
> +      - description: BCM63xx SoC-specific NAND controller

Only the BCM63268 family has a v4.0 NAND controller with support for
ONFI and raw access; BCM6368 has a v2.1, and BCM6328 and BCM6362 have
a v2.2.

So claiming this is a generic binding is wrong; you would need to add
the appropriate variants first. Or add another one for the BCM6368
NAND v2.x controllers, which is missing. You can find them used in
arch/mips/boot/dts/brcm/bcm63{28,62,68}.dtsi.

>          items:
>            - const: brcm,nand-bcm63168
>            - const: brcm,nand-bcm6368

Also bcm63168's v4.0 has a different register layout than bcm6368's
v2.x, so claiming brcm.nand-bcm6368 as compatible here is a bit weird.
It works because the register layout used is derived from the
"brcm,brcmnand-vX.Y" compatible, and the driver attaching to
'brcm,nand-bcm6368" only uses the shared interrupt registers which are
identical, the layout only diverges after that.

But then again these aren't really used as compatibles in the original
sense, and more like tags which describe different parts of the
controller, and the combination is the whole unique "compatible". Not
sure if this is how compatibles are supposed to be used. /rant.

Best Regards,
Jonas

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
