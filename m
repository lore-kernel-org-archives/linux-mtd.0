Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BzgRd-0008VK-VG
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2004 14:54:59 -0400
Message-ID: <412B8EF2.8050606@mvista.com>
Date: Tue, 24 Aug 2004 11:54:42 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <412B53F9.5030006@bergeron.com>
	<1093360220.14552.12475.camel@hades.cambridge.redhat.com>
In-Reply-To: <1093360220.14552.12475.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can jffs2 support XIP extensions?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

> If you really really really care about power, then you might care that
> RAM actually takes more power at runtime than flash does. But then we'd
> just laugh at you for using Linux instead of something much smaller and
> in particular without a periodic timer tick :)

A debate of the merits of various OS technologies for battery-powered 
portable devices would be interesting, but a number of awfully bright 
product designers are choosing Linux for *some* reason. ;)  Makers of 
cell phones do really really care about power.  And periodic timer ticks 
are being worked on (such as the Variable Scheduling Timeouts technology 
of George Anzinger's High Res Timers project).

> The only reason for using XIP under Linux which is even vaguely sane is
> to improve boot time. But since the figures shown at OLS were comparing
> apples and oranges -- compressed non-XIP kernel vs. uncompressed XIP
> kernel, with a lot of the time taken being the actual decompression, I'm
> not entirely convinced. There may well be better alternatives, without
> the runtime and hardware overhead.

For the kernel boot time it's true that boot times tend to be dominated 
by the decompression step.  I measured this on a couple platforms at one 
point (some of my measurements may have been in the OLS presentation, 
not sure).  I didn't directly measure kernel boot times of an 
uncompressed non-XIP kernel, but would roughly guess an uncompressed 
non-XIP kernel would boot to /sbin/init in only about a few tens of 
milliseconds more time (I'm guessing about the increased time to copy an 
uncompressed tetx image to RAM) than an XIP kernel on a 266MHz PowerPC 
405LP, and 168MHz OMAP ARM 926T is probably similar (it seems to better 
deal with the cache effects).

Application startup times non-XIP vs. XIP, compared to either CramFS 
compressed or ROMFS uncompressed, can add up to a more significant 
savings -- about 2 seconds for a TinyX startup and app start in the 
configuration I tried.  I have more data on kernel boot time, 
application startup, system sizing, and runtime performance benchmarks 
that I can send to anyone interested.

And yes, lower-overhead alternative technologies to help reduce SDRAM 
needs and sub-second startup times for consumer electronics would be 
welcome and are the subject of various other projects...

-- 
Todd Poynor
MontaVista Software
