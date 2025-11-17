Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89664CEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 18:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUhne39p93bwr9Q7IeZFN5EjkeiJCqM5lRZS5Ewlts8=; b=Vbd1oZRtNqYUGT
	B152eHy0OwRSs06vyAJZgxAGDFt1A9dJF3HOIH0XmnfFJr7bSYVGMaiNORvWGnflrNE/DNAvTo+3Y
	Y/KCoRNe2f9dOYhspuih3lys1COt0050mpkrLlrkUibFo2/4uxjNoFzf0gfD+Zs8xXY+vT7yfSAU7
	Dh9FforPCC6oDHYf3RBdoZadoqUT/LReNV2WxuJ3+flNe2zUE4d6BQscpPC8BiMe11ck1PY6vW14g
	fJvmoEc/rnF5880ABsdeS4Nl0GYt5rIRKa0lbQxG9CtZ3H2qn4Z1B5v6sZD934sI4WvpEkXhrpDt8
	sRETgT8U0KZKQKoStYiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3WE-0000000GZpF-1JuJ;
	Mon, 17 Nov 2025 18:00:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL3WA-0000000GZoT-3OHf;
	Mon, 17 Nov 2025 17:59:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1C54439FA;
	Mon, 17 Nov 2025 17:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD0AC2BCB2;
	Mon, 17 Nov 2025 17:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763402397;
	bh=zz92o1OZD/mEvjkXD1QCuckIGo1/cOITFNC020wMh5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7wTL+Kwv71q3PJg8tZNc2IK9+lrvGbk+0oKeD5VCy7QwY0k1lD2K7E59pyif5rUR
	 L3N4IVnNL5SsOkfK0N6LJ+xx0iyGzo4L3QR4Uhn/sm88vIPkvLIPNscM1WyBOLgZt4
	 vH0iKLhr99IU3X+m2M0d2qFfk0wx5uEEBn72RPNAJPgxHZZcwYgx1BdjPD+CMHqnQw
	 mVxQ6qcSixYgig27PIerRvK8nJ6kEwOhnh5L0AEtxBF+S6IqqezpH+fkk0bDS0xCa/
	 P0EZNo67g4ZzEERjC19H4ofT9fMsYXWmhHg8MNWp1fzbLcw1Lq5Rg4Pb1fBG+IPtzK
	 QOJHf8n3yHe1Q==
Date: Mon, 17 Nov 2025 11:59:55 -0600
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: mtd: physmap: Allow using memory-region
 to access memory resources
Message-ID: <20251117175955.GA225586-robh@kernel.org>
References: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
 <20251117-mtd-memregion-v1-2-7b35611c79a6@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117-mtd-memregion-v1-2-7b35611c79a6@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_095958_910781_1AC988B5 
X-CRM114-Status: GOOD (  20.27  )
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

On Mon, Nov 17, 2025 at 06:00:15PM +0100, Gregory CLEMENT wrote:
> Enable access to memory resources not only via I/O address using reg,
> but also through a portion of main memory using memory-region. To
> achieve this, new compatible strings have been introduced: mtd-mem and
> mtd-memro.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/mtd-physmap.yaml       | 59 +++++++++++++++-------
>  1 file changed, 40 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> index 1b375dee83b0c..0f75a1204b263 100644
> --- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> +++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
> @@ -13,10 +13,6 @@ description: |
>    Flash chips (Memory Technology Devices) are often used for solid state
>    file systems on embedded devices.
>  
> -allOf:
> -  - $ref: mtd.yaml#
> -  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
> -
>  properties:
>    compatible:
>      oneOf:
> @@ -61,6 +57,8 @@ properties:
>            - jedec-flash
>            - mtd-ram
>            - mtd-rom
> +          - mtd-mem
> +          - mtd-memro

I thought we had a flag for read only.

>  
>    reg:
>      description: |
> @@ -116,6 +114,10 @@ properties:
>      minItems: 1
>      maxItems: 8
>  
> +  memory-region:
> +    items:
> +      - description: Memory regions to map into mtd
> +
>    '#address-cells':
>      const: 1
>  
> @@ -129,21 +131,25 @@ properties:
>  
>  required:
>    - compatible
> -  - reg
> -
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: cortina,gemini-flash
> -then:
> -  properties:
> -    syscon:
> -      $ref: /schemas/types.yaml#/definitions/phandle
> -      description:
> -        Phandle to the syscon controller
> -  required:
> -    - syscon
> +
> +allOf:
> +  - $ref: mtd.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mtd-mem
> +              - mtd-memro
> +    then:
> +      required:
> +        - memory-region
> +      properties:
> +        addr-gpios: false
> +    else:
> +      $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
> +      required:
> +        - reg
>  
>  unevaluatedProperties: false
>  
> @@ -223,4 +229,19 @@ examples:
>              reg = <0 0x04000000>;
>          };
>      };
> +
> +  - |
> +    /* An example using mtd-mem */
> +    mem_logs: mem_logs@10000800 {
> +        reg = <0x1 0x0000800 0x0 0x000f800>;
> +        no-map;
> +    };
> +
> +    sram {

It's really an abuse of /reserved-memory to define regions outside of 
what's defined in /memory nodes (or whatever defines system memory). Is 
that the case here with the suspicious 'sram'?

If we do keep this, I'd rather just add the properties below into the 
/reserved-memory node itself. Devices are created for those nodes if 
they have 'compatible'.


> +        compatible = "mtd-mem";
> +        memory-region = <&mem_log>;
> +        bank-width = <4>;
> +        device-width = <1>;
> +    };
> +
>  ...
> 
> -- 
> 2.51.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
