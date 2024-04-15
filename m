Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33B8C04FF9
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 21:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YhFzfWCNT+iOZGPnYDy8D5TNAp11plIJmKQ0hWhYJXA=; b=hcRatwNI11vGEb
	okN6TT/SwypH6Vf08tUOjkZz6SgId49zslrvt+WIg45Pwar9vD6EAiy77cHzbRl+xwA02jprAToE1
	2d6slHv0453oqS/S7gBoVbWX7NnjCfNhHpUvURfjSDx5HsGh6/HFHh85K7W1zYikd3GmOK8wDGe5A
	R4VlMNjOj9w35SjbdhCFJKSQw6CHqrM8n3RS8duv6eACdTrhRa4T8wOKkekjyi7FOo8LzbrCRLlDa
	M+X7v1KUDyB8DJYehU+yzonkW30edwNN4o/PZt7s0JE8xMiY8326Cn3ZSsjHWDhvkOGhmxznYCNvn
	JOZ1if4eFlhcZiO3UL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwTrO-00000009xtn-1gb6;
	Mon, 15 Apr 2024 21:27:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwTrD-00000009xq1-1Enk;
	Mon, 15 Apr 2024 21:27:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 26F7DCE0A50;
	Mon, 15 Apr 2024 21:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C9AC113CC;
	Mon, 15 Apr 2024 21:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713216433;
	bh=AokiBwLoenA+AuAq05ya7tY/KjTt6b5eb9h8P1KVQgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hXy8eAQj0AlY6mfR43iRJ6wS/B4Mn29gxVYqTjINDIeY7vknv4DS3h4gc4pDRJLUq
	 uB1iJajd7UgRZ7Da4E2BzwyONCB1jPrkpDxaA01jy7sQbz4WuQreTY69KXFrZtxtU7
	 t1AwZARUlS1IyHp3/w+trYZ2JH5XrcDvDnKpvJlJKyKgMJTGyZV9ZxlQjEQ2pPgCGa
	 FeY9zkIYRVhknFX9GyEYSvm3upQRX61YNLdl2jQz94icifluufllDDRCdHdT61HzE3
	 osRcwcH6S3/KK/Bei8f6d22RF+Qa1WXy+tnX1cni3hG61xlz534rwNjrKLvaAO4KzF
	 kJqePPDycI82Q==
Date: Mon, 15 Apr 2024 16:27:10 -0500
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
Subject: Re: [PATCH v4 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <20240415212710.GA105671-robh@kernel.org>
References: <20240410185409.2635622-1-avkrasnov@salutedevices.com>
 <20240410185409.2635622-2-avkrasnov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410185409.2635622-2-avkrasnov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_142719_766275_114162C9 
X-CRM114-Status: GOOD (  16.95  )
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

On Wed, Apr 10, 2024 at 09:54:08PM +0300, Arseniy Krasnov wrote:
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
> index 57b6957c8415..838ae1847ef0 100644
> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> @@ -64,11 +64,25 @@ patternProperties:
>          items:
>            maximum: 0
>  
> +      amlogic,boot-pages:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          The NFC driver needs this information to select ECC
> +          algorithms supported by the boot ROM.

'the $driver drivers needs this information' is true for every property, 
so it's redundant. You fail to say *what* the property represents or 
defines.

> +
> +      amlogic,boot-page-step:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          The NFC driver needs this information to select ECC
> +          algorithms supported by the boot ROM (in pages).

Same issue here.

> +
>      unevaluatedProperties: false
>  
>      dependencies:
>        nand-ecc-strength: [nand-ecc-step-size]
>        nand-ecc-step-size: [nand-ecc-strength]
> +      amlogic,boot-pages: [nand-is-boot-medium, "amlogic,boot-page-step"]
> +      amlogic,boot-page-step: [nand-is-boot-medium, "amlogic,boot-pages"]
>  
>  
>  required:
> -- 
> 2.35.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
