Received: from www.itv-con.net ([203.125.253.66] helo=localhost.localdomain)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKt5X-00006d-RB
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 03:44:32 -0400
Received: from yahoo.com.sg (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.12.8/8.12.8) with ESMTP id j8T7gkfu002193
	for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2005 15:42:47 +0800
Message-ID: <433B9AF6.6020202@yahoo.com.sg>
Date: Thu, 29 Sep 2005 15:42:46 +0800
From: Chen Zhigao <banyan8@yahoo.com.sg>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Wrong CLEANMARKER Position
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I try to boot my IXP425 board with a JFFS2 root FS on the MTD, into 
which I burned two images, "zImage" and "jffs2". I got a lot of messages 
regarding wrong CLEANMARKER position during booting, although I can use 
the root FS. What's wrong here?

============================================
6 RedBoot partitions found on MTD device IXP425 Flash
Creating 6 MTD partitions on "IXP425 Flash":
0x00000000-0x00040000 : "RedBoot"
0x00040000-0x00100000 : "zImage"
0x00100000-0x00f00000 : "jffs2"
0x00f00000-0x00fc0000 : "unallocated"
0x00fc0000-0x00fc1000 : "RedBoot config"
mtd: partition "RedBoot config" doesn't end on an erase block -- force 
read-only
0x00fe0000-0x01000000 : "FIS directory"
<snip>
Empty flash at 0x0000fffc ends at 0x00010000
CLEANMARKER node found at 0x00010000, not first node in block (0x00000000)
Empty flash at 0x0002fffc ends at 0x00030000
CLEANMARKER node found at 0x00030000, not first node in block (0x00020000)
Empty flash at 0x0004fffc ends at 0x00050000
CLEANMARKER node found at 0x00050000, not first node in block (0x00040000)
Empty flash at 0x0006fffc ends at 0x00070000
CLEANMARKER node found at 0x00070000, not first node in block (0x00060000)
<snip>
CLEANMARKER node found at 0x00310000, not first node in block (0x00300000)
Empty flash at 0x0032ffd4 ends at 0x00330000
CLEANMARKER node found at 0x00330000, not first node in block (0x00320000)
CLEANMARKER node found at 0x00350000, not first node in block (0x00340000)
CLEANMARKER node found at 0x00370000, not first node in block (0x00360000)
CLEANMARKER node found at 0x00390000, not first node in block (0x00380000)
Empty flash at 0x003afffc ends at 0x003b0000
CLEANMARKER node found at 0x003b0000, not first node in block (0x003a0000)
CLEANMARKER node found at 0x003d0000, not first node in block (0x003c0000)
VFS: Mounted root (jffs2 filesystem).
====================================================

Another problem is that I can not find any "/dev/mtd*" in the FS, though 
"cat /proc/mtd" can return me the flash partition infor.

Any comment is welcome.

--Zhigao
