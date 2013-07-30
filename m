Received: from [94.23.35.102] (helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4A95-0007YV-LP
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 13:39:24 +0000
Date: Tue, 30 Jul 2013 10:38:53 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
Message-ID: <20130730133852.GD2375@localhost>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51F76EBA.1020504@gmail.com> <20130730095310.38400ca6@skate>
 <51F772FC.90404@gmail.com> <20130730101809.7c28525c@skate>
 <20130730131538.GB2375@localhost> <51F7BE11.2020101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51F7BE11.2020101@gmail.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Artem Bityutskiy <dedekind1@gmail.com>,
 leiwen@marvell.com, haojian.zhuang@gmail.com, Chao Xie <chao.xie@marvell.com>,
 linux-mtd@lists.infradead.org, grinberg@compulab.co.il,
 Gregory Clement <gregory.clement@free-electrons.com>, eric.miao@marvell.com,
 computersforpeace@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Willy Tarreau <w@1wt.eu>, nikita@compulab.co.il
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 30, 2013 at 03:22:25PM +0200, Daniel Mack wrote:
[...]
> > Mmmm.. I'm a bit confused by this: is your dmaengine driver any
> > different/better from the already existent mmp_{p,t}dma.c ?
> 
> As I said, I saw this after I started my own implementation, which isn't
> a big deal. At least, I now understand the internals of dmaengine
> drivers :) The mmp_pdma looks suitable for PXA2xx chips, but it doesn't
> work yet for me. I'll try and fix this first, and then port over all the
> drivers.
> 
> > Here's a patch posted in July 2012 converting pxa3xx-nand to dmaengine.
> 
> Where?
> 

Ouch... here it is:

http://permalink.gmane.org/gmane.linux.ports.arm.kernel/178989

(sorry about that...)

That patch was part of this series:

http://comments.gmane.org/gmane.linux.ports.arm.kernel/181731

But as you can see in the above link, they dropped the pxa3xx-nand part.

> > That patch was never merged because (just as Thomas says) both
> > dma drivers (mmp dmaengine on one side, mach-pxa dma on the other) don't
> > work together. In other words, you have to convert *all* drivers at the
> > same time.
> > 
> > Thomas proposed an idea for this conversion a few months ago: (quoting
> > him from IRC)
> > 
> > """
> > First have a patch that reimplements the existing plat-pxa/dma.c API on
> > top of dmaengine, so that you don't have to change any driver.
> > Then, go through each driver, one per patch to switch to the dmaengine API.
> > And finally get rid of the compatibility layer created in the first
> > patch.
> > """
> > 
> > Does this sound sane?
> 
> Unfortunately, no. I thought so too, but the problem is that all users
> of the proprietary PXA DMA implementation access the registers directly,
> and also allocate their own DMA coherent register space, which is
> unneeded with a proper dmaengine implementation.
> 
> So there's nothing else we can do than really change all the drivers,
> which is what I'm currently doing.

Oh, I see. 

> I'll put you on Cc: once I post patches.
> 

Great! That'll be very appreciated.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
