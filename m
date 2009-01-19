Received: from mail64.messagelabs.com ([216.82.249.227])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LOlMJ-0004Hx-PD
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2009 04:03:34 +0000
Received: from [192.168.65.100] (arasv [192.168.65.100])
	by mail.magtech.com.au (Postfix) with ESMTP id A16A7D7FD9
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Jan 2009 15:03:28 +1100 (EST)
Message-ID: <4973FB90.5080309@magtech.com.au>
Date: Mon, 19 Jan 2009 15:03:28 +1100
From: Aras Vaichas <arasv@magtech.com.au>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: problem updating jffs2 rootfs partition
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I need to update a jffs2 root partition on a running system.

I'm using a statically linked version of flash_eraseall and nandwrite to 
prepare the NAND chip and then write a jffs2 image on to it.

This is what I do:

* ftp the upgrade script onto the device, and run the install script 
which does:
 * copy all the installation files to a tmpfs /tmp directory
 * kill all non-essential processes, and those that are accessing the 
root partition (like syslogd)
 * 'umount /' which remounts root as read-only
 * flash_eraseall
 * nandwrite
 * reboot

The problem is that sometimes I get jffs2 errors, and sometimes the 
upgrade fails due to corruption of the nand.


During a nandwrite I will sometimes get errors like this:
...
Writing data to block 4f0000
Writing data to block 4f4000
jffs2_flush_wbuf(): Write failed with -5
Write of 71 bytes at 0x004f01f8 failed. returned -5, retlen 0
Not marking the space at 0x004f01f8 as dirty because the flash driver 
returned retlen zero
jffs2_flush_wbuf(): Write failed with -5
Write of 71 bytes at 0x004ec1f8 failed. returned -5, retlen 0
Not marking the space at 0x004ec1f8 as dirty because the flash driver 
returned retlen zero
Node CRC ffffffff != calculated CRC f09e7845 for node at 00ef7b4c
jffs2_flush_wbuf(): Write failed with -5
...
Writing data to block 5fc000
Writing data to block 600000
mtd->read(0x1000 bytes from 0x480000) returned ECC error
Newly-erased block contained word 0xe0021985 at offset 0x00480000
mtd->read(0x1000 bytes from 0x4a8000) returned ECC error
Newly-erased block contained word 0xe0021985 at offset 0x004a8000
mtd->read(0x1000 bytes from 0x4cc000) returned ECC error
Newly-erased block contained word 0xe0021985 at offset 0x004cc000
Header CRC failed on REF_PRISTINE node at 0x01d08fc8: Read 0xffffffff, 
calculated 0x44660075
JFFS2 notice: (45) read_unknown: node header CRC failed at 0x1d0a100. 
But it must have been OK earlier.
JFFS2 notice: (45) read_unknown: node header CRC failed at 0x1d09b0c. 
But it must have been OK earlier.
JFFS2 notice: (45) read_unknown: node header CRC failed at 0x1d095bc. 
But it must have been OK earlier.
JFFS2 notice: (45) read_unknown: node header CRC failed at 0x1d08fc8. 
But it must have been OK earlier.
JFFS2 warning: (45) jffs2_do_read_inode_internal: no data nodes found 
for ino #151
Eep. read_inode() failed for ino #151. nlink 1
Writing data to block 604000
Writing data to block 608000
...

What is happening, and how can I avoid it?

Is the problem that jffs2 is performing garbage collection on the root 
partition?

Aras



______________________________________________________________________
This email has been scanned by the MessageLabs Email Security System.
For more information please visit http://www.messagelabs.com/email 
______________________________________________________________________
