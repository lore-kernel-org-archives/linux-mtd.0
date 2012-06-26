Date: Tue, 26 Jun 2012 16:15:49 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd/m25p80: add device tree probe support
Message-ID: <20120626081546.GB4928@S2101-09.ap.freescale.net>
References: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
 <201206251801.22385.marex@denx.de>
 <20120625161506.GH2342@S2101-09.ap.freescale.net>
 <201206251850.10839.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <201206251850.10839.marex@denx.de>
Cc: manu <manuel.pezzin@free.fr>, patches@linaro.org,
 devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <artem.bityutskiy@intel.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 25, 2012 at 06:50:10PM +0200, Marek Vasut wrote:
> 116                         ssp2: ssp@80014000 {
> 117                                 #address-cells = <1>;
> 118                                 #size-cells = <0>;
> 119                                 compatible = "fsl,imx28-spi";
> 120                                 pinctrl-names = "default";
> 121                                 pinctrl-0 = <&spi2_pins_a>;
> 122                                 status = "okay";
> 123 
> 124                                 flash: m25p80@0 {
> 125                                         #address-cells = <1>;
> 126                                         #size-cells = <1>;
> 127                                         compatible = "m25p80";
> 128                                         spi-max-frequency = <25000000>;
> 129                                         reg = <0>;
> 130                                 };
> 131                         };
> 
> I use this + my SPI patches I submitted recently.
> 
I do not have the flash on my imx28-evk board, but I just tested on
imx6q-sabrelite, and yes, it can be probed without the patch.  I'm
fine then.

-- 
Regards,
Shawn
