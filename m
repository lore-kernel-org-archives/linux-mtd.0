Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvG7o-0003Hu-5h
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 02:22:20 +0000
Received: by pdbnk13 with SMTP id nk13so90470766pdb.1
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 19:21:59 -0700 (PDT)
Date: Wed, 20 May 2015 19:21:55 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [RFC PATCH 0/3] mtd: nand: provide a clear separation of chip
 and controller ops
Message-ID: <20150521022155.GA11598@ld-irv-0074>
References: <1423920758-1556-1-git-send-email-boris.brezillon@free-electrons.com>
 <20150425022254.GA32500@ld-irv-0074>
 <20150428180241.2bc834b5@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150428180241.2bc834b5@bbrezillon>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 28, 2015 at 06:02:41PM +0200, Boris Brezillon wrote:
> On Fri, 24 Apr 2015 19:22:54 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
> > > There surely is other pros and cons to this approach, and I'm pretty sure
> > > you will point plenty of them.
> > 
> > At the moment (and, though I have taken I while to respond, I have
> > thought about this issue occasionally over the last two months) I don't
> > actually see a lot of problems with your current proposal. The code is
> > pretty trivial at the moment.
> > 
> > The problem might only be that this does not yet go far enough. A lot of
> > the controller-specific stuff ends up being related to the nand_ecc_ctrl
> > struct. Those function pointers essentially end up being the bulk of
> > controller-specific function pointers, in some cases, but those may even
> > vary from nand_chip to nand_chip. I haven't figured out what best to do
> > with these yet.
> 
> Actually I was planning to make the same separation for nand_ecc_ctrl.
> The ops should be part of another structure (nand_ecc_ctrl seems like
> a good container), while instantiation information (like the selected
> ECC strength/step size and the oob layout) should be assigned to the
> NAND chip itself.

Sounds about right.

> > (BTW, this source of problem makes it hard to deal with on-die/built-in
> > ECC too; we might need to make use of the controller-specific *raw* read
> > functions while still handling the on-die ECC status info. *hint hint
> > Richard* *I'll comment on your on-die ECC patches soon, I hope*)
> 
> Hum, I'm not sure the raw functions are in cause here, but maybe we
> should provide read/write page functions (those ones should access the
> NAND in raw mode of course) in the nand_controller_ops.
> 
> This brings us to another aspect I'd like to rework: the way we're
> attaching an ECC implementation to a NAND chip.
> Currently, the nand_chip struct embeds a nand_ecc_ctrl struct which is
> then filled by NAND controller drivers.
> I'd like to make this field a pointer, so that NAND controllers can
> provide an ECC implementation which can then be overloaded by nand core
> if on-die ECC is available and explicitly requested.

Could work. Though, the "overloading" would probably involve wrapping
the controller callbacks, not completely replacing. It would look
loosely like:

 mtd_read()
 |_ ... chip->read_something()
        |_ if (on-die)
	      hwctrl->read_something_raw()
	   else
	      hwctrl->read_something()

> I might be wrong, but all the attempt to support on-die ECC I've seen
> so far are involving ECC implementation selection in each NAND
> controller driver.

Yeah, and that's one reason I haven't merged any of them. They are very
much tied to specific drivers (or classes of drivers). They haven't
provisioned for any way to seamlessly add on-die ECC support to drivers
by, e.g., disabling existing hardware ECC, or using existing "raw"
support to build support for on-die ECC.

In considering options here, I think we have a few things to plan for:
1. one controller may support many types of ECC (SW, HW)
2. one controller may support many strengths for a particular type
(1-bit, 8-bit, 24-bit, etc.)
3. we might want to override all of the above in order to use on-die ECC
4. we might want to opt out of on-die ECC, even on those that support it
(on Micron I think you can disable it? but on Toshiba you can't)
5. different ECC schemes for different partitions? Some have requested
being able to do a HW (?) 1-bit ECC on the bootloader partition, and a
stronger SW or HW ECC on the rest.

#1 and #2 have been handled OK with a variety of driver-specific coding
in between nand_scan_ident() and nand_scan_tail(). But it's a bit too
much work to make every driver add more logic there for #3 and #4. So if
we're going to do that kind of work, we should plan something that
allows a little more modularity / replaceability.

#5 is a lot less important, but I thought I'd throw it in there, in case
it could help guide the thought process for reworking this now.

Maybe some kind of ecc_ctrl() or ecc_select() callback provided (at
least partially) by the controller? It could handle multiplexing the
various ECC modes, so that nand_base can configure them directly. (Or
maybe I'm off-base a bit. I'll admit I haven't 100% though this last
suggestion completely, though I've imagined something like that for a
while.)

Brian
