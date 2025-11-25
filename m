Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7030CFD373
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Nov 2025 03:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dgxZT8gmArqb6TYZjzRB7CS2fRQAdNPczoGU8wuBLfo=; b=Qo6YSAE4KY53PK
	Q3JspS9CST/DWgqQzrHPDXKQ9DzzOwlgWf6Mk+osj4BbPCqTmYmydtJamztxIKdbpAuchfyEToUfi
	yJIPedsf9FwKrfe778sliSQfXbGoIev0No2H74nHfkMcgus9MV37Mm1qFE8ae3bePREkEqFJ3sqVV
	EkTH45Y8tr/ex1PfrVjY5CyNjutl8ix8KCUWLj7MYpPUfCKnWnswgUFsxMw2FALMqylVRI21pVKvp
	ODKXswHTHwXizsfHmSESezH+MQ0LZPPpLDy2gRycd8X2/uJgSj9H8e4V+La7OlbbCFEQMyWHk7eVr
	o/MwkD9EbkryOp5AbmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNja7-0000000CfJf-3bJO;
	Tue, 25 Nov 2025 03:19:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNja5-0000000CfJM-2gPD;
	Tue, 25 Nov 2025 03:19:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE84560010;
	Tue, 25 Nov 2025 03:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FB4C4CEF1;
	Tue, 25 Nov 2025 03:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764040743;
	bh=vIDD8LFY77iXhoHeON2MfwV+2avvRETkcShcf+gI2PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhI68gn7YzIa81JBKpRwugug9zQIwWklnQcKcl+bhfiTyzV8YPZFR1iphY18FBlYY
	 MSgGHzQPxs3iQwec3bYO5/WJa7Hzs/Gkm8TAWJDJpyNG8R/aYr/WTxriuzerpXET1t
	 Fl7WM0jX+9xgziH7Wk0qIdmB6TYhU8vIRrGKEJSAln8inz7pQ3hrE5o4JqL1awD3My
	 0UuN57Z82T9Hp2yQ4Sxx414CTxj2rGeQBto/VYC6byfeVXGklzJnAwSVNtZtR7menA
	 dUiPGj1oFmlt/bDiWL6gi1DJ1F9vsYsCfQlOK1h7s6wEkXJIq83XxivUkI3z3lnhaJ
	 6I0IlrYeOcpqw==
Date: Mon, 24 Nov 2025 21:19:01 -0600
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
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
Subject: Re: [PATCH v2 2/3] dt-bindings: mtd: physmap: Allow using
 memory-region to access memory resources
Message-ID: <20251125031901.GA1580653-robh@kernel.org>
References: <20251121-mtd-memregion-v2-0-c5535fdcebe4@bootlin.com>
 <20251121-mtd-memregion-v2-2-c5535fdcebe4@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121-mtd-memregion-v2-2-c5535fdcebe4@bootlin.com>
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

On Fri, Nov 21, 2025 at 04:42:36PM +0100, Gregory CLEMENT wrote:
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
> index 1b375dee83b0c..323e89aacaacd 100644
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
> +    memlog {
> +        compatible = "mtd-mem";
> +        memory-region = <&mem_log>;
> +        bank-width = <4>;
> +        device-width = <1>;
> +    };

To repeat v1 comment:

> If we do keep this, I'd rather just add the properties below into the
> /reserved-memory node itself. Devices are created for those nodes if
> they have 'compatible'.

To put it another way, see the ramoops binding and copy that.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
