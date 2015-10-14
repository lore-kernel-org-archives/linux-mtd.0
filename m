Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmMDM-00005W-Nd
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2015 13:35:33 +0000
Subject: Re: [PATCH v3 20/27] ARM: dts: dra7: Fix NAND device nodes.
To: Roger Quadros <rogerq@ti.com>, <tony@atomide.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
 <1442588029-13769-21-git-send-email-rogerq@ti.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Franklin S Cooper Jr." <fcooper@ti.com>
Message-ID: <561E59F0.8080906@ti.com>
Date: Wed, 14 Oct 2015 08:34:40 -0500
MIME-Version: 1.0
In-Reply-To: <1442588029-13769-21-git-send-email-rogerq@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 09/18/2015 09:53 AM, Roger Quadros wrote:
> Add compatible id, GPMC register resource and interrupt
> resource to NAND controller nodes.
>
> The GPMC driver now implements gpiochip and irqchip so
> enable gpio-controller and interrupt-controller properties.
>
> With this the interrupt parent of NAND node changes so fix it
> accordingly.
>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> ---
>  arch/arm/boot/dts/dra7-evm.dts  | 5 ++++-
>  arch/arm/boot/dts/dra7.dtsi     | 4 ++++
>  arch/arm/boot/dts/dra72-evm.dts | 5 ++++-
>  3 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
> index a6c82e5..8a31161 100644
> --- a/arch/arm/boot/dts/dra7-evm.dts
> +++ b/arch/arm/boot/dts/dra7-evm.dts
> @@ -585,9 +585,12 @@
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&nand_flash_x16>;
> -	ranges = <0 0 0 0x01000000>;	/* minimum GPMC partition = 16MB */
> +	ranges = <0 0 0x08000000 0x01000000>;	/* minimum GPMC partition = 16MB */
>  	nand@0,0 {
> +		compatible = "ti,omap2-nand";
>  		reg = <0 0 4>;		/* device IO registers */
> +		interrupt-parent = <&crossbar_mpu>;
> +		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
>  		ti,nand-ecc-opt = "bch8";
>  		ti,elm-id = <&elm>;
>  		nand-bus-width = <16>;
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> index 5d65db9..f0a3616 100644
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -1389,6 +1389,10 @@
>  			gpmc,num-waitpins = <2>;
>  			#address-cells = <2>;
>  			#size-cells = <1>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
>  			status = "disabled";
>  		};
Based on the discussion on my patchset I noticed that the nand node defines the
interrupt but it is also defined in the parent node. Similar to the dma channel we
should conclude where the best place for it to be defined.  But to me it seems at
least it should only be defined once.

This is true for your other patches making similar changes to the dt.
>  
> diff --git a/arch/arm/boot/dts/dra72-evm.dts b/arch/arm/boot/dts/dra72-evm.dts
> index 6f6bd98..245f5f9 100644
> --- a/arch/arm/boot/dts/dra72-evm.dts
> +++ b/arch/arm/boot/dts/dra72-evm.dts
> @@ -395,13 +395,16 @@
>  	status = "okay";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&nand_default>;
> -	ranges = <0 0 0 0x01000000>;	/* minimum GPMC partition = 16MB */
> +	ranges = <0 0 0x08000000 0x01000000>;	/* minimum GPMC partition = 16MB */
>  	nand@0,0 {
>  		/* To use NAND, DIP switch SW5 must be set like so:
>  		 * SW5.1 (NAND_SELn) = ON (LOW)
>  		 * SW5.9 (GPMC_WPN) = OFF (HIGH)
>  		 */
> +		compatible = "ti,omap2-nand";
>  		reg = <0 0 4>;		/* device IO registers */
> +		interrupt-parent = <&crossbar_mpu>;
> +		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
>  		ti,nand-ecc-opt = "bch8";
>  		ti,elm-id = <&elm>;
>  		nand-bus-width = <16>;
