Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CCDC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4BEB60FF2
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 21:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B4BEB60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AO/G4Uw7C31mSO2Tj4PO6YyZWhyW5Emqw4REujqTQw=; b=QpvilWmzvQ3zBd
	5Bu594kdMaLuQzNUllFghJbD3+A0IB9iDS1TW5vRRKxgIokNvzyuh5HIq/ESYE87u3Yy3f8DpdGJD
	V/5KGCYG0K0to/ZYmrcjkYOYIGYhwYnx195cKvTZZVao46PZkscedGJPaCthH4vtEN1Qlr7FKrxfR
	zSlC9OxfZjsCTdVr8OEJHoLEBCGUwXz06Ww8B1cadsVBW+5Pfm6ibFr+Ad/VQinjyVS5Rq2A8iNz+
	G/kK/k56BWNyx9OSIrgeah/q4unR519ZIwgKyuA+IEhxBRSFwviBXCaF5FhIPJMFBPdH8whforP1x
	mz4+gdseF3Ef/Gw2feNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgD6n-009AXP-Nn; Thu, 28 Oct 2021 21:38:49 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgD6k-009AWA-Lf
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 21:38:48 +0000
Received: by mail-oi1-f169.google.com with SMTP id o4so10273559oia.10
 for <linux-mtd@lists.infradead.org>; Thu, 28 Oct 2021 14:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6OiNYLAxsFXPFjL0FqyFvTnwfqy6iGdQjj9Dv8HGhtw=;
 b=nAWJQ+x9uSr7CtG7gRDx7LQ0rrT9uZYLgs4SYAIA8SyQoLhm8Q8l7vXk51azo0CNdt
 dTx08jjaFcBasM+thHQZPkAf56VuTxuymSMg6qH7ccgPguCAE1kXTaLJanqev9yEwqbO
 eZWl/FuqHNVRrbatUk3cODoNHhjIqvaZ9iHebkQxxlJI+m1yTKLN4Za0JcuCvL7ISVe4
 BhnUTef6r2BIEzfoFV3wo5XygDc9xrC4bPSaQNET3rH2Z08XIncYNdwFDwOFHyu+S7Pm
 b9hWjQZk9+rdKgwVhBOLap2+LQojtZkPkQnWxIhGfoKvaupxLDWFfeK6leNwwJMj9Mbn
 Halw==
X-Gm-Message-State: AOAM533akjAJ8AENwwzOrUke33H1c9qACZEh/5QtEFNiPByffSCBitC+
 eaWLqG7t3LW0kc8ltzRnzA==
X-Google-Smtp-Source: ABdhPJxutP3x4GwMxsrgkPLF2C0wZhHfpPHmdB7Z+SB06+/wmcoJve0rxdzTGctUMhJZaHnPWesQ7A==
X-Received: by 2002:a05:6808:1898:: with SMTP id
 bi24mr5172217oib.3.1635457124640; 
 Thu, 28 Oct 2021 14:38:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q15sm1381169otm.15.2021.10.28.14.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:38:44 -0700 (PDT)
Received: (nullmailer pid 632711 invoked by uid 1000);
 Thu, 28 Oct 2021 21:38:43 -0000
Date: Thu, 28 Oct 2021 16:38:43 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>
Subject: Re: [PATCH 09/18] dt-bindings: spi: mxic: Document the
 nand-ecc-engine property
Message-ID: <YXsYY6JaglRjan+L@robh.at.kernel.org>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
 <20211020142809.349347-10-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020142809.349347-10-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_143846_755189_43597618 
X-CRM114-Status: GOOD (  15.95  )
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

On Wed, Oct 20, 2021 at 04:28:00PM +0200, Miquel Raynal wrote:
> This SPI controller supports interacting with an external ECC
> engine. The nand-ecc-engine property already exist in the NAND world but
> also applies to SPI controller nodes which have external correction
> capabilities like Macronix's.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)

This should come before patch 8. The example would fail if 
'unevaluatedProperties' did anything.

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml b/Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml
> index 4036c14fc533..01618a77627d 100644
> --- a/Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/mxicy,mx25f0a-spi.yaml
> @@ -43,6 +43,12 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +  nand-ecc-engine:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +    description: NAND ECC engine used by the SPI controller in order to perform
> +      on-the-fly correction when using a SPI-NAND memory.
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.27.0
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
