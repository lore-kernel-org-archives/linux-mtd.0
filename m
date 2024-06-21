Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B8EC27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 06:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fV/Ah0jaTWwh6QQLxB91NO3AakEFMzTSLvJYDyOC+tQ=; b=BPS+bHa62T845F
	yw8jNcu3QxxLMeyQiBkAjlo6DOMtwUk22C/GOiufxzfKyUpJ39Fs0FV96otW4cqSMgwcRIacPfIXq
	NyTAopU9OqQcUA/9ra6VthGFOJ3IOSALAvcEOS2fPuv4NxlVmUwzy35sjmlyU6JV1u6T6Y8U7Jc9E
	yts0/0zULCzGRq7H43G1+Sn6k4cgXC5EEICUvQZmCZbgJmvbN8fZnSAKD4EMgRSEJObCco53laDAF
	qqxKqcyCsL8QAWCs0t/0eu/3p002zUx4plpmVHpxZVeA0+htiCBkUXCw2ATgsJcc9knYFruLT7eHE
	UU+FFLhlN5Nhg4MICiEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXaY-00000007uXs-3Iho;
	Fri, 21 Jun 2024 06:17:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXaQ-00000007uTC-1Lic;
	Fri, 21 Jun 2024 06:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70D9062411;
	Fri, 21 Jun 2024 06:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0083FC2BBFC;
	Fri, 21 Jun 2024 06:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950645;
	bh=grR7DKj1v9NfUIVXQ/wA7b9FGj3wa+ylhebh9dYyMss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y6ZF7uWao4h0Z17eZa8wQq/f0CTLyIVLWxIxqI5M6ALQOA6cuCSaTBHAqQFZMZL+D
	 kDhCosVLaUyMk7fOJk+2lX7iobozai1v+8kmLHUPGKkI23lF3imFBxToa5NSjT5DCS
	 KRioXx8CNZhk3Uu3zcRwvplrSxVbhOXRtye772hXYPjghPx0xexG7eZG4pGMihkVbj
	 DAFrfCPCcM1MjpfKOlwj+PT/KlZjKjSh7lYyrfaoAmc1NZ3pXtpaJPCJJP4RQNnXUL
	 9Iue/Ar7rXj/FIW4StHM8iMP5BqjyvWpQ+nYQ+i5w2/ngX36xc6Zp9KtbZIwp8A4Ia
	 PexX5ULbTzcgA==
Message-ID: <6aafffd6-4c1f-4041-abe0-9b17d669467f@kernel.org>
Date: Fri, 21 Jun 2024 08:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 02/10] dt-bindings: dma: Add lpc32xx DMA mux binding
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>,
 Li Zetao <lizetao1@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_231726_525770_816F5972 
X-CRM114-Status: GOOD (  17.56  )
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

On 20/06/2024 19:56, Piotr Wojtaszczyk wrote:
> LPC32XX SoCs use pl080 dma controller which have few request signals
> multiplexed between peripherals. This binding describes how devices can
> use the multiplexed request signals.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>

> +
> +properties:
> +  "#dma-cells":
> +    const: 3
> +    description: |
> +      First two cells same as for device pointed in dma-masters.
> +      Third cell represents mux value for the request.
> +
> +  compatible:
> +    const: nxp,lpc3220-dmamux

Please put compatible first in the list of properties (and follow the
same order in "required"). It's the most important piece, so we want it
to be the first to see. It also follows the convention of DTS, where
compatible is expected to be first.

> +
> +  dma-masters:
> +    description: phandle to a dma node compatible with arm,pl080

maxItems: 1

> +
> +  reg:
> +    maxItems: 1

Keep reg after compatible.

> +
> +required:
> +  - compatible
> +  - reg
> +  - dma-masters
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@40004000 {
> +      compatible = "nxp,lpc3220-creg", "syscon", "simple-mfd";
> +      reg = <0x40004000 0x114>;
> +      ranges = <0 0x40004000 0x114>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;

Drop the node above (you will see Rob's warning). Alternatively, this
schema could skip the example and the nxp,lpc3220-creg could have one
complete example for entire device with children.

> +
> +      dma-router@7c {
> +        compatible = "nxp,lpc3220-dmamux";
> +        reg = <0x7c 0x8>;
> +        #dma-cells = <3>;
> +        dma-masters = <&dma>;
> +      };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aacccb376c28..f7adf9f66dfa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2396,6 +2396,15 @@ F:	drivers/usb/host/ohci-nxp.c
>  F:	drivers/watchdog/pnx4008_wdt.c
>  N:	lpc32xx
>  
> +ARM/LPC32XX DMAMUX SUPPORT

This should be just "LPC32XX DMAMUX SUPPORT"

> +M:	J.M.B. Downing <jonathan.downing@nautel.com>
> +M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> +R:	Vladimir Zapolskiy <vz@mleia.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> +N:	lpc32xx

I think this entry is only foor DMAMUX so the last "N:" is not appropriate.

You are welcomed to help maintaining the platform. Add yourself to
appropriate place of LPC32xx ARM.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
