Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Me1wE-0001g1-7B
	for linux-mtd@lists.infradead.org; Thu, 20 Aug 2009 07:20:02 +0000
Date: Thu, 20 Aug 2009 09:19:53 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH] Orion NAND: Make dword load asm volatile to avoid GCC
	optimizing it away
Message-ID: <20090820091953.2b149fbb@marrow.netinsight.se>
In-Reply-To: <alpine.LFD.2.00.0908191037310.6044@xanadu.home>
References: <20090714164135.65e91b91@marrow.netinsight.se>
	<alpine.LFD.2.00.0907141236160.3138@xanadu.home>
	<20090819094535.558dc0df@marrow.netinsight.se>
	<alpine.LFD.2.00.0908191037310.6044@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 Aug 2009 10:47:14 -0400 (EDT)
Nicolas Pitre <nico@cam.org> wrote:

> > Anyway, I spoke to the GCC people at gcc-help, and they insist that the
> > inlined assembly is wrong. The problem is that GCC doesn't infer from
> > the instruction that it accesses memory, and it can thereby move it out
> > of the loop.
> 
> Oh!  OK.  That's different though.  In your initial report you said that 
> the inline asm was _removed_.  I can understand why it might be factored 
> out of the loop though, but it cannot be removed entirely.

Sorry, I'll be careful about wording in the future :-)

> > -		asm ("ldrd\t%0, [%1]" : "=r" (x) : "r" (io_base));
> > +		asm volatile ("ldrd\t%0, [%1]" : "=&r" (x) : "r" (io_base) : "memory");
> 
> I think that the early clobber buys you nothing, and the memory clobber 
> is way overkill here.  The volatile ought to be all that is needed.  Can 
> you confirm that only the addition of volatile makes the code OK?  My 
> gcc version is 4.3.2 and that makes no difference what so ever as the 
> code as is produces the correct result already in my case.

Yes, it works fine with 4.3.3 and 4.4.1 with this change. So the
updated patch can be found below. I belive the early clobber should be
there though, since (from the ARM architecture reference manual):

  If <addressing_mode> performs base register write-back and the base
  register <Rn> is one of the two destination registers of the
  instruction, the results are UNPREDICTABLE.

it works fine without the early clobber as well, but I'd feel more safe
having it in.

// Simon
--
Orion NAND: Make asm volatile avoid GCC pushing ldrd out of the loop

GCC 4.3.3 and 4.4.1 happily moves the dword load instruction out of the
loop in orion_nand_read_buf. This patch makes the instruction volatile
to avoid the issue. I've discussed this at gcc-help, refer to the thread
at

  http://gcc.gnu.org/ml/gcc-help/2009-08/msg00187.html

The early clobber is added to avoid the destination registers and the
source register overlapping.

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
 drivers/mtd/nand/orion_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 7ad9722..0d9d4bc 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -61,7 +61,7 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	buf64 = (uint64_t *)buf;
 	while (i < len/8) {
 		uint64_t x;
-		asm ("ldrd\t%0, [%1]" : "=r" (x) : "r" (io_base));
+		asm volatile ("ldrd\t%0, [%1]" : "=&r" (x) : "r" (io_base));
 		buf64[i++] = x;
 	}
 	i *= 8;
-- 
1.6.0.4
