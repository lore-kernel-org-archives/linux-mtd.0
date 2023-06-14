Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE46AEB64D8
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jun 2023 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3jiOym4t6a1uSPij36mn2aBDAKpt7xMdka8ooU4G6eI=; b=NDxNNVkIephZo3
	NwgYbyHIYcYkk1zToapPD0sCHSLW/pXG1UqVVE3MxeAGq8z7AEXKS34WESCyygVoSBcdnXWeA8FfW
	mY/Cn1cNINXkjAGPljU3bSLZzs+Zej8lGzkyCaCmW637JHGj23h4EsNLnRN6K+5bz5UL/XJTga6gf
	icvIucory0fItE0dtJnmAqELXNJFDFQq+Pv8luN5c67yhoUDdR8U/DALO9J3cZCFVi8NStFp7B53q
	hhTwFNEotOmGgPlqbx5CDgHDI69W8nDSp0o52kvBYIFcCIVqtJdzwf3Wz6BVtg5cTzvhwWM8FV3yq
	h7zO349frSUvX6UcJfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ZDQ-00CtJN-1R;
	Wed, 14 Jun 2023 22:43:48 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ZDM-00CtIE-15
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jun 2023 22:43:46 +0000
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-777ac791935so286523239f.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2023 15:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686782621; x=1689374621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKGcfzr/p/3/4KMXU7XbxZ/xW3lQr6BAlDHKWT9Oujc=;
        b=fJEiNdI7GKJFt7Fn2ZCNF5vXQpY8Si0lVCWWKXPzkyB45H4TB6xIKazNS/uujIRQfg
         L1LJ/ZIaimt61JjLnRu0EVFblLIDRCnbOF12GnMTLTpid02q+uDH+iNneJvDwWbjhq4K
         1b9FlXMDeDsCzSwUIbWU7kDIlvHUKFql7t9Q4BxPDZVmFxxRB7g5bBp9zmyrI2MgNEBr
         L2s8kt2nnpIDTZqfyC9E0NUEdbGH5Pkwb1uv682DLuf8bB1v8ToysqPSIQsCfdlzsveg
         iQqXGSvLSN7vThl4uL67XKcx/1G5kkyJTtUYGh3sNsNWUfj1PzJnMcqg5PJlHdj0NGhX
         zfpw==
X-Gm-Message-State: AC+VfDzLOHG/1PcNknidXBDtv9arKdePqymgtf44MWI0Jiq8oGzrnK5Y
	AEehpwnRY6qtUaKWdfQjCA==
X-Google-Smtp-Source: ACHHUZ6lygdrz16O6hhXp1oh6hsk1t75L5t3R45RyVE304fcKg+/x7h2K9VVCD3aevb1eYFkGvcjyQ==
X-Received: by 2002:a6b:4401:0:b0:760:f795:ccdf with SMTP id r1-20020a6b4401000000b00760f795ccdfmr14226968ioa.8.1686782621260;
        Wed, 14 Jun 2023 15:43:41 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id u19-20020a02c953000000b0041672c963b3sm5286814jao.50.2023.06.14.15.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 15:43:40 -0700 (PDT)
Received: (nullmailer pid 2999712 invoked by uid 1000);
	Wed, 14 Jun 2023 22:43:38 -0000
Date: Wed, 14 Jun 2023 16:43:38 -0600
From: Rob Herring <robh@kernel.org>
To: William Zhang <william.zhang@broadcom.com>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, Linux MTD List <linux-mtd@lists.infradead.org>, f.fainelli@gmail.com, rafal@milecki.pl, kursad.oney@broadcom.com, joel.peshkin@broadcom.com, computersforpeace@gmail.com, anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 05/12] dt-bindings: mtd: brcmnand: Updates for bcmbca SoCs
Message-ID: <20230614224338.GA2990941-robh@kernel.org>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
 <20230606231252.94838-6-william.zhang@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606231252.94838-6-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_154344_400279_AE1E6E81 
X-CRM114-Status: GOOD (  23.77  )
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

On Tue, Jun 06, 2023 at 04:12:45PM -0700, William Zhang wrote:
> Use new compatiable brcm,nand-bcmbca to support BCMBCA broadband
> product. The old compatible string is still kept in the driver so old
> dtb can still work.

I don't understand why you need to change this. 


> Add brcm,nand-use-wp property to have an option for disabling this
> feature on broadband board design that does not use write protection.
> Add brcm,nand-ecc-use-strap to get ecc setting from board strap for
> broadband board designs because they do not specify ecc setting in dts
> but rather using the strap setting.
> 
> Remove the requirement of interrupts and interrupt-names properties to
> reflect the driver code.
> 
> This patch also includes a few minor fixes to the BCM63xx compatibles
> and add myself to the list of maintainers.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> ---
> 
>  .../bindings/mtd/brcm,brcmnand.yaml           | 64 +++++++++++++------
>  1 file changed, 43 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> index 1571024aa119..1fe1c166a9db 100644
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
> @@ -53,9 +55,9 @@ properties:
>                - brcm,brcmnand-v7.2
>                - brcm,brcmnand-v7.3
>            - const: brcm,brcmnand
> -      - description: BCM63138 SoC-specific NAND controller
> +      - description: BCMBCA SoC-specific NAND controller
>          items:
> -          - const: brcm,nand-bcm63138
> +          - const: brcm,nand-bcmbca
>            - enum:
>                - brcm,brcmnand-v7.0
>                - brcm,brcmnand-v7.1
> @@ -65,11 +67,15 @@ properties:
>            - const: brcm,nand-iproc
>            - const: brcm,brcmnand-v6.1
>            - const: brcm,brcmnand
> -      - description: BCM63168 SoC-specific NAND controller
> +      - description: BCM63xx SoC-specific NAND controller
>          items:
> -          - const: brcm,nand-bcm63168
> -          - const: brcm,nand-bcm6368
> -          - const: brcm,brcmnand-v4.0
> +          - enum:
> +              - brcm,nand-bcm63168
> +              - brcm,nand-bcm6368
> +          - enum:
> +              - brcm,brcmnand-v2.1
> +              - brcm,brcmnand-v2.2
> +              - brcm,brcmnand-v4.0
>            - const: brcm,brcmnand

Completely changing what's valid here too. You're breaking the ABI.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
