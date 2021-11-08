Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10620C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 18:06:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D44DB61159
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 18:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D44DB61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLO0a5NfQNSXqPsnpH1HdM4vzg+fiUHlOvamSQ7O81k=; b=1ayiQB7mpjb/Zq
	ZxcFRBCzBal1oz/MMlVOG6AWajdVWfp1V01bjM1PnNbo3LcK4uacx0rxysibeCnRmHf/Iav6kCqw2
	OF9SQ8WsS7k/z5Jz+NkZtXBab22Z10FWXKIVvUlhFgU5/UT3tt7T/6yyb5mErAOjDvznEueAQCsLU
	dCdvCwdwQ1rEEn0d6jW5FGju1X/s2AtdiNucVfQIaHyxL42NoaPk2L3FWRbM74HTMxcz1yhkeORuy
	b7g1mpsAe4PYVvWE3XYefWAO2JwoXhbtlKACrs0gCZ50DcwkkdwwNdQHDS3RT2PwlxuTSSxIiQkon
	+Rz/j5FgNumBfKlHv6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk92J-00H7KL-0J; Mon, 08 Nov 2021 18:06:27 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk92C-00H7Ik-KH
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 18:06:22 +0000
Received: by mail-oi1-f176.google.com with SMTP id r26so7645604oiw.5
 for <linux-mtd@lists.infradead.org>; Mon, 08 Nov 2021 10:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9lnLXG/bXbyXQGlWv3MhH5r9wnv2o0rdiMQr4B9gclY=;
 b=mzolN1liQ9vYo4opcRDPsyZIZfPVcTxTbPFS1Ob76rLnOQh+B7bMOeA7hb5B9BX8ml
 5RGZMyrXP7WDsf2SGdoIhsOjRLVxa7b47Xk2J3IsXqGu/MUWLbfwfAlLnIBvoLUgFKyi
 3jpNAeIRU2bnttoCoRcoW/e0YWGX8H1h172MUDvKBWYqPSGRcvV1VwfP4bq/ktMaDF6/
 PO/dUSd5WAHoRpnubEuslmY+nSXJfEuf9JvWWP7Lszoudv3zfrvZSFf8oS+wvD363tDQ
 tDqg4ntwSp8+GBpsvm3DE4P33q52gY2WOlQZyGD3gfZWnmnnso9xlD0BneEmAvxEOPey
 pVvg==
X-Gm-Message-State: AOAM530qBmA+deN8UYtrnRN3agqB8+hnnmt3Gw4HSQFVxmQiQjvGMJw7
 a1uG1qQ5a0LN0COMOlZ+6g==
X-Google-Smtp-Source: ABdhPJzGI4wzpRGugqgY8wFxgZUkbFlkvY8GaiFS4N4OxbYx7GtY1iRnLPxthCXtA/6sNluFcaXltA==
X-Received: by 2002:a54:4486:: with SMTP id v6mr186399oiv.90.1636394778826;
 Mon, 08 Nov 2021 10:06:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g15sm6378935oiy.8.2021.11.08.10.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 10:06:18 -0800 (PST)
Received: (nullmailer pid 3947047 invoked by uid 1000);
 Mon, 08 Nov 2021 18:06:17 -0000
Date: Mon, 8 Nov 2021 12:06:17 -0600
From: Rob Herring <robh@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 2/3] spi: dt-bindings: cdns,qspi-nor: Move
 slave-specific properties out
Message-ID: <YYlnGfTw42nmg3sl@robh.at.kernel.org>
References: <20211028124518.17370-1-p.yadav@ti.com>
 <20211028124518.17370-3-p.yadav@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211028124518.17370-3-p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_100620_704701_6D95F98D 
X-CRM114-Status: GOOD (  23.46  )
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

On Thu, Oct 28, 2021 at 06:15:17PM +0530, Pratyush Yadav wrote:
> The spi-slave-props.yaml schema contains slave-specific properties
> for SPI controllers that should be present in the slave node. Move
> slave-specific properties to a separate file and refer to it in
> spi-slave-props.yaml.

Other than s/slave/peripheral/, LGTM.

> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v2:
> - New in v2.
> 
>  .../spi/cdns,qspi-nor-slave-props.yaml        | 42 +++++++++++++++++++
>  .../bindings/spi/cdns,qspi-nor.yaml           | 33 ---------------
>  .../bindings/spi/spi-slave-props.yaml         |  2 +
>  3 files changed, 44 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor-slave-props.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor-slave-props.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-slave-props.yaml
> new file mode 100644
> index 000000000000..263382a5729a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-slave-props.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/cdns,qspi-nor-slave-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Slave-specific properties for the Cadence QSPI controller.
> +
> +description:
> +  See spi-slave-props.yaml for more info.
> +
> +maintainers:
> +  - Pratyush Yadav <p.yadav@ti.com>
> +
> +properties:
> +  # cdns,qspi-nor.yaml
> +  cdns,read-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Delay for read capture logic, in clock cycles.
> +
> +  cdns,tshsl-ns:
> +    description:
> +      Delay in nanoseconds for the length that the master mode chip select
> +      outputs are de-asserted between transactions.
> +
> +  cdns,tsd2d-ns:
> +    description:
> +      Delay in nanoseconds between one chip select being de-activated
> +      and the activation of another.
> +
> +  cdns,tchsh-ns:
> +    description:
> +      Delay in nanoseconds between last bit of current transaction and
> +      deasserting the device chip select (qspi_n_ss_out).
> +
> +  cdns,tslch-ns:
> +    description:
> +      Delay in nanoseconds between setting qspi_n_ss_out low and
> +      first bit transfer.
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> index ca155abbda7a..a439e3ed753f 100644
> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> @@ -86,39 +86,6 @@ properties:
>      items:
>        enum: [ qspi, qspi-ocp ]
>  
> -# subnode's properties
> -patternProperties:
> -  "@[0-9a-f]+$":
> -    type: object
> -    description:
> -      Flash device uses the below defined properties in the subnode.
> -
> -    properties:
> -      cdns,read-delay:
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        description:
> -          Delay for read capture logic, in clock cycles.
> -
> -      cdns,tshsl-ns:
> -        description:
> -          Delay in nanoseconds for the length that the master mode chip select
> -          outputs are de-asserted between transactions.
> -
> -      cdns,tsd2d-ns:
> -        description:
> -          Delay in nanoseconds between one chip select being de-activated
> -          and the activation of another.
> -
> -      cdns,tchsh-ns:
> -        description:
> -          Delay in nanoseconds between last bit of current transaction and
> -          deasserting the device chip select (qspi_n_ss_out).
> -
> -      cdns,tslch-ns:
> -        description:
> -          Delay in nanoseconds between setting qspi_n_ss_out low and
> -          first bit transfer.
> -
>  required:
>    - compatible
>    - reg
> diff --git a/Documentation/devicetree/bindings/spi/spi-slave-props.yaml b/Documentation/devicetree/bindings/spi/spi-slave-props.yaml
> index 5166ec9b0353..4cc12a161da9 100644
> --- a/Documentation/devicetree/bindings/spi/spi-slave-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-slave-props.yaml
> @@ -87,5 +87,7 @@ properties:
>        Delay, in microseconds, after a write transfer.
>  
>  # The controller specific properties go here.
> +allOf:
> +  - $ref: cdns,qspi-nor-slave-props.yaml#
>  
>  additionalProperties: true
> -- 
> 2.33.1.835.ge9e5ba39a7
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
