Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8ALv-0007mA-TZ
 for linux-mtd@lists.infradead.org; Sat, 19 Nov 2016 18:27:05 +0000
Date: Sat, 19 Nov 2016 19:26:39 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Alan Cox <alan@linux.intel.com>, David
 Woodhouse <David.Woodhouse@intel.com>, Jason Roberts
 <jason.e.roberts@intel.com>, Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 00/11] mtd: nand: denali: first round of cleanups of
 Denali NAND driver
Message-ID: <20161119192639.72f32c2a@bbrezillon>
In-Reply-To: <CAK7LNAQceXj1dspwFaRZgcKRxYZP4W+QAiOB_2-L9BeAz=ZS1g@mail.gmail.com>
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
 <20161119093011.17b53356@bbrezillon>
 <CAK7LNAQceXj1dspwFaRZgcKRxYZP4W+QAiOB_2-L9BeAz=ZS1g@mail.gmail.com>
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

Hi Masahiro,

On Sun, 20 Nov 2016 01:15:05 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
> 
> 
> 2016-11-19 17:30 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > Hi Masahiro,
> >
> > On Wed,  9 Nov 2016 13:35:19 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> I am tackling on this driver to use it for my SoCs.
> >> The difficulty is a bunch of platform specific stuff
> >> (more specifically, Intel MRST specific) is hard-coded in this driver.
> >>
> >> I need lots of rework to utilize the driver for generic cases,
> >> but at the same time, I found the driver code is really dirty,
> >> lots of unused code, odd comments, etc.
> >>
> >> The first thing I needed to do was to clean up the code.
> >> My work is still under the way, but I decided to drop this series
> >> for now.  I hope this series is easy to review, so I guess
> >> splitting into a small chunks is better than a one-shot patch bomb.  
> >
> > Well, all I've seen coming from you so far are minor cleanups and
> > cosmetic changes (including one introducing a regression).
> > I'll apply this series, but please, next time, try to send the whole
> > series, so that we can see the big picture, and not just random
> > cleanups.
> >
> > Thanks,
> >
> > Boris  
> 
> Right, this series alone is not useful at all.
> 
> I've been mostly stuck in some local works this week,
> but hopefully I will find some time to complete the series next week.
> 
> If you want to see the big picture,
> you can postpone this series until then.
> 

I already applied the series. Looking forward to the next steps ;-).

Sorry if I've been harsh to you when saying that your contributions
were 'useless'. It's just that we regularly receive random 'cleanups'
(generated with coccinelle, or similar tools), and, while these kind of
things help getting consistent code across the kernel, or
simplifying/clarifying existing code, it's not the kind of rework that
really improve the framework or address drivers flaws.

It's also sometime used by developers who just want to have patches in
mainline, and never reach the next step (contribute things to really
improve a framework or add support for new features/hardware).
Another reason I'm reluctant to apply such cleanup changes is that,
sometime a simple change might actually break things (see the 'mtd:
nand: denali_pci: add missing pci_release_regions() calls' patch).

And the last aspect is that cosmetic changes pollutes other
contributions by delaying their review.

Don't mistake me, if all these cleanups are serving a higher purpose (in
your case, adding support for a new IP revision in a clean way), then
that's all fine. But otherwise, I tend to dequeue those patches last.

Regards,

Boris
