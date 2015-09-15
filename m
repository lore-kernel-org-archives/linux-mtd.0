Message-ID: <1442299185.27250.1.camel@mhfsdcap03>
Subject: Re: [PATCH 1/3] doc: dt: add documentation for Mediatek spi-nor
 controller
From: bayi.cheng <bayi.cheng@mediatek.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll
 <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Date: Tue, 15 Sep 2015 14:39:45 +0800
In-Reply-To: <20150909054734.GC18700@pengutronix.de>
References: <1441705796-11365-1-git-send-email-bayi.cheng@mediatek.com>
 <1441705796-11365-2-git-send-email-bayi.cheng@mediatek.com>
 <20150909054734.GC18700@pengutronix.de>
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

On Wed, 2015-09-09 at 07:47 +0200, Sascha Hauer wrote:
> On Tue, Sep 08, 2015 at 05:49:54PM +0800, Bayi Cheng wrote:
> > Add device tree binding documentation for serial flash with
> > Mediatek serial flash controller
> > 
> > Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/mtk_nor.txt | 25 +++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/mtk_nor.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/mtk_nor.txt b/Documentation/devicetree/bindings/mtd/mtk_nor.txt
> > new file mode 100644
> > index 0000000..0eca0cd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/mtk_nor.txt
> > @@ -0,0 +1,25 @@
> > +* MTD SPI nor driver for MTK MT81xx (and similar) serial flash controller
> > +
> > +MTK MT81xx serial flash controller is designed for serial Flash device.
> > +It supports one Flash device with signal mode, dual mode and quad mode.
> > +
> > +Required properties:
> > +- compatible: should be "mediatek,mt8173-nor";
> > +- reg: physical base address and length of the controller's register
> > +- clocks: spi nor source clock
> > +- clock-names: "spi_clk", "axi_clk", "mux_clk", "sf_clk"
> 
> Drop the _clk suffix. It's the clock-names property which already makes
> it clear that these are clock names.
> 
> Sascha
> 
> 
OK, I will drop the _clk suffix here!
