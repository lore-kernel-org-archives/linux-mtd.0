From: Arnd Bergmann <arnd@arndb.de>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 00/20] ARM: pxa: move core and drivers to dmaengine
Date: Wed, 7 Aug 2013 18:08:51 +0200
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
In-Reply-To: <1375889649-14638-1-git-send-email-zonque@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201308071808.51400.arnd@arndb.de>
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, broonie@kernel.org,
 mika.westerberg@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 gregkh@linuxfoundation.org, g.liakhovetski@gmx.de, sachin.kamat@linaro.org,
 kernel@pengutronix.de, djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 07 August 2013, Daniel Mack wrote:
> I've been working on teaching the mmp-pdma driver more functions and
> porting tree-wide scattered pxa specific drivers over to dmaengine
> implementations. I posted the first round of patches for mmp-pdma here:
> 
>   http://marc.info/?l=linux-arm-kernel&m=137587082530228
> 
> 
> With the following patches applied, I can boot a PXA3xx board boot with
> all DMA runtime information determined from DT, using pxa3xx-nand,
> pxamci and audio components (cyclic DMA).
> 
> However, the transition is quite intrusive and spans across several
> subsystem, and due to the nature of the current pxa DMA implementation,
> it cannot be gap-less. All drivers currently request an exclusive
> channel via code in arch/arm/plat-pxa/dma.c and then do direct register
> modifications regarding their obtained channel. We can't allow this
> with the mmp-pdma driver of course, and I also have no idea how to
> provide sane stubs for the existing hooks which end up in dmaengine
> calls.
> 
> Hence, all drivers have to be ported over in one series, and all these
> changes should be merged by one pull request eventually in order to
> prevent both build and functional breakage. Haojian's repository seems
> most suitable for that, as he's the PXA maintainer.

Very nice series! I just looked over these and only found a few minor details
that could be improved.

	Arnd
