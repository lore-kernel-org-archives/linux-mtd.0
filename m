Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Mn8U-0002ey-J5
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 12:05:55 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h52B8mD11122
	for <linux-mtd@lists.infradead.org>;
	Mon, 2 Jun 2003 14:08:48 +0300 (EEST)
Received: from ifaistos.intranet.gr (ifaistos.intranet.GR [146.124.20.203])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h52B8mY11113
	for <linux-mtd@lists.infradead.org>;
	Mon, 2 Jun 2003 14:08:48 +0300 (EEST)
Received: from intracom.gr (pcrnd46 [146.124.20.92])
	by ifaistos.intranet.gr (8.9.1b+Sun/8.9.1) with ESMTP id OAA20294
	for <linux-mtd@lists.infradead.org>;
	Mon, 2 Jun 2003 14:02:36 +0300 (EET DST)
Message-ID: <3EDB2F4E.6050502@intracom.gr>
Date: Mon, 02 Jun 2003 14:04:46 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: NAND write verify failed problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I'm testing a new board with a NAND device chip
and I've hit a couple of problems which I'm not
sure what the problem is.

My configuration is as follows.

CPU: MPC850SR powerpc
NAND: Samsung K9FF5608U0B (32Mb, 8bit interface).
Kernel: LinuxPPC 2.4.21-rc2 devel.

The kernel has fairly recent MTD drivers and a diff
found no major differences.
I use the mtd utils from the latest nightly tarball.

The NAND driver is a custom one I made based on the
example in the docs. It is fairly simple and the
chip is detected alright at boot time.

The relevant .config fragment is as follows:

CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=0
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CONCAT=y
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_VERIFY_WRITE=y
CONFIG_MTD_NAND_NETVIA=y # the name of my board
CONFIG_MTD_NAND_IDS=y

I intend to use JFFS2 which I used in a previous
design with a NOR flash.

Mounting an NFS root from a shell on the target...

Erasing seems to go well.

 > root$ eraseall -j /dev/mtd0
Erasing 16 Kibyte @ 1ffc000 -- 99 % complete. Cleanmarker written at 1ffc000

Making a test jffs2 image (size 540672 bytes)

 > root$ mkfs.jffs2 -e16384 -b -p -v -d /root/ -o /tmp/root.jffs2.image

Copying the image to the NAND.

 > root$ fcp -v /tmp/root.jffs2.image /dev/mtd0
 > Erasing blocks: 33/33 (100%)
 > Writing data: 528k/528k (100%)
 > Verifying data: 20k/528k (3%)File does not seem to match flash data. 
First mismatch at 0x00002800-0x00005000

We have the first warning that something is amiss.
Still no warning or error at syslog.

Now things get interesting...

 > root$ mount -t jffs2 /dev/mtdblock0 /mnt/

Mount takes 30 seconds to finish, and during that time the board does not
respond to any external stimulus. This is caused I believe from the scaning
of the NAND, which I take it is normal.

The contents of the files match what was written to the image.

But when I try to write by copying a small file the write fails
and I get the following to the syslog.

nand_write_page: Failed write verify, page 0x0000040b <5>Write of 68 
bytes at 0x00081774 failed. returned -5, retlen 0
Mar 10 21:44:22 netvia-ppc kernel: Not marking the space at 0x00081774 
as dirty because the flash driver returned retlen zero

Any ideas how to proceed?

Regards

Pantelis
