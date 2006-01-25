Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F1eDA-0001i0-Sv
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2006 01:33:01 -0500
Received: from ep_mmp2 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0ITM005CHY6N7F@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 25 Jan 2006 15:32:47 +0900 (KST)
Received: from july7 ([10.88.163.199])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPA id <0ITM009NWY6NSL@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 25 Jan 2006 15:32:47 +0900 (KST)
Date: Wed, 25 Jan 2006 15:32:47 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <0ITM009NXY6NSL@mmp2.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Subject: Mount failed after clean mount & umount test
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I have a question about JFFS2

At OneNAND MTD debugging, there's some problem on JFFS2 mount & umount

I write script as following

#!/bin/sh

/mtd-utils/eraseall /dev/mtd4

mount -t jffs2 /dev/mtdblock4 /mnt
umount /mnt
mount -t jffs2 /dev/mtdblock4 /mnt

It printes following message

nr_free_blocks = 0, empty_block = 0, bad_blocks = 0, nr_blocks = 256
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 0, c->nr_blocks 256
mount: Mounting /dev/mtdblock4 on /mnt failed: Input/output error

It always failed on OneNAND MTD but in below script there's no problem.

#!/bin/sh

/rfs-utils/eraseall /dev/mtd4

mount -t jffs2 /dev/mtdblock4 /mnt
# add dummy file on JFFS2
touch /mnt/jffs2_filesystem
umount /mnt
mount -t jffs2 /dev/mtdblock4 /mnt

What is the difference between? The only one dummy file is created.

Regards,
Kyungmin Park
