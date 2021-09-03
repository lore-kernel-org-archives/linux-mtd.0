Return-Path: <SRS0=evNl=NZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 282C5C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 20:42:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D60C8603E7
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Sep 2021 20:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D60C8603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smnn4ZCRxpEix8t1GcEUui4ZoThInmP6g659miOu12U=; b=ROFURVmDISoiBz
	B9c91D7Y5H5rFM1pFg+mlIM+eL9/zzqQUE5kjX16pcvT7gfaKk0ftJFXq3g5Qc8y750BtoTLu2IGP
	qV5tPLTHRrCjx9jXk8+vsomTUOfkx/kwMV+uJV59yvSrd1BTBr0yZDz01LCeGXbsJpbOGTBQCH90Z
	4DKikOEX5HWJt4hlTcBCZdzhSGlLv23qyqLUKlgmiP8dAy0mzPsCGRD5hZ3l104vD8nNIHSfb/YUq
	xn6NSn+1cNSkPyQmV+PbLJwHoBgzjuNsyNDAePIF7FR5dBvcImnx4jkfCeSZP+38rOFVw4CfWyudc
	QdAYttp9JuRHVohsFtbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMG0g-00CvBW-T2; Fri, 03 Sep 2021 20:42:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMG0d-00CvAS-Qo
 for linux-mtd@lists.infradead.org; Fri, 03 Sep 2021 20:42:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1604D610D2
 for <linux-mtd@lists.infradead.org>; Fri,  3 Sep 2021 20:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630701719;
 bh=Wi4e+rtFnSCYRrINEjT72owbghKosRCNwVHy//gFT3M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WzcWQWatU/7zeimAvz3euKLVlFQWTE9aRLD6GSCbmWrqzUmUYR4yJFHTyx58wuKdI
 /nbnBozTHN4n/rpuJMoZQerrtqhbvRBrRFkjfQ41gS9OXDi9AorFdZUTB1y1XY5xkg
 tMjV+t1rQOQZpNk9CZnLZUhS/wSSBaQNHvKjRU8xTW+ipyBz53R3rm8S/dt+sJPCVU
 X19SXVwyH1QNtJpzncNvX01uffdkgBcQy+VfLqWOcFbTzeH2NpcokSIOVFHdicsgT8
 qFuapy6lJ55e6ztB3yx3Ix45pKnamMwB87+z7+foUkpTxZs1o4TAiEkLDtHSgMAMD+
 zRUSggmYj8rUw==
Received: by mail-ej1-f42.google.com with SMTP id x11so575877ejv.0
 for <linux-mtd@lists.infradead.org>; Fri, 03 Sep 2021 13:41:59 -0700 (PDT)
X-Gm-Message-State: AOAM530FxlY047Te8IrW0l4aiyMwGWey9lxe+6CDV5vuQxxDZv0CN6ls
 ICF1MbLJ7kREemjf/VY4o1jnQ4+RdiM7X0uQIw==
X-Google-Smtp-Source: ABdhPJwSaEq05yRS1v2A6s7zZ7Exw81AHXpwn5eaCGBtKOYg4OZ6ZdebY3R09eIDMmr5pZOCZ9kUjk4JLMVBergzDR4=
X-Received: by 2002:a17:906:1913:: with SMTP id
 a19mr759790eje.390.1630701717644; 
 Fri, 03 Sep 2021 13:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210902095609.16583-1-rogerq@kernel.org>
 <20210902095609.16583-3-rogerq@kernel.org>
 <YTEsiJiLMRYon5s3@robh.at.kernel.org>
 <715fe0ee-a38c-c2ca-5e29-79fa0887bea0@kernel.org>
In-Reply-To: <715fe0ee-a38c-c2ca-5e29-79fa0887bea0@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 3 Sep 2021 15:41:45 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+HTJhVGrjJ9EdbE0_rpMtpa=nbm7CyObHHEpocy-A3+A@mail.gmail.com>
Message-ID: <CAL_Jsq+HTJhVGrjJ9EdbE0_rpMtpa=nbm7CyObHHEpocy-A3+A@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
To: Roger Quadros <rogerq@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 devicetree@vger.kernel.org, 
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_134159_959386_E3DCFD76 
X-CRM114-Status: GOOD (  35.65  )
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

On Fri, Sep 3, 2021 at 4:35 AM Roger Quadros <rogerq@kernel.org> wrote:
>
> Hi Rob,
>
> On 02/09/2021 22:56, Rob Herring wrote:
> > On Thu, Sep 02, 2021 at 12:56:05PM +0300, Roger Quadros wrote:
> >> Convert omap-gpmc.txt to ti,gpmc.yaml.
> >>
> >> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> >> ---
> >>  .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
> >>  .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
> >>  .../devicetree/bindings/mtd/gpmc-nand.txt     |   2 +-
> >>  .../devicetree/bindings/mtd/gpmc-nor.txt      |   4 +-
> >>  .../devicetree/bindings/mtd/gpmc-onenand.txt  |   2 +-
> >>  .../devicetree/bindings/net/gpmc-eth.txt      |   4 +-
> >>  6 files changed, 370 insertions(+), 163 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
> >>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> >
> >> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> >> new file mode 100644
> >> index 000000000000..b7d43370a95d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> >> @@ -0,0 +1,364 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/memory-controllers/ti,gpmc.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Texas Instruments GPMC Memory Controller device-tree bindings
> >> +
> >> +maintainers:
> >> +  - Tony Lindgren <tony@atomide.com>
> >> +  - Roger Quadros <rogerq@kernel.org>
> >> +
> >> +description:
> >> +  The GPMC is a unified memory controller dedicated for interfacing
> >> +  with external memory devices like
> >> +  - Asynchronous SRAM-like memories and ASICs
> >> +  - Asynchronous, synchronous, and page mode burst NOR flash
> >> +  - NAND flash
> >> +  - Pseudo-SRAM devices
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - enum:
> >> +          - ti,omap2420-gpmc
> >> +          - ti,omap2430-gpmc
> >> +          - ti,omap3430-gpmc
> >> +          - ti,omap4430-gpmc
> >> +          - ti,am3352-gpmc
> >> +
> >> +  reg:
> >> +    items:
> >> +      - description:
> >> +          Configuration registers for the controller.
> >
> > Just 'maxItems: 1' is sufficient.
> >
> >> +
> >> +  interrupts: true
> >
> > Need to define how many.
> >
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +    description: |
> >> +      Functional clock. Used for bus timing calculations and
> >> +      GPMC configuration.
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: fck
> >> +
> >> +  dmas:
> >> +    items:
> >> +      - description: DMA channel for GPMC NAND prefetch
> >> +
> >> +  dma-names:
> >> +    items:
> >> +      - const: rxtx
> >> +
> >> +  "#address-cells":
> >> +    const: 2
> >> +
> >> +  "#size-cells":
> >> +    const: 1
> >> +
> >> +  gpmc,num-cs:
> >> +    description: maximum number of supported chip-select lines.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +
> >> +  gpmc,num-waitpins:
> >> +    description: maximum number of supported wait pins.
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +
> >> +  ranges:
> >> +    minItems: 1
> >> +    description: |
> >> +      Must be set up to reflect the memory layout with four
> >> +      integer values for each chip-select line in use,
> >> +      <cs-number> 0 <physical address of mapping> <size>
> >> +
> >> +    items:
> >> +      - description: NAND bank 0
> >> +      - description: NOR/SRAM bank 0
> >> +      - description: NOR/SRAM bank 1
> >> +
> >> +  '#interrupt-cells':
> >> +    const: 2
> >> +
> >> +  interrupt-controller:
> >> +    description: |
> >> +      The GPMC driver implements and interrupt controller for
> >> +      the NAND events "fifoevent" and "termcount" plus the
> >> +      rising/falling edges on the GPMC_WAIT pins.
> >> +      The interrupt number mapping is as follows
> >> +      0 - NAND_fifoevent
> >> +      1 - NAND_termcount
> >> +      2 - GPMC_WAIT0 pin edge
> >> +      3 - GPMC_WAIT1 pin edge, and so on.
> >> +
> >> +  '#gpio-cells':
> >> +     const: 2
> >> +
> >> +  gpio-controller:
> >> +    description: |
> >> +      The GPMC driver implements a GPIO controller for the
> >> +      GPMC WAIT pins that can be used as general purpose inputs.
> >> +      0 maps to GPMC_WAIT0 pin.
> >> +
> >> +  ti,hwmods:
> >> +    description:
> >> +      Name of the HWMOD associated with GPMC. This is for legacy
> >> +      omap2/3 platforms only.
> >> +    $ref: /schemas/types.yaml#/definitions/string
> >> +    deprecated: true
> >> +
> >> +  ti,no-idle-on-init:
> >> +    description:
> >> +      Prevent idling the module at init. This is for legacy omap2/3
> >> +      platforms only.
> >> +    type: boolean
> >> +    deprecated: true
> >> +
> >> +patternProperties:
> >> +#  "@[0-3],[a-f0-9]+$":>> +  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$":
>
> >
> > Why the commented regex. There's no need for a full regex as we already
> > do that elsewhere. You only need to define the unit-address format.
>
> This should be
>   "@[0-7],[a-f0-9]+$":
>
> I added the full regex during debug but forgot to take it off.
>
> >
> >> +    type: object
> >> +    description: |
> >> +      The child device node represents the device connected to the GPMC
> >> +      bus. The device can be a NAND controller, SRAM device, NOR device
> >> +      or an ASIC.
> >> +
> >> +    properties:
> >> +      compatible:
> >> +        description:
> >> +          Compatible of attached device.
> >
> > Duh. Drop.
> >
> >> +
> >> +      reg:
> >> +        items:
> >> +        - description: Register access space for the device
> >
> > A device with 2 register ranges isn't allowed?
>
> GPMC is actually a memory controller and we are describing the children here.

Yes, I understand what it is.

> Each child has to have a register range.

What you are saying here with the schema is there is only 1 register
range allowed for the child node. You don't know how many a child
device may have. That's a property of the child device. You just need
'reg: true' here.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
