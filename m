Received: from 263.net.cn ([211.150.96.22] helo=smtp.263.net)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IDtEw-0001JY-13
	for linux-mtd@lists.infradead.org; Thu, 26 Jul 2007 03:38:16 +0100
Received: from smtp2.263.net (localhost [127.0.0.1])
	by smtp2.263.net (Postfix) with ESMTP id 97FE93BEACF
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Jul 2007 10:37:28 +0800 (CST)
Received: from mox89b9e5e1226 (localhost [127.0.0.1])
	by smtp2.263.net (Postfix) with ESMTP id 51A5F16DDEC
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Jul 2007 10:37:28 +0800 (CST)
From: "Eric" <liuhxshanghai@263.net>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 messages
Date: Thu, 26 Jul 2007 10:36:12 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20070726023728.51A5F16DDEC@smtp2.263.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi, all:

We are developing AT91RM9200-DK based device, 32M SDRAM, 8M Nor flash =
for linux kernel image and INITRD, Nand flash for applications and =
storage. Our application will frequently write something to the Nand.=20

Now we are performing critical test. The device may lose power at any =
time and it will reboot after 10sec. Two days has gone.
While rebooting and mounting Nand flash, Jffs2 gives many messages, =
like:
---------------------------------------------------------------------
Empty flash at 0x000cc738 ends at 0x000cc800
....

jffs2_scan_eraseblock(): Node at 0x00ca0ffc {0x1985, 0xe002, 0xe0021985) =
has invalid CRC 0x00000075 (calculated 0xd7cd6a7b)
.....

JFFS2 notice: (179) check_node_data: wrong data CRC in data node at =
0x01b25a00: read 0x58d6423f, calculated 0xb3eebebd.
JFFS2 notice: (179) read_dnode: node CRC failed on dnode at 0x1057bdc: =
read 0xffffffff, calculated 0x32a8b981
.......
---------------------------------------------------------------------

Now these message becomes more and more.

Another frustrating thing is that we find one log file (produced by our =
application) is corrupted. Its size is over 800M and cannot cat it. =
However, can rm it.

I am wondering whether the device can survive the test, and JFFS2 is as =
robust as the webpage =
(http://www.denx.de/wiki/DULG/RootFileSystemOnAJFFS2FileSystem) says: =
JFFS2 (Journalling Flash File System version 2) was specifically =
designed for use on flash memory devices in embedded systems. It is a =
log-structured file system which means that it is robust against loss of =
power, crashes or other unorderly shutdowns of the system ("robust" =
means that data that is just being written when the system goes down may =
be lost, but the file system itself does not get corrupted and the =
system can be rebootet without need for any kind of file system check).

Thanks and Regards
Eric
