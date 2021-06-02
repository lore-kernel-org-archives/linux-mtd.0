Return-Path: <SRS0=DONg=K4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB30C4708F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 19:31:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5870613E9
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jun 2021 19:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5870613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+k+yG73CxRk76GBXLRLidUrhZzZGnaL0wPOqaUeRWFs=; b=UVZoMEJ65RA20+
	R5QoJwJb8tAj0iEE+cGrDLt1Jc7DYqKJYuIrKvpIcZ1KOEJ+IIkdJRL8A4BbdBukRLOJeMOf/FdWG
	nPNg3zFJueHA9MLqSyEPt0Xu0CZOZEvY8vDVM0vFQRKSzTveEy6Zkjm+RWBAPyQWdJbbFWjQ8J13X
	bPInHj1a+euzDY2VfYuWH4EDD8D05h6VmUSIiz0rz6wsE7RUzhUQceUp1Oxhhi/2eeJZGT4PPw+Bh
	zUcM4m3SyRCCjvn9Onc/xFMcTm75boL8Jk/tJ4chjgLS7Q8FSNIxwbxBNJ+W+l7dYViR9FJHO50Ir
	lE4BMY7+QFit1ak1gNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loWYv-005xk9-1V; Wed, 02 Jun 2021 19:29:57 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loWYr-005xiW-BV
 for linux-mtd@lists.infradead.org; Wed, 02 Jun 2021 19:29:54 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 i14-20020a9d624e0000b029033683c71999so3484132otk.5
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jun 2021 12:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3plZeCz7fgIf1ejmmfS5ZX5SU0qjotsTUM0Caj+WGY8=;
 b=kABjopriK/p6WyY5PnIcz76vsUYB9hS8tQ/Jl83Ts/tF19GpwfulupvP7/ef8m94Rj
 9K12Li1YUco8bUBUO5Lahwe7sNNzCUFSVzJzbyQPjUfn3glBvAFcUJ9tCs6B4k+U3tGC
 /38VVGUW34hqB/F2JZRL2KYjrbKLEBmpi6F39y72+7QKRdJG9KMnAjT9vxp6sT2XDdym
 kVZ2uWtv93w1PEhCYE69lb1Z/osVCYp/G2SpLDzqJzvGcGsyi7fqg3Jb0LwoHsCx18/l
 TOb8nncXTe3Ev7YSzsVs01KKzKg5YTwVwy4fZvgN9ldDRmvrZ6btR9W0tCaALWCgO6VO
 xbwg==
X-Gm-Message-State: AOAM530ayc4d03TMgFOOKx6Xq1CYmZKHEGe767UHeEnWajPDU1Wy0NmY
 hsVolWAwltIFvNW5iodIbA==
X-Google-Smtp-Source: ABdhPJxUTbNZu6gnxSBJHTtYZfLz+pJpkTmBpXapgtA0YZOo3BEVhehVwU+ikqYteSZdmcQlOWzqsw==
X-Received: by 2002:a9d:2904:: with SMTP id d4mr3715611otb.238.1622662192100; 
 Wed, 02 Jun 2021 12:29:52 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q22sm176297otl.11.2021.06.02.12.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 12:29:51 -0700 (PDT)
Received: (nullmailer pid 3834982 invoked by uid 1000);
 Wed, 02 Jun 2021 19:29:50 -0000
Date: Wed, 2 Jun 2021 14:29:50 -0500
From: Rob Herring <robh@kernel.org>
To: Heiko Schocher <hs@denx.de>
Cc: linux-mtd@lists.infradead.org, Fabio Estevam <festevam@denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mtd: devices: add devicetree documentation for
 microchip 48l640
Message-ID: <20210602192950.GA3827845@robh.at.kernel.org>
References: <20210601043546.1345704-1-hs@denx.de>
 <20210601043546.1345704-2-hs@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601043546.1345704-2-hs@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_122953_423192_92A93F0C 
X-CRM114-Status: GOOD (  17.93  )
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

On Tue, Jun 01, 2021 at 06:35:45AM +0200, Heiko Schocher wrote:
> The Microchip 48l640 is a 8KByte EERAM connected via SPI.
> Add devicetree bindings documentation.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>
> ---
> 
> Changes in v3:
> Add Fabio to cc
> 
> Changes in v2:
> as Rob helped, fix warnings from running command
> 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> 
>  .../bindings/mtd/microchip,mchp48l640.yaml    | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
> new file mode 100644
> index 0000000000000..08089f2db0761
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mtd/microchip,mchp48l640.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MTD SPI driver for Microchip 48l640 (and similar) serial EERAM

This is not the driver.

> +
> +maintainers:
> +  - Heiko Schocher <hs@denx.de>
> +
> +description: |
> +  The Microchip 48l640 is a 8KByte EERAM connected via SPI.
> +
> +  datasheet: http://ww1.microchip.com/downloads/en/DeviceDoc/20006055B.pdf
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: microchip,48l640
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      spi-eeram@0 {

eeram@0

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>


> +        compatible = "microchip,48l640";
> +        reg = <0>;
> +        spi-max-frequency = <20000000>;
> +      };
> +    };
> +...
> -- 
> 2.31.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
