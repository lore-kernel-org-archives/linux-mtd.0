Received: from mail.milliontech.com ([210.17.151.186])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AYMXz-0000Xl-NU
	for linux-mtd@lists.infradead.org; Mon, 22 Dec 2003 09:40:20 +0000
Received: from milliontech.com ([192.168.168.70])
	by mail.milliontech.com (8.11.6/8.11.6) with ESMTP id hBM9cEc23411
	for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2003 17:38:14 +0800
Message-ID: <3FE6BBD8.5000106@milliontech.com>
Date: Mon, 22 Dec 2003 17:39:36 +0800
From: Martin Chan <martinc@milliontech.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: 7bit
Subject: booting DOC2000 with jffs2 as root
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I can copy a root.jffs2 image to DiskOnChip2000 and mount it. I can't
install the boot loader using patched lilo-mtd in mtd-snapshot. This is
my lilo.conf

default=linux
linear
bios=0x80
vga=Extended
image=/boot/vmlinuz
label=linux
root=/dev/mtdblock0


When running lilo-mtd -r /mnt -v -v -v
It gives the following errors:

Reading boot sector from current root
Caching devices /dev/mtdblock0 (0x1f00)
mtdblock_open
mtdblock: read on "DiskOnChip 2000" ar 0x0, size 0x200
mtdblock: read on "DiskOnChip 2000" ar 0x200, size 0x200
mtdblock: read on "DiskOnChip 2000" ar 0x400, size 0x200
mtdblock: read on "DiskOnChip 2000" ar 0x600, size 0x200
mtdblock: read on "DiskOnChip 2000" ar 0x800, size 0x200
mtdblock: read on "DiskOnChip 2000" ar 0xa00, size 0x200
mtdblock: read on "DiskOnChip 2000" ar 0xc00, size 0x200
mtdblock: read on "DiskOnChip 2000" ar 0xe00, size 0x200
Merging with /boot/boot.b
mtdblock_open
Sorry, don't know hw to handle device 0x1f00
mtdblock_release
ok
mtdblock_release
ok

What can I do? Does the lilo-mtd support /dev/mtdblock[n] or it just
support nftla?

Thanks,
Martin Chan
