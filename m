Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atZuQ-0007i6-73
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 12:10:07 +0000
Date: Fri, 22 Apr 2016 14:09:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Petr Kulhavy <petr@barix.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: DaVinci NAND: disable subpage write (28c015)
Message-ID: <20160422140934.018d46bc@bbrezillon>
In-Reply-To: <571A0FE1.4040202@barix.com>
References: <5719DEB9.1020909@barix.com> <20160422110547.7fdf019c@bbrezillon>
 <571A0FE1.4040202@barix.com>
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

On Fri, 22 Apr 2016 13:49:53 +0200
Petr Kulhavy <petr@barix.com> wrote:

> Hi Boris,
> 
> On 22.04.2016 11:05, Boris Brezillon wrote:
> > Hi Petr,
> >
> > On Fri, 22 Apr 2016 10:20:09 +0200
> > Petr Kulhavy <petr@barix.com> wrote:
> >
> >> Hi,
> >>
> >> this email refers to the commit:
> >> 28c015a9daabe4ed3aeb0ccf669a3f1c2b8b81d5 on drivers/mtd/nand/davinci-nand.c.
> >> This commit sets the NAND_NO_SUBPAGE_WRITE option for "ti,keystone-nand"
> >> to workaround a HW issue on the controller.
> >>
> >> Disabling subpage write however should be made a general option because
> >> some NAND chips do not support subpage write at all. Subpage write is a
> >> feature of the NAND chip, not the NAND interface. In combination with
> >> "ti,davinci-nand" there is no option to disable subpage write.
> >> In my case I'm struggling with this issue on the AM1808 with a 1Gb
> >> Micron NAND (MT29F1GxxABB).
> > That's true that subpage write is initially a feature exposed by NAND
> > chips (actually called subpage in datasheets), but the controller can
> > say that it does not support writing subpages.
> > The problem is, in most drivers we don't have the concept of
> > controllers, hence the reason we're asking NAND controllers to
> > explicitly modify chip->options and set the NAND_NO_SUBPAGE_WRITE flag
> > manually.
> >
> > Note that, unless the CHIP supports subpage write, mtd->subpage_sft
> > will be 0, which should prevent subpage writes [1].
> 
> Thank you for the explanation. Do you mean that the controller should 
> detect if the chip supports subpage writing?

No, the controller should just care about what it supports, not what
the chip supports.

> Where is the piece of code 
> doing the detection?

Actually, according to the code I pointed out, all SLC NANDs support
subpage write. For NANDs with really small pages (<= 512bytes), you'll
always have pagesize == subpagesize, because step usually is 512 or
1024.

For SLC NANDs with larger pages (>= 2K), then your subpage size will
depend on the number of ECC steps your have in a single page.

I realize that this approach is not entirely safe, because ecc->steps
is deduced from ecc->size which can be overloaded by NAND controller
drivers. Maybe this should be extracted from ->ecc_step_size_ds, or
even better, be encoded into a separate field, but I'm not sure this is
related to the problem you're facing.

> That is interesting, because in my case the detection does not work.

What do you get in chip->subpagesize.
According to the MT29F1GxxABB datasheet you can program a single page
up to 8 times without needing an erase operation:

"
PROGRAM PAGE 80h-10h

Micron NAND Flash devices also support partial-page programming
operations. This means that any single bit can only be programmed one
time before an erase is required; however, the page can be partitioned
so that a maximum of eight programming operations are supported before
an erase is required.
"

Which means your NAND exposes subpages, and according to the code I
pointed out, you should have 4 subpages inside a page, each of them
containing 512 bytes.

> Using compatible string "ti,davinci-nand" causes heavy ECC errors with 
> UBI (which extensively uses subpage writes) and after setting the 
> compatible string to "ti,keystone-nand" the errors are gone...

Then, maybe this is your controller (or the driver implementation) that
does not support writing subpages...

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
