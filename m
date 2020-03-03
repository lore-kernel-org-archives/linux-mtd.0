Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4E4C3F2D1
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 22:47:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 264022072A
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 22:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pACMBusi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 264022072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fd0Ug+1OJv8NXUlPBvaDbFXC4gA3y+BjDGcskBUNFSE=; b=pACMBusiU4VBVD
	a3wH4vXA8ptpeM++fbe36fWCAkl4JbEwr7ToQIw2YI+E64gQWyenHNg8m90Hspdyiblu701vuBO3M
	iRLmUkVMbr4OGlaCNeFTJToP6O2npCLwB3TTZXtuQXhN4DJ7Jw7NCknCLn5L3lCa33o1dXOOI4cwc
	eMgWFK9sW50ODIXfDO7DxNtNv6u7hOxlLmXOkTollXQOk0tleJ0TYrfn5i8EgYR5e9Wwln78KmsEI
	OfV7k12KY5Kq2iCTuDBRXmEjJZWLASSEOnSekUG6hOEst36jmjtXlqOuYkpTQVK7a2abaBNFmy8iS
	9U5MO8kbUB5LxESYj8Gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9GJm-0008FC-T8; Tue, 03 Mar 2020 22:47:14 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9GJh-0008Dn-Cn; Tue, 03 Mar 2020 22:47:10 +0000
Received: by mail-ot1-f65.google.com with SMTP id i14so95454otp.5;
 Tue, 03 Mar 2020 14:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z0du2wcxyjg7iRH0s/qpIMsj7X0YCwaBDvE2vsxIrbk=;
 b=lagoFGtSBW7BIMufWo914TZz8gdFTZT16BflTmeZmo2Cvo3+YHT8jP1H3+alOk3zqO
 EfaLbQbGV5KKO0TFxkFkS2SgV0bYuY5zmkbZOIKybKNvqfkvAHyZwoQSrpmnifLZ+sNh
 BWVAmoYiJedYKBiw+WpXaZxnfZC9/jcHprkwb2YpiUIX1ORwv4cLnneBI7oxgcKMAYuy
 LqU2a3es6aUE1gcxWvpLDpSSu4YXhWjEW5hjZLUmCQIB+fhXRuuR8zYBC0Gc4M/JYPC/
 NAiMAcHXUmT7SS6+g9ENqaA4MbeTbgYU9S9YCxqsDJs9sI5qlkZtCa/kJugR+Be0ja/D
 97Lg==
X-Gm-Message-State: ANhLgQ2tvuEduWb4HPW1NNwaVTaiQX78p1ZsEPamzMxNGN5XC4EiiW87
 vUjXJ/adXGmbTkNXX48VNw==
X-Google-Smtp-Source: ADFU+vuU+JCOVQpYg1AlYEQdEKGSsg5SLhgtKZoaS1dScWhKEQWMAhE4l5CbjQlxM9gWy34zkZG6zg==
X-Received: by 2002:a9d:4c92:: with SMTP id m18mr129586otf.168.1583275628368; 
 Tue, 03 Mar 2020 14:47:08 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b2sm5879600oii.20.2020.03.03.14.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 14:47:07 -0800 (PST)
Received: (nullmailer pid 32174 invoked by uid 1000);
 Tue, 03 Mar 2020 22:47:06 -0000
Date: Tue, 3 Mar 2020 16:47:06 -0600
From: Rob Herring <robh@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: convert mtk-quadspi binding doc for
 spi-mtk-nor
Message-ID: <20200303224706.GA22867@bogus>
References: <20200228043636.559915-1-gch981213@gmail.com>
 <20200228043636.559915-4-gch981213@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228043636.559915-4-gch981213@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_144709_439257_1FC5268B 
X-CRM114-Status: GOOD (  20.46  )
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 28, 2020 at 12:36:35PM +0800, Chuanhong Guo wrote:
> spi-mtk-nor is a driver to replace mtk-quadspi and they have almost
> the same device-tree bindings. Reuse this binding documentation and
> convert it for new driver:
> 
> 1. "Mediatek SoCs" -> "Mediatek ARM SoCs" because MTK MIPS SoCs
>    use different controllers.
> 2. document "interrupts" as a required property because it's
>    available on all SoCs with this controller and new driver takes
>    advantages of it. It's implemented as optional only to maintain
>    backward compatibility.
> 3. replace binding example with a mt7629 one because this is the
>    only one I know the interrupt assignment.

That doesn't really matter. It would be less churn without that change 
and examples are just examples.

> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
> Change since v1:
>  none
> 
>  .../mtk-quadspi.txt => spi/spi-mtk-nor.txt}   | 34 ++++++++-----------
>  1 file changed, 15 insertions(+), 19 deletions(-)
>  rename Documentation/devicetree/bindings/{mtd/mtk-quadspi.txt => spi/spi-mtk-nor.txt} (62%)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/spi/spi-mtk-nor.txt
> similarity index 62%
> rename from Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> rename to Documentation/devicetree/bindings/spi/spi-mtk-nor.txt
> index a12e3b5c495d..829da480b9a9 100644
> --- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-mtk-nor.txt
> @@ -1,4 +1,4 @@
> -* Serial NOR flash controller for MediaTek SoCs
> +* SPI NOR flash controller for MediaTek ARM SoCs
>  
>  Required properties:
>  - compatible: 	  For mt8173, compatible should be "mediatek,mt8173-nor",
> @@ -13,6 +13,7 @@ Required properties:
>  		  "mediatek,mt7629-nor", "mediatek,mt8173-nor"
>  		  "mediatek,mt8173-nor"
>  - reg: 		  physical base address and length of the controller's register
> +- interrupts:	  Interrupt number used by the controller.
>  - clocks: 	  the phandle of the clocks needed by the nor controller
>  - clock-names: 	  the names of the clocks
>  		  the clocks should be named "spi" and "sf". "spi" is used for spi bus,
> @@ -22,29 +23,24 @@ Required properties:
>  - #address-cells: should be <1>
>  - #size-cells:	  should be <0>
>  
> -The SPI flash must be a child of the nor_flash node and must have a
> -compatible property. Also see jedec,spi-nor.txt.
> -
> -Required properties:
> -- compatible:	  May include a device-specific string consisting of the manufacturer
> -		  and name of the chip. Must also include "jedec,spi-nor" for any
> -		  SPI NOR flash that can be identified by the JEDEC READ ID opcode (0x9F).
> -- reg :		  Chip-Select number
> +There should be only one spi slave device following generic spi bindings.
> +It's not recommended to use this controller for devices other than SPI NOR
> +flash due to limited transfer capability of this controller.
>  
>  Example:
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/mt7629-clk.h>
>  
> -nor_flash: spi@1100d000 {
> -	compatible = "mediatek,mt8173-nor";
> -	reg = <0 0x1100d000 0 0xe0>;
> -	clocks = <&pericfg CLK_PERI_SPI>,
> -		 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> +spi_nor: spi@11014000 {
> +	compatible = "mediatek,mt7629-nor",
> +		     "mediatek,mt8173-nor";
> +	reg = <0x11014000 0xe0>;
> +	interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
> +	clocks = <&pericfg CLK_PERI_FLASH_PD>,
> +		 <&topckgen CLK_TOP_FLASH_SEL>;
>  	clock-names = "spi", "sf";
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> -
> -	flash@0 {
> -		compatible = "jedec,spi-nor";
> -		reg = <0>;
> -	};

Better to leave this in the example IMO.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
