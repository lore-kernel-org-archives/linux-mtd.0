Received: from [94.23.35.102] (helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V44kT-0003fc-Mo
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 07:53:38 +0000
Date: Tue, 30 Jul 2013 09:53:10 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 00/13] pxa3xx patches to support mvebu builds
Message-ID: <20130730095310.38400ca6@skate>
In-Reply-To: <51F76EBA.1020504@gmail.com>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <51F76EBA.1020504@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, linux-mtd@lists.infradead.org,
 grinberg@compulab.co.il, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
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

Dear Daniel Mack,

On Tue, 30 Jul 2013 09:43:54 +0200, Daniel Mack wrote:

> On 30.07.2013 01:24, Ezequiel Garcia wrote:
> > It's also worth noting that since pxa3xx has a mach-specific
> > DMA API, I'm including a few patches to ifdef such pxa-specific
> > code in non PXA/MMP platforms. This ugly workaround should be
> > removed once the specific DMA API is replaced by dmaengine.
> 
> Interesting, because I'm working on a dmaengine implementation for PXA
> right now. I'm not even half through, but I'm making progress, and I'm
> not sure yet how to merge it. Because there won't be any migration path,
> it'll be a bigger set that has to go in in one in order to prevent build
> breakage.

Aren't drivers/dma/mmp_pdma.c and drivers/dma/mmp_tdma.c already
dmaengine drivers for PXA ?

> Your patches will cause merge conflicts against mine, so I'm not sure
> whether I should rebase my work on top of yours or if you should wait
> until I'm finished.

Considering the amount of time it will take for PXA to migrate over to
the dmaengine API, I think we'd want those clean up patches to go in
first, so that in parallel to the work you're doing on PXA dmaengine
usage, we can move forward with improving the pxa3xx_nand driver to
make it usable on Armada 370/XP.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
