Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F68C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 21:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKGsEL+ljTUU8bMP/e7BDsi2AZ/Kuw29xvf7RRWzjoM=; b=NpCp+c1rKvMSwG
	koyTCUBfdKs5fDbY4rOcCzVhiimu/KtW4HcOpEgDLJxO1AIiwnacu9GGHYNGqeYhTMh8tSb4Fd+BE
	9zzSMNAqnjmjTeC9D8fOX1crsnuNpsN0W5FP25gpFX6xjFqlltXD39x3lvm1PN2Co4t/Hl7EIQbKO
	vH6KG5pd/ufUklf0RPGixBsKaD1QDlZm4zZzpTLfECRxWkIGc6NgMFgoix8ONoGzo2BoZTY4/nVQa
	ZjStbA7962HPfATJGjM1H5zYiak1TQPmIl38fgjTYOQMxCf7o/LFmnPVCiPR+NkJxE5z8wu1PmHUU
	Mr70xCrS8kwntwyT7XmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHuMi-001fVC-V3; Wed, 09 Feb 2022 21:19:05 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHuMU-001fRj-Rr; Wed, 09 Feb 2022 21:18:52 +0000
Received: by mail-oi1-f177.google.com with SMTP id ay7so3868755oib.8;
 Wed, 09 Feb 2022 13:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ysi9tyGURK2QwhBWavXBNAH4KWOK+Ss1yM0yrY3G7jk=;
 b=vn7XAZBioBCbaXuEGy6CeA8TtMwnPZVVauMsnWsM4wOscXhfDdlpo9r1rD+J+6p+of
 tgFi7AkFnyuUrofe3oPvYlIzk9mqPfmVJ1svopkoPHHXRu4F/x7qkHUXscuG7IB5s7uJ
 oEAUr28KneP7zefOoDlwuO5OW9ZoQ1E1XuZfunM90WMMG9l7PBmJzUso1o9cKywH5c0K
 kml0PGz33vPt/uUSX2AoXM9OEg451PVCKfyCfzX2jQgKKr4Lk5HmeanbgapOj4mSUPZ1
 ijRDCq6rpbfLxuNsDOFROJh7R6YmyqlqcDdKd5acyS4CWNjvJLdT+19RzSU4uNL9/JED
 A2rQ==
X-Gm-Message-State: AOAM531AvAM9gDxJMU+VJMLUjFdQWFtbcWvg7EL74B4+DEOpO5i9fYm1
 SarWSoSTIyNvVYjJmeQuNzFMg7Wktw==
X-Google-Smtp-Source: ABdhPJzaDtW2H4LesfcmHT/9rcXfGcMFnwfUDpZImmvW0LWJ0t2aBhAXoz0IFGO+1CSlXSzEgirmdQ==
X-Received: by 2002:a05:6808:208d:: with SMTP id
 s13mr2225459oiw.282.1644441523498; 
 Wed, 09 Feb 2022 13:18:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 12sm3579222oam.5.2022.02.09.13.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 13:18:42 -0800 (PST)
Received: (nullmailer pid 932436 invoked by uid 1000);
 Wed, 09 Feb 2022 21:18:41 -0000
Date: Wed, 9 Feb 2022 15:18:41 -0600
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: linus.walleij@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: mtd: drop mtd/cortina,gemini-flash.txt
Message-ID: <YgQvsQbGEBgfAoVO@robh.at.kernel.org>
References: <20220131080858.1777518-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131080858.1777518-1-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_131850_911331_5AFB505E 
X-CRM114-Status: GOOD (  21.28  )
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

On Mon, Jan 31, 2022 at 08:08:58AM +0000, Corentin Labbe wrote:
> Drop mtd/cortina,gemini-flash.txt since it is nearly already handled by
> Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> Change since v1:
> - fixed typo on syscon
> 
>  .../bindings/mtd/cortina,gemini-flash.txt     | 24 -------------------
>  .../devicetree/bindings/mtd/mtd-physmap.yaml  | 18 +++++++++++++-
>  2 files changed, 17 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt b/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> deleted file mode 100644
> index efa5b2aba829..000000000000
> --- a/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Flash device on Cortina Systems Gemini SoC
> -
> -This flash is regular CFI compatible (Intel or AMD extended) flash chips with
> -some special bits that can be controlled by the machine's system controller.
> -
> -Required properties:
> -- compatible : must be "cortina,gemini-flash", "cfi-flash";
> -- reg : memory address for the flash chip
> -- syscon : must be a phandle to the system controller
> -- bank-width : width in bytes of flash interface, should be <2>
> -
> -For the rest of the properties, see mtd-physmap.yaml.
> -
> -The device tree may optionally contain sub-nodes describing partitions of the
> -address space. See partition.txt for more detail.
> -
> -Example:
> -
> -flash@30000000 {
> -	compatible = "cortina,gemini-flash", "cfi-flash";
> -	reg = <0x30000000 0x01000000>;
> -	syscon = <&syscon>;
> -	bank-width = <2>;
> -};
> diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> index f827984936f6..82eb4e0f453b 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> @@ -44,7 +44,9 @@ properties:
>                - numonyx,js28f128
>                - sst,sst39vf320
>                - xlnx,xps-mch-emc-2.00.a
> -          - const: cfi-flash
> +          - enum:
> +              - cfi-flash
> +              - jedec-flash

Why is jedec-flash being added? The old doc made no mention of it.

>        - items:
>            - enum:
>                - cypress,cy7c1019dv33-10zsxi
> @@ -127,6 +129,20 @@ required:
>    - compatible
>    - reg
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: cortina,gemini-flash
> +then:
> +  properties:
> +    syscon:
> +      $ref: /schemas/types.yaml#/definitions/phandle
> +      description:
> +        Phandle to the syscon controller
> +  required:
> +    - syscon
> +
>  # FIXME: A parent bus may define timing properties
>  additionalProperties: true
>  
> -- 
> 2.34.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
