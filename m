From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd/m25p80: add device tree probe support
Date: Sat, 23 Jun 2012 04:15:18 +0200
References: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
 <4E31B713.1030901@free.fr> <20110728214521.GA4674@ponder.secretlab.ca>
In-Reply-To: <20110728214521.GA4674@ponder.secretlab.ca>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201206230415.18833.marex@denx.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, manu <manuel.pezzin@free.fr>,
 patches@linaro.org, devicetree-discuss@lists.ozlabs.org,
 Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Grant Likely,

> On Thu, Jul 28, 2011 at 09:22:59PM +0200, manu wrote:
> > Dear Grant, Shawn,
> > I don't this patch is required as m25p** serial flashes are
> > supported already with generic OF/SPI and OF/MTD schemes.
> > I have successfully used it myself on an unmodified 2.6.36.3 vanilla
> > kernel on a xilinx/powerpc platform with a m25p32 part from STM.
> > You will find attached the corresponding working defconfig + dts
> > files (appart from partitions which I didn't managed to configure
> > properly...).
> > Best Regards,
> > 
> > Manuel
> 
> There is a heuristic which allows spi and i2c devices to get bound
> without a match table, which is why it works for you, but there is no
> guarantee that the heuristic will continue to exist in the long term.
> This is still probably the right thing to do.
> 
> g.

So is there any particular reason why this wasn't applied?

Best regards,
Marek Vasut
