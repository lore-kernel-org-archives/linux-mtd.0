Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eSc4-0005i7-00
	for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2002 04:44:56 +0100
Message-ID: <3D5881AE.3020809@redswitch.com>
Date: Mon, 12 Aug 2002 20:49:02 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,  linuxppc-embedded@lists.linuxppc.org
Subject: how to mount a root filesystem stored on MTD device?
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I've read the MTD/JFFS howto but still cannot get it. Right now I've 
been able to enable MTD devices and mount jffs2. I set bootargs to 
'root=/dev/mtdblock0' on PPCBoot and use tftpboot to boot the kernel via 
network. But the boot process doesn't succeed due to unability to mount 
root filesystem.

Here is the message showing that mtd devices have been found.
--------------------clip--------------------------------------
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis 
Communications AB.
loop: loaded (max 8 devices)
Search for id:(89 88f3) interleave(1) type(2)
Found: Intel 28F160F3T
IB8SW Bank 0: Found 1 x16 devices at 0x0 in 16-bit mode
Using word write method
init_ib8sw_mtd: part_num=3
IB8SW flash bank 0: Using static image partition definition
Creating 3 MTD partitions on "IB8SW Bank 0":
0x00000000-0x000f0000 : "jffs2"
mtd: Giving out device 0 to jffs2
0x000f0000-0x00100000 : "spare"
mtd: Giving out device 1 to spare
0x00100000-0x00200000 : "ppcboot"
mtd: Giving out device 2 to ppcboot
--------------------clip--------------------------------------

But here it complains that root fs hasn't been mounted.
--------------------clip-----------------------------------
Root-NFS: No NFS server available, giving up.
VFS: Unable to mount root fs via NFS, trying floppy.
request_module[block-major-2]: Root fs not mounted
VFS: Cannot open root device "mtdblock0" or 02:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 02:00
--------------------clip-----------------------------------

Any instructions or hints? Thanks a lot.

- Shawn.
