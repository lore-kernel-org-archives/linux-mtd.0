Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTuMZ-00046M-Tm
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 14:03:44 +0000
Date: Wed, 9 Oct 2013 11:03:13 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 0/2] pxa3xx: Data buffer dynamic allocation
Message-ID: <20131009140312.GC31294@localhost>
References: <1380911438-24240-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131009114803.GA31294@localhost> <5255455C.6060606@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5255455C.6060606@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 09, 2013 at 02:00:28PM +0200, Daniel Mack wrote:
> On 09.10.2013 13:48, Ezequiel Garcia wrote:
> > On Fri, Oct 04, 2013 at 03:30:36PM -0300, Ezequiel Garcia wrote:
> >> As part of my work to support the NAND controllers in Armada 370/XP SoC
> >> here's a tiny set of patches to replace the currently data buffer allocation
> >> based in a hardcoded buffer size, into a dynamic scheme.
> >>
> >> We first use kmalloc to request a 256 bytes (big enough for the ONFI paramater
> >> page) and then re-allocate (either with kmalloc or using DMA allocators) using
> >> the detected page size.
> >>
> >> The first patch is required to perform the initial NAND operations (READID
> >> and friends) using programmable I/O since the DMA buffers are not ready
> >> at such early stage.
> >>
> >> The second patch performs to actual dynamic allocation and it's exactly
> >> the same patch I sent a few weeks ago:
> >>
> >>   http://patchwork.ozlabs.org/patch/275982/
> >>
> >> Daniel: Can you test these two If they look fine we can add them now,
> >> being an improvement to the driver pxa3xx beyond the Armada 370/XP effort.
> > 
> > Daniel: sorry to bother, any luck testing this?
> 
> Sorry for the delay, got other things to do lately ...
> 

No problem, thanks for testing.

> I tested these two patches successfully on my board with both use_dma=0
> and =1. Nice :) You can take my
> 
> 	Tested-by: Daniel Mack <zonque@gmail.com>
> 

Good news! Brian: all yours :)

> I hope I can catch up with my pxa DMA cleanups very soon.

Indeed. BTW: I had some feedback on why the Armada 370/XP SoC can't
do DMA on the NAND, I'll reply to the older mail with the information.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
