Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvLoE-0000Mv-BM
 for linux-mtd@lists.infradead.org; Fri, 13 Jun 2014 07:21:58 +0000
Date: Fri, 13 Jun 2014 00:21:30 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 10/36] ARM: dts: OMAP2+: Fix NAND device nodes
Message-ID: <20140613072129.GL17845@atomide.com>
References: <1402477001-31132-1-git-send-email-rogerq@ti.com>
 <1402477001-31132-11-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402477001-31132-11-git-send-email-rogerq@ti.com>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 linux-mtd@lists.infradead.org, pekon@ti.com,
 ezequiel.garcia@free-electrons.com, javier@dowhile0.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [140611 01:58]:
> Add compatible id, GPMC register resource and interrupt
> resource to NAND controller nodes.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  arch/arm/boot/dts/am335x-evm.dts         |  8 ++++++--
>  arch/arm/boot/dts/am335x-igep0033.dtsi   |  8 ++++++--
>  arch/arm/boot/dts/am43x-epos-evm.dts     |  8 ++++++--
>  arch/arm/boot/dts/omap3-devkit8000.dts   |  9 +++++++--
>  arch/arm/boot/dts/omap3-evm-37xx.dts     | 10 +++++++---
>  arch/arm/boot/dts/omap3-igep0020.dts     | 10 +++++++---
>  arch/arm/boot/dts/omap3-igep0030.dts     |  8 ++++++--
>  arch/arm/boot/dts/omap3-ldp.dts          | 10 +++++++---
>  arch/arm/boot/dts/omap3-lilly-a83x.dtsi  | 10 +++++++---
>  arch/arm/boot/dts/omap3-lilly-dbb056.dts |  7 ++++---
>  arch/arm/boot/dts/omap3430-sdp.dts       |  8 ++++++--
>  11 files changed, 69 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
> index 6028217..fa25f2b 100644
> --- a/arch/arm/boot/dts/am335x-evm.dts
> +++ b/arch/arm/boot/dts/am335x-evm.dts
> @@ -437,9 +437,13 @@
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&nandflash_pins_s0>;
> -	ranges = <0 0 0x08000000 0x10000000>;	/* CS0: NAND */
> +	ranges = <0 0 0x08000000 0x10000000	/* CS0 space, 16MB */
> +		  255 0 0x50000000 0x36c>;	/* GPMC reg */

And here too let's not let the NAND driver tinker with the GPMC
registers.

Tony
