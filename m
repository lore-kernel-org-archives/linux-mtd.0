Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UkMMh-00010A-2p
 for linux-mtd@lists.infradead.org; Wed, 05 Jun 2013 22:39:36 +0000
Message-ID: <1370471946.20138.67.camel@ideak-mobl>
Subject: Re: [PATCH 3/3] mtd: cfi_cmdset_0002: increase do_write_buffer()
 timeout
From: Imre Deak <imre.deak@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 06 Jun 2013 01:39:06 +0300
In-Reply-To: <CAN8TOE8FRtQupXwvAtrVSN-C-nQz-XgOW7OA5C=XRs9YmCwTkg@mail.gmail.com>
References: <1370310406-413-1-git-send-email-computersforpeace@gmail.com>
 <1370310406-413-3-git-send-email-computersforpeace@gmail.com>
 <51AD9140.90500@freescale.com>
 <CAN8TOE9UDGuQd9AbE-4UVcAiqCFpqhY=fX+LbrDybdgr16THdQ@mail.gmail.com>
 <CAN8TOE8FRtQupXwvAtrVSN-C-nQz-XgOW7OA5C=XRs9YmCwTkg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-06-05 at 14:08 -0700, Brian Norris wrote:
> Adding a few others
> 
> For reference, this thread started with this patch:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2013-June/047164.html
> 
> On Wed, Jun 5, 2013 at 11:01 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Tue, Jun 4, 2013 at 12:03 AM, Huang Shijie <b32955@freescale.com> wrote:
> >> 于 2013年06月04日 09:46, Brian Norris 写道:
> >>> After various tests, it seems simply that the timeout is not long enough
> >>> for my system; increasing it by a few jiffies prevented all failures
> >>> (testing for 12+ hours). There is no harm in increasing the timeout, but
> >>> there is harm in having it too short, as evidenced here.
> >>>
> >> I like the patch1 and patch 2.
> >>
> >> But extending the timeout from 1ms to 10ms is like a workaround. :)
> >
> > I was afraid you might say that; that's why I stuck the first two
> > patches first ;)
> ...
> >> I GUESS your problem is caused by the timer system, not the MTD code. I
> >> ever met this type of bug.
> ...
> >> I try to describe the jiffies bug with my poor english:
> >>
> >> [1] background:
> >> CONFIG_HZ=100, CONFIG_NO_HZ=y
> >>
> >> [2] call nand_wait() when we write a nand page.
> >>
> >> [3] The jiffies was not updated at a _even_ speed.
> >>
> >> In the nand_wait(), you wait for 20ms(2 jiffies) for a page write,
> >> and the timeout occurs during the page write. Of course, you think that
> >> we have already waited for 20ms.
> >> But in actually, we only waited for 1ms or less!
> >> How do i know this? I use the gettimeofday to check the real time when
> >> the timeout occur.
> >
> > I suspected this very type of thing, since this has come up in a few
> > different contexts. And for some time, with a number of different
> > checks, it appeared that this *wasn't* the case. But while writing
> > this very email, I had the bright idea that my time checkpoint was in
> > slightly the wrong place; so sure enough, I found that I was timing
> > out after only 72519 ns! (That is, 72 us, or well below the max write
> > buffer time.)
> 
> So I can confirm that with the 1ms timeout, I actually am sometimes
> timing out at 40 to 70 microseconds. I think this may have multiple
> causes:
> (1) uneven timer interrupts, as suggested by Huang?
> (2) a jiffies timeout of 1 is two short (with HZ=1000, msecs_to_jiffies(1) is 1)
> 
> Regarding reason (2):
> 
> My thought (which matches with Imre's comments from his [1]) is that
> one problem here is that we do not know how long it will be until the
> *next* timer tick -- "waiting 1 jiffy" is really just waiting until
> the next timer tick, which very well might be in 40us! So the correct
> timeout calculation is something like:
> 
> uWriteTimeout = msecs_to_jiffies(1) + 1;
> 
> or with Imre's proposed methods (not merged upstream yet), just:
> 
> uWriteTimeout = msecs_to_jiffies_timeout(1);
> 
> Thoughts?

I think what you describe at (2) wouldn't cause a premature timeout in
your case. The driver uses the returned jiffy value something like the
following in all cases (before applying the patch with the +1 change):

uWriteTimeout = msecs_to_jiffies(1);
timeout = jiffies + uWriteTimeout;
while (!condition)
	if (time_after(jiffies, timeout))
		return -ETIMEDOUT;

Here using time_after() as opposed to time_after_eq() serves as an
implicit +1 and thus guarantees that you wait at least 1 msec.

A bit off-topic:
Though using msecs_to_jiffies() is not a problem here, I think in this
case and almost always it would need less thinking and thus be safer to
still use msecs_to_jiffies_timeout(). A rare exception would be when the
+1 adjustment would accumulate to a significant error, like in the
following polling loop:

for (i = 0; i <= 50; i++) {
	if (poll_condition)
		return 0;
	schedule_timeout(msecs_to_jiffies(1));
}
return -ETIMEDOUT;

Here on HZ=1000 we would time out in average after 100 msec using
msecs_to_jiffies_timeout(1), whereas the intention was 50 msecs. 

--Imre

> Note that a 2-jiffy timeout does not, in fact, totally resolve my
> problems; with a timeout of 2 jiffies, I still get a timeout that
> (according to getnstimeofday()) occurs after only 56us. It does
> decrease its rate of occurrence, but Huang may still be right that
> reason (1) is involved.
> 
> Brian
> 
> [1] http://marc.info/?l=linux-kernel&m=136854294730957
