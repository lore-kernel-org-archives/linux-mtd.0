Message-ID: <1448505773.9118.19.camel@mhfsdcap03>
Subject: Re: [PATCH v8 2/2] arm64: dts: mt8173: Add nor flash node
From: bayi cheng <bayi.cheng@mediatek.com>
To: Daniel Kurtz <djkurtz@chromium.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll
 <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, <jteki@openedev.com>,
 <ezequiel@vanguardiasur.com.ar>
Date: Thu, 26 Nov 2015 10:42:53 +0800
In-Reply-To: <CAGS+omBVfc=BPLoobOJSDPnbv97PnGsRxUTF1gbXEz4DeufbmQ@mail.gmail.com>
References: <1447817403-16631-1-git-send-email-bayi.cheng@mediatek.com>
 <1447817403-16631-3-git-send-email-bayi.cheng@mediatek.com>
 <CAGS+omBVfc=BPLoobOJSDPnbv97PnGsRxUTF1gbXEz4DeufbmQ@mail.gmail.com>
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

On Thu, 2015-11-26 at 09:20 +0800, Daniel Kurtz wrote:
> Hi Bayi, Matthias,
> 
> Sorry for the late review, one comment below...
> 
> On Wed, Nov 18, 2015 at 11:30 AM, Bayi Cheng <bayi.cheng@mediatek.com> wrote:
> > Add Mediatek nor flash node
> >
> > Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> > Acked-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 18 +++++++++++++++++-
> >  1 file changed, 17 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index 4dd5f93..7988656 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -387,7 +387,23 @@
> >                         status = "disabled";
> >                 };
> >
> > -               i2c3: i2c@11010000 {
> > +               nor_flash: spi@1100d000 {
> > +                       compatible = "mediatek,mt8173-nor";
> > +                       reg = <0 0x1100d000 0 0xe0>;
> > +                       clocks = <&pericfg CLK_PERI_SPI>,
> > +                                <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> > +                       clock-names = "spi", "sf";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       status = "disabled";
> > +
> > +                       flash@0 {
> > +                               compatible = "jedec,spi-nor";
> > +                               reg = <0>;
> > +                       };
> 
> I think this flash@0 node represents the flash device present on the
> board and should therefore be moved to the board-specific .dts.
> 
> -Dan
> 
Hi Daniel, Thanks for your comments, and I will fixed it in the next
patch.
> > +               };
> > +
> > +               i2c3: i2c3@11010000 {
> >                         compatible = "mediatek,mt8173-i2c";
> >                         reg = <0 0x11010000 0 0x70>,
> >                               <0 0x11000280 0 0x80>;
> > --
> > 1.8.1.1.dirty
> >
