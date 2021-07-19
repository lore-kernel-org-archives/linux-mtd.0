Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678E9C07E95
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 15:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B486121E
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 15:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B486121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JGSC+JOznd96No7YxDDpmhCuZBeJfqCPX2V68qesf0=; b=RomIUgQmFI2BYF
	CN5KsRjrwIaLH4oU1oligPO7rWwegAuUuBsyok45j9vRM0Da3M4hkz4bsGhhoX4+/yqshWkTgonKi
	STZjzesgWPiiuy6oNd3Y9pnPVDcJPlHBj3syDxP2ZXsAnLKAiszcEBKbuwbwp4jAX3fQrH+EAwjkF
	JCleLGY2pB46Sc7jVeNZKuGlUX9kS4DIOlKNhi4BdO0hzuuOGT43BMJlyMpb4lxlnZ9SQuOiv30Xj
	1nBJzNbI3mLXE9RmkcVW5aiyWLggCSR8bZl+rxqHu+SldoN5QZW+gnHg7kEe7gW+Xc6+RN81Lc/gA
	2FUo6YW2CtyHUH7LyrXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5V82-00A4u2-9I; Mon, 19 Jul 2021 15:24:22 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5V7x-00A4rZ-H7
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 15:24:21 +0000
Received: by mail-il1-f177.google.com with SMTP id a7so16313809iln.6
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jul 2021 08:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vzERivZqSSJFIGeAmgTC/Nw6CzI7ObBqzkfLEHhPO/w=;
 b=GcJubEbK5ltG/m7NwIxlYzR72abLXdXyl70YpoICPV7x0yy9cNHIPmIg2CUjeqUQRj
 siRgTstjafPRo/Cr19D0Ix1alZEjleLbzP9+cDNR/yysdUdhu/79iqXLeWS0Dr0kUqyi
 Yt0+lczITECtbTMuusVz5ePCNvnI4SsCJzb5zy3gpdcAmT9H35LRqLO8IoNdDgm73a+q
 1RZnVIVuCki7Oih6RZ00kDHAYvZKeszGIDiXWRMkiA/ZFBPnRmzb5VK+SOV9JLS0Bdu1
 dtUC3OR4brgxJdRDnO5Ln/SX3XKELyX20nWlRyzg9XTNXFZLcCmUtF0M85G4Xy2WbECE
 RPew==
X-Gm-Message-State: AOAM5323TI537EwJd4uc0CC+DkQWShPvwRjLjA/4XRryo41XW7apmBGt
 8HT1h26IUzximRvL2PdUkA==
X-Google-Smtp-Source: ABdhPJyri+TXCyr4MCEpKVVzSSJx361AXYHcpD9imtD5zPDRk+xQaRGiGAFQK3C6ytmqRK551Sb+Kg==
X-Received: by 2002:a92:d251:: with SMTP id v17mr16834647ilg.283.1626708256258; 
 Mon, 19 Jul 2021 08:24:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id u10sm5867563iop.15.2021.07.19.08.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 08:24:15 -0700 (PDT)
Received: (nullmailer pid 1961107 invoked by uid 1000);
 Mon, 19 Jul 2021 15:24:13 -0000
Date: Mon, 19 Jul 2021 09:24:13 -0600
From: Rob Herring <robh@kernel.org>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nand: Convert to DT schema format
Message-ID: <20210719152413.GA1953551@robh.at.kernel.org>
References: <20210718004125.733-1-a-nandan@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210718004125.733-1-a-nandan@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_082417_634151_7B04C14C 
X-CRM114-Status: GOOD (  21.83  )
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

On Sun, Jul 18, 2021 at 12:41:25AM +0000, Apurva Nandan wrote:
> Convert spi-nand.txt binding to YAML format with an added example.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
>  .../devicetree/bindings/mtd/spi-nand.yaml     | 74 +++++++++++++++++++
>  2 files changed, 74 insertions(+), 5 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt b/Documentation/devicetree/bindings/mtd/spi-nand.txt
> deleted file mode 100644
> index 8b51f3b6d55c..000000000000
> --- a/Documentation/devicetree/bindings/mtd/spi-nand.txt
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -SPI NAND flash
> -
> -Required properties:
> -- compatible: should be "spi-nand"
> -- reg: should encode the chip-select line used to access the NAND chip
> diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.yaml b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> new file mode 100644
> index 000000000000..366b86e1b19c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SPI NAND flash
> +
> +maintainers:
> +  - Apurva Nandan <a-nandan@ti.com>
> +
> +allOf:
> +  - $ref: "mtd.yaml#"
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: spi-nand

Drop 'oneOf' as there is only one.

> +
> +  reg:
> +    items:
> +      description:
> +        should encode the chip-select line used to access the NAND chip

Just:

reg:
  maxItems: 1

> +
> +  spi-max-frequency: true
> +  spi-rx-bus-width: true
> +  spi-tx-bus-width: true
> +
> +  partitions:
> +    type: object
> +
> +  '#address-cells': true
> +  '#size-cells': true
> +
> +patternProperties:
> +  # Note: use 'partitions' node for new users
> +  '^partition@':
> +    type: object
> +
> +  "^otp(-[0-9]+)?$":
> +    type: object
> +
> +additionalProperties: false

Just do:

additionalProperties:
  type: object

and then drop partitions, partition@, and ^otp(-[0-9]+)?$.

> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash@6 {
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            compatible = "spi-nand";
> +            reg = <0x6>;
> +            spi-max-frequency = <42000000>;
> +
> +            partitions {
> +                compatible = "fixed-partitions";
> +                #address-cells = <1>;
> +                #size-cells = <1>;
> +
> +                partition@0 {
> +                    label = "boot";
> +                    reg = <0 0x200000>;
> +                };
> +
> +                partition@200000 {
> +                    label = "rootfs";
> +                    reg = <0x200000 0xce0000>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.17.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
