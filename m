Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC45C48BCD
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 02:45:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 784E0613E4
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 02:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 784E0613E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLznkqu17AyLd31dRPPZ/9NTnfZFrKjEyoqcQ1lvH1Y=; b=uKg1w/CW8isGNz
	jbZIeRXPilE9p/QoPhHJGtLN8CAAH73Au9776R4qeAe/NXuNCIgaYOQGtTgBixUVVLT/wT3KXRlcU
	k98EP1zjySmM9fF3Uv+E7tuG2Nx13Qe3x6mtJYCoxwDSwp/fPh602LBMM5C/DTvrVNHrz+MqBNFeu
	/YA3FNQce3ubqt7gun8ZAC9G++FF8cdhYhInbps0yiZYJy3Pmzgl/Vcim8v0F/4jeXIBOay/RGxZj
	Zgl6T9EsqnFB3LXz2z3ZLIPAnHuYsaswAvonGma4x8nkERMGLHMY5eX08KwTN3Ws/UPHy9ldLfXz1
	E5ONmveqjFYQ8bgMQEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrAfl-00GVMt-Iv; Thu, 10 Jun 2021 02:43:57 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrAfh-00GVL7-Jc; Thu, 10 Jun 2021 02:43:55 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so26089862otg.2; 
 Wed, 09 Jun 2021 19:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dImUtuZhYj/XM6SXnOoPdWYPwbVVRclZFlt4djv5m4I=;
 b=fvBuWPM8ffu++zSFeYLkGisqDjcNxr1dgXMKq5FHw1Zz36WIhKskqlKrEWFy97mGCX
 2VHoc2HdwsdVScjl/GORkG1tU4LspQpxGunKz1YrA4dNUQsyWCcqA5Kh9kCqfjhLWqIk
 Bp7Y6JENp/mho9RSv9VdxrkbbDUmYVhdzYMwDRWQhnTrzsEZbmZZ1N1qD9r3DVJZS9SK
 OMWHdV/mxY/aVxSMT134HMpbYSyqckiOAzC/CTOQaTxJY9d7iU9/sErmBiu9VIHt8HyY
 JoMOIxAttsZ75WDyPlAPz770bkkRlVc5yXdMrYWFCQbdrznw2JvY7m7IpX2cRORVQS7V
 6cdw==
X-Gm-Message-State: AOAM533rdRS1VRWiERQtfpzKmWBb4mm6/HdsllBNQilYg1oi4StxxdWv
 3ah9aeFCHAGi33zo/JWPCw==
X-Google-Smtp-Source: ABdhPJyBbya+zcm+FNUz27ZCbnnVovIW8rnlJgE1oiJjPoTI61rtVEt6hV/gGWqmvF9ZFn0ASOJC/w==
X-Received: by 2002:a9d:554f:: with SMTP id h15mr534270oti.237.1623293032608; 
 Wed, 09 Jun 2021 19:43:52 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q6sm316972oot.40.2021.06.09.19.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 19:43:51 -0700 (PDT)
Received: (nullmailer pid 706007 invoked by uid 1000);
 Thu, 10 Jun 2021 02:43:50 -0000
Date: Wed, 9 Jun 2021 21:43:50 -0500
From: Rob Herring <robh@kernel.org>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: linux-spi@vger.kernel.org, broonie@kernel.org, heiko@sntech.de,
 jbx6244@gmail.com, hjc@rock-chips.com, yifeng.zhao@rock-chips.com,
 sugar.zhang@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, macroalpha82@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 linux-clk@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v7 1/9] dt-bindings: rockchip-sfc: Bindings for Rockchip
 serial flash controller
Message-ID: <20210610024350.GA697147@robh.at.kernel.org>
References: <20210609140412.16058-1-jon.lin@rock-chips.com>
 <20210609140412.16058-2-jon.lin@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609140412.16058-2-jon.lin@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_194353_710737_7BFB97CA 
X-CRM114-Status: GOOD (  43.38  )
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

On Wed, Jun 09, 2021 at 10:04:04PM +0800, Jon Lin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add bindings for the Rockchip serial flash controller. New device
> specific parameter of rockchip,sfc-no-dma included in documentation.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> ---
> 
> Changes in v7:
> - Fix up the sclk_sfc parent error in rk3036
> - Unify to "rockchip,sfc" compatible id because all the feature update
>   will have a new IP version, so the driver is used for the SFC IP in
>   all SoCs
> - Change to use node "sfc" to name the SFC pinctrl group
> - Add subnode reg property check
> - Add rockchip_sfc_adjust_op_size to workaround in CMD + DUMMY case
> - Limit max_iosize to 32KB
> 
> Changes in v6:
> - Add support in device trees for rv1126(Declared in series 5 but not
>   submitted)
> - Change to use "clk_sfc" "hclk_sfc" as clock lable, since it does not
>   affect interpretation and has been widely used
> - Support sfc tx_dual, tx_quad(Declared in series 5 but not submitted)
> - Simplify the code, such as remove "rockchip_sfc_register_all"(Declared
>   in series 5 but not submitted)
> - Support SFC ver4 ver5(Declared in series 5 but not submitted)
> - Add author Chris Morgan and Jon Lin to spi-rockchip-sfc.c
> - Change to use devm_spi_alloc_master and spi_unregister_master
> 
> Changes in v5:
> - Add support in device trees for rv1126
> - Support sfc tx_dual, tx_quad
> - Simplify the code, such as remove "rockchip_sfc_register_all"
> - Support SFC ver4 ver5
> 
> Changes in v4:
> - Changing patch back to an "RFC". An engineer from Rockchip
>   reached out to me to let me know they are working on this patch for
>   upstream, I am submitting this v4 for the community to see however
>   I expect Jon Lin (jon.lin@rock-chips.com) will submit new patches
>   soon and these are the ones we should pursue for mainlining. Jon's
>   patch series should include support for more hardware than this
>   series.
> - Clean up documentation more and ensure it is correct per
>   make dt_binding_check.
> - Add support in device trees for rk3036, rk3308, and rv1108.
> - Add ahb clock (hclk_sfc) support for rk3036.
> - Change rockchip_sfc_wait_fifo_ready() to use a switch statement.
> - Change IRQ code to only mark IRQ as handled if it handles the
>   specific IRQ (DMA transfer finish) it is supposed to handle.
> 
> Changes in v3:
> - Changed the name of the clocks to sfc/ahb (from clk-sfc/clk-hsfc).
> - Changed the compatible string from rockchip,sfc to
>   rockchip,rk3036-sfc. A quick glance at the datasheets suggests this
>   driver should work for the PX30, RK180x, RK3036, RK312x, RK3308 and
>   RV1108 SoCs, and possibly more. However, I am currently only able
>   to test this on a PX30 (an RK3326). The technical reference manuals
>   appear to list the same registers for each device.
> - Corrected devicetree documentation for formatting and to note these
>   changes.
> - Replaced the maintainer with Heiko Stuebner and myself, as we will
>   take ownership of this going forward.
> - Noted that the device (per the reference manual) supports 4 CS, but
>   I am only able to test a single CS (CS 0).
> - Reordered patches to comply with upstream rules.
> 
> Changes in v2:
> - Reimplemented driver using spi-mem subsystem.
> - Removed power management code as I couldn't get it working properly.
> - Added device tree bindings for Odroid Go Advance.
> 
> Changes in v1:
> hanges made in this new series versus the v8 of the old series:
> - Added function to read spi-rx-bus-width from device tree, in the
>   event that the SPI chip supports 4x mode but only has 2 pins
>   wired (such as the Odroid Go Advance).
> - Changed device tree documentation from txt to yaml format.
> - Made "reset" message a dev_dbg from a dev_info.
> - Changed read and write fifo functions to remove redundant checks.
> - Changed the write and read from relaxed to non-relaxed when
>   starting the DMA transfer or reading the DMA IRQ.
> - Changed from dma_coerce_mask_and_coherent to just
>   dma_set_mask_and_coherent.
> - Changed name of get_if_type to rockchip_sfc_get_if_type.
> 
>  .../devicetree/bindings/spi/rockchip-sfc.yaml | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml b/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> new file mode 100644
> index 000000000000..42e4198e92af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/rockchip-sfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Serial Flash Controller (SFC)
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +  - Chris Morgan <macromorgan@hotmail.com>
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: rockchip,sfc

Use 'enum' instead of oneOf+const.

You need an SoC specific compatible.

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
> +      - const: clk_sfc
> +      - const: hclk_sfc

Do you have these backwards? 'hclk' is usually an AHB bus clock.

Also, '_sfc' is redundant.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  rockchip,sfc-no-dma:
> +    description: Disable DMA and utilize FIFO mode only
> +    type: boolean
> +
> +patternProperties:
> +    "^flash@[0-3]$":
> +      type: object
> +      properties:
> +        reg:
> +          minimum: 0
> +          maximum: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/px30-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/px30-power.h>
> +
> +    sfc: spi@ff3a0000 {
> +        compatible = "rockchip,sfc";
> +        reg = <0xff3a0000 0x4000>;
> +        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
> +        clock-names = "clk_sfc", "hclk_sfc";
> +        pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
> +        pinctrl-names = "default";
> +        power-domains = <&power PX30_PD_MMC_NAND>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash@0 {
> +            compatible = "jedec,spi-nor";
> +            reg = <0>;
> +            spi-max-frequency = <108000000>;
> +            spi-rx-bus-width = <2>;
> +            spi-tx-bus-width = <2>;
> +        };
> +    };
> +
> +...
> -- 
> 2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
