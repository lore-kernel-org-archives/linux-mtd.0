From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 08/11] MTD: m25p80: Add option to limit SPI transfer size.
Date: Wed, 15 Jul 2015 13:52:27 +0200
Cc: Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Alison Chaiken <alison_chaiken@mentor.com>, "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= (beanhuo)" <beanhuo@micron.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>,
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi" <linux-spi@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, Rob Herring <robh+dt@kernel.org>,
 Han Xu <han.xu@freescale.com>, Knut Wohlrab <knut.wohlrab@de.bosch.com>,
 dmaengine <dmaengine@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <cover.1433364398.git.hramrach@gmail.com>
 <20150604171547.GA1530@localhost.localdomain>
 <CAOMqctSCL9E-kCBryeaMvtssSP12RY=kyfPuwSYx9wc=Lv9kGQ@mail.gmail.com>
In-Reply-To: <CAOMqctSCL9E-kCBryeaMvtssSP12RY=kyfPuwSYx9wc=Lv9kGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201507151352.27689.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, July 15, 2015 at 11:45:07 AM, Michal Suchanek wrote:
> On 4 June 2015 at 19:15, Richard Cochran <richardcochran@gmail.com> wrote:
> > On Thu, Jun 04, 2015 at 10:31:45AM +0200, Michal Suchanek wrote:
> >> You might want to try to run the bus at 60MHz or 80MHz and then the
> >> values would probably again be different.
> >> 
> >> The first two values are set in DT so the logical place for setting
> >> the third is also in DT.
> >> 
> >> Otherwise you would need some in-kernel table of these settings.
> > 
> > Or a formula.
> 
> This formula probably needs to take into account
> 
>  - the unknown reason for the pl330 to fail transfer

Shouldn't that be fixed at the PL330 level ? This looks like fixing
a problem at the wrong place :)

>  - the device transfer speed and transfer phase as set in DT
>  - possibly device-specific latency and board-specific trace design
> and assembly tolerances

If the design is broken, then cap the speed as for normal SPI device.

> Seriously, until I have at least a vague idea why the transfer fails I
> am not comfortable pulling some formula out of thin air and pretending
> I have a working patch.
> 
> On the other hand, a parameter you can set in the DT and which comes
> with a suggested value which can be tuned depending on the system
> seems more viable.

The problem is, if you add a new DT binding, you'd have to support it
forever, no matter how bad idea that binding turned out to be.

Best regards,
Marek Vasut
