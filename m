Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkQ5g-00078D-Uy
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2018 08:33:15 +0000
Date: Tue, 31 Jul 2018 10:32:59 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Mike
 Dunn <mikedunn@newsguy.com>, Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: Re: [RFC PATCH] mtd: rawnand: Remove docg4
Message-ID: <20180731103259.7ec1be8d@bbrezillon>
In-Reply-To: <20180731102035.018ad7d0@xps13>
References: <20180730201341.17365-1-boris.brezillon@bootlin.com>
 <20180731102035.018ad7d0@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 31 Jul 2018 10:20:35 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 30 Jul 2018
> 22:13:41 +0200:
> 
> > The diskonchip G4 driver does not fit very well in the raw/parallel
> > NAND framework simply because such chips have an internal controller
> > translating DoC-specific commands into NAND ones.
> > 
> > Keeping such a driver in the raw NAND framework is a real burden for
> > NAND maintainers.
> > 
> > Not to mention that some part in this drivers are a bit worrisome:
> > 
> > - writes are done by subpages, even though we're interfacing with an MLC
> >   chip which are known to not support subpage writes very well (it might
> >   be that the FTL handles the complexity for us though)
> > 
> > - some part of the code are simply ignoring return codes of function that
> >   can fail in a few occasions
> > 
> > - there's a hack to support OOB writes when no data is provided. This
> >   operation is not supported by the chip and should have been rejected,
> >   and nandwrite and other userspace tools should have been patched to
> >   deal with such devices
> > 
> > - the driver is apparently broken when ignore_badblocks module param
> >   is not set to 1 and nobody noticed that (don't know since when this
> >   is the case, but it's not a recent change)
> >   http://lists.infradead.org/pipermail/linux-mtd/2018-July/082472.html
> > 
> > Add to that the fact that we already have a docg3 driver in
> > drivers/mtd/devices/docg3.c and, looking at the code (and regs), it
> > seems docg3 and docg4 have a lot in common (even the author of this
> > driver seemed to have realized that interfacing with the raw NAND
> > framework might have been a bad idea
> > http://lists.infradead.org/pipermail/linux-mtd/2012-January/039517.html).
> > 
> > For all these reasons, I'm proposing to remove this driver. If anyone
> > ever wants to add support for this chip back, I'd suggest extending
> > the docg3 driver instead of adding a completely new driver.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > Cc: Mike Dunn <mikedunn@newsguy.com>
> > Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> > Cc: Sergey Larin <cerg2010cerg2010@mail.ru>
> > ---  
> 
> I do agree in removing this driver.
> 
> I just checked for docg4 references and it looks like palmeo.c board
> file has some code related to it, enclosed in a
> 
>         #if IS_ENABLED(CONFIG_MTD_NAND_DOCG4)
> 
> Besides the fact that it is the only user, that's probably something
> we should also remove.
> 
> Plus, I recently added a mention to the docg4 driver in nand_base.c
> during the conversion to nand_scan() (to skip nand_scan_ident()). It
> might be worth removing the extra code or at least the reference in the
> comment.

Yep. Let's wait for more feedback, and if we all agree that this driver
should be removed I'll send a new version with 2 new patches to remove
the unused code.
