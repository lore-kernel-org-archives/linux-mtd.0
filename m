Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMj4R-0005Jp-Ua
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 18:35:20 +0000
Date: Thu, 19 Sep 2013 15:34:47 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 00/21] Armada 370/XP NAND support
Message-ID: <20130919183418.GA2663@localhost>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <523B38BE.2010203@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <523B38BE.2010203@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 19, 2013 at 07:47:42PM +0200, Daniel Mack wrote:
> On 19.09.2013 18:01, Ezequiel Garcia wrote:
> 
> > Ezequiel Garcia (21):
> >   mtd: nand: pxa3xx: Allocate data buffer on detected flash size
> >   mtd: nand: pxa3xx: Disable OOB on arbitrary length commands
> >   mtd: nand: pxa3xx: Use a completion to signal device ready
> >   mtd: nand: pxa3xx: Add bad block handling
> >   mtd: nand: pxa3xx: Add driver-specific ECC BCH support
> >   mtd: nand: pxa3xx: Configure detected pages-per-block
> >   mtd: nand: pxa3xx: Clear cmd buffer #3 (NDCB3) on command start
> >   mtd: nand: pxa3xx: Make config menu show supported platforms
> >   mtd: nand: pxa3xx: Split FIFO size from to-be-read FIFO count
> >   mtd: nand: pxa3xx: Replace host->page_size by mtd->writesize
> >   mtd: nand: pxa3xx: Add helper function to set page address
> >   mtd: nand: pxa3xx: Remove READ0 switch/case falltrough
> >   mtd: nand: pxa3xx: Split prepare_command_pool() in two stages
> >   mtd: nand: pxa3xx: Move the data buffer clean to
> >     prepare_start_command()
> >   mtd: nand: pxa3xx: Add a read/write buffers markers
> >   mtd: nand: pxa3xx: Introduce multiple page I/O support
> >   mtd: nand: pxa3xx: Add multiple chunk write support
> 
> Your patches work fine on my board with CONFIG_HAS_DMA=n.
> 

Great, this is already good news!

> However, it seems that with CONFIG_HAS_DMA=y, pxa3xx_nand_irq() is now
> called before pxa3xx_nand_init_buff(), which results in a NULL pointer
> dereference.  I had to tweak my pending dmaengine patch of course, but I
> don't see an particular problem with that right now.
> 
> Any idea? Are you tesing with PIO mode or DMA?
> 

Mm.. I'll check about that. As far as I understand, these SoCs don't
support NAND DMA operation. But I need to check this.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
