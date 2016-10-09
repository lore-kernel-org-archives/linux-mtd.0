Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btCfJ-00030a-PV
 for linux-mtd@lists.infradead.org; Sun, 09 Oct 2016 11:53:15 +0000
Date: Sun, 9 Oct 2016 13:52:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Peter Pan <peterpansjtu@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC PATCH 0/7] mtd: nand: Abstract away the NAND interface type
Message-ID: <20161009135248.6a9a9185@bbrezillon>
In-Reply-To: <20161009053406.GE10199@brian-ubuntu>
References: <1474539180-5863-1-git-send-email-boris.brezillon@free-electrons.com>
 <20161009053406.GE10199@brian-ubuntu>
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

Hi Brian,

On Sat, 8 Oct 2016 22:34:06 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Thu, Sep 22, 2016 at 12:12:53PM +0200, Boris Brezillon wrote:
> > Hi,
> > 
> > This series is aiming at providing a generic NAND layer to share code
> > between different NAND based devices.
> > 
> > We currently have 3 different interfaces to interact with NANDs:
> > - Raw NANDs
> > - OneNANDs
> > - SPI NANDs
> > 
> > Apart from the way these NAND devices are accessed they have a lot
> > in common, like the way the memory is organized, or their constraints.
> > This is usually a good sign that some work should be done to factorize
> > the code.
> > 
> > This work has been started by Peter who wanted to re-use the BBT
> > code for its SPI-NAND driver. But I think we can push it further
> > other stuff (the software ECC implementation, or the way offsets are
> > converted to block/page number).
> > 
> > Before I continue in this direction, I'd like to get some feedback
> > from Peter and those who reviewed his initial submission (Brian,
> > Ezequiel) [1], or anyone who is interested in this topic.  
> 
> My eyes are bleeding for two reasons:

Sorry for your eyes :-).

> 
> (1) You haven't used any of git's nice rename detection for your patches

Yep, as already answered to Ezequiel on IRC, I forgot to pass -M when
generating patches with git format-patch. Will be addressed in v2.

> (2) The 'rawnand' naming seems a bit much for me. If we really need to
>     reorganize everything, keeping the name shorter, like just 'raw'
>     might be fine -- at least wherever we're already namespaces as
>     "nand". e.g., 'drivers/mtd/nand/raw/' and 'mtd: nand: raw:
>     commit subject', but you might still keep 'rawnand.h' (unless you
>     want to move things into an include/linux/mtd/nand/ subdirectory).

That's also something Ezequiel complained about. I'm perfectly fine
dropping the nand suffix when it's unneeded (will be fixed in v2).

> 
> You'll also need to update MAINTAINERS for the header pattern.

Sure, I'll patch MAINTAINERS to describe the new patterns.

> 
> Haven't looked too closely at the code yet.

Thanks for this preliminary review, but I was actually looking for a
more general review:

- Is the general approach OK (the fact that we now have a generic NAND
  layer to share code between different NAND based devices, no matter
  the interface they use)?
- Is the API defined at the generic NAND level (the interface-agnostic
  API) acceptable?

Thanks,

Boris
