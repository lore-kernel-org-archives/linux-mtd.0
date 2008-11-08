Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KygO5-0006eu-SK
	for linux-mtd@lists.infradead.org; Sat, 08 Nov 2008 05:29:34 +0000
Date: Fri, 7 Nov 2008 21:28:07 -0800 (PST)
From: Trent Piepho <tpiepho@freescale.com>
To: Andre Puschmann <andre.puschmann@imms.de>
Subject: Re: flash read performance
In-Reply-To: <gf12sb$oo3$1@ger.gmane.org>
Message-ID: <Pine.LNX.4.64.0811072052200.3864@t2.domain.actdsltmp>
References: <ge6old$oo3$1@ger.gmane.org>
	<20081029114256.GA2239@yoda.jdub.homelinux.org>
	<gea0sh$j97$1@ger.gmane.org> <49097176.5010506@thomson.net>
	<gec051$efd$1@ger.gmane.org>
	<49098716.1010404@thomson.net> <490F096D.5060208@imms.de>
	<20081104114229.GA1673@shareable.org> <49105CAB.3000706@imms.de>
	<Pine.LNX.4.64.0811061815190.3864@t2.domain.actdsltmp>
	<gf12sb$oo3$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Jamie Lokier <jamie@shareable.org>,
	MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 7 Nov 2008, Andre Puschmann wrote:
> Trent Piepho wrote:
>> I've found that writes do not work with caching enabled.  When the CPU writes
>> to the flash and then reads it back, it gets returned what it wrote.  That's
>> not what is supposed to happen.
>
> Sure, writes should be uncached and unbuffered. But I thought the mtd
> layer handles this correctly as there are two different ioremap's in the
> driver:
>
> map.virt = ioremap(..);
> map.cached = ioremap_cached(..);
> map.inval_cache = inval_cache_fct();

It depends on what mapping driver you're using.  It looks like only the
pxa2xx driver uses map.cached.  The physmap or of_physmap drivers that I'm
using don't use it.

> So, calling inval_cache_fct() just before any write operation and then
> using the uncached mapping should do the trick, no? On the other hand, I
> am not sure if the mtd-layer really behaves like that. Can somebody
> confirm this?

>From looking at the code I'd say you're right.

> I am not familiar with GPCM and eLBC, but it sounds about the same here.
> Same timings for writes and reads. But I use burst mode (4 words), but
> this only applies to reads.

I've switched from GPCM to UPM, which lets me use different timings for
read and write as well as use burst mode.

In non-cached and guarded mode, I now get 13.61 vs 12.30 MB/s.  That's just
from slightly better timings because I could make them different for read
vs write.  The big difference is cached and non-guarded reads, which went
to 44.79 MB/s from 14.24 MB/s.  That boost is from using burst mode.

So the answer is yes, turning on cache can boost cold-cache performance, if
doing so lets you use page burst mode.  It makes a huge difference in fact!

>> The biggest bootup delay I have now is waiting for the ethernet phy to get
>> online, which takes almost 3 seconds.
>
> Same here, ethernet phy takes sooo long. Here is what I do: I am using a
> parallel init. On script is just for loading the ethernet-module which
> is done next to the other scripts. So 2sec is cheated, cause ethernet
> isn't really available at this point of time.

It might be the case that the ethernet module resets the PHY when it loads
and/or when the ethernet device is opened.  That was a problem I was
having.  The PHY would almost be done when the dhcp client would run and
open eth0, which would start the phy all over again.
