Received: from bay101-f7.bay101.hotmail.com ([64.4.56.17] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.60 #1 (Red Hat Linux))
	id 1FMrHW-0004wp-8D
	for linux-mtd@lists.infradead.org; Fri, 24 Mar 2006 18:45:08 +0000
Message-ID: <BAY101-F7B62563E26F6D6318B633BCDF0@phx.gbl>
From: "Han Chang" <posaune@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 24 Mar 2006 10:44:52 -0800
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Subject: JFFS2 & NAND problem.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm trying to get JFFS2 working on a NAND flash device. I'm having two 
problems. They might be related.

1) Once I mount the JFFS2 to the device, I am able to create directory and 
copy files into there. If I compare the files in the JFFS2 directory with 
the original files. They are exactly match. Even if I do a "sync", and 
compare them again, and they still match. But once I reboot the system and 
compare the files in the JFFS2 directory with the original files, then they 
are not matched any more. Anyone have seen this kind of behavior?

2) One thing I noticed when I mount the JFFS2 to the devive, there are bunch 
of following CRC msgs dumped out. I have done other test on the NAND flash 
and it's in good condition. I'm puzzled with these "CRC failed" msgs.

jffs2_get_inode_nodes(): CRC failed on node at 0x0005efd0: Read 0xffffffff, 
calc
ulated 0x6791a538
jffs2_get_inode_nodes(): CRC failed on node at 0x0005e7d8: Read 0xffffffff, 
calc
ulated 0x81c6885d
jffs2_get_inode_nodes(): CRC failed on node at 0x0004bff8: Read 0xffffffff, 
calc
ulated 0xcfd1b4d3
jffs2_get_inode_nodes(): CRC failed on node at 0x00040fd4: Read 0xffffffff, 
calc
ulated 0x596a66c5
jffs2_get_inode_nodes(): CRC failed on node at 0x0002d7e0: Read 0xffffffff, 
calc
ulated 0xb6f7ff0d
jffs2_get_inode_nodes(): CRC failed on node at 0x00028fcc: Read 0xffffffff, 
calc
ulated 0x78990f70
jffs2_get_inode_nodes(): CRC failed on node at 0x0001efcc: Read 0xffffffff, 
calc
ulated 0x30a35bd1
jffs2_get_inode_nodes(): CRC failed on node at 0x0001dfe4: Read 0xffffffff, 
calc
ulated 0x4f77e039


I appreciate any help!!!

Han
