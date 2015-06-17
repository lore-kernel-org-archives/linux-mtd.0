Date: Wed, 17 Jun 2015 14:19:20 +0200
From: Pavel Machek <pavel@denx.de>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 11/11] dt: Exynos: add Snow SPI NOR node.
Message-ID: <20150617121920.GB20728@amd>
References: <cover.1433364398.git.hramrach@gmail.com>
 <3234c12c90eabbeeb6d33604a324231937e309ec.1433364398.git.hramrach@gmail.com>
 <556FB222.2070406@samsung.com> <201506041720.54666.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201506041720.54666.marex@denx.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-mtd@lists.infradead.org,
 Alison Chaiken <alison_chaiken@mentor.com>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 Michal Suchanek <hramrach@gmail.com>, Russell King <linux@arm.linux.org.uk>,
 Vinod Koul <vinod.koul@intel.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
 Ben Hutchings <ben@decadent.org.uk>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 "grmoore@altera.com" <grmoore@altera.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@freescale.com>,
 Knut Wohlrab <knut.wohlrab@de.bosch.com>, dmaengine@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu 2015-06-04 17:20:54, Marek Vasut wrote:
> On Thursday, June 04, 2015 at 04:04:18 AM, Krzysztof Kozlowski wrote:
> > On 04.06.2015 06:26, Michal Suchanek wrote:
> > > The Snow has onboard SPI NOR flash which contains the bootloader.
> > > 
> > > Add DT node for this flash chip. The flash is rated 133MHz but the pl330
> > > controller can transfer only up to 128 bytes at this speed so use more
> > > conservative settings. Even at 40MHz pl330 can transfer at most 64k with
> > > the current driver.
> > > 
> > > Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> > > ---
> > > 
> > >  arch/arm/boot/dts/exynos5250-snow.dts | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/exynos5250-snow.dts
> > > b/arch/arm/boot/dts/exynos5250-snow.dts index 1fa72cf..38e4cda 100644
> > > --- a/arch/arm/boot/dts/exynos5250-snow.dts
> > > +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> > > @@ -691,6 +691,18 @@
> > > 
> > >  	num-cs = <1>;
> > >  	cs-gpios = <&gpa2 5 0>;
> > >  	status = "okay";
> > > 
> > > +		flash: m25p80@0 {
> > 
> > The indentation looks odd. This should be at the same level as "status".
> > 
> > > +			#address-cells = <1>;
> > > +			#size-cells = <1>;
> > > +			compatible = "jedec,spi-nor";
> > > +			reg = <0>;
> > > +			spi-max-frequency = <40000000>;
> > 
> > So actually you wanted 133 MHz but as a workaround for DMA issue you use
> > 40 MHz, right? Could you add here a small TODO note in comment about it?
> 
> I disagree. There is a problem, the problem should actually be analyzed and 
> fixed, not just postponed with some TODO nonsense.

Of course, that would be preferable if submitter has time. But OTOH
slow SPI is probably better than no SPI at all, and debugging this can
be nasty. I think that TODO is suitable.
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
