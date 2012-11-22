Received: from mail.jpberlin.de ([213.203.238.11])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbRxR-0001TI-Jh
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 08:16:29 +0000
Received: from gerste.heinlein-support.de (gerste.heinlein-support.de
 [91.198.250.173])
 by plasma.jpberlin.de (Postfix) with ESMTP id B0EC1A2370
 for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2012 09:16:23 +0100 (CET)
Received: from plasma.jpberlin.de ([91.198.250.140])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10024)
 with ESMTP id JZaUKa0pHkzB for <linux-mtd@lists.infradead.org>;
 Thu, 22 Nov 2012 09:16:13 +0100 (CET)
Received: from [192.168.12.35] (unknown [213.172.126.10])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: thomasbechtold)
 by plasma.jpberlin.de (Postfix) with ESMTPSA id 03E63A23A0
 for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2012 09:16:12 +0100 (CET)
Message-ID: <50ADDF4A.90506@jpberlin.de>
Date: Thu, 22 Nov 2012 09:16:10 +0100
From: Thomas Bechtold <thomasbechtold@jpberlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS always readonly - ubifs_iget: failed to read inode 11414, error
 -22
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I use UBIFS with upstream kernel 3.2.32 on an ARMv5 (Stamp9G20) and NAND
Flash. When the device starts, the root-fs is mounted readonly. I can
not remount the FS. The FAQ [1] told me that I can ask here for help.
The device is remote and only accessable over ssh. It's expensive to go
there so it would be nice if something could be done to repair the FS
remotely.

The output from dmesg is:

#################### BEGIN #########################
# dmesg |grep -i ubi
Kernel command line: console=ttyS0,115200 mem=128M
mtdparts=atmel_nand:128k(bootstrap)ro,256k(uboot),128k(env1),128k(env2),2M(linux),-(root)rw
ubi.mtd=5 root=ubi0_0 rootfstype=ubifs boardtype=revC
UBI: attaching mtd5 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: max. sequence number:       5115
UBI: attached mtd5 to ubi0
UBI: MTD device name:            "root"
UBI: MTD device size:            509 MiB
UBI: number of good PEBs:        4064
UBI: number of bad PEBs:         11
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             119
UBI: total number of reserved PEBs: 3945
UBI: number of PEBs reserved for bad PEB handling: 40
UBI: max/mean erase counter: 39/1
UBI: image sequence number:  -393607928
UBI: background thread "ubi_bgt0d" started, PID 248
TCP cubic registered
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 0, volume 0, name "m40rootfs"
UBIFS: file system size:   501387264 bytes (489636 KiB, 478 MiB, 3886 LEBs)
UBIFS: journal size:       25159680 bytes (24570 KiB, 23 MiB, 195 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  4952683 bytes (4836 KiB)
VFS: Mounted root (ubifs filesystem) on device 0:10.
UBIFS error (pid 1): read_znode: bad indexing node at LEB 3174:70736,
error 6
UBIFS error (pid 1): ubifs_iget: failed to read inode 11414, error -22
UBIFS error (pid 1): ubifs_lookup: dead directory entry
'custom-loco.conf', error -22
UBIFS warning (pid 1): ubifs_ro_mode: switched to read-only mode, error -22
[<c000d4ec>] (unwind_backtrace+0x0/0xec) from [<c010d098>]
(ubifs_lookup+0xf4/0x140)
[<c010d098>] (ubifs_lookup+0xf4/0x140) from [<c0089af8>]
(d_alloc_and_lookup+0x44/0x60)
UBIFS error (pid 456): make_reservation: cannot reserve 160 bytes in
jhead 1, error -30
UBIFS error (pid 456): ubifs_write_inode: can't write inode 19562, error -30
UBIFS error (pid 558): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 558): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 561): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 561): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 566): make_reservation: cannot reserve 384 bytes in
jhead 1, error -30
UBIFS error (pid 566): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 610): make_reservation: cannot reserve 384 bytes in
jhead 1, error -30
UBIFS error (pid 610): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 631): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 633): make_reservation: cannot reserve 216 bytes in
jhead 1, error -30
UBIFS error (pid 755): make_reservation: cannot reserve 160 bytes in
jhead 1, error -30
UBIFS error (pid 755): ubifs_write_inode: can't write inode 9615, error -30
UBIFS error (pid 756): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 756): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 756): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 807): make_reservation: cannot reserve 216 bytes in
jhead 1, error -30
UBIFS error (pid 808): make_reservation: cannot reserve 216 bytes in
jhead 1, error -30
UBIFS error (pid 810): make_reservation: cannot reserve 160 bytes in
jhead 1, error -30
UBIFS error (pid 810): ubifs_write_inode: can't write inode 11568, error -30
UBIFS error (pid 812): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 812): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 812): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 815): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 815): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 830): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 830): ubifs_mkdir: cannot create directory, error -30
UBIFS error (pid 717): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 717): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 717): make_reservation: cannot reserve 160 bytes in
jhead 1, error -30
UBIFS error (pid 717): ubifs_write_inode: can't write inode 19593, error -30
UBIFS error (pid 717): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 717): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 717): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 717): make_reservation: cannot reserve 160 bytes in
jhead 1, error -30
UBIFS error (pid 717): ubifs_write_inode: can't write inode 19594, error -30
UBIFS error (pid 717): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 933): make_reservation: cannot reserve 216 bytes in
jhead 1, error -30
UBIFS error (pid 950): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 950): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 952): make_reservation: cannot reserve 408 bytes in
jhead 1, error -30
UBIFS error (pid 952): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 717): make_reservation: cannot reserve 392 bytes in
jhead 1, error -30
UBIFS error (pid 717): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 717): make_reservation: cannot reserve 216 bytes in
jhead 1, error -30
UBIFS error (pid 717): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 717): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 717): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 717): ubifs_create: cannot create regular file, error -30
UBIFS error (pid 717): make_reservation: cannot reserve 400 bytes in
jhead 1, error -30
UBIFS error (pid 717): ubifs_create: cannot create regular file, error -30
####################  END  #########################

The U-Boot parameters are:

#################### BEGIN #########################
# fw_printenv
ethaddr=aa:aa:bb:cc:dd:ee
baudrate=115200
sdboot=setenv bootargs ${basicargs} ${mtdparts} root=/dev/mmcblk0p1
rootdelay=1; nand read 0x22000000 0xA0000 0x200000; bootm 22000000
flashboot=setenv bootargs ${basicargs} ${mtdparts} root=/dev/mtdblock5
rootfstype=jffs2; nand read 0x22000000 0xA0000 0x200000; bootm 22000000
ethact=macb0
disable-wd=mw fffffd44 8000
reset-wd=mw fffffd40 A5000001
basicargs=console=ttyS0,115200 mem=128M
stdin=serial
stdout=serial
stderr=serial
ubidevice-standard=ubi.mtd=5 root=ubi0_0 rootfstype=ubifs
ubidevice-runlevel1=ubi.mtd=5 root=ubi0_0 1 rootfstype=ubifs
ubiboot=setenv bootargs ${basicargs} ${mtdparts} ${ubidevice-standard};
nand read 0x22000000 0xA0000 0x200000; bootm 22000000;
ubiboot-runlevel1=setenv bootargs ${basicargs} ${mtdparts}
${ubidevice-runlevel1}; nand read 0x22000000 0xA0000 0x200000; bootm
22000000;
mtdparts=mtdparts=atmel_nand:128k(bootstrap)ro,256k(uboot),128k(env1),128k(env2),2M(linux),-(root)rw
bootcmd=run disable-wd;run ubiboot
bootdelay=0
####################  END  #########################



TIA

Tom


[1] http://www.linux-mtd.infradead.org/faq/ubifs.html#L_sudden_ro
