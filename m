Received: from dsl-62-3-66-203.zen.co.uk
	([62.3.66.203] helo=crown.nexus.co.uk ident=foobar)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATm7t-0005jm-M1
	for <linux-mtd@lists.infradead.org>; Tue, 09 Dec 2003 17:58:26 +0000
Received: from dsl-62-3-66-204.zen.co.uk ([62.3.66.204]
	helo=dobblers.nexus.co.uk)
	by crown.nexus.co.uk with esmtp (TLS-1.0:DHE_RSA_3DES_EDE_CBC_SHA:24)
	(Exim 4.24)	id 1ATm6B-0004Hw-JH
	for linux-mtd@lists.infradead.org; Tue, 09 Dec 2003 17:56:39 +0000
From: John Stirling <js@reciva.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1070992528.25344.23.camel@dobblers.nexus.co.uk>
Mime-Version: 1.0
Date: 09 Dec 2003 17:55:28 +0000
Content-Transfer-Encoding: 7bit
Subject: jffs2/nand flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I've just upgraded mtd/jffs2 and am having some trouble getting it to
operate correctly. 

>From a clean file system, the kernel boots up fine. When i reboot the
kernel some errors are reported. 

Errors similar to the one below are introduced each time the kernel is
rebooted :
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00a67044: Read
0x624aa350, calculated 0x35ced54c

I have traced through to find the cause of this error.
jffs2_flash_writev is called with vecs[0]=68, vecs[1]=489. This only
results in one page write even though there is more than 512 bytes of
data. It is called from jffs2_full_dnode (in write.c).
alloc_mode=ALLOC_GC. Is this expected operation ? It seems to be causing
the reported errors.

I have some additional errors - see below. 0x4ac400 corresponds to the
end of the downloaded jffs2 image (approx 5Mb). The remainder of the
partition was filled with 0xff (7Mb). Individual page reads and writes
work fine.

Can anyone give me some pointers ?

Cheers
John


Reading data from NAND FLASH without ECC is not recommended, page = 4034
Empty flash at 0x004ac3e0 ends at 0x004ac400
ofs 0x004ac400 has already been seen. Skipping
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004ac404:
0x0044 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004ac408:
0xfb1d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004ac40c:
0x015e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004ac410:
0x0002 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004ac414:
0x81a4 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004ac41c:
0x09ee instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004ac420:
0x090c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004ac424:
0x090c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004ac428:
0x090c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x004ac440:
0x6473 instead
Further such events for this erase block will not be printed
Empty flash at 0x004ad968 ends at 0x004ada00
Empty flash at 0x004ae4f4 ends at 0x004ae600
Empty flash at 0x004af0f4 ends at 0x004af200
Empty flash at 0x004afcf4 ends at 0x004afe00
Empty flash at 0x009509d0 ends at 0x00950a00
Empty flash at 0x00950c74 ends at 0x00950e00
Empty flash at 0x00951074 ends at 0x00951200
Empty flash at 0x00951474 ends at 0x00951600
Empty flash at 0x00951874 ends at 0x00951a00
Empty flash at 0x00951c74 ends at 0x00951e00
Empty flash at 0x00952074 ends at 0x00952200
Empty flash at 0x00952474 ends at 0x00952600
Empty flash at 0x00952874 ends at 0x00952a00
Empty flash at 0x00952c74 ends at 0x00952e00
Empty flash at 0x00953074 ends at 0x00953200
Empty flash at 0x00953474 ends at 0x00953600
Empty flash at 0x00953874 ends at 0x00953a00
Empty flash at 0x00953c74 ends at 0x00953e00
Empty flash at 0x00a64af4 ends at 0x00a64c00
Empty flash at 0x00a656f4 ends at 0x00a65800
Empty flash at 0x00a65a74 ends at 0x00a65c00
Empty flash at 0x00a666f4 ends at 0x00a66800
Empty flash at 0x00a66a74 ends at 0x00a66c00
Empty flash at 0x00a66e74 ends at 0x00a67000
Empty flash at 0x00a67b00 ends at 0x00a67c00
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00a67044: Read
0x624aa350, calculated 0x35ced54c
csize = 2680
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00a65c44: Read
0xb06d8189, calculated 0x6572a2ca
csize = 2666
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00a64c44: Read
0xb06d8189, calculated 0x6572a2ca
csize = 2666
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00a64044: Read
0xb06d8189, calculated 0x6572a2ca
csize = 2666
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00950000: Read
0x800a46b1, calculated 0x46227ec9
csize = 2443
jffs2_get_inode_nodes(): Data CRC failed on node at 0x004af244: Read
0xb06d8189, calculated 0x6572a2ca
csize = 2666
jffs2_get_inode_nodes(): Data CRC failed on node at 0x004ae644: Read
0xb06d8189, calculated 0x6572a2ca
csize = 2666
jffs2_get_inode_nodes(): Data CRC failed on node at 0x004ada44: Read
0xb06d8189, calculated 0x6572a2ca
csize = 2666
jffs2_get_inode_nodes(): Data CRC failed on node at 0x004aceb8: Read
0xb06d8189, calculated 0xdbc6ea9a
csize = 2666
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00a67c44: Read
0x3493adbd, calculated 0x467d8877
csize = 509
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00a66c44: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00a66844: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00a65844: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00953a44: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00953644: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00953244: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00952e44: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00952a44: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00952644: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00952244: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00951e44: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00951a44: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00951644: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00951244: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00950e44: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489
jffs2_get_inode_nodes(): Data CRC failed on node at 0x00950a44: Read
0x30c47a75, calculated 0x615d8e4b
csize = 489




 
