Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF3FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 18:05:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E313C61159
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 18:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E313C61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dznfNmbwHnmGMxBKXUTnG5W9TCo6jFmMO/sFu983+UQ=; b=GfKTbhQDoDZ2Ri
	BSBi4Wv9VkHXsAUMYonu45KT35QWQuZ6Tu8pZrMfJczG6b2pQtIqTMuqOtSuv9xBAZ+uNX490f82/
	8xEuqE60YQ1JebmUWaAg08e/erD/dt04MOUa5hv/F9w7R9iUP6nEqt6Vj1PFYgL79xxZB+fo0SAX4
	6bfkh2rJ+4DLWTp83VSWqKI8FjazfyvzJYgU4ytauRw5+qzg1yclYSSL7fHHS6Q0LOrVhRpG1yll0
	zgXpKL+i0kA2YuRDHFd8B4SVCi82Z68fhF89zp9cbtHX0kRu+pT8hYxu5UEQqEkyRm8VSUSGVW08i
	ZmooJHXcI1O+cfSuCYFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk90w-00H7BG-RK; Mon, 08 Nov 2021 18:05:02 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk90s-00H7A7-Qe
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 18:05:00 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 l7-20020a0568302b0700b0055ae988dcc8so23643377otv.12
 for <linux-mtd@lists.infradead.org>; Mon, 08 Nov 2021 10:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IT0TOfNZrid+OKcl6kTolpGzJd7YUTS6ItseMSTHwM8=;
 b=XWGSMkyRW8NgAQNQSq2Bhee6wqJ1spZGqQ8HOaZmv16a/fFFVB+kvtn+iNOX7K7OAl
 PmU658hdn6s3hLnk8iV2ZOJ7XyILkmNLvZNwHg94LJ1ZXwjiY/TLJiM88m9WHOLdHaZL
 Fm/DVqYZxRn+OUWi0YO9zgeqnPS0hmmIK1pNESMwRzFmB6pf8K9rXYlfmt8E50eSqFPF
 AwDacEsv3fqrytZIodWfwvwJccV7rfbt9SJakgbkmmH3ZWpclkE6V3tOO4DjrpNWIWeP
 MPZj+xGHc/t51/OFBck3zCJD4Sbx50nVdV1ksVozygjUmf9Uxc2wBjpN809kN+w6tl+X
 Yc7A==
X-Gm-Message-State: AOAM530qYDg8+rLjMlp+Tw4TMlWunw/1Q0+vgLe9MMO9o12z1uMDf4Ft
 vislGP4LZL55j9TdHPqTgg==
X-Google-Smtp-Source: ABdhPJztta6Ve9cS47MO7ZL8lvI5qZYy/tl71CB5N4gC8Xn634NSaq/6AGkg8468MAweL7jBaDfVIQ==
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr759237otq.69.1636394697386; 
 Mon, 08 Nov 2021 10:04:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v66sm6303793oib.18.2021.11.08.10.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 10:04:56 -0800 (PST)
Received: (nullmailer pid 3938772 invoked by uid 1000);
 Mon, 08 Nov 2021 18:04:55 -0000
Date: Mon, 8 Nov 2021 12:04:55 -0600
From: Rob Herring <robh@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 1/3] spi: dt-bindings: add schema listing
 slave-specific properties
Message-ID: <YYlmx3QyI9zxuO9N@robh.at.kernel.org>
References: <20211028124518.17370-1-p.yadav@ti.com>
 <20211028124518.17370-2-p.yadav@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211028124518.17370-2-p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_100458_896033_F39E142D 
X-CRM114-Status: GOOD (  39.13  )
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

On Thu, Oct 28, 2021 at 06:15:16PM +0530, Pratyush Yadav wrote:
> Many SPI controllers need to add properties to slave devices. This could

Probably should replace 'slave' with 'peripheral' throughout[1]. 

> be the delay in clock or data lines, etc. These properties are
> controller specific but need to be defined in the slave node because
> they are per-slave and there can be multiple slaves attached to a
> controller.
> 
> If these properties are not added to the slave binding, then the dtbs
> check emits a warning. But these properties do not make much sense in
> the slave binding because they are controller-specific and they will
> just pollute every slave binding. So this binding is added to collect
> all such properties from all such controllers. Slave bindings should
> simply refer to this binding and they should be rid of the warnings.
> 
> There are some limitations with this approach. Firstly, there is no way
> to specify required properties. The schema contains properties for all
> controllers and there is no way to know which controller is being used.
> Secondly, there is no way to restrict additional properties. Since this
> schema will be used with an allOf operator, additionalProperties needs
> to be true. In addition, the slave schema will have to set
> unevaluatedProperties: false.
> 
> Despite these limitations, this appears to be the best solution to this
> problem that doesn't involve modifying existing tools or schema specs.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v2:
> - Move other subnode properties listed in spi-controller.yaml to
>   spi-slave-props.yaml
> - Move the Cadence controller-specific properties out of
>   spi-slave-props.yaml. They will be added in a separate file.
> - Add a reference to spi-slave-props.yaml in spi-controller.yaml.
> - Update description.
> 
>  .../bindings/spi/spi-controller.yaml          | 69 +-------------
>  .../bindings/spi/spi-slave-props.yaml         | 91 +++++++++++++++++++
>  2 files changed, 93 insertions(+), 67 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-slave-props.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> index 8246891602e7..ff770657e214 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -94,73 +94,8 @@ patternProperties:
>    "^.*@[0-9a-f]+$":
>      type: object
>  
> -    properties:
> -      compatible:
> -        description:
> -          Compatible of the SPI device.
> -
> -      reg:
> -        minItems: 1
> -        maxItems: 256
> -        items:
> -          minimum: 0
> -          maximum: 256
> -        description:
> -          Chip select used by the device.
> -
> -      spi-3wire:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description:
> -          The device requires 3-wire mode.
> -
> -      spi-cpha:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description:
> -          The device requires shifted clock phase (CPHA) mode.
> -
> -      spi-cpol:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description:
> -          The device requires inverse clock polarity (CPOL) mode.
> -
> -      spi-cs-high:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description:
> -          The device requires the chip select active high.
> -
> -      spi-lsb-first:
> -        $ref: /schemas/types.yaml#/definitions/flag
> -        description:
> -          The device requires the LSB first mode.
> -
> -      spi-max-frequency:
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        description:
> -          Maximum SPI clocking speed of the device in Hz.
> -
> -      spi-rx-bus-width:
> -        description:
> -          Bus width to the SPI bus used for read transfers.
> -          If 0 is provided, then no RX will be possible on this device.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        enum: [0, 1, 2, 4, 8]
> -        default: 1
> -
> -      spi-rx-delay-us:
> -        description:
> -          Delay, in microseconds, after a read transfer.
> -
> -      spi-tx-bus-width:
> -        description:
> -          Bus width to the SPI bus used for write transfers.
> -          If 0 is provided, then no TX will be possible on this device.
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        enum: [0, 1, 2, 4, 8]
> -        default: 1
> -
> -      spi-tx-delay-us:
> -        description:
> -          Delay, in microseconds, after a write transfer.
> +    allOf:
> +      - $ref: spi-slave-props.yaml
>  
>      required:
>        - compatible
> diff --git a/Documentation/devicetree/bindings/spi/spi-slave-props.yaml b/Documentation/devicetree/bindings/spi/spi-slave-props.yaml
> new file mode 100644
> index 000000000000..5166ec9b0353
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-slave-props.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/spi-slave-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Slave-specific properties for a SPI bus.
> +
> +description: |

Don't need '|' if no formatting to preserve.

> +  Many SPI controllers need to add properties to slave devices. They could be
> +  common properties like spi-max-frequency, spi-cpha, etc. or they could be
> +  controller specific like delay in clock or data lines, etc. These properties
> +  need to be defined in the slave node because they are per-slave and there can
> +  be multiple slaves attached to a controller. All those properties are listed
> +  here. The controller specific properties should go in their own separate
> +  schema that should be referenced from here.
> +
> +maintainers:
> +  - Pratyush Yadav <p.yadav@ti.com>
> +
> +properties:
> +  compatible:
> +    description:
> +      Compatible of the SPI device.

You can drop 'compatible'.

> +
> +  reg:
> +    minItems: 1
> +    maxItems: 256
> +    items:
> +      minimum: 0
> +      maximum: 256
> +    description:
> +      Chip select used by the device.
> +
> +  spi-3wire:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      The device requires 3-wire mode.
> +
> +  spi-cpha:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      The device requires shifted clock phase (CPHA) mode.
> +
> +  spi-cpol:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      The device requires inverse clock polarity (CPOL) mode.
> +
> +  spi-cs-high:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      The device requires the chip select active high.
> +
> +  spi-lsb-first:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      The device requires the LSB first mode.
> +
> +  spi-max-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Maximum SPI clocking speed of the device in Hz.
> +
> +  spi-rx-bus-width:
> +    description:
> +      Bus width to the SPI bus used for read transfers.
> +      If 0 is provided, then no RX will be possible on this device.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 4, 8]
> +    default: 1
> +
> +  spi-rx-delay-us:
> +    description:
> +      Delay, in microseconds, after a read transfer.
> +
> +  spi-tx-bus-width:
> +    description:
> +      Bus width to the SPI bus used for write transfers.
> +      If 0 is provided, then no TX will be possible on this device.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 4, 8]
> +    default: 1
> +
> +  spi-tx-delay-us:
> +    description:
> +      Delay, in microseconds, after a write transfer.
> +
> +# The controller specific properties go here.
> +
> +additionalProperties: true
> -- 
> 2.33.1.835.ge9e5ba39a7
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
