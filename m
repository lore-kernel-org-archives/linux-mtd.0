Received: from mx3.mail.elte.hu ([157.181.1.138])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxKtk-0004XJ-IY
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 13:25:17 +0000
Date: Mon, 12 Oct 2009 15:25:03 +0200
From: Ingo Molnar <mingo@elte.hu>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] panic.c: export panic_on_oops
Message-ID: <20091012132503.GD25464@elte.hu>
References: <1255241458-11665-1-git-send-email-dedekind1@gmail.com>
	<20091012111545.GB8857@elte.hu>
	<1255346731.9659.31.camel@localhost>
	<20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<20091012142714.56362465@marrow.netinsight.se>
	<20091012123210.GB22766@elte.hu>
	<20091012140821.5dfa1598@lxorguk.ukuu.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20091012140821.5dfa1598@lxorguk.ukuu.org.uk>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


* Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:

> > See my reply to David Woodhouse, i think we should add support for 
> > buffering in kernel/printk.c and that would both fix your problems, 
> > would simplify the driver (significantly!) and would expose the 
> > generic buffering capability to other console drivers as well.
> 
> Buffering printk in general is bad. [...]

The general (and default) case would be 0 buffering - i.e. finegrained 
per line calls to ->console_write().

This is the common case indeed, we want to get console output out as 
soon as possible and as finegrained as possible - as we dont know when a 
failure mode removes our ability to print anything else.

My argument is that instead of a complicated dance of workqueue versus 
non-workqueue printk support in the MTD code in drivers/mtd/mtdoops.c, 
this should be done at the generic console level.

It's not hard, nor complex if done at the right level, nor does it 
impact the regular zero-buffering codepath in a significant way - and 
the end result would be a significantly simpler (and, in turn, more 
robust) MTD printk driver.

I care about this because i still havent given up hope that the company 
you are working for will finally give us some permanent storage in the 
CPU itself, so that we can have cross-reboot printk buffering ;-) If 
that storage is in the form of Flash, then buffering (to optimize write 
cycles) is probably a must.

> [...] Given a driver needs only to provide about 6 lines of code using 
> a kfifo is it really that hard for the odd code that wants to buffer 
> to do that ?

Avoiding a workqueue in printk is about the critical path of failure and 
about complexity in general.

I dont see how kfifo helps here much - kfifo is really just a relatively 
simple dynamic memory buffer abstraction - while most of the complexity 
here is elsewhere. Could you explain what you meant with kfifo here 
please?

	Ingo
