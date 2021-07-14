Return-Path: <SRS0=9oOa=MG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A64C07E9A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jul 2021 12:45:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07D5D613B2
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jul 2021 12:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07D5D613B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1tijV9geUs08tj25TsDfw0YeZrCWhx1Nb6sIbl8gKo=; b=iTG7C5M+R/hmuH
	6mDPwBUaGsy0EgUA8YLswgViQ3zFEI0DKzBuGpU01lkEi23glDcRjB8vQXkFvUTEQMurxQWp8dk2l
	5DhXjYqfmPAjl+un+ebjcZkwiBiZC8OohQ8NiZm9IV2BfI6H5c6+mpN+BRQjGvwM3H4CD9EPHalLw
	kwnmfkG7kTdBqRaGa4FrNg0WEKROBJH8Z2VOVxp7Rvwpd9UHHuWLpEtQZJCjuRR+gln3983rS6sKI
	JuBl9kkopr5MfmTrmW2J5dqZ6N4eBZ3gBiGvgNWklaaIT+T+KoqQ9UfX8q06SzfE2YC6kiFtK2Ie5
	HFojYj5trPDQCrYejmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3eFX-00Dac7-SC; Wed, 14 Jul 2021 12:44:27 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3eFU-00Dab6-1C
 for linux-mtd@lists.infradead.org; Wed, 14 Jul 2021 12:44:26 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 59B93240005;
 Wed, 14 Jul 2021 12:44:17 +0000 (UTC)
Date: Wed, 14 Jul 2021 14:44:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sebastian Siewior <bigeasy@linutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: More dropping redundant minItems/maxItems
Message-ID: <YO7cIQLn3i4+zOK/@piout.net>
References: <20210713193453.690290-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210713193453.690290-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_054424_405444_1994554B 
X-CRM114-Status: GOOD (  24.10  )
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

On 13/07/2021 13:34:53-0600, Rob Herring wrote:
> Another round of removing redundant minItems/maxItems from new schema in
> the recent merge window.
> 
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooling
> will fixup the final schema adding any unspecified minItems/maxItems.
> 
> This condition is partially checked with the meta-schema already, but
> only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> An improved meta-schema is pending.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sebastian Siewior <bigeasy@linutronix.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-clk@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  .../devicetree/bindings/clock/brcm,iproc-clocks.yaml      | 1 -
>  .../devicetree/bindings/iommu/rockchip,iommu.yaml         | 2 --
>  .../bindings/memory-controllers/arm,pl353-smc.yaml        | 1 -
>  Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml  | 8 --------
>  .../devicetree/bindings/rtc/faraday,ftrtc010.yaml         | 1 -
>  Documentation/devicetree/bindings/usb/nxp,isp1760.yaml    | 2 --
>  6 files changed, 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
> index 8dc7b404ee12..1174c9aa9934 100644
> --- a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
> +++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
> @@ -50,7 +50,6 @@ properties:
>  
>    reg:
>      minItems: 1
> -    maxItems: 3
>      items:
>        - description: base register
>        - description: power register
> diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> index d2e28a9e3545..ba9124f721f1 100644
> --- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
> @@ -28,14 +28,12 @@ properties:
>        - description: configuration registers for MMU instance 0
>        - description: configuration registers for MMU instance 1
>      minItems: 1
> -    maxItems: 2
>  
>    interrupts:
>      items:
>        - description: interruption for MMU instance 0
>        - description: interruption for MMU instance 1
>      minItems: 1
> -    maxItems: 2
>  
>    clocks:
>      items:
> diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
> index 7a63c85ef8c5..01c9acf9275d 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
> @@ -57,7 +57,6 @@ properties:
>  
>    ranges:
>      minItems: 1
> -    maxItems: 3
>      description: |
>        Memory bus areas for interacting with the devices. Reflects
>        the memory layout with four integer values following:
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> index e5f1a33332a5..dd5a64969e37 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> @@ -84,7 +84,6 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 3
>      items:
>        - description: NAND CTLRDY interrupt
>        - description: FLASH_DMA_DONE if flash DMA is available
> @@ -92,7 +91,6 @@ properties:
>  
>    interrupt-names:
>      minItems: 1
> -    maxItems: 3
>      items:
>        - const: nand_ctlrdy
>        - const: flash_dma_done
> @@ -148,8 +146,6 @@ allOf:
>      then:
>        properties:
>          reg-names:
> -          minItems: 2
> -          maxItems: 2
>            items:
>              - const: nand
>              - const: nand-int-base
> @@ -161,8 +157,6 @@ allOf:
>      then:
>        properties:
>          reg-names:
> -          minItems: 3
> -          maxItems: 3
>            items:
>              - const: nand
>              - const: nand-int-base
> @@ -175,8 +169,6 @@ allOf:
>      then:
>        properties:
>          reg-names:
> -          minItems: 3
> -          maxItems: 3
>            items:
>              - const: nand
>              - const: iproc-idm
> diff --git a/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml b/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
> index 657c13b62b67..056d42daae06 100644
> --- a/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
> +++ b/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
> @@ -30,7 +30,6 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    minItems: 2
>      items:
>        - description: PCLK clocks
>        - description: EXTCLK clocks. Faraday calls it CLK1HZ and says the clock
> diff --git a/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> index a88f99adfe8e..f238848ad094 100644
> --- a/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> +++ b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> @@ -25,14 +25,12 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 2
>      items:
>        - description: Host controller interrupt
>        - description: Device controller interrupt in isp1761
>  
>    interrupt-names:
>      minItems: 1
> -    maxItems: 2
>      items:
>        - const: host
>        - const: peripheral
> -- 
> 2.27.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
