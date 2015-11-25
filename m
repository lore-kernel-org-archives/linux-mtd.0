Message-ID: <1448449042.24527.0.camel@mtksdaap41>
Subject: Re: [PATCH v8 2/2] arm64: dts: mt8173: Add nor flash node
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Bayi Cheng <bayi.cheng@mediatek.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "Mark
 Rutland" <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>,
 <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-mediatek@lists.infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 "Kumar Gala" <galak@codeaurora.org>, <jteki@openedev.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 25 Nov 2015 18:57:22 +0800
In-Reply-To: <56559274.1090900@gmail.com>
References: <1447817403-16631-1-git-send-email-bayi.cheng@mediatek.com>
 <1447817403-16631-3-git-send-email-bayi.cheng@mediatek.com>
 <56559274.1090900@gmail.com>
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

On Wed, 2015-11-25 at 11:50 +0100, Matthias Brugger wrote:
> 
> On 18/11/15 04:30, Bayi Cheng wrote:
> > Add Mediatek nor flash node
> >
> > Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> > Acked-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 18 +++++++++++++++++-
> >   1 file changed, 17 insertions(+), 1 deletion(-)
> >
> 
> Applied to v4.5-next/dts
> 
> Thanks.
> Matthias
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index 4dd5f93..7988656 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -387,7 +387,23 @@
> >   			status = "disabled";
> >   		};
> >
> > -		i2c3: i2c@11010000 {
> > +		nor_flash: spi@1100d000 {
> > +			compatible = "mediatek,mt8173-nor";
> > +			reg = <0 0x1100d000 0 0xe0>;
> > +			clocks = <&pericfg CLK_PERI_SPI>,
> > +				 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> > +			clock-names = "spi", "sf";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			status = "disabled";
> > +
> > +			flash@0 {
> > +				compatible = "jedec,spi-nor";
> > +				reg = <0>;
> > +			};
> > +		};
> > +
> > +		i2c3: i2c3@11010000 {

Hi Matthias,

Just notice this one. Please make sure this line should be

i2c3: i2c@11010000 {

instead of

i2c3: i2c3@11010000 {

Joe.C
