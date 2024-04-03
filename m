Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77230CD1288
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2024 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9PXCmDts5/R4Vwh3DfiDE9AbMajHNzVD4jxtj8aS0E=; b=YFzoGu+7gLCF3A
	d395jvPEvmK1w2Mzbdu91LacfpqtrxQ2jxIVMzrn3ofJBvhdyIPOx9khPc8/HSp0jmu2fQAxR/F1C
	jYppfbj3vh2Vyttt+36k4IB0r8m0YZ8xf8SrCSL5bgL4F7ubvFRWvhiP9DyfSOtHz6gz73GDw2pMe
	k+useVrUuAsX50g7+coMmiqZs+Dg/rSJMt7sRBl0vw2/psIoKhR5F55IYOY9PjUZD/164YBtzt9L3
	lvC7v+V03P9xgAVVGwNa8yhvXL22CrisPZu2F0vofi+E2mYvc3CRno+qK5owo9vo3xNlXUnf2Y1UR
	0SJ1Lq7oP3bsqAxL52/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs40o-0000000H55k-0gXK;
	Wed, 03 Apr 2024 17:02:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs40i-0000000H53q-3H0B;
	Wed, 03 Apr 2024 17:02:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 874B2CE2BC3;
	Wed,  3 Apr 2024 17:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87308C43390;
	Wed,  3 Apr 2024 17:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712163739;
	bh=2oGsbwbq15QL3wvwkV7hEBDpgVGRbcvJNrIyVScYh6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rx/GFrI/POAqeyJagkVNQjQ4UaDfYwJqjMkwf9+CnS/ac8n2Nb03EXzq0FqdGLE7L
	 SZlx7hdF0VWhMXORF4dGtipOW3bT9HocxdzMhoTdJYCqsTyqw1jJwz77HENtm8I2jE
	 SiV5GRjTCv6qotdJjr41qnIewCD/i3z3HkxRIam96U0DRROD8MUYtopJRnM2djQMGN
	 Ugyl4CkPhuqxLmbQGsEFgLHry+oNQbGVmqF8a5j2HFVlqXWG5fXewg9exJ4EfF7u/Z
	 TrLZZPmB8o5YgFCKltUaE9VjMDWMnB4gPxiekAKLQ/s45NQ6VdGym9etkYC0lIJgmC
	 6n23OeoB3gvgw==
Date: Wed, 3 Apr 2024 12:02:17 -0500
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
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: amlogic,meson-nand: support
 fields for boot ROM code
Message-ID: <20240403170217.GA3984955-robh@kernel.org>
References: <20240402202705.2355326-1-avkrasnov@salutedevices.com>
 <20240402202705.2355326-2-avkrasnov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240402202705.2355326-2-avkrasnov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_100253_189157_73E61D30 
X-CRM114-Status: GOOD (  17.71  )
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

On Tue, Apr 02, 2024 at 11:27:04PM +0300, Arseniy Krasnov wrote:
> Boot ROM code on Meson requires that some pages on NAND must be written
> in special mode: "short" ECC mode where each block is 384 bytes and
> scrambling mode is on. Such pages located with the specified interval
> within specified offset. Both interval and offset are located in the
> device tree and used by driver if 'nand-is-boot-medium' is set for
> NAND chip.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>  .../bindings/mtd/amlogic,meson-nand.yaml         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> index 57b6957c8415..f49819ee76b8 100644
> --- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> @@ -64,11 +64,27 @@ patternProperties:
>          items:
>            maximum: 0
>  
> +      meson,boot-page-last:

'meson' is not a valid vendor.

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          The NFC driver needs this information to select ECC
> +          algorithms supported by the boot ROM.
> +          Only used in combination with 'nand-is-boot-medium'.

No need to state what's captured with constraints.

> +
> +      meson,boot-page-step:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          The NFC driver needs this information to select ECC
> +          algorithms supported by the boot ROM.
> +          Only used in combination with 'nand-is-boot-medium'.

step is in blocks/pages/bytes?

> +
>      unevaluatedProperties: false
>  
>      dependencies:
>        nand-ecc-strength: [nand-ecc-step-size]
>        nand-ecc-step-size: [nand-ecc-strength]
> +      meson,boot-page-last: [nand-is-boot-medium]
> +      meson,boot-page-step: [nand-is-boot-medium]

I assume both properties must be present? If so:

meson,boot-page-last: ['meson,boot-page-step']
meson,boot-page-step: ['meson,boot-page-last']

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
