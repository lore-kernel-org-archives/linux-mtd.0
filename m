Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B551DEB64DA
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNtSsnctcnr6minH8zpKCewHH/nd1+MhK9FQJoKfsiY=; b=G/ESV8RZeh5heA
	l/RErf6y3EV08+Q1ObSt2qBhwU1BIHfO6YqbHOyhRmGOHeEO+mVLLMiGodXZmHVguoIc/jwsfNHkk
	v8qIX33XBYy4F4V0JX0XMa33Kt72Zgu6HrgdaUH3uXoGA6WMC/76awm2ROSqVOU9MpfO2XI5GD3K9
	r3s1qnn22DC/mBsr/Z5qokrmvJ1SRZUGXHp61GccqKAxjId46rvdAfS2jN5sXr8FMoac7uW4jF9sE
	9/0zuS5V/ulmSAZHpjywtVPYpbXnM4j8fWLQzR+5vF34H3jsqj4+wdGTKj2Q/LqdktNTLFTgLErCW
	rTvD7DLZRzVGX7KQUl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9c0-003BwD-1n;
	Fri, 30 Jun 2023 08:36:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9by-003Bv2-0q
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jun 2023 08:36:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fbc54caad5so7317765e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2023 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688114172; x=1690706172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYLmeNIa/qbq0KtAzV/Ey9lpEGHL4i7EOrsVCQLPj3A=;
        b=A+sxzTewrp+4wWtq/DbqZ2PmzuwXHSL5d+QkgJIf/INdv9tJM6AL+Ql5b1Amu4UtfO
         Vjm8RM6HWVcmHCB5QnVEIAj0w4VxuvAub5BJ9OILwaPraOTZ9gRxcYhIZKJSiPL73eRv
         DJSAzIIT2WcwcZPHWwYGjs3RlzM+iHgycuiIV3PyH7BhYiDUNtUGt/sueuB0M6BxqcrF
         YdSkz4d+5/XN39dPE19udl8Z37W2gmiO/6sRvMf1MMfTzhsZIl1NOopZwFUsp/B4N+jC
         T0Eq9STbIySEa67sLPNzpyx2VFqkI0gzA9Ug391DoOfM8qkpye8ayVq+T5bkKr8ALyur
         /R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114172; x=1690706172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYLmeNIa/qbq0KtAzV/Ey9lpEGHL4i7EOrsVCQLPj3A=;
        b=esn9AM7Jldqmu6xnB+Ay/hl4dtBDAoPhgkWVcKi8Irq0ELef5nHQMB5rG7SwjGOnhw
         6sYsOc8KRVscT61Sd/LcW1Dpi1X5llaW3tQXIgRSJPT+anjNG4tCwS2bvDngQleU2dzw
         Xm2Yg5K+IgkRVBhUEMzxYd7NDRM3sqmciloxRhY1iJPF1wHSc6aKiUf01HZdabjgE0MM
         o3UTIjhXU6ukui/7G6x0BQdNArEv4Pz1vy9Pznodgsn3B3LXWI7IisHZCk/RbEnUWNcm
         G3Ft2UXzYOqcegDjYb7SlPTf0yRnSbGJLJ+9Y+Ltrq+/fVVIXgV7lXSiXh/YU/G5QLDb
         ETbQ==
X-Gm-Message-State: AC+VfDyVFRrmiJW37wjDjtf3MMsyXCpC8qEVqb6AzgHXib6xtml52aP+
	Guaw55SRGDqb1r+avirGojRSZQ==
X-Google-Smtp-Source: ACHHUZ7EZObFAaKzqiAF5KKdvIUKd3ODGlToOXtpArd4HfG1IV5jWmOGUZTY+v+gqbbS0+LUc2uoKg==
X-Received: by 2002:a7b:c445:0:b0:3f9:b7cc:731 with SMTP id l5-20020a7bc445000000b003f9b7cc0731mr1457072wmi.15.1688114172525;
        Fri, 30 Jun 2023 01:36:12 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.171])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c294200b003fa78d1055esm18320515wmd.21.2023.06.30.01.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:36:12 -0700 (PDT)
Message-ID: <cba4c06c-65ed-141a-80e4-3731c3560ae9@linaro.org>
Date: Fri, 30 Jun 2023 09:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: clarify the need for spi-nor
 compatibles
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
References: <20230616140054.2788684-1-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230616140054.2788684-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_013614_297046_D54A4ED1 
X-CRM114-Status: GOOD (  17.97  )
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

Hi, Miquel,

On 6/16/23 15:00, Miquel Raynal wrote:
> Most SPI NOR devices do not require a specific compatible, their ID can
> in general be discovered with the JEDEC READ ID opcode. In this case,
> only the "jedec,spi-nor" generic compatible is expected. Clarify this
> information in the compatible description to (i) help device-tree
> writers and (ii) prevent further attempts to extend this list with
> useless information.

Sounds good. If you don't mind I'll reword the description from below
when applying.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 7149784a36ac..bef071163e38 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -43,8 +43,10 @@ properties:
>            - const: jedec,spi-nor
>        - const: jedec,spi-nor
>      description:
> -      Must also include "jedec,spi-nor" for any SPI NOR flash that can be
> -      identified by the JEDEC READ ID opcode (0x9F).
> +      SPI NOR flashes compatible with the JEDEC standard or which may be

s/JEDEC/JEDEC216, s/may/can

> +      identified with the JEDEC READ ID opcode (0x9F) do not deserve a

"deserve" is a little harsh. How about "must be matched against
the generic ...".

For future me: 0x9f is not a JEDEC216 opcode, it just happened
that the industry agreed on a specific opcode for reading the
ID of the flash. JEDEC216 doesn't care about the flash's ID.
We care because of the fixup hooks.

Cheers,
ta
> +      specific compatible. They should instead only be matched against
> +      the generic "jedec,spi-nor" compatible.
>  
>    reg:
>      minItems: 1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
