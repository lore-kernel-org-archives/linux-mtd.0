Received: from newgate1.zarlink.com ([209.226.172.66] helo=semigate.zarlink.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1781vO-00028C-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 17:46:50 +0100
Received: from ottmta02.zarlink.com (ottmta02.ottawa.zarlink.com [134.199.14.111])
	by semigate.zarlink.com (8.10.2+Sun/8.10.2) with ESMTP id g4FGjN307964
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 12:45:24 -0400 (EDT)
Subject: Status of NAND Flash JFFS2 Code
To: linux-mtd@lists.infradead.org
Message-ID: <OF8E839385.B27B3BDB-ON80256BBA.00535F9D@zarlink.com>
From: Rob.McConnell@Zarlink.Com
Date: Wed, 15 May 2002 17:39:06 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
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

Hi Folks,

I am having problems running JFFS2 on NAND flash devices with dodgy blocks
(Toshiba TC58V64AFT).

I started with the  MVista HHL2.0 - 2.4.2 kernel. I updated the mtd code to
the newest available from the CVS repository. This code appears to work
correctly. I can read/write and erase the NAND flash device correctly using
mtd char access. I have also created a block device and this seems to allow
me to "dd" it.

I have tried several version of the JFFS2 code but  I always encounter the
same problems. I started with the JFFS2 code from HHL 2.1 (2.4.17 kernel).
I have also obtained the CVS branches JFFS2-2_4, JFFS2-NAND_BRANCH and
JFFS2-NAND-BRANCHPOINT. I have  back-ported each of these versions into my
2.4.2 kernel and compiled the JFFS2 fs and mtd drivers into the kernel.

This is the sequence of events leading to the problems:

a) Erase NAND flash partition 0 using the "eraseall" utility (./eraseall
/dev/mtd0 and verify that the erase has worked (reading back FF's from all
erased blocks).

b) mount the JFFS2 on the mtdblock0 device (mount -t jffs2 /dev/mtdblock0
/nand/p0)

     This identifies that the NAND flash device is not formatted for JFFS2
and proceeds to do its business. It then comes back to the command prompt
and I can check the /proc/mounts file to see whether it has really been
mounted.

c) I then create a simply file by echo "Hello World" > /nand/p0 and then
sync.  I can see this file in the directory and can read it back.

d) I can also copy this small file to another file or even create another
"Hello World2" file in the same directory without any problems.

e) If I copy a large file onto the JFFS2 fs (e.g. eraseall > 400K), I get
problems when I try to read it back or list the dir contents or even if I
try to execute it.

I get the message "Error reading node from 0x????????: ..." which is
printed from the function "jffs2_read_dnode" in read.c

f) I can't unmount the device (it's busy) and if I then reboot and try to
mount again it fails.

If anyone has any suggestions, then they would be most welcome!

TIA,

Rob ;-)
