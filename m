Date: Wed, 22 Dec 2004 13:36:47 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
In-Reply-To: <Pine.LNX.4.58.0412171119290.8020@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.58.0412221328430.23254@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEIEHDCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171119290.8020@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We began interesting discussions concerning CRC.
There were several issues:
- on 32-bit architectures crc16 may be calculated not so fast;
- proposition to calculate CRC starting from the end;
- counter-evidence about forward/backward prefetching;

I decided to write a test to experimentally check the CRCs speed.

Short description:
1. Test works in kernel space in order to be precise. We don't want to be 
affected by preemptions, interrupts, etc etc.
2. Test is implemented as Kernel module and does actual testing in the 
module init function. Of course it can be linked with the kernel. In the 
later case just see the kernel boot log.
3. Preemption and interrupts are disabled during the test.
4. Test uses the high resolution timer (CPU clocks counter, etc). As one 
can see it is defined for many platforms (asm/timex.h).

For now I have added only CRCs which are in linux/lib. They do forward CRC 
check of course.

I offer people to review the test, add more CRCs. Then we will try it on 
different platforms (hope people here have different boards with Linux).

Note 1: crc32c and crc-ccitt should be explicitly enabled in the Linux 
configuration or the correspondent modules loaded);

Note 2: I inserted file content in order to pass infradead.org's 
filtering.

Note 3: For now only was run on x86, 2.6.8 kernel. Hope will work on other 
arch/kernels.

-------------------------------------------------------------
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
		for (j = 0; j < ITERATIONS; j++) {
			crc = crc_ccitt(0xFFFF, mem[i], memsizes[i]); 
		}
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
		
		crc = crc32(0xFFFF, mem[i], memsizes[i]); 
		ts1 = TIMESTAMP;
		for (j = 0; j < ITERATIONS; j++) {
			crc = crc32(0xFFFF, mem[i], memsizes[i]); 
		}
		ts2 = TIMESTAMP;

		printk(KERN_NOTICE TEST_PREFIX "crc32 %d bytes: "
			"ts1 %llu, ts2 %llu, delta %llu\n", memsizes[i],
			(unsigned long long)ts1, (unsigned long long)ts2,
			(unsigned long long)(ts2 - ts1));
	}
	
	/* Test crc32c */
	for (i = 0; i < MEM_CHUNKS; i++) {
		u32 crc;
		
		crc = crc32c(0xFFFF, mem[i], memsizes[i]); 
		ts1 = TIMESTAMP;
		for (j = 0; j < ITERATIONS; j++) {
			crc = crc32c(0xFFFF, mem[i], memsizes[i]); 
		}
		ts2 = TIMESTAMP;

		printk(KERN_NOTICE TEST_PREFIX "crc32c %d bytes: "
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

MODULE_LICENSE ("GPL");
MODULE_AUTHOR ("Artem B. Bityuckiy");
MODULE_DESCRIPTION ("The CRC test");

-------------------------------------------------------------

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
