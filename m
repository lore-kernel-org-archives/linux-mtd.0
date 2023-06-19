Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A07DEB64DB
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 06:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TK/jU/D2t6+Tmts84s4mRU33FNfOCX3ORExH3XUqDcM=; b=fRTngZBVMRvw72
	xuTVMZL3cc0xQ62Y0rDcU61hMlQTm+Z090Fq6cu0RhHooTzElYUSnR0ay8w3dx3in8GvDz1g+SKMH
	1EMXyt1QBg84/F50CPTZRIq36u5gU4t/YxSCzEIr9BVGHidy6Hq7RqLNkBbFXkbBYGyaOjHhR7qke
	p5I/tNytTduHRYrjwq4QXGhOyIy2eC53f3vgD86aEd7xg/2mZLSQv06dd0XEc5NJUG47nbinXLEpd
	5o7b3/qEGC7ojidRi4UOTfLtKQ1aVQyB2Mwi75+/kGMikxmKTMCJUXgLsnaoENLvhvg0TBhvnBtVA
	qM6YAK5HpdiZdCThDF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8NW-007ZvI-2h;
	Mon, 19 Jun 2023 06:28:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qB8NU-007Zu6-0V
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 06:28:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 056B5614BE;
	Mon, 19 Jun 2023 06:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC02C433C0;
	Mon, 19 Jun 2023 06:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687156118;
	bh=TznITH/HAKMxB++DyKr5L/4yr1heYvNg/RG2jgdIzLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tjFUDuurkvH2uCXtROceidf9iyNpTVVqI2e5y0Fhu46cbwI8tOgPaPWcWFN48tiD1
	 q+YbccU2VPi3IZ05qIHyqs3UjE+hoQ3ZjwzgtA9UUbKYy1j0pD7/eIprTjFS6NU+AY
	 SoSHt4zN/UUJy1QAp/0mko4/tBMCtUXcAJ0lW7b9IhjeFHwKy/msxGPv+HqjSGjyRh
	 tyZRuYdyOJVWW95OV00EKJUJbnbkfx1+cvh0cYSkgLrcVfdQ18trY5Mn5zIGQmisqq
	 popSiQdHyHEONSMvvXuyAToyvaRGe/eGF+8PWa0cwOmX/vKcP3o+JXMkLJyey8ABwS
	 M1M4sBtqYP66g==
Message-ID: <f7218445-77e7-7429-5d81-ee7380a3e045@kernel.org>
Date: Mon, 19 Jun 2023 08:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 02/17] dt-bindings: mtd: Create a file for raw NAND
 chip properties
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
 <20230606175246.190465-3-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230606175246.190465-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_232840_277462_ADF038BA 
X-CRM114-Status: GOOD (  33.20  )
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

On 06/06/2023 19:52, Miquel Raynal wrote:
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

...

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
> -    $ref: "nand-chip.yaml#"

You work on some old tree, judging by email addresses you CC and by
this. I would expect here current next, but this is even pre v6.4-rc1!
Working on something older than current master branch doss not make any
sense.


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
> +    $ref: "raw-nand-chip.yaml#"

Again, no quotes. We just removed them everywhere.

>  


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
