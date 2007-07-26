Received: from wx-out-0506.google.com ([66.249.82.226])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IDyyN-00022F-7Y
	for linux-mtd@lists.infradead.org; Thu, 26 Jul 2007 04:45:28 -0400
Received: by wx-out-0506.google.com with SMTP id s7so420594wxc
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Jul 2007 01:45:24 -0700 (PDT)
Message-ID: <cb35f5d60707260145h2e3bf06epc0416a07b24dda58@mail.gmail.com>
Date: Thu, 26 Jul 2007 14:15:23 +0530
From: "Dilip Patel" <dilip.ce2005@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: NAND bad block issue with JFFS2
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am facing a problem with NAND. I have custom board having 64MB Samsung
NAND (K9F1208R0C) and montavista linux-2.6.10 is running on it.

Below are the steps which I used to flash the NAND.

1)       mkfs.jffs2 -s 512 -e 16384 -o jffs2.img -d /home/rfs
2)       flash_eraseall -j /dev/mtd0
3)       nandwrite -jp /dev/mtd0 jffs2.img

I am explaining this bad block issue in detail:

1. I took two Boards. Board-1 does not have any bad block in rfs (root file
system) partition of NAND, while the Board-2 has one bad block in the rfs
(root file system) partition of NAND. I flashed both boards with same kernel
and same JFFS2 file system image. The Board-1 having nil bad block is booted
properly and mounted JFFS2 file system successfully and starts all the
services. While the Board-2 having the bad block in rfs partition is booted
properly and mounted JFFS2 file system but not able to start the all the
services especially getting error while starting "sshd" service. I am using
my customized root file system.

2. Further, I erased the rfs partition of the Board-2 having the bad block.
After erasing, I mounted this blank rfs partition with JFFS2 using "mount -t
jffs2 /dev/mtdblock0 /mnt/jffs2" command. Then copied whole root file system
source (not JFFS2 image) to this mounted partition using "cp" command. I
rebooted this Board-2 and this time it is booted properly and also started
all the services.

3. I have also done some stress testing. On the Board-1 having no bad block,
I have created five bad blocks manually in rfs partition. The positions of
these bad blocks are 2, 3, 4, 5 and 6. First block is good block. Then I
have erased rfs partition and written rfs JFFS2 image using "nandwrite".
After doing this, when I booted this Board-1, it is not able to boot at all.
It hangs after displaying lots of error messages like "Inode #2107 was a
directory with children - removing those too..." . Again I have erased this
rfs partition and mounted this blank partition. Then I copied whole root
file system source (not JFFS2 image) to this mounted partition using "cp"
command. I rebooted this Board-1 and this time it is booted properly and
also started all the services.


Anybody has any idea about this issue?

Thanks in advance.

-Dilip
