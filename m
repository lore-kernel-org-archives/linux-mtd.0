Received: from tim.rpsys.net ([194.106.48.114])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I60d9-0002Qs-5W
	for linux-mtd@lists.infradead.org; Wed, 04 Jul 2007 04:54:37 -0400
Subject: Re: [PATCH/RFC] oops and panic message logging to MTD
From: Richard Purdie <rpurdie@openedhand.com>
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>,
	LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20070703094702.GA11992@angel.research.nokia.com>
References: <1182184301.6074.62.camel@localhost.localdomain>
	<1182239749.4403.48.camel@sauron>
	<1182247254.5760.17.camel@localhost.localdomain>
	<20070703094702.GA11992@angel.research.nokia.com>
Content-Type: text/plain
Date: Wed, 04 Jul 2007 09:54:21 +0100
Message-Id: <1183539261.4538.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-07-03 at 12:47 +0300, Jarkko Lavinen wrote:
> On Tue, Jun 19, 2007 at 11:00:54AM +0100, Richard Purdie wrote:
> > Its not a case of formatting the whole partition. The whole point of
> > this code is the following use case:
> > 
> > 1. Device crashes
> > 2. Device reboots
> > 3. mtdoops partition has a log of why it crashed
> 
> The oops logger uses oops_in_progress variable to detect the begin and the 
> end of an oops.  The end is detected when the first non-oops line comes and
> oops_in_progress is false.
> 
> This works if the kernel is still running after the oops and gemerates some 
> non-oops messages.  But if there is no non-oops line following an oops, no
> flushing will occur and there won't be a log on flash.

There was a printk within bust_spinlocks which flushed the klogd queues
and hence flushed the mtd_oops queue too.

I've noticed this has recently been removed and replaced with a wait
queue [1] and hence the problem mentioned above now exists (but didn't
when the driver was developed).

[1] http://git.o-hand.com/?p=linux-rpurdie;a=commitdiff;h=e3e8a75d2acfc61ebf25524666a0a2c6abb0620c

This raises the question of how to known when the oops has completed.
The neatest solution I can see would be to add some kind of optional
sync function pointer to struct console. Would that be acceptable?

Richard
