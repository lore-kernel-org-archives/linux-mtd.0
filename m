Received: from 69.37.115.40.ded.snet.net ([69.37.115.40] helo=www.necii.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CeLoZ-0007QT-3i
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2004 18:10:44 -0500
Received: from Shelton.necii.com (shelton [143.101.35.7])
	by www.necii.com (8.12.8/8.12.8) with ESMTP id iBENDlUn005327
	for <linux-mtd@lists.infradead.org>; Tue, 14 Dec 2004 18:13:47 -0500
To: linux-mtd@lists.infradead.org
Message-ID: <OFD7229C12.76AD2125-ON85256F6A.007CB17C-85256F6A.007F521E@necii.com>
From: MQuicquaro@necii.com
Date: Tue, 14 Dec 2004 18:09:40 -0500
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Subject: jffs2 - mtd - nand flash works....except....
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>






Hi all,
My system is running as described in the subject....

a nand flash with mtd and jffs2.

Just about everything seems to be working great as far as I can see
except subsector writing.

I get CRC errors when I load my kernel sometimes and I assume
its because of this problem.

Is there something that anyone can think of that would cause this kind
of behavior?  I've racked my brain and can't come up with anything.

As far as my low level hardware interface goes, I imagine that it must
work ok since everything else is fine.

Any  help would be appreciated.

Here is output from 'nandtest':

# nandtest /dev/mtd/0
MTD_open
MTD_ioctl
meminfo.oobsize = 16
meminfo.oobblock = 512
meminfo.erasesize = 16384
This will erase the first block of device, continue? y

Performing Flash Erase of length 16384 at offset 0...
MTD_ioctl
OK
Test if block was erased...MTD_read
MTD_ioctl
MTD_read
MTD_ioctl
MTD_read
MTD_ioctl
.
.
.
MTD_read
MTD_ioctl
MTD_read
MTD_ioctl
MTD_read
MTD_ioctl
MTD_read
MTD_ioctl
MTD_read
MTD_ioctl
MTD_read
MTD_ioctl
OK
Writing 512 byte sectors...MTD_write
MTD_write
MTD_write
MTD_write
OK
Reading 512 byte sectors...MTD_read
MTD_read
MTD_read
MTD_read
OK
Testing subsector writing...MTD_write
MTD_write
MTD_write
MTD_write
MTD_write
OK
Reading back...MTD_read
0x0064: (0xff) != (0x57)
MTD_close
#
