Received: from [88.247.191.72] (helo=avrupayazilim.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTHFi-0000pP-Gj
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 08:46:23 -0400
Message-ID: <45FE8599.8040901@avrupayazilim.com>
Date: Mon, 19 Mar 2007 14:44:09 +0200
From: Mete Kart <mete.kart@avrupayazilim.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ST NAND flash + u-boot + linux
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a problem with starting linux by mounting ST NAND flash as a file system.
I have the followings on my board:

- ARM920T processor, 
- 64MB RAM
- NAND 64 MB ST Flash: NAND512W3A (512B small page and 16KB erase size)
- kernel-linux_2.6.11.7-1.07.1
- u-boot version 1.1.6-0.04.0
- mkfs.jffs2 revision 1.50

-> I have 3 partitions on NAND 
0-3 MB - An Image file
3-5 MB - Linux Kernel Image
5-64 MB - File System.

I have written the above images using u-boot to the NAND flash and there is not seem any error.
Next, I boot linux with the following boot parameters:

bootargs console=ttyS0,115200 mem=47M root=/dev/mtdblock2 rw rootfstype=jffs2

I have patched also my kernel for the above 3 partitions on NAND flash.

After linux tries to mount the filesystem I get the following messages:
----------------------------------------------------------------------

Many empty block messages and then CRC check errors:

mtd->read(0x2c bytes from 0x1e4100) returned ECC error
Node header CRC failed at 001e4100. But it must have been OK earlier.
Node was: { fd00, 2000, 0000ff00, daa24100 }
mtd->read(0x44 bytes from 0x21ec) returned ECC error
Node CRC d502958a != calculated CRC 0dc05c56 for node at 000021ec
mtd->read(0x13e bytes from 0x2f34) returned ECC error
Data CRC 80165db4 != calculated CRC a51e3b9e for node at 00002ef0
mtd->read(0x143 bytes from 0x3b6c) returned ECC error
Data CRC 272db0f1 != calculated CRC a67ca7b7 for node at 00003b28
----------------------------------------------------------------------

and then linux does not open.


*********************************************************************

I have also a NFS file system and when I use it as a file system, linux is opened. (by reading kernel image from NAND flash and using the following boot parameters
bootargs console=ttyS0,115200 mem=47M root=/dev/nfs rw nfsroot=10.0.0.60:/home/nfs/fs26c ip=10.0.0.40:10.0.0.60:10.0.0.138:255.255.255.0::eth0)

Anyway on this file system I have also used nandwrite utility (write to /dev/mtd2) but it gives me this type of an error: 

Writing data to block 594000
Writing data to block 598000
Writing data to block 59c000
Writing data to block 5a0000
Writing data to block 5a4000
Writing data to block 5a8000
Writing data to block 5ac000
Writing data to block 5b0000
Writing data to block 5b4000
Writing data to block 5b8000
Writing data to block 5bc000
Writing data to block 5c0000
Writing data to block 5c4000
Writing data to block 5c8000
Writing data to block 5cc000
Writing data to block 5d0000
Writing data to block 5d4000
Writing data to block 5d8000
Writing data to block 5dc000
Writing data to block 5e0000
Writing data to block 5e4000
Writing data to block 5e8000
Writing data to block 5ec000
Writing data to block 5f0000
Writing data to block 5f4000
Writing data to block 5f8000
Writing data to block 5fc000
Writing data to block 600000
Writing data to block 604000
Writing data to block 608000
Writing data to block 60c000
Writing data to block 610000
Writing data to block 614000
pwrite: Input/output error
Data was only partially written due to error
: Illegal seek


(Errors occured on different blocks in each time)


------------------------------------------------------------------------

I also mounted /dev/mtdblock2 in the linux (using NFS file system), it gives also some CRC check error like in the boot process, but I see the file system and open the files in it.
(mount -t jffs2 /dev/mtdblock2 /mnt/mtd)


************************************************************************

Last of all I have also changed my NAND flash with a new one but the result is the same and linux does not opened with the above errors.


Can you suggest me something where can be the problem?



Thanks in advance.

Mete
