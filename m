Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayZmG-0002y4-UI
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 07:02:21 +0000
Date: Fri, 6 May 2016 09:01:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PULL] mtd: nand: changes for 4.7
Message-ID: <20160506090159.38c997f1@bbrezillon>
In-Reply-To: <20160505183815.GA89390@google.com>
References: <20160429101348.309d4784@bbrezillon>
 <20160505183815.GA89390@google.com>
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

On Thu, 5 May 2016 11:38:15 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi Boris,
> 
> On Fri, Apr 29, 2016 at 10:13:48AM +0200, Boris Brezillon wrote:
> > Hi Brian,
> > 
> > This is my first PR for the NAND subsystem, so don't hesitate to tell me
> > if I did something wrong ;).  
> 
> Overall things aren't too bad, but I do have some comments.
> 
> > This pull request contains the following infrastructure changes:
> > * introduction of the ECC algo concept to extend the ECC mode one
> > * replacement of the nand_ecclayout infrastructure by something more
> >   future-proof.
> > * addition of an mtd-activity led trigger to replace the nand-activity
> >   one
> > 
> > And a bunch of specific NAND driver improvements/fixes. Here are the
> > changes that are worth mentioning:
> > * rework of the OMAP GPMC and NAND drivers
> > * prepare the sunxi NAND driver to receive DMA support
> > * handle bitflips in erased pages on GPMI revisions that do not support
> >   this in hardware.  
> 
> Thanks for the summary; it'd be nice if you can include this in the tag
> description next time. Then it'll get auto-populated below with
> git-request-pull, and it'll get pulled in automatically for me.
> 
> I also see this when I try to build a reasonably simple kernel:
> 
> depmod: ERROR: Found 5 modules in dependency cycles!
> depmod: ERROR: Cycle detected: nand -> nand_bch -> nand
> 
> I think the new reference to &nand_ooblayout_lp_ops in nand_bch.c is
> causing this (I can at least build/boot if I hack that out).

Oops, indeed. I should really setup an environment to test all the
cases on a build server (+ some static code checker like sparse).

Anyway, I fixed the bug as proposed on IRC (moved the
mtd_set_ooblayout() call into nand_base.c), and resent the PR.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
