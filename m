Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXNaU-0003Z2-Np
 for linux-mtd@lists.infradead.org; Tue, 18 Jul 2017 08:10:38 +0000
Received: by mail-wr0-x22a.google.com with SMTP id a10so17559088wrd.0
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2017 01:10:12 -0700 (PDT)
Date: Tue, 18 Jul 2017 09:10:09 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com
Subject: Re: [PATCH 1/3] mfd: syscon: update Atmel SMC binding doc
Message-ID: <20170718081009.modpwyzd6klhvmh6@dell>
References: <20170711074015.30440-1-ludovic.desroches@microchip.com>
 <20170711074015.30440-2-ludovic.desroches@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170711074015.30440-2-ludovic.desroches@microchip.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 11 Jul 2017, Ludovic Desroches wrote:

> A new compatible string is introduced for SMC on sama5d2 to manage a
> different layout of the registers.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-smc.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/atmel-smc.txt b/Documentation/devicetree/bindings/mfd/atmel-smc.txt
> index 26eeed373934..1103ce2030fb 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-smc.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-smc.txt
> @@ -8,6 +8,7 @@ Required properties:
>  - compatible:		Should be one of the following
>  			"atmel,at91sam9260-smc", "syscon"
>  			"atmel,sama5d3-smc", "syscon"
> +			"atmel,sama5d2-smc", "syscon"
>  - reg:			Contains offset/length value of the SMC memory
>  			region.
>  

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
