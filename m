Received: from f102.law9.hotmail.com ([64.4.9.102] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16UPfV-0004Fn-00
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jan 2002 10:02:41 +0000
From: "=?gb2312?B?1twgyPE=?=" <san_blabla@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: Why no kernel message on my DOC system?
Date: Sat, 26 Jan 2002 10:13:14 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <F102s7nlT2NqFJ3sl3x00002184@hotmail.com>
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

Hello,everyone.

I've build up an X86 Linux system using MTD DiskOnChip driver, using serial 
port as my console. The Linux system can boot form DOC and I can also login 
into the system, the problem is that I can't see any kernel printk 
messages. But if I put the same kernel on my harddisk and boot up using 
harddisk, I can see all kernel messages, still using serial port as my 
console. my lilo.conf for DOC is:

boot=/dev/nftla
map=/boot/map
install=/boot/boot.b-mtd
default=doc-full
serial=0,9600n8
image=/boot/bzImage-2.4.17
        label=doc
        root=/dev/ram0
        read-write
        initrd=/boot/initrd.img.gz
        append="console=ttyS0,9600n8"
image=/boot/bzImage-2.4.17-full
        label=doc-full
        root=/dev/ram0
        read-write
        initrd=/boot/initrd.img.gz
        append="console=ttyS0,9600n8"

The command to put lilo on it and the output is:

#mount /dev/nftla1 /mnt
#cd /mnt
#rdev boot/bzImage-2.4.17-full /dev/ram0
#lilo-mtd -v -C lilo.conf -r /mnt
Patched LILO for M-Systems' DiskOnChip 2000
LILO version 21, Copyright 1992-1998 Werner Almesberger

Reading boot sector from /dev/nftla
Warning: /dev/nftla is not on the first disk
Merging with /boot/boot.b-mtd
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
Setting DELAY to 20 (2 seconds)
Boot image: /boot/bzImage-2.4.17
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
Mapping RAM disk /boot/initrd.img.gz
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
Added doc
Boot image: /boot/bzImage-2.4.17-full
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
Mapping RAM disk /boot/initrd.img.gz
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
Added doc-full *
/boot/boot.5D00 exists - no backup copy made.
Writing boot sector.

I don't know why it output "invalidate: busy buffer", but as I said before, 
the DOC can boot up and I can even login.

My lilo.conf for my harddisk is :

boot=/dev/hda
map=/boot/map
install=/boot/boot.b
default=linux
serial=0,9600n8
image=/boot/bzImage-2.4.17-full
        label=linux
        root=/dev/hda1
        read-only
        append = "console=ttyS0,9600n8"

The command to put lilo on harddisk is simple:
#lilo
and the output is normal.

Another question, how could I choose boot image when I use lilo on the 
serial port? Sending Ctrl+a f in minicom and do what else?


_________________________________________________________________
与联机的朋友进行交流，请使用 MSN Messenger：
http://messenger.microsoft.com/cn
