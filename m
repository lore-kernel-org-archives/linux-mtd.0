Received: from [202.114.36.28] (helo=bbs.ccnu.edu.cn)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 197StG-0000Sy-Nb
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 05:26:51 +0100
Date: Mon, 21 Apr 2003 12:42:26 +0800
From: lhl <lhl@phy.ccnu.edu.cn>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Message-Id: <E197StG-0000Sy-Nb@pentafluge.infradead.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Subject: DOC2000 grub boot problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I had install the grub in DiskOnChip 2000,and the grub info show when boot
I use the Dformat write the grub_firmware to the DOC,the size of grub_firmware is 98304 bytes
I had Partition the nftla with one partition nfla1
use the fdisk /dev/nftla use t to change the ID to 83(linux)
then mke2fs /dev/nftla and mount it on /mnt,cp the bzImage to the /mnt/boot/vmlinuz-doc
cp the menu.list to the /mnt/boot/grub/
menulist:
timeout 10
default 0
title DiskOnChip Boot
kernel (dc0,0)/boot/vmlinuz-doc root=/dev/hda4

problem begin when start the grub
it showes such messages:
Attempting to open /boot/grub/menu.list on driver 0x80 XXXX
....

and once I don't know what I had done,it goes to
grub>
and I try 
grub> kernel(dc0,0)/boot/vmlinuz-doc root=/dev/hda4
Loading kernel image......
	Linux-bzImage,setup=0xa00 size=0xec7a4

what's the problem with my doc?
