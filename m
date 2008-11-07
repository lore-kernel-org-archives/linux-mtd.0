Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KyK1H-0007UN-5H
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 05:36:31 +0000
Date: Thu, 6 Nov 2008 21:36:08 -0800 (PST)
From: Trent Piepho <tpiepho@freescale.com>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: flash read performance
In-Reply-To: <20081107040200.GB17593@shareable.org>
Message-ID: <Pine.LNX.4.64.0811062121130.3864@t2.domain.actdsltmp>
References: <ge6old$oo3$1@ger.gmane.org>
	<20081029114256.GA2239@yoda.jdub.homelinux.org>
	<gea0sh$j97$1@ger.gmane.org> <49097176.5010506@thomson.net>
	<gec051$efd$1@ger.gmane.org>
	<49098716.1010404@thomson.net> <490F096D.5060208@imms.de>
	<20081104114229.GA1673@shareable.org> <49105CAB.3000706@imms.de>
	<Pine.LNX.4.64.0811061815190.3864@t2.domain.actdsltmp>
	<20081107040200.GB17593@shareable.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Arnaud Mouiche <arnaud.mouiche@thomson.net>,
	Andre Puschman <andre.puschmann@imms.de>,
	MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 7 Nov 2008, Jamie Lokier wrote:
> Based on Andre's observation, I will soon try enabling cache for my
> NOR, and see if it makes a difference to cold-cache read performance.
> I don't expect it, but it's worth a try.

It possible it could help by efficiently doing the reads back-to-back with
no wasted cycles between them.  I think it's necessary if you want to
benefit from page mode, but that's something I haven't tried yet.

> You might also find the write operation to be unreliable, if the
> caching mode is write-back rather than write-through.

Proper use of "sync" instructions, or whatever the arch uses to insure that
writel() is strictly ordered should fix that.

> Really, you should use an uncached mapping to write commands to the
> flash, flush the cached mapping (for reads) when commands are written,
> and prevent any access during the writes (this is in MTD normally).
> You could optimise by flushing only the cached read regions which are
> affected by write and erase commands.

Yes, that is probably the best.  Most NOR flash writing is so slow that the
cache flushes shouldn't be too expensive.

>> Mapping				Speed (MB/sec) (MB = 1048576 bytes)
>> un-cached and guarded		12.30
>> cached and gaurded		14.24
>> cached and un-guarded		14.31
>> un-cached and un-guarded	14.66
>>
>> I measured by reading flash linearly from beginning to end 32-bits at a time.
>> Since the flash is bigger than the cache, ever read should have come from the
>> flash.  If I just read the same 1k over and over that would obviously be much
>> faster if it could come from the cache.
>
> That's nice to see that cache helps cold-read performance too, not
> just cached reads.  Thanks :-)

Though if the mapping is not in guarded mode, turning cache on hurts
performance.  That surprises me.

>> The biggest bootup delay I have now is waiting for the ethernet phy to get
>> online, which takes almost 3 seconds.
>
> Do you need to delay everything else for that, or can you parallelise?

It's parallel.  I start the phy very early in the boot loader, and linux is
done booting and sitting in userspace waiting for it for a few hundred ms
before it's ready.
