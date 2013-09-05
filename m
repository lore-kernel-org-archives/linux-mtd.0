Date: Wed, 4 Sep 2013 21:43:53 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Message-ID: <20130905014350.GA2261@gmail.com>
References: <1377828449-18912-1-git-send-email-b32955@freescale.com>
 <522697E9.1050208@freescale.com>
 <20130904095523.GT3084@sirena.org.uk>
 <52270B8E.5080402@freescale.com>
 <20130904113322.GA5859@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130904113322.GA5859@sirena.org.uk>
Cc: devicetree@vger.kernel.org, shawn.guo@linaro.org, b44548@freescale.com,
 dedekind1@gmail.com, linux-doc@vger.kernel.org, b18965@freescale.com,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, lznuaa@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 04, 2013 at 12:33:22PM +0100, Mark Brown wrote:
> On Wed, Sep 04, 2013 at 06:29:34PM +0800, Huang Shijie wrote:
> > 于 2013年09月04日 17:55, Mark Brown 写道:
> > > On Wed, Sep 04, 2013 at 10:16:09AM +0800, Huang Shijie wrote:
> 
> > >> Since this quadspi driver depends on the mtd code, could this driver
> > >> goes to the kernel by
> > >> the l2-mtd tree?
> 
> > > Why would a SPI driver depend on MTD?
> 
> > The patch 1-4 are for m25p80.c, and this quadspi controller drivers
> > depends on the
> > patch 1-4.
> 
> In what way does the controller driver depend on those changes?
This driver needs the spi nor command to fill the LUT register, such as
OPCODE_WREN(0x06), so the patch 1 moves the spi nor command to a seprate
header spi-nor.h, and this driver includes this new header.

thanks
Huang Shijie
