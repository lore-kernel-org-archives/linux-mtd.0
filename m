Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15mIiN-0006pn-00
	for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2001 18:43:19 +0100
Message-ID: <20010926105217.A29296@recycle.lbl.gov>
Date: Wed, 26 Sep 2001 10:52:17 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: undefined reference to `__put_user_bad' in `mtdblock_ioctl', arch=ARM
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Building the CVS version of MTD, embedded within
linux-2.4.9-ac9-rmk1-np1 for StrongARM using gcc-2.95.3,
I get:

drivers/mtd/mtdlink.o: In function `mtdblock_ioctl':
drivers/mtd/mtdlink.o(.text+0xadcc): undefined reference to `__put_user_bad'
drivers/mtd/mtdlink.o(.text+0xadcc): relocation truncated to fit: R_ARM_PC24 __p
ut_user_bad
make: *** [vmlinux] Error 1

It appears as if mtdblock_ioctl() in drivers/mtd/mtdblock.c, faced with
the case BLKGETSIZE64, does a put_user() of a 64-bit number.  Eight-byte
put_user()'s are not supported on ARM or x86.
    (ref: include/asm-{arm,i386}/uaccess.h, macro __put_user_size)

Whazzup?

      - Larry
