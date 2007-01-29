Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HBYb4-0008GB-UP
	for linux-mtd@lists.infradead.org; Mon, 29 Jan 2007 10:40:09 -0500
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l0TFapp9008639
	for <linux-mtd@lists.infradead.org>; Mon, 29 Jan 2007 17:36:59 +0200
Message-ID: <45BE14D6.8010606@nokia.com>
Date: Mon, 29 Jan 2007 17:37:58 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] OneNAND: Add support for
	auto-placement	ofout-of-band data
References: <45BA1A9D.60301@nokia.com>
	<45BA21E6.60301@nokia.com>	<000101c7436b$14370420$c7a3580a@swcenter.sec.samsung.co.kr>
	<45BDACBA.2080503@nokia.com>
In-Reply-To: <45BDACBA.2080503@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Adrian Hunter wrote:
> ext Kyungmin Park wrote:
>> It's cool. however how can we test this one?
> 
> I have a test module, that I will post.

Here it is


/*
 * oobtest.c
 *
 * Test oob read and write on MTD device.
 *
 * Copyright (C) 2005-2006 Nokia Corporation
 *
 * Authors: Artem Bityutskiy <artem.bityutskiy@nokia.com>
 *          Adrian Hunter <ext-adrian.hunter@nokia.com>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 as published by
 * the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; see the file COPYING. If not, write to the Free Software
 * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *
 */

#include <linux/init.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/kobject.h>
#include <linux/device.h>
#include <linux/err.h>
#include <linux/mtd/mtd.h>
#include <linux/sched.h>
#include <linux/jiffies.h>

#define PRINT_PREF KERN_CRIT "oobtest: "

/* Uncomment this if you have old MTD sources */
/* #define writesize oobblock */

static int dev = 4;
module_param(dev, int, S_IRUGO);
MODULE_PARM_DESC(dev, "MTD device number to use");

static struct mtd_info *mtd;

static unsigned char *readbuf  = 0;
static unsigned char *writebuf = 0;

static int pgsize;
static int bufsize;
static int ebcnt;
static int pgcnt;
static int errcnt = 0;

static int use_offset;
static int use_len;
static int use_len_max;
static int vary_offset;

static unsigned long next = 1;

static int simple_rand(void)
{
	next = next * 1103515245 + 12345;
	return ((unsigned) (next / 65536) % 32768);
}

static void simple_srand(unsigned long seed)
{
	next = seed;
}

static inline void set_random_data(unsigned char *buf,size_t len)
{
	size_t i;

	for (i = 0; i < len; ++i)
		buf[i] = simple_rand();
}

static inline int erase_eraseblock(int ebnum)
{
 	int err;
	struct erase_info ei;
	loff_t addr = ebnum * mtd->erasesize;

	memset(&ei, 0, sizeof(struct erase_info));
	ei.mtd  = mtd;
	ei.addr = addr;
	ei.len  = mtd->erasesize;

	err = mtd->erase(mtd, &ei);
	if (unlikely(err)) {
		printk(PRINT_PREF "error %d while erasing EB %d\n", err, ebnum);
		return err;
	}

	if (unlikely(ei.state == MTD_ERASE_FAILED)) {
		printk(PRINT_PREF "some erase error occurred at EB %d\n", ebnum);
		return -EIO;
	}

	return 0;
}

static void do_vary_offset(void)
{
	use_len -= 1;
	if (use_len < 1) {
		use_offset += 1;
		if (use_offset >= use_len_max)
			use_offset = 0;
		use_len = use_len_max - use_offset;
	}
}

static inline int write_eraseblock(int ebnum)
{
	int i;
	struct mtd_oob_ops ops;
	int err = 0;
	loff_t addr = ebnum * mtd->erasesize;

	for (i = 0; i < pgcnt; ++i, addr += pgsize) {
		set_random_data(writebuf, use_len);
		ops.mode      = MTD_OOB_AUTO;
		ops.len       = 0;
		ops.retlen    = 0;
		ops.ooblen    = use_len;
		ops.oobretlen = 0;
		ops.ooboffs   = use_offset;
		ops.datbuf    = 0;
		ops.oobbuf    = writebuf;
		err = mtd->write_oob(mtd, addr, &ops);
		if (unlikely(err || ops.oobretlen != use_len)) {
			printk(PRINT_PREF "error: writeoob failed at 0x%08x\n", (unsigned) addr);
			printk(PRINT_PREF "error: use_len = %d  use_offset = %d\n", use_len, use_offset);
			errcnt += 1;
			return err ? err : -1;
		}
		if (vary_offset)
			do_vary_offset();
	}

	return err;
}

static inline int write_eraseblock_in_one_go(int ebnum)
{
	struct mtd_oob_ops ops;
	int err = 0;
	loff_t addr = ebnum * mtd->erasesize;
	size_t len = mtd->ecclayout->oobavail * pgcnt;

	set_random_data(writebuf, len);
	ops.mode      = MTD_OOB_AUTO;
	ops.len       = 0;
	ops.retlen    = 0;
	ops.ooblen    = len;
	ops.oobretlen = 0;
	ops.ooboffs   = 0;
	ops.datbuf    = 0;
	ops.oobbuf    = writebuf;
	err = mtd->write_oob(mtd, addr, &ops);
	if (unlikely(err || ops.oobretlen != len)) {
		printk(PRINT_PREF "error: writeoob failed at 0x%08x\n", (unsigned) addr);
		errcnt += 1;
		return err ? err : -1;
	}

	return err;
}

static inline int verify_eraseblock(int ebnum)
{
	int i;
	struct mtd_oob_ops ops;
	int err = 0;
	loff_t addr = ebnum * mtd->erasesize;

	for (i = 0; i < pgcnt; ++i, addr += pgsize) {
		set_random_data(writebuf, use_len);
		ops.mode      = MTD_OOB_AUTO;
		ops.len       = 0;
		ops.retlen    = 0;
		ops.ooblen    = use_len;
		ops.oobretlen = 0;
		ops.ooboffs   = use_offset;
		ops.datbuf    = 0;
		ops.oobbuf    = readbuf;
		err = mtd->read_oob(mtd, addr, &ops);
		if (unlikely(err || ops.oobretlen != use_len)) {
			printk(PRINT_PREF "error: readoob failed at 0x%08x\n", (unsigned) addr);
			errcnt += 1;
			return err ? err : -1;
		}
		if (unlikely(memcmp(readbuf, writebuf, use_len))) {
			printk(PRINT_PREF "error: verify failed at 0x%08x\n", (unsigned) addr);
			errcnt += 1;
			if (errcnt > 1000) {
				printk(PRINT_PREF "error: too many errors\n");
				return -1;
			}
		}
		if (vary_offset)
			do_vary_offset();
	}
	return err;
}

static inline int verify_eraseblock_in_one_go(int ebnum)
{
	struct mtd_oob_ops ops;
	int err = 0;
	loff_t addr = ebnum * mtd->erasesize;
	size_t len = mtd->ecclayout->oobavail * pgcnt;

	set_random_data(writebuf, len);
	ops.mode      = MTD_OOB_AUTO;
	ops.len       = 0;
	ops.retlen    = 0;
	ops.ooblen    = len;
	ops.oobretlen = 0;
	ops.ooboffs   = 0;
	ops.datbuf    = 0;
	ops.oobbuf    = readbuf;
	err = mtd->read_oob(mtd, addr, &ops);
	if (unlikely(err || ops.oobretlen != len)) {
		printk(PRINT_PREF "error: readoob failed at 0x%08x\n", (unsigned) addr);
		errcnt += 1;
		return err ? err : -1;
	}
	if (unlikely(memcmp(readbuf, writebuf, len))) {
		printk(PRINT_PREF "error: verify failed at 0x%08x\n", (unsigned) addr);
		errcnt += 1;
		if (errcnt > 1000) {
			printk(PRINT_PREF "error: too many errors\n");
			return -1;
		}
	}

	return err;
}

static int __init oobtest_init(void)
{
	int err = 0;
	u_int32_t i;
	struct mtd_oob_ops ops;
	loff_t addr = 0;

	printk("\n");
	printk("=========================================================="
	       "===============================\n");
	printk("oobtest: dev = %d\n", dev);

	mtd = get_mtd_device(NULL, dev);
	if (IS_ERR(mtd)) {
		err = PTR_ERR(mtd);
		printk(PRINT_PREF "error: Cannot get MTD device\n");
		return err;
	}

	if (mtd->writesize == 1) {
		printk(PRINT_PREF "warning: this test was written for NAND."
		       "Assume page size is 512 bytes.\n");
		pgsize = 512;
	} else
		pgsize = mtd->writesize;

	printk(PRINT_PREF "oob available per page = %u\n",(unsigned) mtd->ecclayout->oobavail);

	err = -ENOMEM;
	bufsize = mtd->erasesize;
	readbuf = kmalloc(bufsize, GFP_KERNEL);
	if (!readbuf) {
		printk(PRINT_PREF "error: cannot allocate memory\n");
		goto out;
	}
	writebuf = kmalloc(bufsize, GFP_KERNEL);
	if (!writebuf) {
		printk(PRINT_PREF "error: cannot allocate memory\n");
		goto out;
	}

	ebcnt = mtd->size / mtd->erasesize;
	pgcnt = mtd->erasesize / pgsize;

	use_offset = 0;
	use_len = mtd->ecclayout->oobavail;
	use_len_max = mtd->ecclayout->oobavail;
	vary_offset = 0;

	/* First test: write all oob, read it back and verify */

	printk(PRINT_PREF "Test 1 of 5\n");

	/* Erase all eraseblocks */
	printk(PRINT_PREF "erasing\n");
	for (i = 0; i < ebcnt; ++i) {
		err = erase_eraseblock(i);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "erased %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "erased %u\n", i);

	/* Write all eraseblocks */
	simple_srand(1);
	printk(PRINT_PREF "writing\n");
	for (i = 0; i < ebcnt; ++i) {
		err = write_eraseblock(i);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "written %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "written %u\n", i);

	/* Check all eraseblocks */
	simple_srand(1);
	printk(PRINT_PREF "verifying\n");
	for (i = 0; i < ebcnt; ++i) {
		err = verify_eraseblock(i);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "verified %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "verified %u\n", i);

	/* Second test: write all oob, a block at a time, read it back and verify */

	printk(PRINT_PREF "Test 2 of 5\n");

	/* Erase all eraseblocks */
	printk(PRINT_PREF "erasing\n");
	for (i = 0; i < ebcnt; ++i) {
		err = erase_eraseblock(i);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "erased %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "erased %u\n", i);

	/* Write all eraseblocks */
	simple_srand(3);
	printk(PRINT_PREF "writing\n");
	for (i = 0; i < ebcnt; ++i) {
		err = write_eraseblock_in_one_go(i);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "written %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "written %u\n", i);

	/* Check all eraseblocks */
	simple_srand(3);
	printk(PRINT_PREF "verifying\n");
	for (i = 0; i < ebcnt; ++i) {
		err = verify_eraseblock_in_one_go(i);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "verified %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "verified %u\n", i);

	/* Third test: write oob at varying offsets and lengths,
	               read it back and verify */

	printk(PRINT_PREF "Test 3 of 5\n");

	/* Erase all eraseblocks */
	printk(PRINT_PREF "erasing\n");
	for (i = 0; i < ebcnt; ++i) {
		err = erase_eraseblock(i);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "erased %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "erased %u\n", i);

	/* Write all eraseblocks */
	use_offset = 0;
	use_len = mtd->ecclayout->oobavail;
	use_len_max = mtd->ecclayout->oobavail;
	vary_offset = 1;
	simple_srand(5);
	printk(PRINT_PREF "writing\n");
	for (i = 0; i < ebcnt; ++i) {
		err = write_eraseblock(i);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "written %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "written %u\n", i);

	/* Check all eraseblocks */
	use_offset = 0;
	use_len = mtd->ecclayout->oobavail;
	use_len_max = mtd->ecclayout->oobavail;
	vary_offset = 1;
	simple_srand(5);
	printk(PRINT_PREF "verifying\n");
	for (i = 0; i < ebcnt; ++i) {
		err = verify_eraseblock(i);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "verified %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "verified %u\n", i);

	use_offset = 0;
	use_len = mtd->ecclayout->oobavail;
	use_len_max = mtd->ecclayout->oobavail;
	vary_offset = 0;

	/* Fourth test: try to write off end of device */

	printk(PRINT_PREF "Test 4 of 5\n");

	/* Erase all eraseblocks */
	printk(PRINT_PREF "erasing\n");
	for (i = 0; i < ebcnt; ++i) {
		err = erase_eraseblock(i);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "erased %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "erased %u\n", i);

	/* Attempt to write off end of oob */
	ops.mode      = MTD_OOB_AUTO;
	ops.len       = 0;
	ops.retlen    = 0;
	ops.ooblen    = 1;
	ops.oobretlen = 0;
	ops.ooboffs   = mtd->ecclayout->oobavail;
	ops.datbuf    = 0;
	ops.oobbuf    = writebuf;
	printk(PRINT_PREF "Attempting to start write past end of oob\n");
	printk(PRINT_PREF "An error is expected...\n");
	err = mtd->write_oob(mtd, 0, &ops);
	if (unlikely(err)) {
		printk(PRINT_PREF "Error occurred as expected\n");
		err = 0;
	} else {
		printk(PRINT_PREF "error: started write past end of oob\n");
		errcnt += 1;
	}

	/* Attempt to read off end of oob */
	ops.mode      = MTD_OOB_AUTO;
	ops.len       = 0;
	ops.retlen    = 0;
	ops.ooblen    = 1;
	ops.oobretlen = 0;
	ops.ooboffs   = mtd->ecclayout->oobavail;
	ops.datbuf    = 0;
	ops.oobbuf    = readbuf;
	printk(PRINT_PREF "Attempting to start read past end of oob\n");
	printk(PRINT_PREF "An error is expected...\n");
	err = mtd->read_oob(mtd, 0, &ops);
	if (unlikely(err)) {
		printk(PRINT_PREF "Error occurred as expected\n");
		err = 0;
	} else {
		printk(PRINT_PREF "error: started read past end of oob\n");
		errcnt += 1;
	}

	/* Write oob across chip boundary */
	simple_srand(7);
	ops.mode      = MTD_OOB_AUTO;
	ops.len       = 0;
	ops.retlen    = 0;
	ops.ooblen    = mtd->ecclayout->oobavail * 2;
	ops.oobretlen = 0;
	ops.ooboffs   = 0;
	ops.datbuf    = 0;
	ops.oobbuf    = writebuf;
	err = mtd->write_oob(mtd, addr, &ops);
	if (unlikely(err))
		goto out;

	/* Read oob across chip boundary */
	simple_srand(7);
	ops.mode      = MTD_OOB_AUTO;
	ops.len       = 0;
	ops.retlen    = 0;
	ops.ooblen    = mtd->ecclayout->oobavail * 2;
	ops.oobretlen = 0;
	ops.ooboffs   = 0;
	ops.datbuf    = 0;
	ops.oobbuf    = readbuf;
	err = mtd->read_oob(mtd, addr, &ops);
	if (unlikely(err))
		goto out;

	/* Attempt to write off end of device */
	ops.mode      = MTD_OOB_AUTO;
	ops.len       = 0;
	ops.retlen    = 0;
	ops.ooblen    = mtd->ecclayout->oobavail + 1;
	ops.oobretlen = 0;
	ops.ooboffs   = 0;
	ops.datbuf    = 0;
	ops.oobbuf    = writebuf;
	printk(PRINT_PREF "Attempting to write past end of device\n");
	printk(PRINT_PREF "An error is expected...\n");
	err = mtd->write_oob(mtd, mtd->size - mtd->writesize, &ops);
	if (unlikely(err)) {
		printk(PRINT_PREF "Error occurred as expected\n");
		err = 0;
	} else {
		printk(PRINT_PREF "error: wrote past end of device\n");
		errcnt += 1;
	}

	/* Attempt to read off end of device */
	ops.mode      = MTD_OOB_AUTO;
	ops.len       = 0;
	ops.retlen    = 0;
	ops.ooblen    = mtd->ecclayout->oobavail + 1;
	ops.oobretlen = 0;
	ops.ooboffs   = 0;
	ops.datbuf    = 0;
	ops.oobbuf    = readbuf;
	printk(PRINT_PREF "Attempting to read past end of device\n");
	printk(PRINT_PREF "An error is expected...\n");
	err = mtd->read_oob(mtd, mtd->size - mtd->writesize, &ops);
	if (unlikely(err)) {
		printk(PRINT_PREF "Error occurred as expected\n");
		err = 0;
	} else {
		printk(PRINT_PREF "error: read past end of device\n");
		errcnt += 1;
	}

	/* Fifth test: write / read across block boundaries */

	printk(PRINT_PREF "Test 5 of 5\n");

	/* Erase all eraseblocks */
	printk(PRINT_PREF "erasing\n");
	for (i = 0; i < ebcnt; ++i) {
		err = erase_eraseblock(i);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "erased %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "erased %u\n", i);

	/* Write all eraseblocks */
	simple_srand(11);
	printk(PRINT_PREF "writing\n");
	for (i = 0; i < ebcnt - 1; ++i) {
		set_random_data(writebuf, mtd->ecclayout->oobavail * 2);
		addr = (i + 1) * mtd->erasesize - mtd->writesize;
		ops.mode      = MTD_OOB_AUTO;
		ops.len       = 0;
		ops.retlen    = 0;
		ops.ooblen    = mtd->ecclayout->oobavail * 2;
		ops.oobretlen = 0;
		ops.ooboffs   = 0;
		ops.datbuf    = 0;
		ops.oobbuf    = writebuf;
		err = mtd->write_oob(mtd, addr, &ops);
		if (unlikely(err))
			goto out;
		if (i % 256 == 0)
			printk(PRINT_PREF "written %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "written %u\n", i);

	/* Check all eraseblocks */
	simple_srand(11);
	printk(PRINT_PREF "verifying\n");
	for (i = 0; i < ebcnt - 1; ++i) {
		set_random_data(writebuf, mtd->ecclayout->oobavail * 2);
		addr = (i + 1) * mtd->erasesize - mtd->writesize;
		ops.mode      = MTD_OOB_AUTO;
		ops.len       = 0;
		ops.retlen    = 0;
		ops.ooblen    = mtd->ecclayout->oobavail * 2;
		ops.oobretlen = 0;
		ops.ooboffs   = 0;
		ops.datbuf    = 0;
		ops.oobbuf    = readbuf;
		err = mtd->read_oob(mtd, addr, &ops);
		if (unlikely(err))
			goto out;
		if (unlikely(memcmp(readbuf, writebuf, mtd->ecclayout->oobavail * 2))) {
			printk(PRINT_PREF "error: verify failed at 0x%08x\n", (unsigned) addr);
			errcnt += 1;
			if (errcnt > 1000) {
				printk(PRINT_PREF "error: too many errors\n");
				goto out;
			}
		}
		if (i % 256 == 0)
			printk(PRINT_PREF "verified %u\n", i);
		cond_resched();
	}
	printk(PRINT_PREF "verified %u\n", i);

	printk(PRINT_PREF "oobtest finished with %d errors\n", errcnt);
out:
	kfree(writebuf);
	kfree(readbuf);

	put_mtd_device(mtd);

	if (err)
		printk(PRINT_PREF "error %d occurred\n", err);

	printk("=========================================================="
	       "===============================\n");

	return -1;
}
module_init(oobtest_init);

static void __exit oobtest_exit(void)
{
	return;
}
module_exit(oobtest_exit);

MODULE_DESCRIPTION("Page test module");
MODULE_AUTHOR("Artem Bityutskiy, Adrian Hunter");
MODULE_LICENSE("GPL");
