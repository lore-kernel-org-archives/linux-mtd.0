Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlpkY-0004S7-HA
 for linux-mtd@lists.infradead.org; Sat, 25 Apr 2015 02:23:23 +0000
Received: by pacyx8 with SMTP id yx8so64322575pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 19:22:58 -0700 (PDT)
Date: Fri, 24 Apr 2015 19:22:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [RFC PATCH 0/3] mtd: nand: provide a clear separation of chip
 and controller ops
Message-ID: <20150425022254.GA32500@ld-irv-0074>
References: <1423920758-1556-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423920758-1556-1-git-send-email-boris.brezillon@free-electrons.com>
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

Hi Boris,

Sorry for the delay here. I've owed you a response for a while.

On Sat, Feb 14, 2015 at 02:32:35PM +0100, Boris Brezillon wrote:
> Hello,
> 
> I'm pretty sure I'm starting a controversial discussion here, but that's
> something I am thinking about for quite a while now, and instead of working
> on my own to provide a full solution I thought this would be good to share
> my vision and hopefully get feedback from other developers (including
> maintainers ;-)).
> 
> This patch series is an attempt to define a clear separation between NAND
> chip methods (those that are really dependent on the discovered NAND chip),
> and NAND controller merhods (those generic enough to access any NAND chip
> connected to a NAND controller).

I think you might be on to something here. I'm feeling more and more
like a lot of the NAND subsystem is layered kinda badly [1]. This is
probably much due to history, where nand_base was first designed for
relatively simple NAND controllers, where much of the heavy lifting was
done in software. Nowadays, controllers do a lot more automagically.

Anyway, I agree in principle that a clearer separation between flash and
controller is a good goal.

> This separation is motivated by several things.
> 
> The first one being my current attempt to support MLC chips. These chips
> need some extra care (like read-retry or paired pages detection to avoid
> any data loss, and obviously other things I'm not yet aware of).
> MLC vendors each implement these features in a non standard way,
> meaning that NAND core (or, as I see it, vendor specific code) has to fill
> those function pointers accordingly.
> While the kernel documentation tries to specify which function should be
> filled by the controller part, and which one should be filled by NAND core,
> providing a clear separation would makes things even clearer.

Sure, I think these should be kept separate in some way. Whether that's
with your current proposal or with something else remains to be seen.

> The second aspect, which IHMO is less important,

I agree.

> is that NAND controller
> drivers that deal with multiple chips won't have to fill the chip
> function each time they add one, and it would even save some space in this
> case (though I don't know any board embedding several NAND chips yet :-().

I've seen a few that used a boot SLC NAND and a large MLC NAND for
secondary storage. It's been a while since I've seen anything like that
though.

I think the more important aspect of this point is that it puts the
driver writer in the right mindset. If we have a clearer "controller"
struct (it exists already, but it's used for very little), we can hope
to eventually encourage drivers that will not have to modify struct
nand_chip at all, but leave that to the common code.

> There surely is other pros and cons to this approach, and I'm pretty sure
> you will point plenty of them.

At the moment (and, though I have taken I while to respond, I have
thought about this issue occasionally over the last two months) I don't
actually see a lot of problems with your current proposal. The code is
pretty trivial at the moment.

The problem might only be that this does not yet go far enough. A lot of
the controller-specific stuff ends up being related to the nand_ecc_ctrl
struct. Those function pointers essentially end up being the bulk of
controller-specific function pointers, in some cases, but those may even
vary from nand_chip to nand_chip. I haven't figured out what best to do
with these yet.

(BTW, this source of problem makes it hard to deal with on-die/built-in
ECC too; we might need to make use of the controller-specific *raw* read
functions while still handling the on-die ECC status info. *hint hint
Richard* *I'll comment on your on-die ECC patches soon, I hope*)

> I'd like to discuss another thing, not directly related to the controller
> ops separation: the automatic assignment of default methods done in by
> the core.
> I've done a few reviews and worked on a few NAND drivers lately, and I
> noticed that a lot of them do not implement the raw access functions
> (write/read_page_raw in nand_ecc_ctrl).
> It's obviously a bad thing, but that's not my point :-).

I agree that's bad :)

> Actually they all leave the read/write_page_raw unassigned and let NAND
> core assign default values which will obviously not do what's expected
> at all.

Actually, that might be expected. e.g., on some NAND_ECC_HW
implementations, the driver may be relying entirely on the
ecc.{hwctl,correct,calculate} functions, and in the absence of those
calls (e.g., when read_page_raw() just performs calls to read_buf()),
then no HW ECC is initiated.

> My point is, maybe we should provide default implementations to all drivers
> (export GPL symbols) and let them fill their function pointer instead of
> guessing what they want to do.
> This way we would easily detect offending drivers and complain before they
> can even register a NAND chip.

I don't think we can do exactly that -- that would leave a lot of
implementations where we have to duplicate too much stuff -- though a
compromise might work. Perhaps we can at least have nand_base complain /
error out [2] if ecc.{read,write}_page() are provided by the driver but
ecc.{read,write}_page_raw() are not. That would cover the likely problem
cases, while avoiding work on some cases that are done properly.

> Now, let's talk about the implementation proposed in this RFC. It's not
> complete yet, since the methods in nand_chip are still there (and
> assigned to the NAND controller ops one), but my goal is to eventually
> remove them.

Maybe some extra comments are in order there, then? We are always in
need of big blocks of explanatory text :)

> Anyway, this implies modifying all the drivers and I'm not inclined to do
> that until every body has agreed on something.

Right, good idea. But it seems that only you and I have opinions here,
so "agreement" may just be between us. Or you just weren't loud enough.

> I've only extracted methods I was pretty sure they were related to the NAND
> controller, but there may be other methods that could be moved out (or I
> might have wrongly assumed some of them were related to NAND controllers).
> Please share your opinion on that point.

I think your initial set looks OK, though the 'write_page' function
sticks out a bit. It's not symmetric (there's no similar 'read_page'),
and I actually think the nand_ecc_ctrl pointers should cover everyone's
uses (atmel_nand is the only user of nand_chip::write_page).

> The sunxi nand driver has been patched to make use of this new approach and
> can be considered as a reference implementation.
> 
> 
> That's all I got for now.
> I'm waiting for your feedback.

Thanks for the thoughts and patience. I've been pretty swamped (yeah,
yeah, so is everyone; not the greatest excuse). And now I have a nice
MTD backlog!

> Thanks.
> 
> Best Regards,
> 
> Boris
> 
> Boris Brezillon (3):
>   mtd: nand: introduce NAND controller ops
>   mtd: nand: export nand_wait so that NAND controller driver can use it
>   mtd: nand: sunxi: define NAND controller ops instead of assigning chip
>     functions
> 
>  drivers/mtd/nand/nand_base.c  | 26 +++++++++++++++++++++++++-
>  drivers/mtd/nand/sunxi_nand.c | 15 ++++++++++-----
>  include/linux/mtd/nand.h      | 42 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 77 insertions(+), 6 deletions(-)
> 
> -- 
> 1.9.1
> 

Brian

[1] Tangent on layering: can you think of any good reason why we don't
embed a struct mtd_info in struct nand_chip? That seems like it would be
the better layering. That would help unclutter some of the APIs, where
we have both 'mtd' and 'chip' parameters passed all over the place,
where we should only need 'chip'.

[2] That's another thing; there are too many BUG()'s in
nand_scan_tail()!
