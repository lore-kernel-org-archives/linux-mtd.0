Received: from [212.17.98.56] (helo=hofr.at)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BzqyJ-0001Lg-DN
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2004 02:09:26 -0400
From: Der Herr Hofrat <der.herr@hofr.at>
Message-Id: <200408250608.i7P68x004504@hofr.at>
In-Reply-To: <412B92A9.4060901@joshuawise.com> from Joshua Wise at "Aug 24,
	2004 03:10:33 pm"
To: Joshua Wise <joshua@joshuawise.com>
Date: Wed, 25 Aug 2004 08:08:59 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: Can jffs2 support XIP extensions?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > For the kernel boot time it's true that boot times tend to be dominated 
> > by the decompression step.  I measured this on a couple platforms at one 
> > point (some of my measurements may have been in the OLS presentation, 
> > not sure).  I didn't directly measure kernel boot times of an 
> > uncompressed non-XIP kernel, but would roughly guess an uncompressed 
> > non-XIP kernel would boot to /sbin/init in only about a few tens of 
> > milliseconds more time (I'm guessing about the increased time to copy an 
> > uncompressed tetx image to RAM) than an XIP kernel on a 266MHz PowerPC 
> > 405LP, and 168MHz OMAP ARM 926T is probably similar (it seems to better 
> > deal with the cache effects).
> Also remember that on many systems, flash is a lot slower than RAM, so 
> it is entirely possible that an XIP kernel would actually be _SLOWER_ 
> than non-XIP!
>
there are a number of examples of boot times and runtime performance posted
on the web and ALL of them show that the boot times of XIP
enabled kernels are primarily lower due to the kernel
not being decompressed and other steps actually being slower.

   Table of bootup times:

   Boot Stage                         Non-XIP  Time XIP Time
   Copy kernel to RAM                 85 ms    12 ms 
   Decompress kernel                  453 ms   0 ms
   Kernel time to initialize
   (time to first user space program) 819 ms   882 ms
   Total kernel boot time             1357 ms  894 ms
   Reduction:                         -        463 ms

(from: http://tree.celinuxforum.org/pubwiki/moin.cgi/KernelXIP)

The execution times of most system calls are clearly longer (not sure if
it was a 405/266 or a OMAP/168) fork was reported at 7.1 vs 4.8 us , trivial 
system calls will be about the same time (did not find the reference - if of 
interest I can dig it out).

The only (?) real argument for XIP is system RAM requirements on very small 
systems (see: http://www.denx.de/twiki/publish/DULG/ConfigureLinuxForXIP.htm) 
 
hofrat
 
