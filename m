Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V47eJ-0002Ap-Np
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 10:59:29 +0000
Message-ID: <1375182248.14869.127.camel@sauron.fi.intel.com>
Subject: Re: No pull for mtd?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Tue, 30 Jul 2013 14:04:08 +0300
In-Reply-To: <20130720122231.GB4410@gmail.com>
References: <20130712124728.GB31726@localhost>
 <CAN8TOE-y0HvZYWqwoPEZhReVVP_iY6t5p1N0ZMJXPQqwuK5ozQ@mail.gmail.com>
 <51E64B40.1030408@freescale.com>
 <CAF4G-tLsOO_F-Mhn=+5vS2kkJuoeLJwrTdCR90DVuQQ+xn40aw@mail.gmail.com>
 <CAN8TOE_osCKY86W2O5mLxSSahyiW2peFwDhCFuSQ+ewGHeXNKw@mail.gmail.com>
 <1374102799.21468.3.camel@shinybook.infradead.org>
 <CAN8TOE9CX7fcDRQzee=Xg5TYkYYOs3__vWzy3r0Ofg0aCsgxSg@mail.gmail.com>
 <1374109439.21468.67.camel@shinybook.infradead.org>
 <CAN8TOE_y=mDY4frFB9kmedhGnNhf4pQwqH1q+fAcDAE_RNwO+A@mail.gmail.com>
 <20130720122231.GB4410@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: torvalds@linux-foundation.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-07-20 at 08:22 -0400, Huang Shijie wrote:
> > I think that mostly sounds OK. I can't speak for everyone, but it
> > seems that for some of us, the process just needs to be able to
> adapt
> > to changes in job situations (where at least you and Artem aren't
> even
> > employed in MTD-related work anymore), vacations, babies, absences,
> or
> > any of the other reasons that MTD participation ebbs and flows. So
> > bringing others into the process should help.
> yes.
> 
> If more people can ack and merge the patches, we can speed up the mtd.

Sure. Go ahead and review things which are outside of your gpmi driver.
Ack them, nack them, review them, etc. This will be a real help.
> 
> I really envy the other maillist, you can get response in several
> days.

Well, yes. MTD is a small and (IMHO) a veeery slowly dying subsystem.
People mostly care about their own little things. Few people are
interested in improving it in general. Such is life.

Brian was one of those who did great job in MTD overall, especially in
the NAND framework. He reviewed others patches. But even Brian got
silent lately.

Shmulik comes to mind - he reviewed things all over MTD.

You mostly contribute to your own driver. And I think there were times
when I had to ask you to do an infrastructure rework instead of working
around MTD infrastructure problems with in-driver hacks. No one is
perfect :-)

So there is simply not enough people, thus the slowness.

> > 
> > I guess we'll see what Artem thinks when he's back from vacation and
> Waiting for Artem's solution too. He becomes much busy this year, and
> can not review the patches as he did last year.

Well, just go ahead and help.

This is also how the l2 tree appeared. I noticed that dwmw2 is becoming
slow, and I just went ahead and created this tree without asking him,
and told him that now he does not have to go through the mailing list -
all the "sane" (from my POW) patches are in the l2 tree.

But please, do not create another tree now :-) Either start reviewing
others' patches, or declare ownership for some part of MTD and let's
create a corresponding branch in my tree for you. E.g., gpmi.

In case of Brian, I'd fully trust the entire NAND subsystem to him, he
demonstrated that he is capable of taking care of it.

-- 
Best Regards,
Artem Bityutskiy
