Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173GqC-0003dV-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 14:41:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020502155602.A8801@kosh.hut.fi> 
References: <20020502155602.A8801@kosh.hut.fi> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
Subject: Re: Benchmarking JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 02 May 2002 14:40:58 +0100
Message-ID: <13211.1020346858@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

jlavi@iki.fi said:
>  I have also tried to run the tests using linear data that compresses
> easily. I have encountered repeatedly very low memory and out of
> memory condition and messages like "Memory fail", "deflateInit failed"
> and when the memory really runs out repeated "Out of memory". I don't
> think a benchmark program should be able to bring the system to its
> knwws simply by exercising the file-system. I wouldn't bet on the
> stability and maturity of the embedded device either.

The 'deflateInit failed' and memory problems are solved with the 
application of the 'shared-zlib' patches. I'm waiting for 2.4.19 to be 
released before sending those to Marcelo for 2.4.20-pre1, but they're at 
ftp.kernel.org:/pub/linux/kernel/people/dwmw2/shared-zlib and in the 2.4-ac 
trees. 

Your results on a clean file system are as expected. We write nodes which 
do not cross a 4096-byte boundary. So 4096-byte writes and multiples of 
4096 bytes will always write full-sized blocks with a full 4096 bytes of 
data prepended by a node header, and the effective write speed approaches 
a reasonable proportion of the maximum write bandwidth available. Due to 
the addition of node headers and the time taken by compression, the 
full write bandwidth of the raw flash chips cannot be achieved. 

Where your write size is not a multiple of 4096 bytes, some nodes which do
not carry a full payload must be written, and this is obviously less 
efficient. 

jlavi@iki.fi said:
> Question 1:
> Is the lack of performance at higher block sizes normal?
> Question 2:
> Is the lack of performance at higher blocks sizes due to garbage
> collection? 

We break up writes of greater than 4 KiB into 4 KiB chunks. A write size of 
8 KiB or any other multiple of 4 KiB should give you identical performance
the write size of 4 KiB. I suspect your results are skewed, and can see two 
possible reasons.

1. The file system is getting progressively dirtier as your tests continue.
   Perhaps you should take a complete snapshot of the flash when the file
   system is 'dirty', and reinstall that precise image before each run.

2. Garbage collection is happening in the background thread between your
   benchmark's timed write attempts, thereby making the smaller writes 
   _look_ more efficient. Possibly either kill (or SIGSTOP) the GC thread
   to prevent this or call gettimeofday() once each time round the loop 
   rather than twice, comparing with the value from the previous loop.

Neither of the above are valid excuses for the fact that write performance 
on a dirty file system sucks royally. There are some things we can do about 
that.

1. Stop the GC from decompressing then immediately recompressing nodes that
   it's just going to write out unchanged. It's a stupid waste of CPU time.

2. We have a 'dirty_list' containing blocks which have _any_ dirty space, 
   and we pick blocks from the to garbage-collect from. If there's only a 
   few bytes of dirty space, we GC the whole block just to gain a few 
   bytes. We should keep a 'very_dirty_list' of blocks with _significant_ 
   amounts of dirty space and favour that even more when picking blocks
   to GC, especially when doing just-in-time GC rather than from the 
   background thread.

If we're feeling really brave then we can try:

3. JFFS2 current keeps a single 'nextblock' pointer for the block to which
   new nodes are written. We interleave new writes from userspace with GC
   copies of old data; mixing long-lived data with new. This means we end up
   with blocks to be GC'd which have static long-lived data in. We should 
   keep _two_ blocks for writing, one for new data and one for data being 
   GC'd; this way the static data tend to get grouped together into blocks
   which stay clean and are (almost) never GC'd, while short-lived data are
   also grouped together into blocks which will have a higher proportion 
   of dirty space and hence will give faster GC progress.

   If we do this, it's going to completely screw up our NAND wbuf support/
   flushing logic, but it's probably worth it anyway.


--
dwmw2
