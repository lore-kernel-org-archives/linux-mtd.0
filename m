Received: from smtp2.macqel.be ([109.135.2.61])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGPMR-0005sq-5B
 for linux-mtd@lists.infradead.org; Thu, 20 Feb 2014 08:52:04 +0000
Date: Thu, 20 Feb 2014 09:34:40 +0100
From: Philippe De Muyter <phdm@macq.eu>
To: Markus Niebel <list-09@tqsc.de>
Subject: Re: which driver for mmap-able battery-backed SRAM ?
Message-ID: <20140220083440.GA15361@frolo.macqel>
References: <20140211192910.GA23223@frolo.macqel> <5305BA30.8070609@tqsc.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5305BA30.8070609@tqsc.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Markus,

On Thu, Feb 20, 2014 at 09:17:52AM +0100, Markus Niebel wrote:
> Hi,
> 
> Am 11.02.2014 20:29, wrote Philippe De Muyter:
> > Hi mtd experts,
> > 
> 
> not an expert, but this should be done as a simple char device driver?

Actually, I am surprised that this does not exist yet, (or did I
not search enough ?)

At the moment, the only solution I have found is using /dev/mem, and
mmap-ing the part of it starting at the physical address of my sram
into my user program.

But my user program must know the physical address of the sram, and run as root;
I cannot give individual access rights to my sram.

> 
> BTW. if you intend to try mainlining such a driver I can send you a piece of raw code
> offlist.

I would gladly look at it.  Thanks for the proposal.

Philippe

> 
> > I try to find the right driver for a memory-mapped battery-backed SRAM chip.
> > I have tried two drivers : 
> > 	"mmio-sram"	drivers/misc/sram.c
> > and
> > 	"mtd-ram"	drivers/mtd/chips/map_ram.c
> > but none of them provides me the expected interface : being able to mmap
> > it in a user program, and ensure that every write access to it happens
> > at the moment it is executed in the user program.
> > 
> > Is there already a driver that has those functionalities, or which one should
> > I enhance ?
> > 
> > TIA
> > 
> Markus

-- 
Philippe De Muyter +32 2 6101532 Macq SA rue de l'Aeronef 2 B-1140 Bruxelles
