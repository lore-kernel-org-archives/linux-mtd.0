Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4AJ5-0007o0-Qg
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 13:49:44 +0000
Received: by mail-pa0-f53.google.com with SMTP id lb1so7234634pab.12
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 06:49:22 -0700 (PDT)
Date: Tue, 30 Jul 2013 21:53:38 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: No pull for mtd?
Message-ID: <20130731015329.GA2133@gmail.com>
References: <CAN8TOE-y0HvZYWqwoPEZhReVVP_iY6t5p1N0ZMJXPQqwuK5ozQ@mail.gmail.com>
 <51E64B40.1030408@freescale.com>
 <CAF4G-tLsOO_F-Mhn=+5vS2kkJuoeLJwrTdCR90DVuQQ+xn40aw@mail.gmail.com>
 <CAN8TOE_osCKY86W2O5mLxSSahyiW2peFwDhCFuSQ+ewGHeXNKw@mail.gmail.com>
 <1374102799.21468.3.camel@shinybook.infradead.org>
 <CAN8TOE9CX7fcDRQzee=Xg5TYkYYOs3__vWzy3r0Ofg0aCsgxSg@mail.gmail.com>
 <1374109439.21468.67.camel@shinybook.infradead.org>
 <CAN8TOE_y=mDY4frFB9kmedhGnNhf4pQwqH1q+fAcDAE_RNwO+A@mail.gmail.com>
 <20130720122231.GB4410@gmail.com>
 <1375182248.14869.127.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375182248.14869.127.camel@sauron.fi.intel.com>
Cc: torvalds@linux-foundation.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 30, 2013 at 02:04:08PM +0300, Artem Bityutskiy wrote:
> On Sat, 2013-07-20 at 08:22 -0400, Huang Shijie wrote:
> > 
> > If more people can ack and merge the patches, we can speed up the mtd.
> 
> Sure. Go ahead and review things which are outside of your gpmi driver.
> Ack them, nack them, review them, etc. This will be a real help.
ok.
i will spend more time to review the patches.

> > 
> > I really envy the other maillist, you can get response in several
> > days.
> 
> Well, yes. MTD is a small and (IMHO) a veeery slowly dying subsystem.
I am not sure it is dying, but there are still so many patches pending
in the maillist.

> People mostly care about their own little things. Few people are
> interested in improving it in general. Such is life.

I am interested in improve the general code. But my patch set is
pending so long to accept. I feel frastrated. I still have some other
patch set queued in my hand, and do not be sent out.  
The patch sets have dependency. If the patch set A is not merged,
i can not send out the patch set B.    

And i still want to some more features to the mtd, such as cache read,
multi-lun read.    

> 
> Brian was one of those who did great job in MTD overall, especially in
> the NAND framework. He reviewed others patches. But even Brian got
> silent lately.
I think he feels frastrated too. :)

> 
> Shmulik comes to mind - he reviewed things all over MTD.
> 
> You mostly contribute to your own driver. And I think there were times
> when I had to ask you to do an infrastructure rework instead of working
> around MTD infrastructure problems with in-driver hacks. No one is
> perfect :-)
sorry. I was too busy in the past. But i have more time in the future.

> 
> So there is simply not enough people, thus the slowness.
> 
> > > 
> > > I guess we'll see what Artem thinks when he's back from vacation and
> > Waiting for Artem's solution too. He becomes much busy this year, and
> > can not review the patches as he did last year.
> 
> Well, just go ahead and help.
> 
> This is also how the l2 tree appeared. I noticed that dwmw2 is becoming
> slow, and I just went ahead and created this tree without asking him,
> and told him that now he does not have to go through the mailing list -
> all the "sane" (from my POW) patches are in the l2 tree.
> 
> But please, do not create another tree now :-) Either start reviewing
> others' patches, or declare ownership for some part of MTD and let's
> create a corresponding branch in my tree for you. E.g., gpmi.

thanks.

But it is no need to create a branch for gpmi. The purely gpmi patches
are very few. Most of time, the gpmi drives the mtd code to change.
And the patch set is for both the mtd and the gpmi.


> 
> In case of Brian, I'd fully trust the entire NAND subsystem to him, he
> demonstrated that he is capable of taking care of it.
If Brian acks a patch, and there is no more comment for this patch,
and you are too busy to review this patch and accept this patch.
How can this patch be pushed to l2-mtd ? 

This is the exactly situation we are facing now.

If he has the right to push to the l2-mtd tree, i think we can speed up the mtd.

thanks
Huang Shijie
