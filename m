Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aeNde-0006zY-6C
 for linux-mtd@lists.infradead.org; Fri, 11 Mar 2016 14:02:00 +0000
Subject: Re: [PATCH v4 2/7] ARM: dts: am33xx: Fix GPMC dma properties
To: Franklin S Cooper Jr <fcooper@ti.com>, <nsekhar@ti.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <rogerq@ti.com>,
 <tony@atomide.com>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
 <1457654203-20856-3-git-send-email-fcooper@ti.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <56E2CF04.4020806@ti.com>
Date: Fri, 11 Mar 2016 15:58:28 +0200
MIME-Version: 1.0
In-Reply-To: <1457654203-20856-3-git-send-email-fcooper@ti.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/11/2016 01:56 AM, Franklin S Cooper Jr wrote:
> This patch updates the GPMC's DT DMA property to reflect the updated eDMA
> bindings.
> 
> Fixes: b5e509066074 ("ARM: DTS: am33xx: Use the new DT bindings for the eDMA3")

I have double checked the switch over to the new eDMA bindings when I sent it
and there were no gpmc node existed back then afaik.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> 
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> Version 4 changes:
> Split in its own commit. Uses correct syntax for Fixes
> 
>  arch/arm/boot/dts/am33xx.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> index 1fafaad..97471d6 100644
> --- a/arch/arm/boot/dts/am33xx.dtsi
> +++ b/arch/arm/boot/dts/am33xx.dtsi
> @@ -860,7 +860,7 @@
>  			ti,no-idle-on-init;
>  			reg = <0x50000000 0x2000>;
>  			interrupts = <100>;
> -			dmas = <&edma 52>;
> +			dmas = <&edma 52 0>;
>  			dma-names = "rxtx";
>  			gpmc,num-cs = <7>;
>  			gpmc,num-waitpins = <2>;
> 


-- 
Péter
