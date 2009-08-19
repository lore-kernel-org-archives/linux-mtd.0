Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mdfrf-0000Et-KC
	for linux-mtd@lists.infradead.org; Wed, 19 Aug 2009 07:45:51 +0000
Date: Wed, 19 Aug 2009 09:45:35 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH] Orion NAND: Make dword load asm volatile to avoid GCC
	optimizing it away
Message-ID: <20090819094535.558dc0df@marrow.netinsight.se>
In-Reply-To: <alpine.LFD.2.00.0907141236160.3138@xanadu.home>
References: <20090714164135.65e91b91@marrow.netinsight.se>
	<alpine.LFD.2.00.0907141236160.3138@xanadu.home>
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

On Tue, 14 Jul 2009 12:40:33 -0400 (EDT)
Nicolas Pitre <nico@cam.org> wrote:

> On Tue, 14 Jul 2009, Simon Kagstrom wrote:
> 
> > GCC 4.3.3 happily removes the dword load instruction in
> > orion_nand_read_buf. This patch makes the inline assembly volatile to
> > avoid this situation.
> 
> If GCC does optimize away this inline asm then this is a serious GCC 
> bug.  The inline asm uses an output operand for which a dependency 
> exists on the very next line.

I've been away on vacation, sorry for not replying until now.

Anyway, I spoke to the GCC people at gcc-help, and they insist that the
inlined assembly is wrong. The problem is that GCC doesn't infer from
the instruction that it accesses memory, and it can thereby move it out
of the loop.

So here comes an updated patch.

// Simon
--
Orion NAND: Clobber memory to make sure that GCC does not move ldrd

GCC 4.3.3 happily removes the dword load instruction in
orion_nand_read_buf. This patch clobbers memory, and makes the
instruction volatile to avoid the issue. I've discussed this at
gcc-help, refer to the thread at

  http://gcc.gnu.org/ml/gcc-help/2009-08/msg00187.html

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
---
 drivers/mtd/nand/orion_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index 7ad9722..845f9a9 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -61,7 +61,7 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	buf64 = (uint64_t *)buf;
 	while (i < len/8) {
 		uint64_t x;
-		asm ("ldrd\t%0, [%1]" : "=r" (x) : "r" (io_base));
+		asm volatile ("ldrd\t%0, [%1]" : "=&r" (x) : "r" (io_base) : "memory");
 		buf64[i++] = x;
 	}
 	i *= 8;
-- 
1.6.0.4
