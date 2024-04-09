Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C46BC67861
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=820jKQwH/WWAlUvOjdFmI8j36IiDDdzPbhxwzkjrb9Y=; b=VCc7ox29KL8feE
	gmMePy2yoFCYcLvsxwg7/r0u+wvCgoULux0Zo/5joT+hArNRO6AKITkRstRhx7dE8MWa2xIGdwzgi
	J2CLyuBWIrgcQc0M8x+34H8hPxA9LozRE3XCrZarPk19uXPDSPLVLmCjq5uY6S0KA+bppt2aJJKg/
	lvgh/pXVAHYbvkbYExM50eWsEICaWJ1j3vVFL48SYpf31ziDf7rBJnS3ZigQ4vNy+dn7nALRiv9N/
	i3q3d8+fsjTICkXKfxGgvYVXQc55VNCCSrXKrA5pEZdVNH5QEeZMJTf7gvbn6DWQZEYlgbyd9phyE
	pQ7R7YYQx7XA43tLk/yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBou-00000002F8x-0iTV;
	Tue, 09 Apr 2024 13:47:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBop-00000002F6E-0dyw;
	Tue, 09 Apr 2024 13:47:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2F56ECE10ED;
	Tue,  9 Apr 2024 13:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E767C433F1;
	Tue,  9 Apr 2024 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712670440;
	bh=eMgGDvBhSwomIduc3Ww9nHxOHT2zRidPoz1kaAAG6Xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OiFpcHrJrELfQ0w4lX0cktdooBbdqsoHCXatp67xvr4gT/dXvE4wa6RVsIydrq0Ce
	 RsIqw93EknR0C4SLFv+idmJKR6ZutAE7ABCpYqG1WtfW4qdFdm07px4Sr6CvEb3wMV
	 eNuBvEm0/6pqZY0bkHFkqKXe4mkepAUsvP3GB57ALkyiv35+N/B033wi1xMe+1mlHP
	 7PsPMY8c5DfwgLZ6Mgr7lrH6+ynkoJLzZOD+pdMYFQ9EwYi5qFUONZJozCwdX13aom
	 6VTB6jC2frvRFZAXY4S0Vf0k20CuzXzKcqgADfZDdMgG5afEEF2SIDBvU97l9C4S9M
	 RWYC1iDthhkiA==
Date: Tue, 9 Apr 2024 08:47:18 -0500
From: Rob Herring <robh@kernel.org>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	oxffffaa@gmail.com, kernel@sberdevices.ru
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <20240409134718.GA1050037-robh@kernel.org>
References: <20240408085931.456337-1-avkrasnov@salutedevices.com>
 <20240408085931.456337-2-avkrasnov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240408085931.456337-2-avkrasnov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_064723_451222_6DCB698F 
X-CRM114-Status: GOOD (  16.80  )
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

On Mon, Apr 08, 2024 at 11:59:30AM +0300, Arseniy Krasnov wrote:
> Boot ROM code on Meson requires that some pages on NAND must be written
> in special mode: "short" ECC mode where each block is 384 bytes and
> scrambling mode is on. Such pages located with the specified interval
> within specified offset. Both interval and offset are located in the
> device tree and used by driver if 'nand-is-boot-medium' is set for
> NAND chip.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>  .../bindings/mtd/amlogic,meson-nand.yaml           | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> index 57b6957c8415..80ba5003ca70 100644
> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> @@ -64,11 +64,25 @@ patternProperties:
>          items:
>            maximum: 0
>  
> +      amlogic,boot-page-last:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          The NFC driver needs this information to select ECC
> +          algorithms supported by the boot ROM.
> +
> +      amlogic,boot-page-step:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          The NFC driver needs this information to select ECC
> +          algorithms supported by the boot ROM (in pages).
> +
>      unevaluatedProperties: false
>  
>      dependencies:
>        nand-ecc-strength: [nand-ecc-step-size]
>        nand-ecc-step-size: [nand-ecc-strength]
> +      amlogic,boot-page-last: [nand-is-boot-medium, amlogic,boot-page-step]
> +      amlogic,boot-page-step: [nand-is-boot-medium, amlogic,boot-page-last]

You need quotes if using the inline syntax.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
