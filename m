Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnWX1-00030Q-DV
	for linux-mtd@lists.infradead.org; Mon, 14 May 2007 05:07:53 -0400
Received: from [10.191.255.159] (dhcp-255-159.norway.atmel.com
	[10.191.255.159])
	by relay.atmel.no (8.13.4/8.13.4) with ESMTP id l4E95eTZ055803
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 May 2007 11:05:40 +0200 (CEST)
	(envelope-from hcegtvedt@norway.atmel.com)
Subject: Mounting big endian jffs2 images on mtdram on a x86
From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 14 May 2007 11:05:33 +0200
Message-Id: <1179133533.21753.13.camel@localhost.localdomain>
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

Hello,

I am trying to mount an JFFS2 image made with mkfs.jffs2 on my x86
laptop. The image is made with --big-endian set.

I do the following:
modprobe mtdram total_size=8192 erase_size=64
modprobe mtdchar
modprobe mtdblock
modprobe jffs2
dd if=jffs2.image of=/dev/mtd0
mount -t jffs2 /dev/mtdblock0 /some/mount/point

And I get:
mount: /dev/mtdblock0: can't read superblock

AFAIK this is related to the image being big endian, while my computer
is little endian. The JFFS2 image is valid when I program it into flash
and mount it on my embedded system.

Any hints, tips, how-to's or similar? I have tried google without much
luck.

-- 
Best regards
Hans-Christian Egtvedt
