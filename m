Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B4Cfp-0001tv-PM
	for linux-mtd@lists.infradead.org; Fri, 19 Mar 2004 05:36:01 +0000
Received: from il06exr04.mot.com (il06exr04.mot.com [129.188.137.134])
	by motgate8.mot.com (Motorola/Motgate3) with ESMTP id i2J5a2mm023338
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Mar 2004 22:36:02 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by il06exr04.mot.com (Motorola/il06exr04) with ESMTP id i2J5ZsJh030558
	for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2004 23:35:55 -0600
Message-ID: <01139FC052A0D411900B00508B9535FC102796E7@ZCH07EXM04.corp.mot.com>
From: Shen Aaron-r62966 <Aaron.Shen@motorola.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Fri, 19 Mar 2004 13:35:51 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Subject: JFFS2 Errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  I met some error when using JFFS2 in my new board while there's no problem to use cramfs file system. Actually, the problem is only these disgusting error messeges because the JFFS2 rootdisk can be mounted at last. 

  Below is the error messege, please help to see what's the cause. Thanks.
......
jffs2_scan_empty(): Empty block at 0x0001fffc ends at 0x00020000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00020000, not first node in block (0x00000000)
jffs2_scan_empty(): Empty block at 0x0005fffc ends at 0x00060000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00060000, not first node in block (0x00040000)
jffs2_scan_empty(): Empty block at 0x0009fff4 ends at 0x000a0000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x000a0000, not first node in block (0x00080000)
jffs2_scan_empty(): Empty block at 0x000dfffc ends at 0x000e0000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x000e0000, not first node in block (0x000c0000)
jffs2_scan_empty(): Empty block at 0x0011fffc ends at 0x00120000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00120000, not first node in block (0x00100000)
jffs2_scan_empty(): Empty block at 0x0015fffc ends at 0x00160000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00160000, not first node in block (0x00140000)
CLEANMARKER node found at 0x001a0000, not first node in block (0x00180000)
jffs2_scan_empty(): Empty block at 0x001dfffc ends at 0x001e0000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x001e0000, not first node in block (0x001c0000)
jffs2_scan_empty(): Empty block at 0x0021fffc ends at 0x00220000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00220000, not first node in block (0x00200000)
jffs2_scan_empty(): Empty block at 0x0025fffc ends at 0x00260000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00260000, not first node in block (0x00240000)
CLEANMARKER node found at 0x002a0000, not first node in block (0x00280000)
CLEANMARKER node found at 0x002e0000, not first node in block (0x002c0000)
CLEANMARKER node found at 0x00320000, not first node in block (0x00300000)
CLEANMARKER node found at 0x00360000, not first node in block (0x00340000)
CLEANMARKER node found at 0x003a0000, not first node in block (0x00380000)
CLEANMARKER node found at 0x003e0000, not first node in block (0x003c0000)
CLEANMARKER node found at 0x00420000, not first node in block (0x00400000)
CLEANMARKER node found at 0x00460000, not first node in block (0x00440000)
CLEANMARKER node found at 0x004a0000, not first node in block (0x00480000)
CLEANMARKER node found at 0x004e0000, not first node in block (0x004c0000)
CLEANMARKER node found at 0x00520000, not first node in block (0x00500000)
CLEANMARKER node found at 0x00560000, not first node in block (0x00540000)
CLEANMARKER node found at 0x005a0000, not first node in block (0x00580000)
CLEANMARKER node found at 0x005e0000, not first node in block (0x005c0000)
CLEANMARKER node found at 0x00620000, not first node in block (0x00600000)
CLEANMARKER node found at 0x00660000, not first node in block (0x00640000)
CLEANMARKER node found at 0x006a0000, not first node in block (0x00680000)
CLEANMARKER node found at 0x006e0000, not first node in block (0x006c0000)
CLEANMARKER node found at 0x00720000, not first node in block (0x00700000)
CLEANMARKER node found at 0x00760000, not first node in block (0x00740000)
CLEANMARKER node found at 0x007a0000, not first node in block (0x00780000)
CLEANMARKER node found at 0x007e0000, not first node in block (0x007c0000)
CLEANMARKER node found at 0x00820000, not first node in block (0x00800000)
CLEANMARKER node found at 0x00860000, not first node in block (0x00840000)
CLEANMARKER node found at 0x008a0000, not first node in block (0x00880000)
CLEANMARKER node found at 0x008e0000, not first node in block (0x008c0000)
jffs2_scan_empty(): Empty block at 0x0091fffc ends at 0x00920000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00920000, not first node in block (0x00900000)
jffs2_scan_empty(): Empty block at 0x0095fffc ends at 0x00960000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00960000, not first node in block (0x00940000)
jffs2_scan_empty(): Empty block at 0x0099fffc ends at 0x009a0000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x009a0000, not first node in block (0x00980000)
jffs2_scan_empty(): Empty block at 0x009dfffc ends at 0x009e0000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x009e0000, not first node in block (0x009c0000)
jffs2_scan_empty(): Empty block at 0x00a1fffc ends at 0x00a20000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00a20000, not first node in block (0x00a00000)
jffs2_scan_empty(): Empty block at 0x00a5fffc ends at 0x00a60000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00a60000, not first node in block (0x00a40000)
jffs2_scan_empty(): Empty block at 0x00a9fffc ends at 0x00aa0000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00aa0000, not first node in block (0x00a80000)
jffs2_scan_empty(): Empty block at 0x00adfffc ends at 0x00ae0000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00ae0000, not first node in block (0x00ac0000)
jffs2_scan_empty(): Empty block at 0x00b1fffc ends at 0x00b20000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00b20000, not first node in block (0x00b00000)
jffs2_scan_empty(): Empty block at 0x00b5fffc ends at 0x00b60000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00b60000, not first node in block (0x00b40000)
jffs2_scan_inode_node(): Data CRC failed on node at 0x00b8b220: Read 0x1bac7b35,
 calculated 0xc731cc62
jffs2_scan_inode_node(): Data CRC failed on node at 0x00b9be10: Read 0x53f45f5f,
 calculated 0x28d0f08d
jffs2_scan_inode_node(): Data CRC failed on node at 0x00b9f654: Read 0xe856288d,
 calculated 0xa49d79c8
jffs2_scan_empty(): Empty block at 0x00b9fffc ends at 0x00ba0000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00ba0000, not first node in block (0x00b80000)
jffs2_scan_inode_node(): Data CRC failed on node at 0x00bb2dd8: Read 0x5ee2d1dd,
 calculated 0xc0f86b28
jffs2_scan_inode_node(): Data CRC failed on node at 0x00bd8e0c: Read 0xe6a360b0,
 calculated 0x4b6baaf9
jffs2_scan_empty(): Empty block at 0x00bdff5c ends at 0x00be0000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00be0000, not first node in block (0x00bc0000)
jffs2_scan_inode_node(): Data CRC failed on node at 0x00bfb074: Read 0xe070bd2e,
 calculated 0x39ae1cdf
jffs2_scan_inode_node(): Data CRC failed on node at 0x00c08914: Read 0xe7c470b4,
 calculated 0xac3121ed
jffs2_scan_inode_node(): Data CRC failed on node at 0x00c0e058: Read 0x0380eb82,
 calculated 0xd4d14d5a
jffs2_scan_inode_node(): Data CRC failed on node at 0x00c19e18: Read 0x98b23442,
 calculated 0xf13ed0ab
jffs2_scan_empty(): Empty block at 0x00c1ffe4 ends at 0x00c20000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00c20000, not first node in block (0x00c00000)
jffs2_scan_empty(): Empty block at 0x00c5fffc ends at 0x00c60000 (with 0x2003198
5)! Marking dirty
CLEANMARKER node found at 0x00c60000, not first node in block (0x00c40000)
jffs2_scan_inode_node(): Data CRC failed on node at 0x00c621a4: Read 0x5f3a742e,
 calculated 0xe4b348f8
Eep. Child "ansi77" (ino #690) of dir ino #488 doesn't exist!
Eep. Child "att610" (ino #794) of dir ino #488 doesn't exist!
Eep. Child "att730" (ino #809) of dir ino #488 doesn't exist!
Eep. Child "cons50l1-m" (ino #954) of dir ino #490 doesn't exist!
Eep. Child "hp2645a" (ino #1259) of dir ino #495 doesn't exist!
Eep. Child "pc6300plus" (ino #1569) of dir ino #503 doesn't exist!
Eep. Child "qvt119p-25-w" (ino #1678) of dir ino #504 doesn't exist!
Eep. Child "soroc120" (ino #1723) of dir ino #506 doesn't exist!
Eep. Child "ti926" (ino #1830) of dir ino #507 doesn't exist!
Eep. Child "wyse60-43-w" (ino #2231) of dir ino #510 doesn't exist!
VFS: Mounted root (jffs2 filesystem).
Mounted devfs on /dev
Freeing init memory: 84K
......
//Then the system is booted up.

Aaron
