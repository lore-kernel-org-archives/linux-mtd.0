Date: Fri, 7 Jan 2005 15:20:11 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: jasmine@linuxgrrls.org
In-Reply-To: <33370.192.168.0.2.1105109729.squirrel@192.168.0.2>
Message-ID: <Pine.LNX.4.58.0501071519100.13073@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>   
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>   
	<20041222160942.GC9783@wohnheim.fh-wedel.de>   
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>   
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<1f9886eb0412221014256b83e6@mail.gmail.com>
	<20041223135231.GB24503@wohnheim.fh-wedel.de>   
	<Pine.LNX.4.58.0412231634580.4006@phoenix.infradead.org>   
	<Pine.LNX.4.58.0501071100260.12054@phoenix.infradead.org>   
	<1105096161.5547.106.camel@baythorne.infradead.org>   
	<Pine.LNX.4.61.0501071127370.26716@hex.linuxgrrls.org>   
	<Pine.LNX.4.58.0501071142460.12054@phoenix.infradead.org>   
	<Pine.LNX.4.58.0501071419550.12054@phoenix.infradead.org>   
	<Pine.LNX.4.61.0501071425550.28205@hex.linuxgrrls.org>   
	<Pine.LNX.4.58.0501071432390.12887@phoenix.infradead.org>   
	<Pine.LNX.4.61.0501071434430.28451@hex.linuxgrrls.org>   
	<Pine.LNX.4.58.0501071438530.12887@phoenix.infradead.org>
	<33370.192.168.0.2.1105109729.squirrel@192.168.0.2>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 7 Jan 2005 jasmine@linuxgrrls.org wrote:

> > On Fri, 7 Jan 2005 jasmine@linuxgrrls.org wrote:
> >
> > But the reason why I include that loops is dictated by our discussions
> > about backward/forward CRC calculations and CPU cache benefits. CRC's are
> > calculated reading bytes. So I don't think we should take into account
> > cache line size in our particular case.
> 
> You're wrong, because:
> 
> i)  The instruction cache suffers from this penalty and is, in fact, the
>     major issue here.  Most of the wasted cycles will be waiting for an
>     instruction to arrive from the i-cache.
> 
> ii) All data accesses use the cache, even byte accesses.  (Byte accesses
>     actually reach the processor's data port as word accesses in any
>     case.)  Data is fetched from the interconnect into the cache in
>     eight-word-long bursts in OMAP1623, regardless of how much the core
>     has asked for.  Critical-word-first means that the core only has
>     to wait for the first word to arrive, but there is an additional
>     cycle of penalty as the line is latched. If your data area is
>     aligned to an eight-word-boundary, and your algorithm works eight
>     words to a stride, the branch will cover the penalty of traversing
>     the cache line boundary.  This will be slightly faster.
> 
> Does this explain?

I'm sorry, not exactly. Ok, could you please write the code you think is 
better? Currentlly it is:

/* Trash the CPU data chache */
trash_cache();
ts1 = TIMESTAMP();
for (j = 0; j < memsizes[i]; j++)
	mem[i][j] = mem[i][j] + 1;
for (j = 0; j < memsizes[i]; j++)
        mem[i][j] = mem[i][j] + 1;
ts2 = TIMESTAMP();

Where memsizes array is 32-byte aligned (kmalloc does this - see 
mm/slab.c, ARCH_KMALLOC_FLAGS definition).

So, I suppose you suggest to write smth like:

/* Trash the CPU data chache */
trash_cache();
ts1 = TIMESTAMP();
for (j = 0; j < memsizes[i]; j += L1_CACHE_BYTES)
	mem[i][j] = mem[i][j] + 1;
for (j = 0; j < memsizes[i]; j += L1_CACHE_BYTES)
        mem[i][j] = mem[i][j] + 1;
ts2 = TIMESTAMP();

? 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
