Received: from web30805.mail.mud.yahoo.com ([68.142.200.148])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DGH0u-0003oT-NA
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2005 08:44:13 -0500
Message-ID: <20050329133733.49012.qmail@web30805.mail.mud.yahoo.com>
Date: Tue, 29 Mar 2005 05:37:33 -0800 (PST)
From: wilho wallaton <wilho_76@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Need help on using jffs2 with blkmtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Although this is may or may not be the mtd problem, I
dear to to ask your assistance, since you guys are my
last hope it seems.

AFAIK jffs2 is only compressing rw filesystem on linux
there is. Therefore I've tried a whole day to create
jffs2 partition on my HD, I'm going to rdiff-backup
onto it when it's ready (rdiff compresses only its
diff-files).

My intention is to make /dev/hdc4 to function with
jffs2 filesystem. This is what I've done so far:
-------------------------------------------
I have these modules installed:
Symbol: MTD [=m]
Prompt: Memory Technology Device (MTD) support
Defined at drivers/mtd/Kconfig:5
Location:
-> Device Drivers
-> Memory Technology Devices (MTD)

Code:
Prompt: MTD emulation using block device
Defined at drivers/mtd/devices/Kconfig:116
Depends on: MTD
Location:
-> Device Drivers
-> Memory Technology Devices (MTD)
-> Self-contained MTD device drivers

Code:
Symbol: JFFS2_FS [=m]
Prompt: Journalling Flash File System v2 (JFFS2)
support
Defined at fs/Kconfig:1052
Depends on: MTD
Location:
-> File systems
-> Miscellaneous filesystems
Selects: CRC32
-------------------------------------------

Next thing was:

  #modprobe blkmtd device=/dev/hdc4
  #mknod /dev/mtdblock0 b 22 4

I'm not sure about usage of mknod command. It seems
that blkmtd needs it with udev, without it there's no
/dev/mtdblcok* devices at all. I've checked major and
minor number from
/usr/src/linux/Documentation/devices.txt, I'm not sure
but I think they're all right. BTW, how do I make
those changes permanent?

Well anyway, story goes on,

  #mkfs.jffs2 -o /dev/mtdblock0

everything seems to be OK this far, no error messages,
but when I do:

  #mount -t jffs2 /dev/mtdblock0 /mnt/hdc4
-> mount: wrong fs type, bad option, bad superblock on
/dev/mtdblock0



Here's something I've done for troubleshooting:

  #lsmod |grep mtd     
-->blkmtd                  8884  0
   mtdcore                 5316  3 jffs2,blkmtd

  #lsmod |grep jffs
-->jffs2                  83248  0
   zlib_deflate           21272  1 jffs2
   zlib_inflate           17280  1 jffs2
   mtdcore                 5316  3 jffs2,blkmtd

  #cat /proc/mtd
-->dev:    size   erasesize  name
   mtd0: 205b0000 00020000 "blkmtd: /dev/hdc4"

if I do
  #wc -c /dev/mtdblock0

I get out size 542836224 bytes ~ 500MB which seems
right - thats about the size as how big the partition
should be.

if I do
  #head -n1 /dev/mtdblock0

There's some filenames visible in output in middle of
carbage. 



So it seems that /dev/mtdblock0 is OK, but is it after
all? If it it, then what the * is wrong with this, why
can't I mount it? I'm gettign desperate.

Thanks for all your help,
-wilho


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
