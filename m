Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FDCC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qvv8SkPnDHkgs8bXRReEQWjqw2p8wKurK2MqSc6LnUs=; b=ECEn4foBzHLsy3
	kJHVBlPg0GLFRRqcMTFEqQiu9LymSNAsxlWV1tIORDvEwMW0QQ4PMMhbbm74q0wnJkYrAETRI4tlV
	16VTDULEBZYWk1Do6qft/H7hrUyBprqIsts45F5sXRoSADczWUjGohfDritodgrn4Ot/lKroxllD4
	Uu/InVSICPuU7gPKmeQtf6Ik2Ax4DE4lEV0CmVX3YDbvD7HunXIiabNqEVIxLQyRbRtV8FDaB4eTR
	Yq0+6+fTU/aQfswlYtqpCaYQ6eACZRARPkFgMt98uEE5qhMpKXfEl0d28TnVYZDpbgQDncDH1kduR
	YxG2epvOKtuD9Mj8l98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncWl8-00DWwJ-Hs; Thu, 07 Apr 2022 18:21:30 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncWl6-00DWvl-Bo
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2022 18:21:29 +0000
Received: by mail-oi1-f178.google.com with SMTP id k10so6547930oia.0
 for <linux-mtd@lists.infradead.org>; Thu, 07 Apr 2022 11:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZUuPSTjprXcNKfHzz7Qs6snhyaATcmWPUoU1Mkt9TqE=;
 b=r0G4zg8erXfSBt1a3l+NZY79PUYMJdhBTXgXCdSvC60sV4zcFu8z3bVwVA3XOoahID
 VEUllXGZEgutiLIzSowL6eER8rGjPe18u4I3++vLpDTvTqaHi1KYE0zSeQido8jpazqV
 U0nOq85/53+Qm5ez9BNCHHTMgRQhGGfxug7JT5JejtFLrPDE4w2TKq9a4SlhtxE7Ipm0
 V5ewtPTW5OikFb4I7hm2Sg6APSjAbhZTCJrHlUbe9uk05pDTYDr2ANQ+erxeRpk27vJU
 ISD6xkAqFZ2F6Kj3JAHUmc2gKTwsiMfUzfO+caQFYC4tB3wbMMO4lMDSMozSXhEObON2
 uSMg==
X-Gm-Message-State: AOAM533Oe7YooQhUZTFtv9Yp//ScurEoLqWDzxxh/aOmOspTnCOM18Kq
 x1uiYTVG42Rks/vX9NovcQ==
X-Google-Smtp-Source: ABdhPJzQ3QKekxOUT9F9yPRhqnVy0KNHkDXdjNZeiEbzCTGOSGHeI4SuJc+WaERnqIJopniAaB0DrA==
X-Received: by 2002:a05:6808:1202:b0:2f9:c7b4:fd56 with SMTP id
 a2-20020a056808120200b002f9c7b4fd56mr351609oil.55.1649355686314; 
 Thu, 07 Apr 2022 11:21:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u22-20020a4ae696000000b0032158ab4ce9sm7507715oot.26.2022.04.07.11.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 11:21:26 -0700 (PDT)
Received: (nullmailer pid 1732024 invoked by uid 1000);
 Thu, 07 Apr 2022 18:21:25 -0000
Date: Thu, 7 Apr 2022 13:21:25 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: remove unneeded
 properties
Message-ID: <Yk8rpUXmfmULMVjr@robh.at.kernel.org>
References: <20220407142004.292782-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220407142004.292782-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_112128_440324_756821D1 
X-CRM114-Status: GOOD (  15.39  )
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

On Thu, Apr 07, 2022 at 04:20:04PM +0200, Krzysztof Kozlowski wrote:
> After conversion the jedec,spi-nor DT schema to reference other schemas
> (SPI and MTD) and use unevaluatedProperties, several properties are
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml        | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 4abfb4cfc157..708e7f88fd92 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -50,10 +50,6 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> -  spi-max-frequency: true
> -  spi-rx-bus-width: true
> -  spi-tx-bus-width: true
> -
>    m25p,fast-read:
>      type: boolean
>      description:
> @@ -74,14 +70,9 @@ properties:
>        be used on such systems, to denote the absence of a reliable reset
>        mechanism.
>  
> -  label: true
> -
>    partitions:
>      type: object
>  
> -  '#address-cells': true
> -  '#size-cells': true

These are needed for 'partition' nodes.

> -
>  patternProperties:
>    # Note: use 'partitions' node for new users
>    '^partition@':
> @@ -99,8 +90,6 @@ examples:
>          #size-cells = <0>;
>  
>          flash@0 {
> -            #address-cells = <1>;
> -            #size-cells = <1>;
>              compatible = "spansion,m25p80", "jedec,spi-nor";
>              reg = <0>;
>              spi-max-frequency = <40000000>;
> -- 
> 2.32.0
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
