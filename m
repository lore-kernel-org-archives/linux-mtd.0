Date: Fri, 7 Jan 2005 11:10:43 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: MTD List <linux-mtd@lists.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0412231634580.4006@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.58.0501071100260.12054@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<1f9886eb0412221014256b83e6@mail.gmail.com>
	<20041223135231.GB24503@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412231634580.4006@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: joakim.tjernlund@lumentis.se
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Guys.

Please, don't try the last test version I sent and don review it. It is 
buggy. I gonna create another one. I gonna add support for those 
architectures who does not have any CPU cycles counters (like ARM). In 
this case I gonna use jiffies value. But I don't like it since we need to 
have interrupts enabled during test. Moreover, this is very inaccurate and 
we need to do lots of iterations of CRC calculations. And we may be 
interrupted and the IRQ handler may put lots of garbage to the L1 caches 
(both instruction and data caches). 

So I don't know how to believe test which uses jiffies (especially when we 
want to measure diference between forward and backward CRC calculations).

Any thoughts?

On Thu, 23 Dec 2004, Artem B. Bityuckiy wrote:
> 
> Created new version of test. Review please. What else should we add? 
> 
> Fixed bug: memcmp -> memset.
> Added buffers passes in different directions.
> Added few more features.
> 
> P.S. Didn't run - only compiled. Right now crashed PC and do some 
> recovery.
> 
> /*
>  *      This program is free software; you can redistribute it and/or 
> modify
>  *      it under the terms of the GNU General Public License as published 
> by
>  *      the Free Software Foundation; either version 2 of the License, or
>  *      (at your option) any later version.
>  *
>  *      This program is distributed in the hope that it will be useful,
>  *      but WITHOUT ANY WARRANTY; without even the implied warranty of
>  *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>  *      GNU General Public License for more details.
>  *
>  *      You should have received a copy of the GNU General Public License
>  *      along with this program; if not, write to the Free Software
>  *      Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
>  *
>  *      Author: Artem B. Bityuckiy, dedekind@infradead.org
>  *      Version: 1.3
>  */
> #include <linux/kernel.h>
> #include <linux/module.h>
> #include <linux/vmalloc.h>
> #include <linux/pagemap.h>
> #include <linux/spinlock.h>
> #include <linux/crc32.h>
> #include <linux/crc32c.h>
> #include <linux/crc-ccitt.h>
> #include <asm/timex.h>
> 
> /* The number of memory cunks to test */
> #define MEM_CHUNKS 4
> 
> /* The test iterations number */
> #define ITERATIONS 1
> 
> /*
>  * The size of vmalloc'ed array used to prune any test-related data
>  * from the CPU data cache.
>  */
> #define TMPMEM_SIZE 1*1024*1024
> 
> #define TEST_PREFIX "[crctst] "
> 
> /*
>  * Most architectures have some kind of hight resolution time-stamp
>  * counter and define the get_cycles() macro to access it.
>  */
> #define TIMESTAMP get_cycles()
> 
> 
> /*
>  * In order to not lost much interupts we relax the system from
>  * time to time during testing
>  */
> #define RELAX()                                                 \
>         do {                                                    \
>                 spin_unlock_irqrestore(&lock, flags);           \
>                 yield();                                        \
>                 spin_lock_irqsave(&lock, flags);                \
>         } while(0)
> 
> #define PRINT_RESULTS(name, bytes, ts1, ts2)                    \
>         printk(KERN_NOTICE TEST_PREFIX name ", %d bytes: "      \
>                 " delta %llu, ts1 %llu, ts2 %llu", bytes,       \
>                 (unsigned long long)(ts2 - ts1),                \
>                 (unsigned long long)ts1,                        \
>                 (unsigned long long)ts2)                        \
> 
> 
> static unsigned long
> adler32(unsigned long adler, const unsigned char *buf, size_t len);
> 
> static uint32_t
> adler32r(uint32_t adler, const char *buf, size_t len);
> 
> static uint32_t
> engel32(uint32_t engel, const void *_s, size_t len);
> 
> static uint32_t
> engel32r(uint32_t engel, const void *_s, size_t len);
> 
> static void
> trash_cache(void);
> 
> /*
>  * The sizes of memory chunks for which CRCs should be tested.
>  */
> static int memsizes[MEM_CHUNKS] = {32, PAGE_SIZE, 32*1024, 64*1024};
> 
> static char *tmp_mem;
> 
> 
> /*
>  * We perform actual testing in the module initialization function.
>  */
> static int __init
> init_crctest(void)
> {
>         register int i, j;
>         char *mem[MEM_CHUNKS];
>         unsigned long flags;
>         spinlock_t lock = SPIN_LOCK_UNLOCKED;
>         int ret = 0;
>         cycles_t ts1, ts2;
> 
>         if ((tmp_mem = vmalloc(TMPMEM_SIZE)) == NULL) {
>                 printk(KERN_ERR TEST_PREFIX "can't allocate %d bytes\n",
>                                         TMPMEM_SIZE);
>                 ret = -ENOMEM;
>                 goto exit;
>         }
> 
>         memset(&mem[0], '\0', MEM_CHUNKS * sizeof(char *));
> 
>         /* Allocate memory */
>         for (i = 0; i < MEM_CHUNKS; i++) {
>                 if ((mem[i] = kmalloc(memsizes[i], GFP_KERNEL)) == NULL) {
>                         printk(KERN_ERR TEST_PREFIX "can't allocate %d 
> bytes\n",
>                                         memsizes[i]);
>                         ret = -ENOMEM;
>                         goto exit;
>                 }
>         }
> 
>         /*
>          * We do not want to be preempted during the test as well as do
>          * not want interrupts affect our results. Both of these are
>          * prevented by spin_lock_irqsave().
>          */
>         spin_lock_irqsave(&lock, flags);
> 
>         /*
>          * Now we gonna measure the difference between passing arrays
>          * two times forward/on time backward and one time forward.
>          */
>         for (i = 0; i < MEM_CHUNKS; i++) {
> 
>                 /* Trash the CPU data chache */
>                 trash_cache();
> 
>                 ts1 = TIMESTAMP;
>                 for (i = 0; i < TMPMEM_SIZE; i++)
>                         tmp_mem[i] = tmp_mem[i] + 1;
>                 for (i = 0; i < TMPMEM_SIZE; i++)
>                         tmp_mem[i] = tmp_mem[i] + 1;
>                 ts2 = TIMESTAMP;
>                 PRINT_RESULTS("Data pass both forward", memsizes[i], ts1, 
> ts2);
> 
>                 trash_cache();
> 
>                 ts1 = TIMESTAMP;
>                 for (i = TMPMEM_SIZE; i >= 0; i--)
>                         tmp_mem[i] = tmp_mem[i] + 1;
>                 for (i = 0; i < TMPMEM_SIZE; i++)
>                         tmp_mem[i] = tmp_mem[i] + 1;
>                 ts2 = TIMESTAMP;
>                 PRINT_RESULTS("Data pass backward/forward", memsizes[i], 
> ts1, ts2);
>         }
> 
>         RELAX();
> 
>         /* Test adler32 */
>         for (i = 0; i < MEM_CHUNKS; i++) {
>                 unsigned long crc;
> 
>                 crc = adler32(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts1 = TIMESTAMP;
>                 for (j = 0; j < ITERATIONS; j++)
>                         crc = adler32(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts2 = TIMESTAMP;
>                 PRINT_RESULTS("adler32", memsizes[i], ts1, ts2);
>         }
> 
>         RELAX();
> 
>         /* Test adler32r */
>         for (i = 0; i < MEM_CHUNKS; i++) {
>                 unsigned long crc;
> 
>                 crc = adler32r(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts1 = TIMESTAMP;
>                 for (j = 0; j < ITERATIONS; j++)
>                         crc = adler32r(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts2 = TIMESTAMP;
>                 PRINT_RESULTS("adler32r", memsizes[i], ts1, ts2);
>         }
> 
>         RELAX();
> 
>         /* Test engel32 */
>         for (i = 0; i < MEM_CHUNKS; i++) {
>                 uint32_t crc;
> 
>                 crc = engel32(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts1 = TIMESTAMP;
>                 for (j = 0; j < ITERATIONS; j++)
>                         crc = engel32(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts2 = TIMESTAMP;
>                 PRINT_RESULTS("engel32", memsizes[i], ts1, ts2);
>         }
> 
>         RELAX();
> 
>         /* Test engel32r */
>         for (i = 0; i < MEM_CHUNKS; i++) {
>                 uint32_t crc;
> 
>                 crc = engel32r(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts1 = TIMESTAMP;
>                 for (j = 0; j < ITERATIONS; j++)
>                         crc = engel32r(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts2 = TIMESTAMP;
>                 PRINT_RESULTS("engel32r", memsizes[i], ts1, ts2);
>         }
> 
>         RELAX();
> 
>         /* Test 16 bit CRC CCITT */
>         for (i = 0; i < MEM_CHUNKS; i++) {
>                 u16 crc;
> 
>                 /* Do one fake pass to exclude CPU cache influence */
>                 crc = crc_ccitt(0xFFFF, mem[i], memsizes[i]);
> 
>                 ts1 = TIMESTAMP;
>                 for (j = 0; j < ITERATIONS; j++)
>                         crc = crc_ccitt(0xFFFF, mem[i], memsizes[i]);
>                 ts2 = TIMESTAMP;
>                 PRINT_RESULTS("16-bit CRC CCITT", memsizes[i], ts1, ts2);
>         }
> 
>         RELAX();
> 
>         /* Test crc32 */
>         for (i = 0; i < MEM_CHUNKS; i++) {
>                 u32 crc;
> 
>                 crc = crc32(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts1 = TIMESTAMP;
>                 for (j = 0; j < ITERATIONS; j++)
>                         crc = crc32(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts2 = TIMESTAMP;
>                 PRINT_RESULTS("CRC32", memsizes[i], ts1, ts2);
>         }
> 
>         RELAX();
> 
>         /* Test crc32c */
>         for (i = 0; i < MEM_CHUNKS; i++) {
>                 u32 crc;
> 
>                 crc = crc32c(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts1 = TIMESTAMP;
>                 for (j = 0; j < ITERATIONS; j++)
>                         crc = crc32c(0xFFFFFFFF, mem[i], memsizes[i]);
>                 ts2 = TIMESTAMP;
>                 PRINT_RESULTS("CRC32c", memsizes[i], ts1, ts2);
>         }
> 
>         spin_unlock_irqrestore(&lock, flags);
> 
> exit:
>         if (tmp_mem != NULL)
>                 vfree(tmp_mem);
> 
>         for (i = 0; i < MEM_CHUNKS && mem[i] != NULL; i++)
>                 kfree(mem[i]);
> 
>         return ret;
> }
> 
> module_init(init_crctest);
> 
> static void __exit
> cleanup_crctest(void)
> {
>         return;
> }
> 
> module_exit(cleanup_crctest);
> 
> /*
>  * In order to prune our data from the CPU cache, we scan big data
>  * array.
>  */
> static void
> trash_cache(void) {
>         register int i;
>         for (i = 1; i < TMPMEM_SIZE; i++)
>                 tmp_mem[i-1] = tmp_mem[i] + 1;
> }
> 
> /* ----------------------------------------------------------------------- 
> */
> 
> /*
>  * Was borrowed from include/linux/zutil.h
>  */
> #define NMAX 5552
> #define BASE 65521L
> #define DO1(buf,i)  {s1 += buf[i]; s2 += s1;}
> #define DO2(buf,i)  DO1(buf,i); DO1(buf,i+1);
> #define DO4(buf,i)  DO2(buf,i); DO2(buf,i+2);
> #define DO8(buf,i)  DO4(buf,i); DO4(buf,i+4);
> #define DO16(buf)   DO8(buf,0); DO8(buf,8);
> 
> static unsigned long
> adler32(unsigned long adler, const unsigned char *buf, size_t len)
> {
>     unsigned long s1 = adler & 0xffff;
>     unsigned long s2 = (adler >> 16) & 0xffff;
>     int k;
> 
>     if (buf == NULL) return 1L;
> 
>     while (len > 0) {
>         k = len < NMAX ? len : NMAX;
>         len -= k;
>         while (k >= 16) {
>             DO16(buf);
>             buf += 16;
>             k -= 16;
>         }
>         if (k != 0) do {
>             s1 += *buf++;
>             s2 += s1;
>         } while (--k);
>         s1 %= BASE;
>         s2 %= BASE;
>     }
>     return (s2 << 16) | s1;
> }
> 
> /*
>  * Reverse version of adler32 (provided by Jorn Engel).
>  */
> static uint32_t
> adler32r(uint32_t adler, const char *buf, size_t len)
> {
>         unsigned long s1 = adler & 0xffff;
>         unsigned long s2 = (adler >> 16) & 0xffff;
>         int k;
> 
>         if (!buf)
>                 return 1L;
> 
>         buf += len;
>         while (len > 0) {
>                 k = len < NMAX ? len : NMAX;
>                 len -= k;
>                 while (k >= 16) {
>                         buf -= 16;
>                         DO16(buf);
>                         k -= 16;
>                 }
>                 if (k != 0)
>                         do {
>                                 s1 += *--buf;
>                                 s2 += s1;
>                         } while (--k);
>                 s1 %= BASE;
>                 s2 %= BASE;
>         }
>         return (s2 << 16) | s1;
> }
> 
> /*
>  * Jorn Engel's algorithms.
>  */
> static uint32_t
> engel32(uint32_t engel, const void *_s, size_t len)
> {
>         const char *s = _s;
>         uint32_t sum=engel, prod=engel;
>         for (; len>=4; len-=4, s+=4) {
>                 sum += s[0];
>                 prod += sum;
>                 sum += s[1];
>                 prod += sum;
>                 sum += s[2];
>                 prod += sum;
>                 sum += s[3];
>                 prod += sum;
>         }
>         for (; len; len--, s++) {
>                 sum += *s;
>                 prod += sum;
>         }
>         sum = (sum&0x0000ffff)<<16^ (sum&0xffff0000)>>16;
>         sum = (sum&0x00ff00ff)<<8 ^ (sum&0xff00ff00)>>8;
>         sum = (sum&0x0f0f0f0f)<<4 ^ (sum&0xf0f0f0f0)>>4;
>         sum = (sum&0x33333333)<<2 ^ (sum&0xcccccccc)>>2;
>         sum = (sum&0x55555555)<<1 ^ (sum&0xaaaaaaaa)>>1;
>         prod ^= sum;
>         return prod;
> }
> 
> static uint32_t
> engel32r(uint32_t engel, const void *_s, size_t len)
> {
>         const char *s = _s;
>         uint32_t sum=engel, prod=engel;
>         for (; len>=4; len-=4, s+=4) {
>                 sum += s[len-1];
>                 prod += sum;
>                 sum += s[len-2];
>                 prod += sum;
>                 sum += s[len-3];
>                 prod += sum;
>                 sum += s[len-4];
>                 prod += sum;
>         }
>         for (; len; len--, s++) {
>                 sum += s[len];
>                 prod += sum;
>         }
>         sum = (sum&0x0000ffff)<<16^ (sum&0xffff0000)>>16;
>         sum = (sum&0x00ff00ff)<<8 ^ (sum&0xff00ff00)>>8;
>         sum = (sum&0x0f0f0f0f)<<4 ^ (sum&0xf0f0f0f0)>>4;
>         sum = (sum&0x33333333)<<2 ^ (sum&0xcccccccc)>>2;
>         sum = (sum&0x55555555)<<1 ^ (sum&0xaaaaaaaa)>>1;
>         prod ^= sum;
>         return prod;
> }
> 
> MODULE_LICENSE ("GPL");
> MODULE_AUTHOR ("Artem B. Bityuckiy");
> MODULE_DESCRIPTION ("The CRC test");
> 
> 
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
