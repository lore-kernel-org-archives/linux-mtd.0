Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yn7yT-0004KG-8G
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2015 16:03:09 +0000
Date: Tue, 28 Apr 2015 18:02:41 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC PATCH 0/3] mtd: nand: provide a clear separation of chip
 and controller ops
Message-ID: <20150428180241.2bc834b5@bbrezillon>
In-Reply-To: <20150425022254.GA32500@ld-irv-0074>
References: <1423920758-1556-1-git-send-email-boris.brezillon@free-electrons.com>
 <20150425022254.GA32500@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hi Brian,

On Fri, 24 Apr 2015 19:22:54 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi Boris,
> 
> Sorry for the delay here. I've owed you a response for a while.

Hey, I thought this 

> > This patch series is an attempt to define a clear separation between NAND
> > chip methods (those that are really dependent on the discovered NAND chip),
> > and NAND controller merhods (those generic enough to access any NAND chip
> > connected to a NAND controller).
> 
> I think you might be on to something here. I'm feeling more and more
> like a lot of the NAND subsystem is layered kinda badly [1]. This is
> probably much due to history, where nand_base was first designed for
> relatively simple NAND controllers, where much of the heavy lifting was
> done in software. Nowadays, controllers do a lot more automagically.
> 
> Anyway, I agree in principle that a clearer separation between flash and
> controller is a good goal.

Great!

> 
> > This separation is motivated by several things.
> > 
> > The first one being my current attempt to support MLC chips. These chips
> > need some extra care (like read-retry or paired pages detection to avoid
> > any data loss, and obviously other things I'm not yet aware of).
> > MLC vendors each implement these features in a non standard way,
> > meaning that NAND core (or, as I see it, vendor specific code) has to fill
> > those function pointers accordingly.
> > While the kernel documentation tries to specify which function should be
> > filled by the controller part, and which one should be filled by NAND core,
> > providing a clear separation would makes things even clearer.
> 
> Sure, I think these should be kept separate in some way. Whether that's
> with your current proposal or with something else remains to be seen.

Feel free to suggest other approaches.

> 
> > There surely is other pros and cons to this approach, and I'm pretty sure
> > you will point plenty of them.
> 
> At the moment (and, though I have taken I while to respond, I have
> thought about this issue occasionally over the last two months) I don't
> actually see a lot of problems with your current proposal. The code is
> pretty trivial at the moment.
> 
> The problem might only be that this does not yet go far enough. A lot of
> the controller-specific stuff ends up being related to the nand_ecc_ctrl
> struct. Those function pointers essentially end up being the bulk of
> controller-specific function pointers, in some cases, but those may even
> vary from nand_chip to nand_chip. I haven't figured out what best to do
> with these yet.

Actually I was planning to make the same separation for nand_ecc_ctrl.
The ops should be part of another structure (nand_ecc_ctrl seems like
a good container), while instantiation information (like the selected
ECC strength/step size and the oob layout) should be assigned to the
NAND chip itself.

> 
> (BTW, this source of problem makes it hard to deal with on-die/built-in
> ECC too; we might need to make use of the controller-specific *raw* read
> functions while still handling the on-die ECC status info. *hint hint
> Richard* *I'll comment on your on-die ECC patches soon, I hope*)

Hum, I'm not sure the raw functions are in cause here, but maybe we
should provide read/write page functions (those ones should access the
NAND in raw mode of course) in the nand_controller_ops.

This brings us to another aspect I'd like to rework: the way we're
attaching an ECC implementation to a NAND chip.
Currently, the nand_chip struct embeds a nand_ecc_ctrl struct which is
then filled by NAND controller drivers.
I'd like to make this field a pointer, so that NAND controllers can
provide an ECC implementation which can then be overloaded by nand core
if on-die ECC is available and explicitly requested.

I might be wrong, but all the attempt to support on-die ECC I've seen
so far are involving ECC implementation selection in each NAND
controller driver.

> > My point is, maybe we should provide default implementations to all drivers
> > (export GPL symbols) and let them fill their function pointer instead of
> > guessing what they want to do.
> > This way we would easily detect offending drivers and complain before they
> > can even register a NAND chip.
> 
> I don't think we can do exactly that -- that would leave a lot of
> implementations where we have to duplicate too much stuff -- though a
> compromise might work. Perhaps we can at least have nand_base complain /
> error out [2] if ecc.{read,write}_page() are provided by the driver but
> ecc.{read,write}_page_raw() are not. That would cover the likely problem
> cases, while avoiding work on some cases that are done properly.

Yes, that's a good idea.

> 
> > Now, let's talk about the implementation proposed in this RFC. It's not
> > complete yet, since the methods in nand_chip are still there (and
> > assigned to the NAND controller ops one), but my goal is to eventually
> > remove them.
> 
> Maybe some extra comments are in order there, then? We are always in
> need of big blocks of explanatory text :)

Sure, I'll add some comments :P.

> 
> > Anyway, this implies modifying all the drivers and I'm not inclined to do
> > that until every body has agreed on something.
> 
> Right, good idea. But it seems that only you and I have opinions here,
> so "agreement" may just be between us. Or you just weren't loud enough.

I'll add active NAND driver maintainers/developers in the loop for the
next version.

> 
> > I've only extracted methods I was pretty sure they were related to the NAND
> > controller, but there may be other methods that could be moved out (or I
> > might have wrongly assumed some of them were related to NAND controllers).
> > Please share your opinion on that point.
> 
> I think your initial set looks OK, though the 'write_page' function
> sticks out a bit. It's not symmetric (there's no similar 'read_page'),
> and I actually think the nand_ecc_ctrl pointers should cover everyone's
> uses (atmel_nand is the only user of nand_chip::write_page).

Yep, I'll look at it (either remove it and modify the atmel driver or
add a read_page for raw read/write page implementation at the NAND
controller level).

Thanks for your feedback.

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
