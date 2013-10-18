Date: Fri, 18 Oct 2013 11:59:17 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v9 1/9] mtd: nand: omap: combine different flavours of
 1-bit hamming ecc schemes
Message-ID: <20131018105917.GE29779@e106331-lin.cambridge.arm.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
 <1381816197-20477-2-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381816197-20477-2-git-send-email-pekon@ti.com>
Content-Language: en-US
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 "balbi@ti.com" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Tue, Oct 15, 2013 at 06:49:49AM +0100, Pekon Gupta wrote:
> OMAP NAND driver currently supports multiple flavours of 1-bit Hamming
> ecc-scheme, like:
> - OMAP_ECC_HAMMING_CODE_DEFAULT
> 	1-bit hamming ecc code using software library
> - OMAP_ECC_HAMMING_CODE_HW
> 	1-bit hamming ecc-code using GPMC h/w engine
> - OMAP_ECC_HAMMING_CODE_HW_ROMCODE
> 	1-bit hamming ecc-code using GPMC h/w engin with ecc-layout compatible
> 	to ROM code.
> 
> This patch combines above multiple ecc-schemes into single implementation:
> - OMAP_ECC_HAM1_CODE_HW
> 	1-bit hamming ecc-code using GPMC h/w engine with ROM-code compatible
> 	ecc-layout.
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> Reviewed-by: Felipe Balbi <balbi@ti.com>
> Acked-by: Tony Lindgren <tony@atomide.com>
> ---
>  Documentation/devicetree/bindings/mtd/gpmc-nand.txt | 8 ++++----
>  arch/arm/mach-omap2/board-flash.c                   | 2 +-
>  arch/arm/mach-omap2/gpmc.c                          | 4 +---
>  drivers/mtd/nand/omap2.c                            | 9 +++------
>  include/linux/platform_data/mtd-nand-omap2.h        | 6 +-----
>  5 files changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> index df338cb..25ee232 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
> @@ -22,10 +22,10 @@ Optional properties:
>  				width of 8 is assumed.
>  
>   - ti,nand-ecc-opt:		A string setting the ECC layout to use. One of:
> -
> -		"sw"		Software method (default)
> -		"hw"		Hardware method
> -		"hw-romcode"	gpmc hamming mode method & romcode layout
> +		"sw"		<deprecated> use "ham1" instead
> +		"hw"		<deprecated> use "ham1" instead
> +		"hw-romcode"	<deprecated> use "ham1" instead
> +		"ham1"		1-bit Hamming ecc code
>  		"bch4"		4-bit BCH ecc code
>  		"bch8"		8-bit BCH ecc code

[...]

> diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
> index 579697a..c9fb353 100644
> --- a/arch/arm/mach-omap2/gpmc.c
> +++ b/arch/arm/mach-omap2/gpmc.c
> @@ -1342,9 +1342,7 @@ static void __maybe_unused gpmc_read_timings_dt(struct device_node *np,
>  #ifdef CONFIG_MTD_NAND
>  
>  static const char * const nand_ecc_opts[] = {
> -	[OMAP_ECC_HAMMING_CODE_DEFAULT]		= "sw",
> -	[OMAP_ECC_HAMMING_CODE_HW]		= "hw",
> -	[OMAP_ECC_HAMMING_CODE_HW_ROMCODE]	= "hw-romcode",
> +	[OMAP_ECC_HAM1_CODE_HW]			= "ham1",
>  	[OMAP_ECC_BCH4_CODE_HW]			= "bch4",
>  	[OMAP_ECC_BCH8_CODE_HW]			= "bch8",
>  };

As the parsing isn't updated until the next patch, doesn't this
temporarily break DTBs with the deprecated ti,nand-ecc-opt values?

Thanks,
Mark.
