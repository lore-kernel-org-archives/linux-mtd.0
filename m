Return-Path: <SRS0=uocl=SE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F19DC43381
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 02:02:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E33C120830
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2019 02:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g0x8WMU/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqY868Id"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E33C120830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhpOyCc8YzKMAduAyo4umyzuUsxc6U7UL117XeTWSIc=; b=g0x8WMU/9DKlqV
	vGO6fIltLhiQFp2wyANbVG4fE9vqhk1H53Sh4Kw4sUzxpGteBFugz9TXnJLB5hwnUmbzTKeMA+KC2
	BaKBwS9wSq71cDCVerZ7vJ5HfFDbo9LTpb+5hmLPkc5tTpGWfbdu7AGhSVQWsls0fTUaDeGL+3JaP
	ysXGxMIl6oxeLSS0bL33j6l990MOClnzZV2QRiOw8qKv3lEwOLHm3jk0aK+O/LCabeIrHwyb3mkYM
	athvaGudlbktaDmOCwLTwv5Q0cXCYap15N/ThC/isEZ+hyN3NUyvSA5pYL2rjZtxXJs6wIZuRLvQ5
	0u8UUEOkgXxerYlCMUkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB8kq-0004Km-6A; Tue, 02 Apr 2019 02:02:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB8kh-0004Cr-42; Tue, 02 Apr 2019 02:02:16 +0000
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2FCB21473;
 Tue,  2 Apr 2019 02:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554170534;
 bh=7FEByyNms8A4/G0KAU/Ei93iPKqUnJD9pSL/qwhya8c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tqY868Idgmj/funHHlWpiWSrBvJXI0WcQjwXq7IXC51TKmWxFIgYK7LK1ZjEJwH4p
 0XE+a5zIkiTFdk+G1E/89Lcbv8UaWcp2tHmgMsNyALmDUbPD5wSoRGcPET+XxJDYYe
 imB33HNXLUG7QpmKYgoWhdJhWCpvGLC5QSjDmcPY=
Received: by mail-qt1-f177.google.com with SMTP id z17so13163800qts.13;
 Mon, 01 Apr 2019 19:02:14 -0700 (PDT)
X-Gm-Message-State: APjAAAV37TC4JW3V8XmWYvPG96zsXHe/Azjy5fDUNdbE3mKI+P2sZNVg
 PCtXeVpKtJ++jlDp9LFKf0El3+ROLJhoyAinGw==
X-Google-Smtp-Source: APXvYqyqzQ9fkjRQvBuqhwF8bWacTcrtZWWxpvopbIQProUR3ueGZqXKzwxi6vZmp9KVVkNxjPYmaRij5RMtzRwPZE4=
X-Received: by 2002:aed:302f:: with SMTP id 44mr58116007qte.178.1554170533898; 
 Mon, 01 Apr 2019 19:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
 <5bbd086f909e2331103fbf9afbe75cc5b8782f36.1554153146.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <5bbd086f909e2331103fbf9afbe75cc5b8782f36.1554153146.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 1 Apr 2019 21:02:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKaaFH2AKKLV91n_RjL5_56ozheLJNtrE=0t+ygm=pxxg@mail.gmail.com>
Message-ID: <CAL_JsqKaaFH2AKKLV91n_RjL5_56ozheLJNtrE=0t+ygm=pxxg@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: mtd: sunxi-nand: Add YAML schemas
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_190215_199053_1A52BD28 
X-CRM114-Status: GOOD (  20.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Apr 1, 2019 at 4:14 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch the DT binding to a YAML schema to enable the DT validation.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/mtd/sunxi-nand.txt                | 48 +-------------------------------------------
>  2 files changed, 81 insertions(+), 48 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
> new file mode 100644
> index 000000000000..174294b9e9c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/allwinner,sun4i-a10-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A10 NAND Controller Device Tree Bindings
> +
> +allOf:
> +  - $ref: "nand-controller.yaml"
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  "#address-cells": true
> +  "#size-cells": true
> +
> +  compatible:
> +    const: allwinner,sun4i-a10-nand
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: mod
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: ahb
> +
> +  dmas:
> +    maxItems: 1
> +
> +  dma-names:
> +    const: rxtx
> +
> +  pinctrl-names: true
> +
> +patternProperties:
> +  "^pinctrl-[0-9]+$": true
> +
> +  "^nand@[a-z0-9]+$":
> +    properties:
> +      reg:
> +        maxItems: 1

min/max value of reg values?

> +
> +      nand-ecc-mode: true
> +      nand-ecc-step-size: true
> +      nand-ecc-strength: true

Surely the h/w has further constraints on possible values?

> +
> +      allwinner,rb:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Contains the native Ready/Busy IDs.
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +...
> diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> deleted file mode 100644
> index dcd5a5d80dc0..000000000000
> --- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -Allwinner NAND Flash Controller (NFC)
> -
> -Required properties:
> -- compatible : "allwinner,sun4i-a10-nand".
> -- reg : shall contain registers location and length for data and reg.
> -- interrupts : shall define the nand controller interrupt.
> -- #address-cells: shall be set to 1. Encode the nand CS.
> -- #size-cells : shall be set to 0.
> -- clocks : shall reference nand controller clocks.
> -- clock-names : nand controller internal clock names. Shall contain :
> -    * "ahb" : AHB gating clock
> -    * "mod" : nand controller clock
> -
> -Optional properties:
> -- dmas : shall reference DMA channel associated to the NAND controller.
> -- dma-names : shall be "rxtx".
> -
> -Optional children nodes:
> -Children nodes represent the available nand chips.
> -
> -Optional properties:
> -- reset : phandle + reset specifier pair
> -- reset-names : must contain "ahb"
> -- allwinner,rb : shall contain the native Ready/Busy ids.
> -- nand-ecc-mode : one of the supported ECC modes ("hw", "soft", "soft_bch" or
> -                 "none")
> -
> -see Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
> -
> -
> -Examples:
> -nfc: nand@1c03000 {
> -       compatible = "allwinner,sun4i-a10-nand";
> -       reg = <0x01c03000 0x1000>;
> -       interrupts = <0 37 1>;
> -       clocks = <&ahb_gates 13>, <&nand_clk>;
> -       clock-names = "ahb", "mod";
> -       #address-cells = <1>;
> -       #size-cells = <0>;
> -       pinctrl-names = "default";
> -       pinctrl-0 = <&nand_pins_a &nand_cs0_pins_a &nand_rb0_pins_a>;
> -
> -       nand@0 {
> -               reg = <0>;
> -               allwinner,rb = <0>;
> -               nand-ecc-mode = "soft_bch";
> -       };
> -};
> --
> git-series 0.9.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
