Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MOaXC-0003DG-Ml
	for linux-mtd@lists.infradead.org; Wed, 08 Jul 2009 17:02:25 +0000
Received: by fxm25 with SMTP id 25so2091950fxm.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jul 2009 10:02:16 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 8 Jul 2009 12:02:16 -0500
Message-ID: <528f13590907081002i7d00e0f7ka714124d873f48ed@mail.gmail.com>
Subject: NAND write from a initial RAm disk boot.
From: alfred steele <alfred.jaquez@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
I am trying to run  the NAND write utility on a board booted up on an
initial RAM disk (16 M is the ramdisk size)from a MMC card. What i
intend to do is replace the jffs2 image already residing on a mtd
partition with a new one. From the shell, invoke nand write for
replacing the  kernel image and it goes fine. But the rootfs NAND
write gets stuck forever after doing a few block writes. See below for
details.

I use  the following commands to  try replae the respective paritions
for the kernel and the rootfs.

flash_eraseall -j /dev/mtd2
nandwrite -a -p /dev/mtd2 /mnt/mmc/rootfs.jffs2
Writing data to block 580000
Writing data to block 5a0000
....Gets stuck there FOREVER.

I am not sure why it hangs on that particular BLOCK insite of it being
not a BAD block. Could it be that its not finding enough memory to
buffer the block. I havent dug up nandwrite code yet so i do not know
how it actually works.

Can anybody help explain what could be the cause?

-Alfred.
