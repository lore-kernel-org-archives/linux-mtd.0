Received: from lst-amand-152-33-17-184.w82-127.abo.wanadoo.fr ([82.127.60.184]
	helo=polaris.sacet.fr)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gwhsk-0002bE-50
	for linux-mtd@lists.infradead.org; Tue, 19 Dec 2006 11:32:00 -0500
Received: from [127.0.0.1] (mimosa.sacet.fr [192.168.82.19])
	by polaris.sacet.fr (8.12.11/8.12.11) with ESMTP id kBJGWcfN030668
	for <linux-mtd@lists.infradead.org>; Tue, 19 Dec 2006 17:32:38 +0100
Message-ID: <45881281.8060001@sacet.com>
Date: Tue, 19 Dec 2006 17:25:37 +0100
From: Michel LECONTE <michel.leconte@sacet.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Reduce boot time with jffs2 and CM-X255
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I use a cm-x255 compulab card and I boot on the NAND flash with jffs2
filesystem.

My problem is the boot is too long.

My method to boot on the NAND flash is :

1) I boot on the cm-x225 via nfs.

2) I format the flash:

flash_eraseall -j /dev/mtd1

3) I mount the flash :

mount -t jffs2 /dev/mtdblock1 /mountpoint

4) I put the distribution of my system on the flash:

cp -r /Distribution/* /mountpoint

5) I unmount the flash :

umount /mountpoint

6) Finally, I boot on the cm-x255 board with the 2.6.18 kernel and
options are :

- Boot options : root=/dev/mtdblock1 rootfstype=jffs2
ip=192.168.82.70:::255.255.255.0:arm:eth0

- Miscellaneous filesystems : Journalling Flash File System v2 (JFFS2)
support

JFFS2 debugging verbosity à 0

JFFS2 write-buffering support

JFFS2 summary support (EXPERIMENTAL)


I would like to know what I'm missing or what I have to do to decrease
boot time ?


Thanks for any suggestion or help.

Michel
