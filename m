Received: from pc-5.tkhnl.demon.nl
	([195.11.235.101] helo=intranet.turnkiek.nl ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Oixi-0000fQ-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2002 18:30:30 +0000
Received: from mail.turnkiek.nl (mail.turnkiek.nl [172.16.1.2])
	by intranet.turnkiek.nl (8.9.3/8.9.3) with ESMTP id UAA14290
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2002 20:01:11 +0100
Received: from lt-gw8l30j ([172.16.100.68])
	by mail.turnkiek.nl (8.12.6/8.12.6) with SMTP id gBIJ2DiX046616
	for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2002 20:02:13 +0100 (CET)
	(envelope-from wolff@turnkiek.nl)
Reply-To: <wolff@turnkiek.nl>
From: "Carl Wolff" <wolff@turnkiek.nl>
To: <linux-mtd@lists.infradead.org>
Subject: problem using jffs2 on DiskOnChip
Date: Wed, 18 Dec 2002 20:03:10 +0100
Message-ID: <001901c2a6c8$1c87ff60$446410ac@lt-gw8l30j.turnkiek.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hello,

I've got a problem with jffs2. I'm using a DiskOnChip module type milennium.

Do I need NFTL support?
I've managed to copy a jffs2 image onto the diskonchip using cp image
/dev/mtd/0.

When I copy the contents of the device to a file using cat /dev/mtd/0 >
testfile and I compare this file with the file just copied to the device,
they are the same, the latter is bigger, because padded with FF's

when I do a mount -t jffs2 /dev/mtd/0 /mnt I get the following output:


# mount -t jffs2 /dev/mtdblock/0 /mnt
mtdblock_open
ok
Short read: 0x10 bytes at 0x000001f0 instead of requested 44
mtdblock_release
ok
mount: Mounting /dev/mtdblock/0 on /mnt failed: Invalid argument
#

What do I wrong?


I use a 2.4.17 kernel with following version details
NFTL driver: nftlcore.c $Revision: 1.85 $, nftlmount.c $Revision: 1.25 $
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00002000 "DiskOnChip Millennium"
#

Thanks for any help
Carl.
