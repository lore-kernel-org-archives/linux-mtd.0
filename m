Date: Wed, 22 Dec 2004 14:44:35 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041222140331.GG31282@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0412221442510.30556@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEIEHDCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171119290.8020@phoenix.infradead.org>
	<Pine.LNX.4.58.0412221328430.23254@phoenix.infradead.org>
	<20041222140331.GG31282@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

> How about adding adler32 and possibly this algorithm?  Engel32
> (missing a better name) is basically adler32, but instead of a
> modula-operation, it mirrors one of the two checksums (last bit
> becomes first, etc.) and XORs both.
Adler32 was added. Engel32 too.

Did yiu investigate theoretically these algorithms? Why engel32 is weaker?

Would somebody like to add backward CRCs to the test?

I ran test on i686 (just to see it is compiled and works). Results are:

[crctst] 16-bit CRC CCITT 32 bytes: ts1 14352216056936, ts2 
14352216057276, delta 340
[crctst] 16-bit CRC CCITT 4096 bytes: ts1 14352237257556, ts2 
14352237286332, delta 28776
[crctst] 16-bit CRC CCITT 65536 bytes: ts1 14352259870036, ts2 
14352260333528, delta 463492
[crctst] crc32 32 bytes: ts1 14352282934664, ts2 14352282934980, delta 316
[crctst] crc32 4096 bytes: ts1 14352301401184, ts2 14352301429996, delta 
28812
[crctst] crc32 65536 bytes: ts1 14352321296456, ts2 14352321726112, delta 
429656
[crctst] crc32c 32 bytes: ts1 14352341677716, ts2 14352341678048, delta 
332
[crctst] crc32c 4096 bytes: ts1 14352360411764, ts2 14352360436508, delta 
24744
[crctst] crc32c 65536 bytes: ts1 14352380586256, ts2 14352381043780, delta 
457524
[crctst] adler32 32 bytes: ts1 14352401248340, ts2 14352401248540, delta 
200
[crctst] adler32 4096 bytes: ts1 14352420251940, ts2 14352420256744, delta 
4804
[crctst] adler32 65536 bytes: ts1 14352439968500, ts2 14352440043460, 
delta 74960
[crctst] engel32 32 bytes: ts1 14352460224760, ts2 14352460224960, delta 
200
[crctst] engel32 4096 bytes: ts1 14352479232376, ts2 14352479240700, delta 
8324
[crctst] engel32 65536 bytes: ts1 14352499089344, ts2 14352499228820, 
delta 139476

New test version:
---------------------------------------------------------
/*
 *      This program is free software; you can redistribute it and/or 
modify
 *      it under the terms of the GNU General Public License as published 
by
 *      the Free Software Foundation; either version 2 of the License, or
 *      (at your option) any later version.
 *
 *      This program is distributed in the hope that it will be useful,
 *      but WITHOUT ANY WARRANTY; without even the implied warranty of
 *      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *      GNU General Public License for more details.
 *
 *      You should have received a copy of the GNU General Public License
 *      along with this program; if not, write to the Free Software
 *      Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 *      Author: Artem B. Bityuckiy, dedekind@infradead.org
 *      Version: 1.1
 */
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/pagemap.h>
#include <linux/spinlock.h>
#include <linux/crc32.h>
#include <linux/crc32c.h>
#include <linux/crc-ccitt.h>
#include <asm/timex.h>

/* The number of memory cunks to test */
#define MEM_CHUNKS 3

/* The test iterations number */
#define ITERATIONS 1

#define TEST_PREFIX "[crctst] "

/* 
 * Most architectures have some kind of hight resolution time-stamp
 * counter and define the get_cycles() macro to access it.
 */
#define TIMESTAMP get_cycles()

static unsigned long
adler32(unsigned long adler, const unsigned char *buf, size_t len);

static uint32_t
engel32(uint32_t engel, const void *_s, size_t len);

/* 
 * The sizes of memory chunks for which CRCs should be tested.
 */
static int
memsizes[MEM_CHUNKS] = {32, PAGE_SIZE, 64*1024};

/* 
 * We perform actual testing in the module initialization function.
 */
static int __init
init_crctest(void)
{
	register int i, j;
	char *mem[MEM_CHUNKS];
	unsigned long flags;
	spinlock_t lock = SPIN_LOCK_UNLOCKED;
	int ret = 0;
	cycles_t ts1, ts2;

	memcmp(&mem[0], '\0', MEM_CHUNKS * sizeof(char *));

	/* Allocate memory */
	for (i = 0; i < MEM_CHUNKS; i++) {
		if ((mem[i] = kmalloc(memsizes[i], GFP_KERNEL)) == NULL) {
			printk(KERN_ERR TEST_PREFIX "can't allocate %d 
bytes\n",
					memsizes[i]);
			ret = -ENOMEM;
			goto exit;
		}
	}
	
	/* 
	 * We do not want to be preempted during the test as well as do
	 * not want interrupts affect our results. Both of these are
	 * prevented by spin_lock_irqsave().
	 */
	spin_lock_irqsave(&lock, flags);
	
	/* Test 16 bit CRC CCITT */
	for (i = 0; i < MEM_CHUNKS; i++) {
		u16 crc;
		
		/* Do one fake pass to exclude CPU cache influence */
		crc = crc_ccitt(0xFFFF, mem[i], memsizes[i]);

		ts1 = TIMESTAMP;
		for (j = 0; j < ITERATIONS; j++)
			crc = crc_ccitt(0xFFFF, mem[i], memsizes[i]); 
		ts2 = TIMESTAMP;

		printk(KERN_NOTICE TEST_PREFIX "16-bit CRC CCITT %d bytes: 
"
			"ts1 %llu, ts2 %llu, delta %llu\n", memsizes[i],
			(unsigned long long)ts1, (unsigned long long)ts2,
			(unsigned long long)(ts2 - ts1));
	}

	/* Test crc32 */
	for (i = 0; i < MEM_CHUNKS; i++) {
		u32 crc;
		
		crc = crc32(0xFFFFFFFF, mem[i], memsizes[i]); 
		ts1 = TIMESTAMP;
		for (j = 0; j < ITERATIONS; j++)
			crc = crc32(0xFFFFFFFF, mem[i], memsizes[i]); 
		ts2 = TIMESTAMP;

		printk(KERN_NOTICE TEST_PREFIX "crc32 %d bytes: "
			"ts1 %llu, ts2 %llu, delta %llu\n", memsizes[i],
			(unsigned long long)ts1, (unsigned long long)ts2,
			(unsigned long long)(ts2 - ts1));
	}
	
	/* Test crc32c */
	for (i = 0; i < MEM_CHUNKS; i++) {
		u32 crc;
		
		crc = crc32c(0xFFFFFFFF, mem[i], memsizes[i]); 
		ts1 = TIMESTAMP;
		for (j = 0; j < ITERATIONS; j++)
			crc = crc32c(0xFFFFFFFF, mem[i], memsizes[i]); 
		ts2 = TIMESTAMP;

		printk(KERN_NOTICE TEST_PREFIX "crc32c %d bytes: "
			"ts1 %llu, ts2 %llu, delta %llu\n", memsizes[i],
			(unsigned long long)ts1, (unsigned long long)ts2,
			(unsigned long long)(ts2 - ts1));
	}

	/* Test adler32 */
	for (i = 0; i < MEM_CHUNKS; i++) {
		unsigned long crc;
		
		crc = adler32(0xFFFFFFFF, mem[i], memsizes[i]); 
		ts1 = TIMESTAMP;
		for (j = 0; j < ITERATIONS; j++)
			crc = adler32(0xFFFFFFFF, mem[i], memsizes[i]); 
		ts2 = TIMESTAMP;

		printk(KERN_NOTICE TEST_PREFIX "adler32 %d bytes: "
			"ts1 %llu, ts2 %llu, delta %llu\n", memsizes[i],
			(unsigned long long)ts1, (unsigned long long)ts2,
			(unsigned long long)(ts2 - ts1));
	}

	/* Test engel32 */
	for (i = 0; i < MEM_CHUNKS; i++) {
		uint32_t crc;
		
		crc = engel32(0xFFFFFFFF, mem[i], memsizes[i]); 
		ts1 = TIMESTAMP;
		for (j = 0; j < ITERATIONS; j++)
			crc = engel32(0xFFFFFFFF, mem[i], memsizes[i]); 
		ts2 = TIMESTAMP;

		printk(KERN_NOTICE TEST_PREFIX "engel32 %d bytes: "
			"ts1 %llu, ts2 %llu, delta %llu\n", memsizes[i],
			(unsigned long long)ts1, (unsigned long long)ts2,
			(unsigned long long)(ts2 - ts1));
	}
	spin_unlock_irqrestore(&lock, flags);
	
exit:
	for (i = 0; i < MEM_CHUNKS && mem[i] != NULL; i++)
		kfree(mem[i]);

	return ret;
}

module_init(init_crctest);

static void __exit
cleanup_crctest(void)
{
	return;
}

module_exit(cleanup_crctest);

/*
 * Was borrowed from include/linux/zutil.h
 */
#define NMAX 5552
#define BASE 65521L
#define DO1(buf,i)  {s1 += buf[i]; s2 += s1;}
#define DO2(buf,i)  DO1(buf,i); DO1(buf,i+1);
#define DO4(buf,i)  DO2(buf,i); DO2(buf,i+2);
#define DO8(buf,i)  DO4(buf,i); DO4(buf,i+4);
#define DO16(buf)   DO8(buf,0); DO8(buf,8);

static unsigned long
adler32(unsigned long adler, const unsigned char *buf, size_t len)
{
    unsigned long s1 = adler & 0xffff;
    unsigned long s2 = (adler >> 16) & 0xffff;
    int k;

    if (buf == NULL) return 1L;

    while (len > 0) {
        k = len < NMAX ? len : NMAX;
        len -= k;
        while (k >= 16) {
            DO16(buf);
            buf += 16;
            k -= 16;
        }
        if (k != 0) do {
            s1 += *buf++;
            s2 += s1;
        } while (--k);
        s1 %= BASE;
        s2 %= BASE;
    }
    return (s2 << 16) | s1;
}

/*
 * Jorn Engel's algorithm.
 */
static uint32_t
engel32(uint32_t engel, const void *_s, size_t len)
{
	const char *s = _s;
	uint32_t sum=engel, prod=engel;
	for (; len>=4; len-=4, s+=4) {
		sum += s[0];
		prod += sum;
		sum += s[1];
		prod += sum;
		sum += s[2];
		prod += sum;
		sum += s[3];
		prod += sum;
	}
	for (; len; len--, s++) {
		sum += *s;
		prod += sum;
	}
	sum = (sum&0x0000ffff)<<16^ (sum&0xffff0000)>>16;
	sum = (sum&0x00ff00ff)<<8 ^ (sum&0xff00ff00)>>8;
	sum = (sum&0x0f0f0f0f)<<4 ^ (sum&0xf0f0f0f0)>>4;
	sum = (sum&0x33333333)<<2 ^ (sum&0xcccccccc)>>2;
	sum = (sum&0x55555555)<<1 ^ (sum&0xaaaaaaaa)>>1;
	prod ^= sum;
	return prod;
}

MODULE_LICENSE ("GPL");
MODULE_AUTHOR ("Artem B. Bityuckiy");
MODULE_DESCRIPTION ("The CRC test");

---------------------------------------------------------

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
