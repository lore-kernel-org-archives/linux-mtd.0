Date: Fri, 9 May 2014 15:28:10 -0600
From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 2/2] mtd: orion-nand: fix build error with ARMv4
Message-ID: <20140509212810.GF18257@obsidianresearch.com>
References: <1399560433-1402630-1-git-send-email-arnd@arndb.de>
 <1399560990-1402858-1-git-send-email-arnd@arndb.de>
 <1399560990-1402858-4-git-send-email-arnd@arndb.de>
 <20140509184505.GA30330@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140509184505.GA30330@arch.cereza>
Cc: Arnd Bergmann <arnd@arndb.de>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 09, 2014 at 03:45:05PM -0300, Ezequiel Garcia wrote:

> I gave this a try in order to answer Arnd's performance
> question. First of all, the patch seems wrong. I guess it's because
> readsl reads 4-bytes pieces, instead of 8-bytes.
> 
> This patch below is tested (but not completely, see below) and works:

Compilers are better now, I think you can just ditch the weirdness:

uint64_t *from;
uint64_t *to;
void foo()
{
	for (unsigned int I = 0; I != 1000; I++)
		*to++ = *from;
}

Using even gcc 4.6.3 gives good code:

(v6)
.L2:
        ldrd    r2, [ip]
        strd    r2, [r1], #8
        cmp     r1, r0

(v4)
.L2:
        ldmia   ip, {r0-r1}
        stmia   r3!, {r0-r1}
        cmp     r3, r2

For correctness this v4 version does require that the cpu executes the
ldmia reads in increasing address order, and never in any other
order. AFAIK the periphal is just a simple fifo that basically ignores
the address.

memcpy_fromio is not as good since it will never align if the buffer
is unaligned, while this version does.

The below gives:

  c8:   ea000002        b       d8 <orion_nand_read_buf+0x84>
  cc:   e5dc0000        ldrb    r0, [ip]
  d0:   e7c30001        strb    r0, [r3, r1]
  d4:   e2811001        add     r1, r1, #1
  d8:   e1510002        cmp     r1, r2

Which looks the same as the asm version to me.

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index dc9d07f34b8a..fea1597f623e 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -95,16 +95,13 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 	}
 	buf64 = (uint64_t *)buf;
 	while (i < len/8) {
-		/*
-		 * Since GCC has no proper constraint (PR 43518)
-		 * force x variable to r2/r3 registers as ldrd instruction
-		 * requires first register to be even.
-		 */
-		register uint64_t x asm ("r2");
-
-		asm volatile ("ldrd\t%0, [%1]" : "=&r" (x) : "r" (io_base));
-		buf64[i++] = x;
+#ifdef CONFIG_64BIT
+		buf64[i++] = readq_relaxed(io_base);
+#else
+		buf64[i++] = *(const volatile u64 __force *)io_base;
+#endif
 	}
+
 	i *= 8;
 	while (i < len)
 		buf[i++] = readb(io_base);
