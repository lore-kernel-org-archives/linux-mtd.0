Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7hk3-0008Ja-Qa
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 20:04:16 -0400
Received: from ep_mmp2 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J3A00E36LIW1Q@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 01 Aug 2006 09:04:08 +0900 (KST)
Received: from sharmaami ([12.52.146.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPSA id <0J3A00JDALIUUX@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 01 Aug 2006 09:04:07 +0900 (KST)
Date: Tue, 01 Aug 2006 09:04:15 +0900
From: Amit Kumar Sharma <sharma.amit@samsung.com>
Subject: Bad block message from JFFS2
To: linux-mtd@lists.infradead.org
Message-id: <004e01c6b4fe$07e88690$3d92340c@dsn.sec.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi 

I am testing JFFS2 with OneNAND mtd on Linux kernel mvl 2.4.20
I have two partition of JFFS2 on my device of following size 20Mb and 200Mb.
During iozone testing on flash partition of size 200Mb, JFFS2 try to erase
device and it create Bad blocks on device .when I try to check with some
different software, I did not find so many bad blocks on my device .How I
Can verify bad block marker in JFFS2 and in which condition JFFS2 will mark
a block as bad block? 

During IOZONE running on 200Mb partition for 20Mb file read and write
operation.I am getting following debugging messages on console

KB  reclen   write rewrite    read    reread
20480       4jffs2_scan_eraseblock(): Node at 0x003cdff8 {0x1985, 0x)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003cdffc:
0x0046 id
jffs2_check_nand_cleanmarker(): Bad block at 05560000
block state bad block   

 /* ==========" block state bad block   print is coming from
here===============

    int ret = jffs2_check_nand_cleanmarker(c, jeb);
                D2(printk(KERN_NOTICE "jffs_check_nand_cleanmarker returned
%d\n",ret));
                /* Even if it's not found, we still scan to see
                   if the block is empty. We use this information
                   to decide whether to erase it or not. */
                switch (ret) {
                case 0:         cleanmarkerfound = 1; break;
                case 1:         break;
                case 2:
                        printk("block state bad block\n");
                        return BLK_STATE_BADBLOCK;
                case 3:  

========================================================*/



jffs2_check_nand_cleanmarker(): Bad block at 05580000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 055a0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0b9e0000
block state bad block
Newly-erased block contained word 0xe0021985 at offset 0x05540000
Newly-erased block contained word 0x44c17860 at offset 0x00220000
Newly-erased block contained word 0x20f000 at offset 0x00200000
jffs2_scan_eraseblock(): Node at 0x003cdff8 {0x1985, 0xe002, 0x00000046) has
in)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003cdffc:
0x0046 id
jffs2_check_nand_cleanmarker(): Bad block at 05560000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 05580000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 055a0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0b9e0000
block state bad block
Newly-erased block contained word 0x3 at offset 0x0bb60000
Newly-erased block contained word 0x34 at offset 0x05540000
Newly-erased block contained word 0x1141 at offset 0x06860000
    3318    1875jffs2_scan_eraseblock(): Node at 0x003cdff8 {0x1985, 0xe002,
0x)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003cdffc:
0x0046 id
jffs2_check_nand_cleanmarker(): Bad block at 05560000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 05580000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 055a0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0b9e0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0bb60000
block state bad block
Newly-erased block contained word 0x1313000 at offset 0x0b4e0000
Newly-erased block contained word 0x1b076 at offset 0x05540000
Newly-erased block contained word 0x1400000 at offset 0x0bb40000
jffs2_scan_eraseblock(): Node at 0x003cdff8 {0x1985, 0xe002, 0x00000046) has
in)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003cdffc:
0x0046 id
jffs2_check_nand_cleanmarker(): Bad block at 05560000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 05580000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 055a0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0b9e0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0bb40000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0bb60000
block state bad block
Newly-erased block contained word 0xe0021985 at offset 0x09220000
Newly-erased block contained word 0x0 at offset 0x05540000
     5362     4459
Newly-erased block contained word 0x1141 at offset 0x06800000
Newly-erased block contained word 0x2fc93c1e at offset 0x04d60000
           20480       8jffs2_scan_eraseblock(): Node at 0x003cdff8 {0x1985,
0x)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003cdffc:
0x0046 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42800:
0x4994 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42804:
0xd309 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42808:
0xac25 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d4280c:
0xa49c id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42810:
0x96f8 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42814:
0x5b8f id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42818:
0x0c02 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d4281c:
0x203a id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42820:
0x803e id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04d42824:
0x4764 id
Further such events for this erase block will not be printed
jffs2_check_nand_cleanmarker(): Bad block at 04d60000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 05560000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 05580000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 055a0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 09220000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0b9e0000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0bb40000
block state bad block
jffs2_check_nand_cleanmarker(): Bad block at 0bb60000
block state bad block





I am getting following message from device after boot up complete.

"            Newly-erased block contained word 0x1a2c3ecf at offset
0x054e000

root@apollon:~# Newly-erased block contained word 0x37fc4828 at offset
0x0bb4000...
"
