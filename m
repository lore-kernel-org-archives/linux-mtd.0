Date: Wed, 15 Jul 2015 08:59:46 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>, hramrach@gmail.com
Cc: Michal Suchanek <hramrach@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@freescale.com>,
 Knut Wohlrab <knut.wohlrab@de.bosch.com>,
 dmaengine <dmaengine@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 08/11] MTD: m25p80: Add option to limit SPI transfer size.
Message-ID: <20150715155946.GB21362@localhost>
References: <cover.1433364398.git.hramrach@gmail.com>
 <20150604171547.GA1530@localhost.localdomain>
 <CAOMqctSCL9E-kCBryeaMvtssSP12RY=kyfPuwSYx9wc=Lv9kGQ@mail.gmail.com>
 <201507151352.27689.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201507151352.27689.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michal,

On Wed, Jul 15, 2015 at 01:52:27PM +0200, Marek Vasut wrote:
> The problem is, if you add a new DT binding, you'd have to support it
> forever, no matter how bad idea that binding turned out to be.

Agreed, and a solid NAK to this patch. I could have sworn I gave such a
response when this was originally being discussed a month ago.

AFAICT, you have one of two general approaches available to you:

1. Fix up the SPI driver so that it knows how to break large SPI
transfers up into smaller segments that its constituent hardware (DMA
controllers, fast clocks, etc.) can handle.

2. Utilize/create a parameter within the SPI subsystem to communicate
that the SPI master has a limited max transfer size (notably: NOT a
per-device DT property, but a SPI API property), and modify SPI device
drivers (like m25p80) to honor it. Mark Brown seemed open to this, and I
thought he suggested it somewhere.

It is most definitely wrong to put this information solely in the slave
device DT (i.e., for the flash), when it is not a property of the flash
device at all. It's a property of the SPI master and/or its clocks and
DMA controllers.

Brian
