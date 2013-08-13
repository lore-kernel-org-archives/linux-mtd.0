Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9Cv3-0004nx-Dw
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 11:37:47 +0000
Date: Tue, 13 Aug 2013 08:37:22 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 00/14] pxa3xx-nand patches to support mvebu builds
Message-ID: <20130813113721.GA2393@localhost>
References: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130812231946.GB7267@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130812231946.GB7267@brian-ubuntu>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

On Mon, Aug 12, 2013 at 04:19:46PM -0700, Brian Norris wrote:
> On Mon, Aug 12, 2013 at 02:14:45PM -0300, Ezequiel Garcia wrote:
> > This patchset is part of the work I'm doing to enable the pxa3xx-nand
> > driver to support the NAND controller in Armada 370/XP. While this is
> > work in progress, here's a subset of patches I consider good enough
> > for mainline.
> 
[..]

> > 
> > Ezequiel Garcia (14):
> >   mtd: nand: pxa3xx: Remove unneeded ifdef CONFIG_OF
> >   mtd: nand: pxa3xx: Introduce 'marvell,armada370-nand' compatible
> >     string
> 
> This series includes an older version of the above patch, without the
> Tested-by and with a trivial change in the spacing. I just pulled in the
> v3 patch.
> 

Oh, I forgot to fix the cast spacing. Thanks for noticing.

BTW, I dropped the Tested-by on purpose, because as per the ifdef
CONFIG_OF removal I'm not sure Daniel tested that code.

Although he probably did, so it's fine to pick the Tested-by.

> >   mtd: nand: pxa3xx: Handle ECC and DMA enable/disable properly
> >   mtd: nand: pxa3xx: Allow to set/clear the 'spare enable' field
> >   mtd: nand: pxa3xx: Support command buffer #3
> >   mtd: nand: pxa3xx: Use 'length override' in ONFI paramater page read
> >   mtd: nand: pxa3xx: Add a local loop variable
> >   mtd: nand: pxa3xx: Remove hardcoded mtd name
> >   mtd: nand: pxa3xx: Remove uneeded internal cmdset
> >   mtd: nand: pxa3xx: Move cached registers to info structure
> >   mtd: nand: pxa3xx: Make dma code dependent on dma capable platforms
> >   mtd: nand: pxa3xx: Add __maybe_unused keyword to enable_int()
> >   mtd: nand: pxa3xx: Allow devices with no dma resources
> >   mtd: nand: Allow to build pxa3xx_nand on Orion platforms
> > 
> >  drivers/mtd/nand/Kconfig                      |   2 +-
> >  drivers/mtd/nand/pxa3xx_nand.c                | 277 ++++++++++++++++----------
> >  include/linux/platform_data/mtd-nand-pxa3xx.h |  13 --
> >  3 files changed, 173 insertions(+), 119 deletions(-)
> 
> Pushed the whole series to l2-mtd.git, although I noted one comment in
> patch 8. Thanks!
> 

Thanks a lot!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
