Received: from mail.fst.it ([213.255.39.254] helo=fst.it)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A0NHq-0000gU-QC
	for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2003 16:35:10 +0100
Message-ID: <00a601c37ec3$46b95760$b670a8c0@laptoplukkino>
From: "Luca Contini" <luca.contini@mediaenabling.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 19 Sep 2003 17:32:46 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: mounting mtd device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I've successfully compiled the mtd subsystem as a module (mtdblock.o and
mtd_blkdevs.o).
I've also successfully inserted those modules using insmod utility, so that
now I can see the mtdblock block device (major number 31) in the
/proc/devices list.
But when I try to mount the corresponding /dev/mtdblock0 device to /mnt/mtd
I got the following error:
** mount: /dev/mtdblock0: unknown device **

The /dev/mtdblock0 device relies on major number 31, minor number 0 and is a
block device.
Also, I've placed a
printk("<1>open\n")
in the 'blktrans_open' function to see whether the mount is at least trying
to open the device but with no result.
Does anyone know why?

Regards

Luca
