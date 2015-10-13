Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm1Lw-0006gn-4h
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 15:19:00 +0000
Date: Tue, 13 Oct 2015 08:18:33 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 ezequiel@vanguardiasur.com.ar, javier@dowhile0.org, fcooper@ti.com,
 nsekhar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 27/27] ARM: dts: omap3: Fix gpmc and NAND nodes
Message-ID: <20151013151832.GW23801@atomide.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
 <1442588029-13769-28-git-send-email-rogerq@ti.com>
 <20151013004335.GU23801@atomide.com> <561CA4C3.4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <561CA4C3.4@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [151012 23:33]:
> On 13/10/15 03:43, Tony Lindgren wrote:
> > * Roger Quadros <rogerq@ti.com> [150918 08:00]:
> >> Add compatible id, GPMC register resource and interrupt
> >> resource to NAND controller nodes.
> >>
> >> The GPMC driver now implements gpiochip and irqchip so
> >> enable gpio-controller and interrupt-controller properties.
> >>
> >> With this the interrupt parent of NAND node changes so fix it
> >> accordingly.
> > ...
> >> --- a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> >> +++ b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
> >> @@ -35,11 +35,14 @@
> >>  };
> >>  
> >>  &gpmc {
> >> -	ranges = <0 0 0x00000000 0x1000000>;	/* CS0: 16MB for NAND */
> >> +	ranges = <0 0 0x08000000 0x1000000>;	/* CS0: 16MB for NAND */
> >>  
> >>  	nand@0,0 {
> >> -		linux,mtd-name = "micron,mt29f4g16abbda3w";
> >> +		compatible = "ti,omap2-nand";
> >>  		reg = <0 0 4>; /* CS0, offset 0, IO size 4 */
> >> +		interrupt-parent = <&intc>;
> >> +		interrupts = <20>;
> >> +		linux,mtd-name = "micron,mt29f4g16abbda3w";
> >>  		nand-bus-width = <16>;
> >>  		ti,nand-ecc-opt = "bch8";
> >>  		gpmc,sync-clk-ps = <0>;
> > 
> > At least torpedo breaks for NFSroot as NAND now overlaps with
> > Ethernet.. What's the policy you have for moving the addresses
> > around?
> 
> For OMAP3 I intended to use 0x30000000 for NAND but incorrectly
> used 0x08000000 for the torpedo.

Might be worth adding some documentation of suggested standardized
mappings.. For most of theme we could just add them as 16MB chunks,
then reserve some larger area for NOR?

> Does setting it to 0x30000000 work? If not what is the original
> NAND address for this board?

The u-boot addresses are probably what were used in the .dts* files.
Setting NAND to 0x30000000 is not enough though, looks like there's
a bug where the logicpd-torpedo-37xx-devkit.dts ranges is missing
the NAND range in logicpd-torpedo-som.dtsi. Something like the
patch below seems to make things work again, might be worth
checking what ranges make sense to standardize on though. Please
feel free to fold it into your patches.

> > There may be other similar cases to check too.
> 
> Just checked that all other OMAP3 boards I've set to 0x30000000
> if they were 0x0.

Do you want to reserve a large chunk for NOR at cs0 or what's
the reason for picking 0x30000000 for NAND?

I guess NOR can be also on other chipselects.. Not sure we can
standardize on any specific partition scheme?

Regards,

Tony

8< --------------------
--- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
+++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
@@ -73,7 +73,8 @@
 };
 
 &gpmc {
-	ranges = <1 0 0x08000000 0x1000000>;	/* CS1: 16MB for LAN9221 */
+	ranges = <0 0 0x30000000 0x1000000	/* CS0: 16MB for NAND */
+		  1 0 0x2c000000 0x1000000>;	/* CS1: 16MB for LAN9221 */
 
 	ethernet@gpmc {
 		pinctrl-names = "default";
--- a/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
+++ b/arch/arm/boot/dts/logicpd-torpedo-som.dtsi
@@ -35,7 +35,7 @@
 };
 
 &gpmc {
-	ranges = <0 0 0x08000000 0x1000000>;	/* CS0: 16MB for NAND */
+	ranges = <0 0 0x30000000 0x1000000>;	/* CS0: 16MB for NAND */
 
 	nand@0,0 {
 		compatible = "ti,omap2-nand";
