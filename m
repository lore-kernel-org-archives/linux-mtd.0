Received: from rproxy.gmail.com ([64.233.170.206])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CQKXi-0006x8-0H
	for linux-mtd@lists.infradead.org; Sat, 06 Nov 2004 01:59:23 -0500
Received: by rproxy.gmail.com with SMTP id b11so182634rne
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Nov 2004 22:59:21 -0800 (PST)
Message-ID: <9f920bdf04110522596551a0a4@mail.gmail.com>
Date: Fri, 5 Nov 2004 22:59:20 -0800
From: Dan Post <postster@gmail.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.61.0411052041230.5250@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.61.0411052041230.5250@xanadu.home>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD and XIP
Reply-To: Dan Post <postster@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 5 Nov 2004 21:08:35 -0500 (EST), Nicolas Pitre <nico@cam.org> wrote:
> Just to let you all know that I committed to CVS my work on making MTD
> deal with flash used for XIP purpose.  At the moment it only supports
> Intel compatible flash on a SA11x0 or PXA2xx based system, but it should
> be easy to extend to other configurations as well.

Nicolas,
This is very cool.  I scanned through the code briefly, and will take
a look at it first chance I get next week (OK, it might be a little
later; I am pretty swamped).  I had hoped to get to doing this sort of
thing in the next few months (i.e. doing XIP support *right* and on a
*relevant* kernel), so I was glad to see your work.  It looks very
clean, but I haven't run a fine-tooth comb through it.
However, the automated post to the CVS list reported:
***** Error reading new file: [Errno 2] No such file or directory: 'xip.h'

Do you have a specific reason to always disable write suspend on XIP
kernels?  That's a pretty big latency hit, and I don't think we need
to disable it for XIP systems.
I saw your comment that "the XIP system config appears to have
problems using write suspend at the moment".  Any specifics?

I suppose one of these days I'll have to get around to doing empirical
measurements on the effect write suspend on busy systems has to write
throughput.  I seem to remember someone else, perhaps David, did that
a while back.

What kind of changes does this require to the map file?  This does
interrupt-pollihg (software-read-while-write, SW/RWW) all the time. 
(Right?)  I think we can add intelligence to the map file, and set a
bit for each hardware partition that has XIP code in it (e.g. kernel,
linear^XIP CRAMFS, ...), so, for instance, we don't constantly suspend
writes / erases to partitions that don't ever have XIP code in them
just because an interrupt happens in the system.  A la my old kludgy
version for 2.4.

More thoughts to come later...

> Also for those interested in making their kernel XIP on ARM, you can
> look at the following patches against Linux-2.6.9:
> http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=2154/1
> http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=2160/1

Once again, cool.  I suppose I should follow the ARM-Linux patch
repository a little closer, too... :)

Cheers,
Dan Post
(Yes, this is my new mail account.  Handy for mailing lists.)
