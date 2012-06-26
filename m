From: Marek Vasut <marex@denx.de>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] mtd/m25p80: add device tree probe support
Date: Tue, 26 Jun 2012 13:47:01 +0200
References: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
 <201206251850.10839.marex@denx.de>
 <20120626081546.GB4928@S2101-09.ap.freescale.net>
In-Reply-To: <20120626081546.GB4928@S2101-09.ap.freescale.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201206261347.01995.marex@denx.de>
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

Dear Shawn Guo,

> On Mon, Jun 25, 2012 at 06:50:10PM +0200, Marek Vasut wrote:
> > 116                         ssp2: ssp@80014000 {
> > 117                                 #address-cells = <1>;
> > 118                                 #size-cells = <0>;
> > 119                                 compatible = "fsl,imx28-spi";
> > 120                                 pinctrl-names = "default";
> > 121                                 pinctrl-0 = <&spi2_pins_a>;
> > 122                                 status = "okay";
> > 123
> > 124                                 flash: m25p80@0 {
> > 125                                         #address-cells = <1>;
> > 126                                         #size-cells = <1>;
> > 127                                         compatible = "m25p80";
> > 128                                         spi-max-frequency =
> > <25000000>; 129                                         reg = <0>;
> > 130                                 };
> > 131                         };
> > 
> > I use this + my SPI patches I submitted recently.
> 
> I do not have the flash on my imx28-evk board, but I just tested on
> imx6q-sabrelite, and yes, it can be probed without the patch.  I'm
> fine then.

Good, let's discard this patch and close this issue :-)

Best regards,
Marek Vasut
