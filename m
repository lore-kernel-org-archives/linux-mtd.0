Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa2MS-0008Nm-Cc
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 12:53:29 +0000
Message-ID: <1412340740.3795.60.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] UBI: Ensure that all fastmap work is done upon WL
 shutdown
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Fri, 03 Oct 2014 15:52:20 +0300
In-Reply-To: <542A64BB.7060904@nod.at>
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-2-git-send-email-richard@nod.at>
 <1412058366.23429.77.camel@sauron.fi.intel.com> <542A548A.7040308@nod.at>
 <1412063620.2379.12.camel@sauron.fi.intel.com> <542A64BB.7060904@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-09-30 at 10:07 +0200, Richard Weinberger wrote:
> > UBI consists of subsystems. Subsystems try to be more or less
> > independent, whenever possible. They expose interface functions for
> > other subsystems. Of course the split is not ideal, but we do our best.
> > 
> > * wl.c does wear-levelling.
> > * wl.c does not do fastmap.
> > * fastmap.c does fastmap.
> > * I am unhappy seeing yet another ifdef to wl.c
> 
> I can warp it.

What I am looking forward to is to see fastmap.c and wl.c to be
separated in a better way. Would your answer be "this is impossible", or
"I've got some ideas"?

The end result should be no #ifdefs in wl.c, or very few of them.

> > * I am unhappy seeing wl.c calling 'flush_work(&ubi->fm_work)', because
> > fastmap.c should deal with 'fm_work'. Or said differently, wl.c is not a
> > fastmap queue baby-sitter. fastmap.c is.
> 
> But wl.c has to trigger the deferred fastmap work as only wl.c detects when it is
> needed. I you want I can implement a ubi_fastmap_shutdown() in fastmap.c which
> calls flush_work().
> But I did it in wl.c to have it balanced. wl.c triggers and stops the fastmap work.

wl.c should be responsible for wear levelling.

wl.c should not be responsible for managing the fastmap pool.

Architecture-wise, is the pull something above or below the WL level?

I think above.

In the past, the EBA layer, which sits on top of the WL layer, called
the WL functions directly to get an and put the LEB.

Then you added the Fastmap pool inbetween EBA and WL. And you added it
to wl.c, it seems (note, I do not know the fastmap well enough, so be
patient and carefully explain me things when I am wrong, please).

What I think is that the pool should live in fastmap.c instead. EBA
should call the pool functions, instead of the WL functions. The pool
code should call the WL functions whenever it needs to refill the pool.

Can something like this be done?

> Some background info:
> Fastmap needs to create a snapshot of the UBI state.
> This is why you cannot call it within an UBI work. As UBI works can run in parallel.

My point is, let's do it in fastmap.c. Let's keep each layer as pure a
possible.

Right now wl.c is populated by fastmap-specific stuff too much. It is
hard to make wear-levelling improvements there because of this.

I want the complexity to be partitioned.

I want WL complexity be in wl.c

I do want to try hard to have _no_ fastmap complexity in wl.c.

I am looking for a discussion about how we could do this.

This patch adds a little bit, but more fastmap complexity to the WL
subsystem. I am trying to block this.
