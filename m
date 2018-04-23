Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAYMF-0002vk-Ai
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 10:06:06 +0000
Date: Mon, 23 Apr 2018 12:05:35 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: Sam Lefebvre <sam.lefebvre@essensium.com>,
 linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 11/18] mtd: rawnand: gpmi: instantiate cmdfunc
Message-ID: <20180423120535.70fdc6bb@bbrezillon>
In-Reply-To: <5965e578-a6bf-74b2-6cda-9ada6dae6285@mind.be>
References: <20180420081946.16088-1-sam.lefebvre@essensium.com>
 <20180420081946.16088-12-sam.lefebvre@essensium.com>
 <20180420223845.049b924f@bbrezillon>
 <5965e578-a6bf-74b2-6cda-9ada6dae6285@mind.be>
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

Hi Arnout,

On Mon, 23 Apr 2018 09:43:48 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 20-04-18 22:38, Boris Brezillon wrote:
> > Hi Sam, Arnout,
> > 
> > On Fri, 20 Apr 2018 10:19:39 +0200
> > Sam Lefebvre <sam.lefebvre@essensium.com> wrote:
> >   
> >> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> >>
> >> Later patches will optimize the command handling for gpmi. This
> >> requires a gpmmi-specific implementation of cmdfunc. As a first step,
> >> nand_command() is copied literally from nand_base.c (after merging
> >> nand_command() and nand_command_lp()).  
> > 
> > NACK. As said in my review of patch 10, we're trying to move a many
> > drivers as possible to the ->exec_op() approach in order to ease
> > maintenance of the NAND subsystem. What you're doing here is going in
> > the wrong direction.
> > 
> > Please work on a solution based on ->exec_op().  
> 
>  The problem is that exec_op() is a revolutionary change, because you need to
> change *all* operations at the same time. I personally believe in a step-by-step
> approach rather than rewriting everything from scratch. That's why patches 11,
> 12, 13, 14, 15 are all split out, to show for each step how and why it works.

Well, that's also one of the thing I don't like in this series. Copying
things from the core just to remove part of the logic afterwards is not
a good idea. But to be honest, that's not my biggest concern right now.

> 
>  In a step-by-step approach, I think that going through cmdfunc is a step
> towards exec_op. In terms of granularity, I think cmd_ctrl < cmdfunc < exec_op
> right?

No it's not. ->cmdfunc() is just a pain to maintain, because every time
we add a new operation in the core we have to patch all drivers that
implement ->cmdfunc() on their own. For me (as a NAND maintainer) it's:

cmdfunc < cmd_ctrl < exec_op

> 
>  It also doesn't help that there is not much documentation of exec_op.

This I agree with.

> There's
> Miquel's FOSDEM18 talk, there's the struct documentation, and there are just a
> few drivers that can serve as an example. In particular, I don't understand what
> happens when a pattern is not included in the nand_op_parser. It's also not
> clear to me how ECC is supposed to be integrated with it. For example, looking
> at the marvell driver, it seems the nand_base infra and exec_op are bypassed
> entirely for hwecc accesses.

Write and read path are where we care about optimizations, hence the
specific logic. If you want to optimize this path, maybe you should try
to overload the chip->ecc.read/write_page() functions.

> 
>  Finally, we are working on a budget that gets extended on a day-by-day basis,
> so we wanted to be able to push *something* within budget rather than not
> upstreaming anything at all.

Except getting from ->cmd_ctrl() to ->cmdfunc() is like going one step
back to me, so that's not something I'm willing to accept.

> 
>  That said, what should be the next steps? I guess continuing with patch 19, 20,
> 21 using the same approach doesn't make a lot of sense since you're not going to
> merge it in this form. We can of course repost patches 1-8 with a fix in patch
> 7. We could start working on exec_op conversion, but there's a big chance that
> nothing will be ready for submission when the budget dries up, and we probably
> won't get to the . Any other ideas?

If you don't want/can't invest time on ->exec_op(), I'd suggest
overloading ->read/write_page().

> 
>  If we do work on conversion to exec_op, what's the proper way to do this gradually?

Not sure what you mean by gradually, but you can have a look at how
miquel converted the FSMC driver from ->cmd_ctrl() to ->exec_op() [1].

Regards,

Boris

[1]https://patchwork.ozlabs.org/cover/874445/
