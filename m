Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157CPd-0004MR-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 09:42:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <15132.22933.859130.119059@pizda.ninka.net> 
References: <15132.22933.859130.119059@pizda.ninka.net>  <13942.991696607@redhat.com> <3B1C1872.8D8F1529@mandrakesoft.com> <15132.15829.322534.88410@pizda.ninka.net> <20010605155550.C22741@metastasis.f00f.org> 
To: "David S. Miller" <davem@redhat.com>
Cc: Chris Wedgwood <cw@f00f.org>, Jeff Garzik <jgarzik@mandrakesoft.com>,
    bjornw@axis.com, linux-kernel@vger.kernel.org,
    linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush. 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Date: Tue, 05 Jun 2001 09:46:09 +0100
Message-ID: <25587.991730769@redhat.com>
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

davem@redhat.com said:
> Chris Wedgwood writes:
> > What if the memory is erased underneath the CPU being aware of
> > this? In such a way ig generates to bus traffic...

> This doesn't happen on x86.  The processor snoops all transactions
> done by other agents to/from main memory.  The processor caches are
> always up to date. 

No. My original mail presented two situations in which this assumption is 
false.

1. Bank-switched RAM. You want to force a writeback before switching pages.
   I _guarantee_ you that the CPU isn't snooping my access to the I/O port
   which sets the latch that drives the upper few address bits of the RAM 
   chips.

2. Flash. A few writes of magic data to magic addresses and a whole erase
   block suddenly contains 0xFF. The CPU doesn't notice that either.

What I want is a function like simon_says_flush_page_to_ram(). In this 
case, I _do_ know better than the CPU. It is _not_ coherent with these 
devices.

I'm actually working on a MIPS box at the moment - the particular problems
with doing it on i386 don't interest me too much. To be honest, I could do
it by sticking asm instructions inside ifdefs in what is otherwise
arch-independent code. I'd rather not do it like that, though. 

Surely stuff like that should be exported by the arch-specific code or
include files somehow. Possibly with a #define or function I can use to tell
whether a selective flush is actually available on the current CPU. If it's
not possible to flush the dcache selectively, then the cost of doing a full
flush probably outweighs the benefit¹ of running the flash cached in the
first place. But it should still be possible to do it from arch-independent
code without manually inserting asm instructions to do it.

--
dwmw2

¹ The _assumed_ benefit, admittedly. I should get some benchmarks to back up
the comment about molasses in arch/cris/drivers/axisflashmap.c
