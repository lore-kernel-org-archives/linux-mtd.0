Return-Path: <SRS0=i2dy=LC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98C1C47082
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jun 2021 18:13:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2AFD61376
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jun 2021 18:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2AFD61376
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rEsYOHl0Yuomofwwwy5NJiGs7c1B6FMvLCncmi5h7BY=; b=fFknu//XXDzotZiSvaul0a/Psz
	AEwz+zdM5QzoF1/R8XpGeI/mSLC6Hw3bG4hUXl4hLgEaD36Snzm04WeqsLYigiW95Raev04XWrI1G
	HlQfXHpJ58ih4ztEtPgyR3jkHrvXmjsYvtCoffBEIr5JPoG146gYJNhYBnUNFUQVmvg8bxEfBRwJn
	Lz4EZBfMqz0YK5cgeiWtXHg2IwnuSjTKUahndRgrYwBSy2zoW4VLpagR+RqdfY78BehTDEkY6lJQT
	JRThem3Aig9Yf37WLeiiaR8ycT4QOGQpUd9uTrmlIV4ab7AI+uPmm3z0aSprjNY5VSJ/p9PPuzU83
	jUXkfU/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqgD3-009ulP-Ki; Tue, 08 Jun 2021 18:12:18 +0000
Received: from mail-ed1-f48.google.com ([209.85.208.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqg5I-009r0j-LJ; Tue, 08 Jun 2021 18:04:20 +0000
Received: by mail-ed1-f48.google.com with SMTP id w21so25500265edv.3;
 Tue, 08 Jun 2021 11:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QjnNslgNx3mbBBpZ7tPLJdkYzY7yWlZsdnOb9sU0rZk=;
 b=Z5BA5dVvOeOBDzMXCAxWXEc+NWYSgTtm4S1bf/juqcY9bkINKp7crZTkVYAsYZPJSJ
 srL1wWOA17cJJZr9GiKMfm0MtUEQt+6tgyGV0iQyK4aV5FQdNeBz07b9nZxvc9JqyZsK
 iIPtTlu5ufx4lWuNEwrSPY536Gh6SM8AzB0UAYCLYT/AyxWOdlpX11lykBFiBqy7Kv1b
 yiwiHWeTjJvvnEPD+pH4GeNV+Yj7r4DWgZfg7y2YCRL1L+R+3CCNnFq9KQLr935YA+AZ
 gxnqxO6crmoH4kUWKpMID4kFEj5f7NrFY/XIsTJkRwyDgNxLfs1VyJEzH+mMj49hwfzt
 s67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QjnNslgNx3mbBBpZ7tPLJdkYzY7yWlZsdnOb9sU0rZk=;
 b=npU+HSBsIBKRyJ85ol6FGFL3Q+6Ed2IPPjQVV6X07TJgpPMpRGKh0IpLSOFYK7FIny
 hYY15/ZPd9uZmZCbJd837Q9vEMdNFj8H8MD21jHPOFo2FLTfGFNDESkaEQaYOYkKouFE
 HJLKNshM78NK53ku6tZnz0SLEYRWLFYxcGdmlfWwtaNmvzvYbtD0qcFrPjV5/Dk7blF7
 l+nBPLY6PcXrpwYtmFcaaBtM4CM07FPGA4WsOYjred/9noEuzMWLFj3OZ/bDBzRm1vxw
 MYX0dgbWP+4X6dFWodiDVnyvmu3nGYdPQUgqi8obZWhMoUtoJYSinnLpPFPWYwA1mzv4
 5HIw==
X-Gm-Message-State: AOAM530xCAf08PGsTFy+RzhY9tN+KfeZtrMxrae5pAPAY/MBxW1FBwvD
 r0YR36Qh8uUH5Nz+G2dXNj0=
X-Google-Smtp-Source: ABdhPJzYS0vW8d9eF0iSw0twCu/n8KyWISJ7R8sj+w9Qo/JQkcUu7YPHZQcDcV2QPQwlCBS+Hx5KFw==
X-Received: by 2002:a50:eb08:: with SMTP id y8mr27289378edp.89.1623175392538; 
 Tue, 08 Jun 2021 11:03:12 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 d24sm170690edr.95.2021.06.08.11.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 11:03:12 -0700 (PDT)
Subject: Re: [PATCH v6 1/8] dt-bindings: rockchip-sfc: Bindings for Rockchip
 serial flash controller
To: Jon Lin <jon.lin@rock-chips.com>, linux-spi@vger.kernel.org
Cc: broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 hjc@rock-chips.com, yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20210608022644.21074-1-jon.lin@rock-chips.com>
 <20210608022644.21074-2-jon.lin@rock-chips.com>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <eb576a12-d084-6cf3-35d0-e50354b7b272@gmail.com>
Date: Tue, 8 Jun 2021 20:03:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210608022644.21074-2-jon.lin@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_110416_807232_5A639E44 
X-CRM114-Status: GOOD (  46.95  )
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

Hi Jon,

A look at the build log shows this error:

https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210608022644.21074-2-jon.lin@rock-chips.com/

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/rockchip-sfc.example.dt.yaml:
spi@ff3a0000: clock-names:0: 'hclk_sfc' was expected
	From schema:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/rockchip-sfc.example.dt.yaml:
spi@ff3a0000: clock-names:1: 'clk_sfc' was expected
	From schema:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml

Check document with:

make ARCH=arm dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/rockchip-sfc.yaml

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/rockchip-sfc.yaml

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/rockchip-sfc.yaml

Remove any errors before submitting.

===

Johan

On 6/8/21 4:26 AM, Jon Lin wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add bindings for the Rockchip serial flash controller. New device
> specific parameter of rockchip,sfc-no-dma included in documentation.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> ---
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
>  .../devicetree/bindings/spi/rockchip-sfc.yaml | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml b/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> new file mode 100644
> index 000000000000..160449713f97
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> @@ -0,0 +1,87 @@
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

In the driver spi-rockchip-sfc.c is used:
Chris Morgan <macroalpha82@gmail.com>
Maybe use a consistent email address?
Also Hotmail does strange things to message-ID's and links/content
inside patches.

> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:

> +      - const: rockchip,rk3036-sfc
> +      - items:
> +          - enum:
> +              - rockchip,px30-sfc
> +              - rockchip,rk3308-sfc
> +              - rockchip,rv1108-sfc
> +          - const: rockchip,rk3036-sfc
> +      - const: rockchip,rv1126-sfc

A look at the driver shows this:

+static const struct of_device_id rockchip_sfc_dt_ids[] = {

+	{ .compatible = "rockchip,px30-sfc"},

remove

+	{ .compatible = "rockchip,rk3036-sfc"},

+	{ .compatible = "rockchip,rk3308-sfc"},
+	{ .compatible = "rockchip,rv1126-sfc"},

remove

+	{ /* sentinel */ }
+};

When no '.data = &my_sfc_data' exist then there's no need for additional
compatible strings in the driver.
===
example for I2S:
	{ .compatible = "rockchip,rk3399-i2s", .data = &rk3399_i2s_pins },
===
Compatibility strings are supposed to be SoC orientated.
With rockchip_sfc_get_version() all we need is one fall back string for
now I think. Is rk3568 identical. Please advise.


      - const: rockchip,rk3036-sfc
      - items:
          - enum:
              - rockchip,px30-sfc
              - rockchip,rk3308-sfc
              - rockchip,rk3368-sfc
              - rockchip,rk3568-sfc
              - rockchip,rv1108-sfc
              - rockchip,rv1126-sfc
          - const: rockchip,rk3036-sfc

===

The rk3368 TRM also describes a SFC controller.
For the mainline DT completeness is it possible to add a rk3368 SFC node
as well? ;)

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
> +      - const: hclk_sfc
> +      - const: clk_sfc
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  rockchip,sfc-no-dma:
> +    description: Disable DMA and utilize FIFO mode only
> +    type: boolean
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
> +        compatible = "rockchip,px30-sfc","rockchip,rk3036-sfc";
> +        reg = <0xff3a0000 0x4000>;
> +        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;

> +        clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
> +        clock-names = "clk_sfc", "hclk_sfc";

The clocks in the examples and dtsi files must have the same sort order.

> +        pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus2>;
> +        pinctrl-names = "default";
> +        power-domains = <&power PX30_PD_MMC_NAND>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +

> +        flash@0 {

From spi-controller.yaml:

patternProperties:
  "^.*@[0-9a-f]+$":
    type: object

    properties:
      compatible:
        description:
          Compatible of the SPI device.

      reg:
        minimum: 0

        maximum: 256

        description:
          Chip select used by the device.

This allows 257 sub nodes.
Support up to 4 chip select in the driver.
#define SFC_MAX_CHIPSELECT_NUM		4


> +            compatible = "jedec,spi-nor";
> +            reg = <0>;
> +            spi-max-frequency = <108000000>;
> +            spi-rx-bus-width = <2>;
> +            spi-tx-bus-width = <2>;
> +        };
> +    };
> +
> +...
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
