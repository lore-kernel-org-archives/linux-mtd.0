Received: from afontenayssb-103-2-1-121.abo.wanadoo.fr ([217.128.3.121] helo=tasmanie.mensi.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166uLE-0003GJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2001 13:56:36 +0000
Received: from there (unknown [192.0.3.58])
	by tasmanie.mensi.net (Postfix) with SMTP id 3E0E7FE89
	for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2001 15:04:13 +0100 (CET)
Content-Type: text/plain;
  charset="iso-8859-1"
From: DAVID Guillaume <guillaume.david@mensi.com>
To: linux-mtd@lists.infradead.org
Subject: Can't modify my DoC anymore (pb with GRUB)
Date: Sat, 1 Jan 2000 01:12:17 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20011122140413.3E0E7FE89@tasmanie.mensi.net>
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

I just installed grub 0.90 on my disk-on-chip DOC2000 and so it boot from it 
now.
But it seems that loading the kernel fails and grub runs a minimal bash.
I don't understand anything with this bash.

The real problem is that I can't boot my development system on hda1 anymore 
because the disk-on-chip firmware intercepts the boot sequence.
Moreover, I'm forced to let the disk-on-chip plugged if I want to correct it !

I tried all the options the bios setup was providing but it didn't seemed to 
have effect.

Can I erase the disk-on-chip firmware from this minimal bash ? or is there 
any better solution?

I created the system as follow :

     cd grub-0.90
     patch -p0 -i ../grub-0.90-doc-patch.txt
     rm -f configure
     autoconf
     ./configure --enable-diskonchip
     make
     cp stage2/pre_stage2 ~/mtd/grub
     cd ~/mtd/grub
     make
     ../util/eraseall /dev/mtd0 
     ../util/nftl_format /dev/mtd0 98304   
     sfdisk /dev/nftla <<EOF
     	0,770,83,*
     	771,,83
     	EOF
     mke2fs /dev/nftla1
     mount /dev/nftla1 /mnt/mtd
     mkdir -p /mnt/mtd/boot/grub
     cp -a /boot/vmlinuz /mnt/mtd/boot/
     cat > /mnt/mtd/boot/grub/menu.lst <<"EOF"
	default=0
	timeout=2
	title=mtd
	root (dc0,0)
	kernel /boot/vmlinuz root=/dev/nftla1
	EOF
     ../util/doc_loadbios /dev/mtd0 grub_firmware
     reboot


PS : if needed, my mother board is a C17BP

Guillaume DAVID.
