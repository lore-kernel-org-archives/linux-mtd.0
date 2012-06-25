From: Marek Vasut <marex@denx.de>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] mtd/m25p80: add device tree probe support
Date: Mon, 25 Jun 2012 18:50:10 +0200
References: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
 <201206251801.22385.marex@denx.de>
 <20120625161506.GH2342@S2101-09.ap.freescale.net>
In-Reply-To: <20120625161506.GH2342@S2101-09.ap.freescale.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201206251850.10839.marex@denx.de>
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

> On Mon, Jun 25, 2012 at 06:01:22PM +0200, Marek Vasut wrote:
> > Dear Shawn Guo,
> > 
> > > On Sat, Jun 23, 2012 at 04:15:18AM +0200, Marek Vasut wrote:
> > > > So is there any particular reason why this wasn't applied?
> > > 
> > > Let me remind Artem by resending the patch tomorrow.
> > 
> > Actually ... the SPI does have the heuristics to probe this chip without
> > the patch. But there was this discussion about them eventually being
> > removed. That was a point raised by you I think. Is that still valid?
> 
> That was a point raised by Grant.  IIRC, the reason I made the patch
> is my system does not probe the device without the patch.  I can
> retest, and if it's true that the patch is not necessarily needed,
> I will probably let it be.

116                         ssp2: ssp@80014000 {
117                                 #address-cells = <1>;
118                                 #size-cells = <0>;
119                                 compatible = "fsl,imx28-spi";
120                                 pinctrl-names = "default";
121                                 pinctrl-0 = <&spi2_pins_a>;
122                                 status = "okay";
123 
124                                 flash: m25p80@0 {
125                                         #address-cells = <1>;
126                                         #size-cells = <1>;
127                                         compatible = "m25p80";
128                                         spi-max-frequency = <25000000>;
129                                         reg = <0>;
130                                 };
131                         };

I use this + my SPI patches I submitted recently.

Best regards,
Marek Vasut
