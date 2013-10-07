Date: Mon, 7 Oct 2013 12:40:30 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v7 5/6] ARM: dts: AM33xx: updated default ECC scheme in
 nand-ecc-opt
Message-ID: <20131007114029.GC15365@e106331-lin.cambridge.arm.com>
References: <1380916188-24206-1-git-send-email-pekon@ti.com>
 <1380916188-24206-6-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1380916188-24206-6-git-send-email-pekon@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "tony@atomide.com" <tony@atomide.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
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

On Fri, Oct 04, 2013 at 08:49:47PM +0100, Pekon Gupta wrote:
> DT property values for OMAP based gpmc-nand have been updated
> to match changes in commit:
> 	6faf096 ARM: OMAP2+: cleaned-up DT support of various ECC schemes
> Refer: Documentation/devicetree/bindings/mtd/gpmc-nand.txt

Doesn't this mean these dts were broken between the changes to the
driver and the changes to the dts?

I think the existing properties need to continue to be supoprted for
backwards compatibility. The dts can be fixed up to have the preferred
binding style, but they shouldn't _have_ to be modified to continue to
function...

Thanks,
Mark.

> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  arch/arm/boot/dts/am335x-evm.dts   | 3 +--
>  arch/arm/boot/dts/omap3430-sdp.dts | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-evm.dts b/arch/arm/boot/dts/am335x-evm.dts
> index e8ec875..1aee6ac 100644
> --- a/arch/arm/boot/dts/am335x-evm.dts
> +++ b/arch/arm/boot/dts/am335x-evm.dts
> @@ -269,7 +269,6 @@
>  				reg = <0 0 0>; /* CS0, offset 0 */
>  				nand-bus-width = <8>;
>  				ti,nand-ecc-opt = "bch8";
> -				gpmc,device-nand = "true";
>  				gpmc,device-width = <1>;
>  				gpmc,sync-clk-ps = <0>;
>  				gpmc,cs-on-ns = <0>;
> @@ -296,7 +295,7 @@
>  
>  				#address-cells = <1>;
>  				#size-cells = <1>;
> -				elm_id = <&elm>;
> +				ti,elm-id = <&elm>;
>  
>  				/* MTD partition table */
>  				partition@0 {
> diff --git a/arch/arm/boot/dts/omap3430-sdp.dts b/arch/arm/boot/dts/omap3430-sdp.dts
> index e2249bc..501f863 100644
> --- a/arch/arm/boot/dts/omap3430-sdp.dts
> +++ b/arch/arm/boot/dts/omap3430-sdp.dts
> @@ -105,7 +105,7 @@
>  		reg = <1 0 0x08000000>;
>  		nand-bus-width = <8>;
>  
> -		ti,nand-ecc-opt = "sw";
> +		ti,nand-ecc-opt = "ham1";
>  		gpmc,cs-on-ns = <0>;
>  		gpmc,cs-rd-off-ns = <36>;
>  		gpmc,cs-wr-off-ns = <36>;
> -- 
> 1.8.1
> 
> 
