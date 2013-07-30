Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4ASH-00083M-OC
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 13:59:14 +0000
Message-ID: <1375193034.14869.158.camel@sauron.fi.intel.com>
Subject: Re: No pull for mtd?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Tue, 30 Jul 2013 17:03:54 +0300
In-Reply-To: <20130731015329.GA2133@gmail.com>
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
 <20130731015329.GA2133@gmail.com>
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

On Tue, 2013-07-30 at 21:53 -0400, Huang Shijie wrote:
> > Well, just go ahead and help.
> > 
> > This is also how the l2 tree appeared. I noticed that dwmw2 is becoming
> > slow, and I just went ahead and created this tree without asking him,
> > and told him that now he does not have to go through the mailing list -
> > all the "sane" (from my POW) patches are in the l2 tree.
> > 
> > But please, do not create another tree now :-) Either start reviewing
> > others' patches, or declare ownership for some part of MTD and let's
> > create a corresponding branch in my tree for you. E.g., gpmi.
> 
> thanks.
> 
> But it is no need to create a branch for gpmi. The purely gpmi patches
> are very few. Most of time, the gpmi drives the mtd code to change.
> And the patch set is for both the mtd and the gpmi.

I will start looking at MTD mailing list patches soon and start picking
them. Just back from vacation.

> > In case of Brian, I'd fully trust the entire NAND subsystem to him, he
> > demonstrated that he is capable of taking care of it.
> If Brian acks a patch, and there is no more comment for this patch,
> and you are too busy to review this patch and accept this patch.
> How can this patch be pushed to l2-mtd ? 

I'll change my practice and will start processing patches which have
acks from others first.

> This is the exactly situation we are facing now.
> 
> If he has the right to push to the l2-mtd tree, i think we can speed up the mtd.

I am fine with giving Brian Norris write rights to the. I trust his
expertise and I like the way communicates and works in the MTD mailing
list.

-- 
Best Regards,
Artem Bityutskiy
