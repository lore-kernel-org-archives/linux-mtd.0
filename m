Received: from mail.freepaq.dk ([213.150.59.107])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ABshY-0002LF-1G
	for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2003 10:21:16 +0100
Received: from unknown (HELO egholm-nielsen.dk) ([212.130.19.66])
          (envelope-sender <martin@egholm-nielsen.dk>)
          by mail.freepaq.dk (qmail-ldap-1.03) with SMTP
          for <linux-mtd@lists.infradead.org>; 21 Oct 2003 09:20:07 -0000
Message-ID: <3F94FA47.7020805@egholm-nielsen.dk>
Date: Tue, 21 Oct 2003 11:20:07 +0200
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Mount-failure (jffs2_scan_empty()) mounting SmartMedia with jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I'm attempting to mount a jffs2-filesystem on a SmartMedia card but it's 
not quite successfull (read: it doesn't work at all).
Some info:

* On startup the kernel informs me of the following:
SmartMedia card inserted.
NAND device: Manufacture ID: 0xec, Chip ID: 0x75 (Samsung KM29U256T)

* The /proc/mtd contains the following:
dev:    size   erasesize  name
mtd0: 00200000 00010000 "Physically mapped flash"
mtd1: 00840000 00000420 "Atmel AT45DB642"
mtd2: 02000000 00004000 "Samsung KM29U256T"

i.e. the flash-device I'm trying to use is "mtd2".

* Running "eraseall /dev/mtd/2" works like a charm.

* I try to create a small filesystem with the command:
  mkfs.jffs2 --eraseblock=0x4000 --pad --root=/usr/adm --output=/tmp/image

* I copied the filesystem to the device: "cp /tmp/image /dev/mtd/2"

* ...and tried to mount it: "mount -t jffs2 /dev/mtdblock/2 /mnt/mtd"
but this is where the sky falls down - I get tons of messages like the 
following:
jffs2_scan_empty(): Empty block at 0x0000001c ends at 0x00000200 (with 
0x0000000
0)! Marking dirty
<%%%% SNIP %%%%>
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased

And now I'm lost... Any ideas of how to get any further?

Regards,
  Martin Egholm Nielsen
