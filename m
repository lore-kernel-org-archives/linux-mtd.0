Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A97DC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:35:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE14960FE3
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE14960FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9aaRgKmRPn4MzvCfxoMy1hLYBBWreQLvkyDjNPvEEM=; b=jIq5RIoM1E2Z75
	SJvqWZqKPl10yg0trEKGt5bt/jTcZNOg1qMJLrWcH/W9B9wd0BgQCXqn9F6iXOf0xvT8UNuGqPlm6
	9o7eR4R5T3gBuwTm6VI4QDBxdvNAmVf5XH5/7quFv9g/DipoZpZ4iZ1Ke1tNGpeZshQPGENTV1Na9
	S3uEu98ePMLEJftsr8QfVxUPGTguTeSxSF3mNlfd4ihqm/mIrtMudYIZFqEjwxfrJLo2S1YPnOvyk
	dgT11aIr5fdv35kkRdRK7W1LhPlavEiRsrtHImY5f1gYaCUa0Cd99YLPpBAYBvY7zvUj7peqMXO/U
	fgZEPdz8E+m64BApGz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgD2d-0099Ua-OE; Thu, 28 Oct 2021 21:34:31 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgD2a-0099Tk-Ss
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 21:34:30 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 n13-20020a9d710d000000b005558709b70fso4102911otj.10
 for <linux-mtd@lists.infradead.org>; Thu, 28 Oct 2021 14:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qpLGuTUyYYTKPA8RL6cRZq63VfK8RoUI0Php/jfvjsw=;
 b=qRj9Wcfjmr3JidxVDLNXvUlixPsz6TXf3Jea4Q6bbV51EmA5EKVLMCA4/H6SWg35K4
 UXRyH1HXekZhokwg1cLoCIRhNXAEi0/Mvk203liilP7eZ6lQ845w1k2Fk8ert4gdIhIH
 wAhx1TO52bKPE+y+A4tWcOJdfajlLnxyaO12rzuw7Mb8PIUtKfSx0geMxQCmQHpXsw7m
 fIuuHyi+n7D2M3++DNFWv/+1ZpDDl/xsdfUC/DyPvAJun5bWBFAGa4vmBCOlwVieKYIo
 4bjS+Y80JV0mBwIL36tFrSZMFkyYdMRWy8Ce06aGbxVniUbGHTw9tUSvX09M8GV70j9+
 GUsQ==
X-Gm-Message-State: AOAM531IkxzzyQTRdvUPgGDQw8Q4Bi7Em9aeoMyEVvGdRXsGHBHZR5GY
 amCtqHCYta+P49V4nUsAWw==
X-Google-Smtp-Source: ABdhPJxpNPOfRGhPO9EQMfKEEg+FrVFsZABAS89TAmyXKolt/PW5cIbwKvjIEVhyue3qL/S+f0RUNg==
X-Received: by 2002:a9d:6d03:: with SMTP id o3mr5613522otp.87.1635456868157;
 Thu, 28 Oct 2021 14:34:28 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w16sm1346045oti.3.2021.10.28.14.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:34:27 -0700 (PDT)
Received: (nullmailer pid 626453 invoked by uid 1000);
 Thu, 28 Oct 2021 21:34:26 -0000
Date: Thu, 28 Oct 2021 16:34:26 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>
Subject: Re: [PATCH 07/18] dt-bindings: spi: mxic: Convert to yaml
Message-ID: <YXsXYssDTKv2L4EL@robh.at.kernel.org>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-8-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020142809.349347-8-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_143428_978101_12557D77 
X-CRM114-Status: GOOD (  15.98  )
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

On Wed, Oct 20, 2021 at 04:27:58PM +0200, Miquel Raynal wrote:
> Straightforward conversion from regular text to yaml schema of the
> Macronix SPI controller DT bindings.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/spi/mxicy,mx25f0a-spi.yaml       | 67 +++++++++++++++++++
>  .../devicetree/bindings/spi/spi-mxic.txt      | 36 ----------
>  2 files changed, 67 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-mxic.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml b/Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml
> new file mode 100644
> index 000000000000..4036c14fc533
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/mxicy,mx25f0a-spi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Macronix SPI controller device tree bindings
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +
> +properties:
> +  compatible:
> +    const: mxicy,mx25f0a-spi
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: regs
> +      - const: dirmap
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: send_clk
> +      - const: send_dly_clk
> +      - const: ps_clk
> +

> +  "#address-cells":
> +    const: 1
> +  "#size-cells":
> +    const: 0

Can drop these as spi-controller.yaml already defines them.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names

> +  - "#address-cells"
> +  - "#size-cells"

And makes them required.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi@43c30000 {
> +      compatible = "mxicy,mx25f0a-spi";
> +      reg = <0x43c30000 0x10000>, <0xa0000000 0x20000000>;
> +      reg-names = "regs", "dirmap";
> +      clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 18>;
> +      clock-names = "send_clk", "send_dly_clk", "ps_clk";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +    };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
