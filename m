Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TeOOQ-0008GN-AX
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 11:04:29 +0000
Received: by mail-ie0-f177.google.com with SMTP id k13so389953iea.36
 for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2012 03:04:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1354268388.30168.80.camel@sauron.fi.intel.com>
References: <CAMjNe_cJG6wkiPDvVZzqURz4gVTW8Dx4JrM-KPVbVedLwsDfcw@mail.gmail.com>
 <1354268388.30168.80.camel@sauron.fi.intel.com>
Date: Fri, 30 Nov 2012 16:34:24 +0530
Message-ID: <CAMjNe_cON6-=MKzMrYAEhkryyvcQApMLpVdSyLPUXPBDU_1Pzw@mail.gmail.com>
Subject: Re: [RFC] LFTL: a FTL for large parallel IO flash cards
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 30, 2012 at 3:09 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sat, 2012-11-17 at 01:04 +0530, srimugunthan dhandapani wrote:
>> Hi all,
>>
>>  Due to fundamental limits like size-per-chip and interface speed
>>  limits all  large capacity Flash  are made of multiple chips or banks.
>>  The presence of multiple chips readily offers parallel read or write support.
>>  Unlike an SSD, for a raw flash card , this parallelism is visible to
>>  the software layer and there are many opportunities
>>  for exploiting this parallelism.
>>
>>  The presented LFTL is meant for flash cards with multiple banks and
>>  larger minimum write sizes.
>>  LFTL mostly reuses code from mtd_blkdevs.c and mtdblock.c.
>>  The LFTL was tested on  a 512GB raw flash card which has no firmware
>>  for wearlevelling or garbage collection.
>>
>>  The following are the important points regarding the LFTL:
>>
>>  1. multiqueued/multithreaded design:(Thanks  to Joern engel for a
>>  mail-discussion)
>>  The mtd_blkdevs.c dequeues block I/O requests from the block layer
>>  provided request queue from a single kthread.
>>  This design of IO requests dequeued from a single queue by a single
>>  thread is a bottleneck for flash cards that supports hundreds of MB/sec.
>>  We use a multiqueued and multithreaded design.
>>  We bypass the block layer by registering a new make_request and
>>  the LFTL maintains several queues of its own and the block IO requests are
>>  put in one of these queues. For every queue there is an associated kthread
>>  that processes requests from that queue. The number of "FTL IO kthreads"
>>  is #defined as 64 currently.
>
> Hmm, should this be done in MTD layer, not hacked in in LFTL, so that
> every MTD user could benefit?
>
> Long time ago Intel guys implemented "striping" in MTD, sent out, but it
> did not make it to upstream. This is probably something your need.
>
> With striping support in MTD, you will end up with a 'virtual' MTD
> device with larger eraseblock and minimum I/O unit. MTD would split all
> the I/O requests and work with all the chips in parallel.
>

Thanks for replying.
Current large capacity flash have several levels of parallelism
chip-level, channel-level, package-level.

1. http://www.cse.ohio-state.edu/~fchen/paper/papers/hpca11.pdf
2. http://research.microsoft.com/pubs/63596/usenix-08-ssd.pdf

Assuming only chip level parallelism
and providing only striping feature  may not exploit all the
capabilities of flash
hardware

In the card that i worked, the hardware  provides DMA read/write capability
which automatically stripes the data across the
chips.(hence the larger writesize = 32K)
But it exposes the other levels of parallelism.

LFTL does not stripe the data across the parallel I/O units(called
"banks" in the code).
But it dynamically selects one of the bank to write and one of the
bank to garbage collect.


Presently with respect to UBI+UBIFS, as block allocation is done by
UBI and garbage collection
by UBIFS, it is not possible to dynamically split the I/O read/writes
and garbage collection read/writes
across the banks.

Although LFTL  assumes only bank level parallelism and is currently
not aware of hierarchy of parallel I/O units,
 i think it is possible to make LFTL aware of it in future.





> This would be a big work, but everyone would benefit.
>
> --
> Best Regards,
> Artem Bityutskiy
