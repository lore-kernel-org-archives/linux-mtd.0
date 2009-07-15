Received: from mx7.zte.com.cn ([202.103.147.169])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQyZt-0007k3-51
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 07:07:07 +0000
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse1.zte.com.cn with ESMTP id n6F71auO096149
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Jul 2009 15:01:36 +0800 (CST)
	(envelope-from liu.yaojin@zte.com.cn)
To: linux-mtd@lists.infradead.org
Subject: mount jffs2 as rootfs and detect error:Magic bitmask 0x1985 not found
MIME-Version: 1.0
Message-ID: <OFEBE7C71C.129897EA-ON482575F4.00266160-482575F4.00269914@zte.com.cn>
From: liu.yaojin@zte.com.cn
Date: Wed, 15 Jul 2009 14:59:54 +0800
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi, everyone:

now i port uboot(1.1.6) and kernel(2.6.24.7) to my arm926 board.
here is my procedure to make a jffs2 fs and mount:
1,make jffs2 using mkfs.jffs2: "mkfs.jffs2 -r ./rootfs -o fs.jffs2 -e 
0x4000 -s 0x200 -n --pad=0x200000 -l"
2,use uboot to write the fs image,because i don't have enthernet!
nand erase 250000 20000
nand write.jffs2 21000000 250000 200000
3,boot the kernel with args: setenv bootargs 'mem=56M 
console=ttyS0,115200n8 noinitrd  root=/dev/mtdblock3 rootfstype=jffs2 rw'

now the errors happen:

//========================================
Creating 4 MTD partitions on "NAND 128MiB 1,8V 8-bit":
0x00000000-0x00040000 : "uboot"
0x00040000-0x00044000 : "params"
0x00050000-0x00250000 : "kernel"
0x00250000-0x00550000 : "filesystem"
mice: PS/2 mouse device common for all mice
mtd->read(0x3c0c bytes from 0x14c3f4) returned ECC error
mtd->read(0xdec bytes from 0x14f214) returned ECC error
Empty flash at 0x0014f210 ends at 0x0014f400
mtd->read(0x400 bytes from 0x150000) returned ECC error
jffs2_scan_eraseblock(): Node at 0x00150008 {0x1985, 0x2003, 0x00000008) 
has invalid CRC 0xffffffff (calculated 0x6b7c27e6)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0015000c: 
0x0008 instead
mtd->read(0x3f80 bytes from 0x150080) returned ECC error
mtd->read(0x400 bytes from 0x154000) returned ECC error
jffs2_scan_eraseblock(): Node at 0x00154008 {0x1985, 0x2003, 0x00000008) 
has invalid CRC 0xffffffff (calculated 0x6b7c27e6)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0015400c: 
0x0008 instead
mtd->read(0x3f80 bytes from 0x154080) returned ECC error
mtd->read(0x400 bytes from 0x158000) returned ECC error
jffs2_scan_eraseblock(): Node at 0x00158008 {0x1985, 0x2003, 0x00000008) 
has invalid CRC 0xffffffff (calculated 0x6b7c27e6)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0015800c: 
0x0008 instead
mtd->read(0x3f80 bytes from 0x158080) returned ECC error
mtd->read(0x400 bytes from 0x15c000) returned ECC error
jffs2_scan_eraseblock(): Node at 0x0015c008 {0x1985, 0x2003, 0x00000008) 
has invalid CRC 0xffffffff (calculated 0x6b7c27e6)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0015c00c: 
0x0008 instead
...........................
JFFS2 notice: (1) jffs2_build_xattr_subsystem: complete building xattr 
subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 
orphan) found.
mtd->read(0x70 bytes from 0x14f590) returned ECC error
mtd->read(0x8f7 bytes from 0x14f600) returned ECC error
JFFS2 notice: (698) check_node_data: wrong data CRC in data node at 
0x0014f590: read 0x6c371760, calculated 0x5f5283ad.
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 76K
Read of newly-erased block at 0x0015c000 failed: -74. Putting on bad_list
Read of newly-erased block at 0x00158000 failed: -74. Putting on bad_list
mtd->read(0x70 bytes from 0x146190) returned ECC error
JFFS2 notice: (1) jffs2_get_inode_nodes: Wrong magic bitmask 0x0000 in 
node header at 0x146190.
JFFS2 notice: (1) jffs2_get_inode_nodes: Wrong magic bitmask 0x0000 in 
node header at 0x146118.
JFFS2 notice: (1) jffs2_get_inode_nodes: Wrong magic bitmask 0x0000 in 
node header at 0x1460a0.
Read of newly-erased block at 0x00150000 failed: -74. Putting on bad_list
............................................
finally dead at:
mtd->read(0xf0 bytes from 0xdbb10) returned ECC error
JFFS2 notice: (1) jffs2_get_inode_nodes: Wrong magic bitmask 0x0000 in 
node header at 0x0dbb10.
Read of newly-erased block at 0x00170000 failed: -74. Putting on bad_list
mtd->read(0xec bytes from 0xda114) returned ECC error
JFFS2 notice: (1) jffs2_get_inode_nodes: Wrong magic bitmask 0x0000 in 
node header at 0x0da114.
Read of newly-erased block at 0x00168000 failed: -74. Putting on bad_list
mtd->read(0x21c bytes from 0xd87e4) returned ECC error
JFFS2 notice: (1) jffs2_get_inode_nodes: Wrong magic bitmask 0x0000 in 
node header at 0x0d87e4.
Read of newly-erased block at 0x00160000 failed: -74. Putting on bad_list
mtd->read(0xd4 bytes from 0x14f52c) returned ECC error
mtd->read(0x44 bytes from 0x14f52c) returned ECC error
(no more)

can anyone tell me what's the really matter causing this?
thanks.


--------------------------------------------------------
ZTE Information Security Notice: The information contained in this mail is solely property of the sender's organization. This mail communication is confidential. Recipients named above are obligated to maintain secrecy and are not permitted to disclose the contents of this communication to others.
This email and any files transmitted with it are confidential and intended solely for the use of the individual or entity to whom they are addressed. If you have received this email in error please notify the originator of the message. Any views expressed in this message are those of the individual sender.
This message has been scanned for viruses and Spam by ZTE Anti-Spam system.
