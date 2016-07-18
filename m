Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bP9ZP-0002rM-47
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 14:30:56 +0000
Subject: Re: [RFC][PATCH] ubi: Implement a read cache
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1468587454-7590-1-git-send-email-richard@nod.at>
 <20160718162141.1d061791@bbrezillon>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at,
 computersforpeace@gmail.com, dedekind1@gmail.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <578CE807.5060204@nod.at>
Date: Mon, 18 Jul 2016 16:30:31 +0200
MIME-Version: 1.0
In-Reply-To: <20160718162141.1d061791@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

Am 18.07.2016 um 16:21 schrieb Boris Brezillon:
> Hi Richard,
> 
> On Fri, 15 Jul 2016 14:57:34 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
>> Implement a simple read cache such that small adjacent reads
>> with in the same NAND page can be cached.
>> When a read smaller than a NAND page is requested, UBI reads the full
>> page and caches it.
>> NAND core has already such a cache but it will go away soon.
>>
>> To be able to benchmark better, there is also a debugfs file which reports
>> cache stats, misses, hits and no_query.
>> Misses and hits should be clear, no_query is incremented when the cache
>> cannot be used, i.e. for reads larger than a page size.
>>
>> This patch is just a PoC.
>>
> 
> Just a few comments on the approach. I'll try to review the code later.
> 
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>> Hi!
>>
>> This is an initial draft for a read cache implemented in UBI.
>>
>> The cache sits in ubi_eba_read_leb() and is used when the read length is
>> smaller than a NAND page and does not cross a page boundary, this can be
>> improved later.
> 
> Hm, we should probably use the cache for aligned accesses and
> multi-pages read.
> 
>> Currently the cache consists of 61 cache lines where the PEB acts
>> as selector.
> 
> If we go for a multi-pages cache, we should probably use an LRU cache
> instead of this 'simple PEB hash + no collision' approach. Remember
> that reading a page from NAND is more time consuming than iterating
> over a small array of NAND page buffers.

Yeah, this implementation more or less moves the cache we have nand_base.c
into UBI.

>> Maybe less cache lines would also do it, this needs to be benchmarked
>> in more detail.
> 
> See my comment below.
> 
>>
>> I did already some benchmarks.
>> The system I've used has a 4GiB MLC NAND with 16KiB page size.
>> Userspace is a Debian 8 with systemd.
>>
>> The following tasks have been benchmarked so far.
>> 1. system bootup (userspace time as reported by systemd-analyze)
>> 2. walking /usr, since this involves a lot of TNC lookups this is interesting
>> 3. removing a 1GiB file, it involves also a lot of TNC lookups
>>
>> Baseline
>> ========
>>
>> 1. bootup time: 18 seconds
>>
>> 2. time find /usr > /dev/null
>> real    0m19.869s
>> user    0m0.120s
>> sys     0m7.300s
>>
>> 3. time rm /root/viel
>> real    0m32.992s
>> user    0m0.000s
>> sys     0m12.380s
>>
>> While the results for 1 and 2 are okay, we observe that removing the file
>> took a rather long time.
>> The NAND driver on this target supports subpage reads and therefore the NAND
>> page cache was never used.
>> Since removing a large file leads to a lot of TNC lookups UBIFS issues many
>> reads with a length around 200 bytes and the overhead of every single mtd_read()
>> kickes in.
>>
>> Baseline + NAND cache (hence, subpage read support disabled in our driver)
>> ==========================================================================
>>
>> 1. bootup time: 19,5 seconds
>>
>> 2. time find /usr > /dev/null
>> real    0m24.555s
>> user    0m0.150s
>> sys     0m8.220s
>>
>> 3. time rm /root/viel
>> real    0m5.327s
>> user    0m0.000s
>> sys     0m3.300s
>>
>> We observe that the bootup took a little longer, but the jitter here is about one
>> second.
>> Walking /usr took about 5 seconds longer, not sure why. This needs more inspection.
>>
>> The most interesting result is that removing the large file took only 5 seconds,
>> compared to 33 seconds this is huge speedup.
>> Since the znodes of the same file are adjacent data structures on the flash
>> the cache on NAND level helped a lot.
>>
>> UBI read cache with 1 cache line
>> ================================
>>
>> 1. bootup time: 19,5 seconds
> 
> Hm, I would expect an attach time close to what we have in Baseline
> with subpage read. Do you know where the difference comes from?

Boottime is pure userspace boot time.
I suspect systemd "jitter". Debian 8 starts a lot of stuff
in parallel...

As soon I'll have time, I'll benchmark ubi attach time.
Or when David has time...

>> cache usage:
>> hits: 1546
>> misses: 6887
>> no_query: 649
>>
>>
>> 2. time find /usr > /dev/null
>> real    0m24.297s
>> user    0m0.100s
>> sys     0m7.800s
>>
>> cache usage:
>> hits: 4068
>> misses: 17669
>> no_query: 107
>>
>> 3. time rm /root/viel
>> real    0m5.457s
>> user    0m0.000s
>> sys     0m2.730s
>>
>> cache usage:
>> hits: 34517
>> misses: 2490
>> no_query: 212
>>
>> The results are more or less the same as with caching on the NAND side.
>> So, we could drop the NAND cache and have it implemented in UBI.
>> As expected the cache brings us most while deleting large files.
>>
>> UBI read cache with 61 cache lines
>> ==================================
>>
>> 1. bootup time: 17,5 seconds
>> hits: 2991
>> misses: 5436
>> no_query: 649
>>
>> 2. time find /usr > /dev/null
>> real    0m20.557s
>> user    0m0.120s
>> sys     0m7.080s
>>
>> hits: 7064
>> misses: 14145
>> no_query: 116
>>
>> 3. time rm /root/viel
>> real    0m5.244s
>> user    0m0.000s
>> sys     0m2.840s
>>
>> hits: 34228
>> misses: 2248
>> no_query: 202
>>
>> With more cache lines we can reduce the boot time a bit, we also observe
>> that, compared to a single line, the cache hit rate is better.
>> Same for walking /usr.
>> Removing a large file is also fast.
>> So, having more cache lines helps but we need to figure out first how
>> much lines make sense.
> 
> That's true, but if we go for an adjustable UBI write-unit cache, I'd
> prefer to have an implementation relying the page-cache mechanism so
> that the system can adjust the cache size (by reclaiming cached pages)
> on-demand instead of hardcoding the number of cache lines at compile
> time.
> 
> IMO, we should either implement a basic 'single page cache' mechanism
> at the UBI level to replace the one at the NAND level and still benefit
> from subpage reads for EC and VID headers, or go for the more complex
> page-cache based mechanism.
> 
> Artem, Brian, any opinion?
> 
> BTW, this implementation still assumes that the upper layer will try to
> fill NAND pages entirely. This seems to be true for UBIFS, so I'm not
> sure we should bother about other cases now, but I'd still like to have
> your opinions.

Yeah, it does what nand_base.c does and helps fulfilling UBIFS' assumptions.
I'm not sure whether a complex LRU cache is worth the performance gain.
But we'll see. :-)

Thanks,
//richard
