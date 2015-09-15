Message-ID: <1442300021.27250.10.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] doc: dt: add documentation for Mediatek spi-nor
 controller
From: bayi.cheng <bayi.cheng@mediatek.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "Ian
 Campbell" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "Daniel Kurtz"
 <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Date: Tue, 15 Sep 2015 14:53:41 +0800
In-Reply-To: <20150911214907.GE11487@google.com>
References: <1441705796-11365-1-git-send-email-bayi.cheng@mediatek.com>
 <1441705796-11365-2-git-send-email-bayi.cheng@mediatek.com>
 <20150911214907.GE11487@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-09-11 at 14:49 -0700, Brian Norris wrote:
> One more thing:
> 
> On Tue, Sep 08, 2015 at 05:49:54PM +0800, Bayi Cheng wrote:
> > +- clocks: spi nor source clock
> 
> ^^ you only list one clock here
> 
Ok, I will add other clocks
> > +- clock-names: "spi_clk", "axi_clk", "mux_clk", "sf_clk"
> 
> But you have 4 names here.
> 
> ...
> > +	clocks = <&pericfg CLK_PERI_SPI>,
> > +		 <&topckgen CLK_TOP_AXI_SEL>,
> > +		 <&topckgen CLK_TOP_UNIVPLL2_D8>,
> > +		 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> 
> And you provide 4 clocks.
> 
> > +	clock-names = "spi_clk", "axi_clk", "mux_clk", "sf_clk";
> 
> Please list all 4 under the "clocks" property, not just under the
> "clock-names" property.
> 
OK,  Thanks for your remind!
> Brian
