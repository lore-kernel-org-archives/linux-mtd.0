Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L1AXW-0003Us-D3
	for linux-mtd@lists.infradead.org; Sat, 15 Nov 2008 02:05:35 +0000
Date: Fri, 14 Nov 2008 18:02:27 -0800 (PST)
From: Trent Piepho <tpiepho@freescale.com>
To: Andre Puschmann <andre.puschmann@imms.de>
Subject: Re: flash read performance
In-Reply-To: <gfc19i$tpr$1@ger.gmane.org>
Message-ID: <Pine.LNX.4.64.0811141745040.11673@t2.domain.actdsltmp>
References: <ge6old$oo3$1@ger.gmane.org>
	<20081029114256.GA2239@yoda.jdub.homelinux.org>
	<gea0sh$j97$1@ger.gmane.org> <49097176.5010506@thomson.net>
	<gec051$efd$1@ger.gmane.org>
	<49098716.1010404@thomson.net> <490F096D.5060208@imms.de>
	<20081104114229.GA1673@shareable.org> <49105CAB.3000706@imms.de>
	<Pine.LNX.4.64.0811061815190.3864@t2.domain.actdsltmp>
	<gf12sb$oo3$1@ger.gmane.org>
	<Pine.LNX.4.64.0811072052200.3864@t2.domain.actdsltmp>
	<gfc19i$tpr$1@ger.gmane.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 11 Nov 2008, Andre Puschmann wrote:
> Trent Piepho schrieb:
>>> map.virt = ioremap(..);
>>> map.cached = ioremap_cached(..);
>>> map.inval_cache = inval_cache_fct();
>>
>> It depends on what mapping driver you're using.  It looks like only the
>> pxa2xx driver uses map.cached.  The physmap or of_physmap drivers that I'm
>> using don't use it.
>
> The flashmap-drive I am using is custom one made for the gumstix-board.
> However, it is almost identically to pxa2xx-driver from newer kernels.

I added support to physmap_of for using map.cached on ppc32, seems to be
working so far.

But, it turns out it doesn't work for XIP.  The flash drivers that support XIP
implement a ->point() method that something like AXFS or cramfs+xip use to
mmap the flash.  But these just return pointers to the uncached mapping.

>> In non-cached and guarded mode, I now get 13.61 vs 12.30 MB/s.  That's just
>> from slightly better timings because I could make them different for read
>> vs write.  The big difference is cached and non-guarded reads, which went
>> to 44.79 MB/s from 14.24 MB/s.  That boost is from using burst mode.
>
> Whop, this is great news. Btw. do you drive your flash in asynchronous
> or in synchronous mode? Do you have an extra flash configuration
> register that you need to modify in order to use the burst mode?
> My intel NOR flash has an extra read configuration register (RCR).
> However, for some reason I am not able to read/modify/read this register
> successfully.

In asynchronous mode.  I didn't have to program anything special in the flash
chip, just program the localbus controller to use page burst transfers.
