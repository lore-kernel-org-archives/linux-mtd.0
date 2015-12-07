Message-ID: <1449462852.9118.25.camel@mhfsdcap03>
Subject: Re: [PATCH] arm64: dts: mt8173: Add nor flash node
From: bayi cheng <bayi.cheng@mediatek.com>
To: Daniel Kurtz <djkurtz@chromium.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, "open list:OPEN FIRMWARE AND..."
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>
Date: Mon, 7 Dec 2015 12:34:12 +0800
In-Reply-To: <CAGS+omCuB3VGcPk3fezakdVDnFB3GAmMD+wZ_6nGdv+uHoB40g@mail.gmail.com>
References: <1449460394-31601-1-git-send-email-bayi.cheng@mediatek.com>
 <CAGS+omCuB3VGcPk3fezakdVDnFB3GAmMD+wZ_6nGdv+uHoB40g@mail.gmail.com>
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

On Mon, 2015-12-07 at 12:09 +0800, Daniel Kurtz wrote:
> Bayi,
> 
> On Mon, Dec 7, 2015 at 11:53 AM, Bayi Cheng <bayi.cheng@mediatek.com> wrote:
> > Add Mediatek nor flash node
> >
> > Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> > Acked-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> > Previous version of this patch is
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/386005.html
> > Drop flash node from mt8173.dtsi accroding review comment
> 
> Is there a flash on mt8173-evb that can be accessed by the nor_flash ?
> If so, can you include flash@0 node in the mt8173-evb.dts.
> 
> -Dan
> 
Hi Daniel, Thanks for your comments! you are right, there is a flash on
mt8173-evb which can be accessed by the nor_flash, and I will include
flash@0 node in mt8173-evb.dts (kernel v3.18) too.

Bayi
> >
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index 4dd5f93..af08e97 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -387,6 +387,17 @@
> >                         status = "disabled";
> >                 };
> >
> > +               nor_flash: spi@1100d000 {
> > +                       compatible = "mediatek,mt8173-nor";
> > +                       reg = <0 0x1100d000 0 0xe0>;
> > +                       clocks = <&pericfg CLK_PERI_SPI>,
> > +                                <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> > +                       clock-names = "spi", "sf";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       status = "disabled";
> > +               };
> > +
> >                 i2c3: i2c@11010000 {
> >                         compatible = "mediatek,mt8173-i2c";
> >                         reg = <0 0x11010000 0 0x70>,
> > --
> > 1.8.1.1.dirty
> >
