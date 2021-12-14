Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0A7C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 17:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJuRw1kd3CeXKoJ6R73lc3f6aDujzB4Wvxik61oXrZ0=; b=yu8KCFUeVC/IXz
	azclOD9vYqywtnFPqFShBTngrFHL2DZVRNOmZJ2Qi+wM5bP/NFx3gXi6+wfvzr3Mg/9X5XqHHup8/
	vfMZkF2eK/sHsD8+52kIEDaiIq0sm8bCPSC7s937o+DxLdH6EfVpASkv68xCZJU3WCaivcIheibr8
	YVRfkoJVe0IBsUdhEg65bfN/RI9l3eiJrWdieBtmRNji/XMmM8T/ZkKy7xQMCs87CIRwpt62MOWnG
	KnVZ8WUK/wAtYaYNrmSEDLK3cgXAlfjPcS2brCSN6RNDFWTvlZmnJ1nhMVZo+CD2wqr02mLxnpTNE
	8y3u+SIjaHvQtlTpBAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxBrt-00FBbX-50; Tue, 14 Dec 2021 17:45:37 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxBrk-00FBZm-Bn
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 17:45:29 +0000
Received: by mail-oi1-f170.google.com with SMTP id m6so28185152oim.2
 for <linux-mtd@lists.infradead.org>; Tue, 14 Dec 2021 09:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PDAQFAlYmMYrsN3W7pDsfMhVrlZtlZ4Z+Zsjot1vjnE=;
 b=h08Q//D1pNkCEOb5tXmQbGPH6m5Ke/iTD3ETmQRsl29TX4NMUKYsEynKyrSoLlH/7H
 u49CJC/jwgyXPj3DnFw095hxbyIKwNWK7Rpo4zeQOY/ktkbVPE3vBmPhCemVw6/mfi0k
 JRkZUnANCowx+M9vIuL9sHyqBhQxtSv++ibMS/ImRGkshZqsWKrburNKGFqp/R4nAc2s
 2EPSr+OnNU0w6A3PeFFK+h8D9oYQp2NfZeuB9r6A0Gf6qo9Jkea0MtTvcDfoWaBpzmcm
 EE4dpvSUZXo3+IENjGDAmW+vhz5DP26Tt2ARTvP8DuAz3epO9BJ01yZRa+a2A5G7YcyG
 QkIA==
X-Gm-Message-State: AOAM531nS59XpsGPdSHWgWnPLlytaEr0v2XLgjPcv4phCRzxUf7NALlw
 4NWtb6RUR1piQgppL8QW1w==
X-Google-Smtp-Source: ABdhPJyv9araoJQUDNF2ES2aBqcsEhsMdYAqkrICAwluC2ddu59UxTqLaT/hJbItOG8FqVqQUhhGqQ==
X-Received: by 2002:a05:6808:1413:: with SMTP id
 w19mr5600749oiv.128.1639503927011; 
 Tue, 14 Dec 2021 09:45:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w4sm89501oiv.37.2021.12.14.09.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 09:45:26 -0800 (PST)
Received: (nullmailer pid 3616024 invoked by uid 1000);
 Tue, 14 Dec 2021 17:45:25 -0000
Date: Tue, 14 Dec 2021 11:45:25 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>, Julien Su <juliensu@mxic.com.tw>,
 Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 03/22] dt-bindings: mtd: nand-controller: Harmonize
 the property types
Message-ID: <YbjYNVOVL/sLda9H@robh.at.kernel.org>
References: <20211207093422.166934-1-miquel.raynal@bootlin.com>
 <20211207093422.166934-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211207093422.166934-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_094528_452990_4C64C0AC 
X-CRM114-Status: GOOD (  21.70  )
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

On Tue, Dec 07, 2021 at 10:34:03AM +0100, Miquel Raynal wrote:
> Harmonize the different properties in this file by:
> * dropping the non-necessary allOf's
> * always defining the keywords in the following order:
>     - first: "type"/"$ref",
>     - second: "description" (when relevant),

If we're going to muck with this, really I prefer description first or 
last and everything else together.

>     - then the other generic keywords ("enum", "default", etc).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/nand-controller.yaml | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 5cd144a9ec99..7024ca24c2e2 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -58,8 +58,7 @@ patternProperties:
>            Contains the chip-select IDs.
>  
>        nand-ecc-engine:
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/phandle
> +        $ref: /schemas/types.yaml#/definitions/phandle
>          description: |
>            A phandle on the hardware ECC engine if any. There are
>            basically three possibilities:
> @@ -79,25 +78,24 @@ patternProperties:
>          description: Do not use any ECC correction.
>  
>        nand-ecc-placement:
> -        allOf:
> -          - $ref: /schemas/types.yaml#/definitions/string
> -          - enum: [ oob, interleaved ]
> +        $ref: /schemas/types.yaml#/definitions/string
>          description:
>            Location of the ECC bytes. This location is unknown by default
>            but can be explicitly set to "oob", if all ECC bytes are
>            known to be stored in the OOB area, or "interleaved" if ECC
>            bytes will be interleaved with regular data in the main area.
> +        enum: [ oob, interleaved ]
>  
>        nand-ecc-algo:
> +        $ref: /schemas/types.yaml#/definitions/string
>          description:
>            Desired ECC algorithm.
> -        $ref: /schemas/types.yaml#/definitions/string
>          enum: [hamming, bch, rs]
>  
>        nand-bus-width:
> +        $ref: /schemas/types.yaml#/definitions/uint32
>          description:
>            Bus width to the NAND chip
> -        $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [8, 16]
>          default: 8
>  
> @@ -113,15 +111,15 @@ patternProperties:
>            build a volatile BBT in RAM.
>  
>        nand-ecc-strength:
> +        $ref: /schemas/types.yaml#/definitions/uint32
>          description:
>            Maximum number of bits that can be corrected per ECC step.
> -        $ref: /schemas/types.yaml#/definitions/uint32
>          minimum: 1
>  
>        nand-ecc-step-size:
> +        $ref: /schemas/types.yaml#/definitions/uint32
>          description:
>            Number of data bytes covered by a single ECC step.
> -        $ref: /schemas/types.yaml#/definitions/uint32
>          minimum: 1
>  
>        nand-ecc-maximize:
> -- 
> 2.27.0
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
