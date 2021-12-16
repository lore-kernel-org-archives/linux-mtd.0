Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8405C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrmXmOWeFLzhx1vDChqvDaXz7MI4mcpuEckJbteg7Xo=; b=ZkGEjnXHfgWxrL
	7zP+h1L91O+uXZubKWfOUGPUUVuDGWQilP7Q2M9sPfxd4nCgpvxd4NhqvX6DUzDVtx9T40/reQQRE
	99YGVruhxlhWl9BUkguZq8mrZtZbo123D+RedL8G1+PGLaszpn3oQ1n0Ix3zYoc+ryRUcWLYCWmhW
	w1Iv5FVKcPgIYBtHhAcGc3+1xzfKL68f+bRg2wP3j37u8lTn0WrjnTSNWQAePN8YnJxK3CchLZuDl
	fDwp3IhZWMyOisnpn342wNUSad5xpteJHqJh4HzL+hwT7X/N7z2qLg2DGQHWdodiQvszFsxZsl6EP
	uJQDgNuRb1pwOvD775iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxxHR-007UaL-LV; Thu, 16 Dec 2021 20:23:09 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxxHO-007UZI-JE
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 20:23:08 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so283976otl.8
 for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2021 12:23:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O8UFdnai6s7snpmbwkSl36M4XrxKlc+aoRmeuFCVzpU=;
 b=UO43ln2LWrD0eHqTd8qIYxI4X8N8u9KJROt5ndELDsnYhodqu8LyKZoyW/Biz5GxrW
 Q1N9JWSyFzgiJgaN88S/FvcCBErdibffyXG5/mb1t9nIKj4BwOOqp6GepQmcirhkqIRB
 IVakBAWYdEgZxloO/dCjRPIM+Lx6dHDAhzMIU97cKbgUF9gOm+lrtQKClPfadmzpZHbl
 CX55TKPxuHEaZYqUHg/jpIcp663tLwpcjrmGyxjp1dyRigiwx+7x/wHUTx92j8YUMzBn
 7tnrIVzGjYiK/+x/Mg3OawjpsbrolDKlqUCEa+vIUVAHGroVgvgxPEiabsIBt7aBQxQN
 WcDg==
X-Gm-Message-State: AOAM532aOdmPjY0wDKBLgUHx41Ec/YylPKuRf7HtFUos9afI+xH83lK6
 BDKpbxjD7DzvYw/tCsEJJA==
X-Google-Smtp-Source: ABdhPJyndhm5K0m9V6/DCjWTrWsPJVH01HL98W25VKieC8BJwh1QrMqZCdZpi152ne28QCC7piMKew==
X-Received: by 2002:a05:6830:2693:: with SMTP id
 l19mr14584490otu.338.1639686185961; 
 Thu, 16 Dec 2021 12:23:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j5sm1223576oou.23.2021.12.16.12.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 12:23:05 -0800 (PST)
Received: (nullmailer pid 693232 invoked by uid 1000);
 Thu, 16 Dec 2021 20:23:04 -0000
Date: Thu, 16 Dec 2021 14:23:04 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v4 1/4] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1
 NAND controller
Message-ID: <YbugKD5KH/x+NavY@robh.at.kernel.org>
References: <20211215154619.166360-1-miquel.raynal@bootlin.com>
 <20211215154619.166360-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215154619.166360-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_122306_661228_FCCB42DB 
X-CRM114-Status: GOOD (  16.40  )
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

On Wed, Dec 15, 2021 at 04:46:16PM +0100, Miquel Raynal wrote:
> Add a Yaml description for this Renesas NAND controller bindings.
> 
> Provide a family-specific "rzn1" compatible and a more specific
> "r9a06g032" one.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../mtd/renesas,rzn1-nand-controller.yaml     | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> new file mode 100644
> index 000000000000..03a4e99b4d89
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/renesas,rzn1-nand-controller.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/renesas,rzn1-nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/N1x NAND flash controller device tree bindings
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a06g032-nand-controller
> +      - const: renesas,rzn1-nand-controller
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB host controller clock
> +      - description: External NAND bus clock
> +
> +  clock-names:
> +    items:
> +      - const: hclk
> +      - const: eclk
> +
> +  "#address-cells": true
> +  "#size-cells": true

You can drop these 2 as nand-controller.yaml should cover them.

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
