Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KyHIj-0003oi-RK
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 02:42:22 +0000
Date: Thu, 6 Nov 2008 18:41:39 -0800 (PST)
From: Trent Piepho <tpiepho@freescale.com>
To: Andre Puschman <andre.puschmann@imms.de>
Subject: Re: flash read performance
In-Reply-To: <49105CAB.3000706@imms.de>
Message-ID: <Pine.LNX.4.64.0811061815190.3864@t2.domain.actdsltmp>
References: <ge6old$oo3$1@ger.gmane.org>
	<20081029114256.GA2239@yoda.jdub.homelinux.org>
	<gea0sh$j97$1@ger.gmane.org> <49097176.5010506@thomson.net>
	<gec051$efd$1@ger.gmane.org>
	<49098716.1010404@thomson.net> <490F096D.5060208@imms.de>
	<20081104114229.GA1673@shareable.org> <49105CAB.3000706@imms.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	Arnaud Mouiche <arnaud.mouiche@thomson.net>,
	Jamie Lokier <jamie@shareable.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 4 Nov 2008, Andre Puschman wrote:
> Jamie Lokier schrieb:
>> I don't know much about this area, but will _writing_ to the flash
>> work reliably if ioremap_cached() is used?
>>
>> -- Jamie
>>
>
> Good point. I only was into reading and so I totally forgot writing ;-)
> I gave it a try, although it was terribly slow (only a few kb/s), it worked.
> I just did a cp uImage /dev/mtd3. On the other hand, I never tried writing
> with the old driver. So I don't know if this is faster.

I've found that writes do not work with caching enabled.  When the CPU writes
to the flash and then reads it back, it gets returned what it wrote.  That's
not what is supposed to happen.  For example, to program flash word 'i' to
the value 'val' using the Spansion/AMD method, you do this:

flash[0] = 0xf0f0;
flash[0x555] = 0xaaaa;
flash[0x2aa] = 0x5555;
flash[0x555] = 0xa0a0;
flash[i] = val;
while(flash[i] != val); /* wait for it to finish */

After this flash[0] should be whatever data was there before, not 0xf0f0. 
Same with flash[0x555] and the rest.  Only flash[i] should be modified.  But
if flash is cached, the cpu will use the cached values and think flash[0] is
0xf0f0 until the cache gets flushed.

> I also did some more testing with my improved flash-timing parameters,
> which yields to read speeds of up to 18-19MB/s, which is really fast
> compared
> to 1,3MB/s at the beginning :-)

My results, from a mpc8572 (powerpc) with a spansion s96gl064n flash chip on a
100 MHz bus.

Mapping				Speed (MB/sec) (MB = 1048576 bytes)
un-cached and guarded		12.30
cached and gaurded		14.24
cached and un-guarded		14.31
un-cached and un-guarded	14.66

I measured by reading flash linearly from beginning to end 32-bits at a time. 
Since the flash is bigger than the cache, ever read should have come from the
flash.  If I just read the same 1k over and over that would obviously be much
faster if it could come from the cache.

I'm just using the GPCM mode of the Freescale eLBC, which means I have to use
the same timings both for writes and reads.  There are parts of the timing I
could make faster for reads, but then they would be too short for writes, and
vice versa.  It also means I can't use the page burst mode, which would
speed up reads significantly.

> Anyway, with these results, booting the complete system in nearly (or
> even less than) 2s should be possible.

The biggest bootup delay I have now is waiting for the ethernet phy to get
online, which takes almost 3 seconds.
