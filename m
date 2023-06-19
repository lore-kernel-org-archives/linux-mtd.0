Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01237EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 22:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sX5yUCBYYU7nSTji/AGvqIASjAVkSexKI6O/zNsWDS4=; b=H+oLzp6HoXG94K
	AtewHmYXcvbWD9ApAbgW4kh8DL/HttwMUO5pFxb7+om4QH0g1Jm8sPFiWXeb2a9i7q4esrNvi0vwi
	VVVkMoZMpN9wllI6CzRgKylWb1v5VngccBOE9/xa42VBu0hLHg883TREkGsBi8Oi/+VR7oCz4N8/h
	pTl8OlJ2JNV8nBzK3I73xwhNRwGD5d3gtgPFXusYJK8oG113TsQCyNx0InZSjuzhxID3ONPZWetA3
	Ur7AUZ1/2NW6a6gj60cs2D0cJXuHaQZtsa14LED4KRTRr88kXV++0xB1y41YObaiCsUCqhnTnrnTs
	D9c34BzYcvN76KLfm3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBNhu-009c9n-0b;
	Mon, 19 Jun 2023 22:50:46 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBNhp-009c9I-23
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 22:50:43 +0000
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-77e35b6b0c4so84164139f.1
        for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2023 15:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687215040; x=1689807040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdmKEO8LetRwQhVmgte2Z1MHdDvvmR8biVbcp0wwjpI=;
        b=CQ0lF8yh04+10hS6J/jr1V2j400RGbTdvE2TBjIVkJpLQGaLM6NQzqgHNms2K49kIf
         CnwhkfBIVrhoJRHzvJJJ201t/JrJJ/F0N7SswgVADCEvn6s60h449FBDfso3pPS+Tasz
         G/ri0FWt7IksTJdcEOI9T6LpBkKeMFJ2D25wDcqhh79lwaLJ/kEuzMR5niQ7EAAytZLo
         z7Glvd6YxkhjkUWvchDByjGY+2W8qnBzL7nWk6YL070iEJD+0KrjU4Xn3142K+Byaq0T
         7ecgXWA7+ajfXWmVlWDSq399PY952D3mLKHSM6BYY33WooNMIIt8k3+DUeYEfLEHarmW
         i1Hg==
X-Gm-Message-State: AC+VfDy+nRqSMEmTqyQFFcUT6ev7LKyIJ3NEEbXHJfLM22huyTzqRd7c
	630LUTD/EJU3aV6DElz7pzoWr6fSaQ==
X-Google-Smtp-Source: ACHHUZ7fc5zUOQFvyDbp88VM712kkIPAiP1BxKYiaRt5dJxgdfUoi+V70oW7sV1a7w2CPIe9+bA7Hg==
X-Received: by 2002:a6b:a14:0:b0:777:aa2c:c2ab with SMTP id z20-20020a6b0a14000000b00777aa2cc2abmr7549381ioi.12.1687215040393;
        Mon, 19 Jun 2023 15:50:40 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id n2-20020a6bf602000000b0077de452f071sm228829ioh.1.2023.06.19.15.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 15:50:39 -0700 (PDT)
Received: (nullmailer pid 1677662 invoked by uid 1000);
	Mon, 19 Jun 2023 22:50:38 -0000
Date: Mon, 19 Jun 2023 16:50:38 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 02/17] dt-bindings: mtd: Create a file for raw NAND
 chip properties
Message-ID: <20230619225038.GA1676165-robh@kernel.org>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
 <20230619092916.3028470-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230619092916.3028470-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_155041_681438_4AFAA078 
X-CRM114-Status: GOOD (  40.13  )
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

On Mon, Jun 19, 2023 at 11:29:01AM +0200, Miquel Raynal wrote:
> In an effort to constrain as much as we can the existing binding, we
> want to add "unevaluatedProperties: false" in all the NAND chip
> descriptions part of NAND controller bindings. But in order to do that
> properly, we also need to reference a file which contains all the
> "allowed" properties. Right now this file is nand-chip.yaml but in
> practice raw NAND controllers may use additional properties in their
> NAND chip children node. These properties are listed under
> nand-controller.yaml, which makes the "unevaluatedProperties" checks
> fail while the description are valid. We need to move these NAND chip
> related properties into another file, because we do not want to pollute
> nand-chip.yaml which is also referenced by eg. SPI-NAND devices.
> 
> Let's create a raw-nand-chip.yaml file to reference all the properties a
> raw NAND chip description can contain. The chain of inheritance becomes:
>   nand-controller.yaml <- raw-nand-chip.yaml
>   raw-nand-chip.yaml   <- nand-chip.yaml
>   spi-nand.yaml        <- nand-chip.yaml
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/mtd/nand-controller.yaml         |  85 +--------------
>  .../bindings/mtd/raw-nand-chip.yaml           | 102 ++++++++++++++++++
>  2 files changed, 104 insertions(+), 83 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index f70a32d2d9d4..83a4fe4cc29d 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -16,16 +16,6 @@ description: |
>    children nodes of the NAND controller. This representation should be
>    enforced even for simple controllers supporting only one chip.
>  
> -  The ECC strength and ECC step size properties define the user
> -  desires in terms of correction capability of a controller. Together,
> -  they request the ECC engine to correct {strength} bit errors per
> -  {size} bytes.
> -
> -  The interpretation of these parameters is implementation-defined, so
> -  not all implementations must support all possible
> -  combinations. However, implementations are encouraged to further
> -  specify the value(s) they support.
> -
>  properties:
>    $nodename:
>      pattern: "^nand-controller(@.*)?"
> @@ -51,79 +41,8 @@ properties:
>  
>  patternProperties:
>    "^nand@[a-f0-9]$":
> -    $ref: nand-chip.yaml#
> -
> -    properties:
> -      reg:
> -        description:
> -          Contains the chip-select IDs.
> -
> -      nand-ecc-placement:
> -        description:
> -          Location of the ECC bytes. This location is unknown by default
> -          but can be explicitly set to "oob", if all ECC bytes are
> -          known to be stored in the OOB area, or "interleaved" if ECC
> -          bytes will be interleaved with regular data in the main area.
> -        $ref: /schemas/types.yaml#/definitions/string
> -        enum: [ oob, interleaved ]
> -
> -      nand-bus-width:
> -        description:
> -          Bus width to the NAND chip
> -        $ref: /schemas/types.yaml#/definitions/uint32
> -        enum: [8, 16]
> -        default: 8
> -
> -      nand-on-flash-bbt:
> -        description:
> -          With this property, the OS will search the device for a Bad
> -          Block Table (BBT). If not found, it will create one, reserve
> -          a few blocks at the end of the device to store it and update
> -          it as the device ages. Otherwise, the out-of-band area of a
> -          few pages of all the blocks will be scanned at boot time to
> -          find Bad Block Markers (BBM). These markers will help to
> -          build a volatile BBT in RAM.
> -        $ref: /schemas/types.yaml#/definitions/flag
> -
> -      nand-ecc-maximize:
> -        description:
> -          Whether or not the ECC strength should be maximized. The
> -          maximum ECC strength is both controller and chip
> -          dependent. The ECC engine has to select the ECC config
> -          providing the best strength and taking the OOB area size
> -          constraint into account. This is particularly useful when
> -          only the in-band area is used by the upper layers, and you
> -          want to make your NAND as reliable as possible.
> -        $ref: /schemas/types.yaml#/definitions/flag
> -
> -      nand-is-boot-medium:
> -        description:
> -          Whether or not the NAND chip is a boot medium. Drivers might
> -          use this information to select ECC algorithms supported by
> -          the boot ROM or similar restrictions.
> -        $ref: /schemas/types.yaml#/definitions/flag
> -
> -      nand-rb:
> -        description:
> -          Contains the native Ready/Busy IDs.
> -        $ref: /schemas/types.yaml#/definitions/uint32-array
> -
> -      rb-gpios:
> -        description:
> -          Contains one or more GPIO descriptor (the numper of descriptor
> -          depends on the number of R/B pins exposed by the flash) for the
> -          Ready/Busy pins. Active state refers to the NAND ready state and
> -          should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
> -
> -      wp-gpios:
> -        description:
> -          Contains one GPIO descriptor for the Write Protect pin.
> -          Active state refers to the NAND Write Protect state and should be
> -          set to GPIOD_ACTIVE_LOW unless the signal is inverted.
> -        maxItems: 1
> -
> -    required:
> -      - reg
> +    type: object
> +    $ref: raw-nand-chip.yaml#
>  
>  required:
>    - "#address-cells"
> diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
> new file mode 100644
> index 000000000000..2caa6a9a73d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: GPL-2.0

Should be dual licensed like the original.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
