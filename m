Received: from [202.75.200.241] (helo=mailgw.cms.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KBpq1-0001zh-Dc
	for linux-mtd@lists.infradead.org; Thu, 26 Jun 2008 11:40:30 +0000
Received: from [172.19.23.21] ([172.19.23.21])
	by mailgw.cms.com (8.12.11/8.12.11) with ESMTP id m5QBbgTt004756
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2008 17:07:42 +0530
Subject: CRC failed error,when mounting JFFS2
From: Aneesh <aneesh_g@cms.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Thu, 26 Jun 2008 17:01:12 +0530
Message-Id: <1214479872.8603.14.camel@Ani>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
        When i am trying to mount jffs2  i am getting an error like
follows


 JFFS2 error: (268) jffs2_do_read_inode_internal: CRC failed for
read_inode of inode 2 at physical location 0x0
Returned error for crccheck of ino #2. Expect badness...
JFFS2 error: (268) jffs2_do_read_inode_internal: CRC failed for
read_inode of inode 3 at physical location 0x790104
Returned error for crccheck of ino #3. Expect badness...



 i have two partitions .I am using mtd1 partition  for data storage
(mtd0 is not using)
steps i did
1) erased the flash  
    ##### ./flash_eraseall -j /dev/mtd1
2) mounted jffs2 
   ##### mount -t jffs2 /dev/mtdblock1 /database/
then i written to  this parallel flash. i created a text file and a
folder
3)unmounted 
    umount /database
4)again i tried to mount then  above error is coming

My parallel flash is  AT49BV642D. I am using 2.6.21 kernel.

can anybody give a suggestion?

Regards 
Aneesh
