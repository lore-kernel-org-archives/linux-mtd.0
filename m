Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWl08-0004KP-Ls
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 09:35:49 +0000
Received: by mail-vb0-f49.google.com with SMTP id fo1so3588146vbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Nov 2012 01:35:46 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 9 Nov 2012 11:35:46 +0200
Message-ID: <CAF9kqNHybAtg8od-h=B8qKKVuWhkieBnXfUuhxW53aHvEdeDZg@mail.gmail.com>
Subject: UBIFS failure on SheevaPlug Basic
From: Dimax <dimax.main@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

1. Problem Description
---------------------------------
1.1 Setup
I have a SheevaPlug running Debian. System is installed on nand Flash.
Installation process is following:
- First I boot up with USB stick and Debian installer images on it
- Get Debian Installed and running on USB stick
- Run the commands below to get it moved to Flash:

ubiformat /dev/mtd2 -s 512
ubiattach /dev/ubi_ctrl -m 2
ubimkvol /dev/ubi0 -N rootfs -m

mount -t ubifs ubi0:rootfs /mnt
mkdir /tmp/rootfs
mount -o bind / /tmp/rootfs/

cp -a /tmp/rootfs/* /mnt/
cp -a /boot /mnt/

- Make required changes in u-boot configuration and system starts to work.

1.2 Failure
Everything is all right until I get power surge
After that system fails with:

Marvell>> boot

UBI: mtd1 is detached from ubi0
Creating 1 MTD partitions on "nand0":
0x000000500000-0x000020000000 : "mtd=2"
UBI: attaching mtd1 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: attached mtd1 to ubi0
UBI: MTD device name:            "mtd=2"
UBI: MTD device size:            507 MiB
UBI: number of good PEBs:        4055
UBI: number of bad PEBs:         1
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 4055
UBI: number of PEBs reserved for bad PEB handling: 40
UBI: max/mean erase counter: 1/0
UBIFS: recovery needed
Error reading superblock on volume 'ubi:rootfs'!
UBIFS not mounted, use ubifs mount to mount volume first!
UBIFS not mounted, use ubifs mount to mount volume first!
Wrong Image Format for bootm command
ERROR: can't get kernel image!

1.3 Recovery
If I run again from the USB stick and mount Flash partition Debian
kernel manage to recover it:

root@debian:~# mount -t ubifs ubi0:rootfs /mnt
[  306.205029] UBIFS: recovery needed
[  309.341987] UBIFS: recovery completed
[  309.345705] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[  309.351738] UBIFS: file system size:   515192832 bytes (503118 KiB,
491 MiB, 3993 LEBs)
[  309.359789] UBIFS: journal size:       25804800 bytes (25200 KiB,
24 MiB, 200 LEBs)
[  309.367495] UBIFS: media format:       w4/r0 (latest is w4/r0)
[  309.373352] UBIFS: default compressor: lzo
[  309.377479] UBIFS: reserved for root:  4952683 bytes (4836 KiB)

2. Fixing
======
2.1. My first direction is to update u-boot with latest patches. There
is a chance it will let u-boot be able to mount broken partition.
There is another thread here where I work on it "Latest SheevaPlug u-boot"

2.2.
My second plan is to separate rootfs partition into two partitions.
One would be read only and will keep all static data. The second
partition will be RW and will contain changing data.
Actually all I need is to
1. Arrange let's say /flash_rw partiotion
2. Make rootfs partition read only
3. Fix u-boot settings
And here I'm not sure how to do all this.

2.3. u-boot
I assume I should start with changing partitioning in u-boot:
Currently I have
mtdparts mtdparts=orion_nand:0xa0000@0x0(u-boot),0x400000@0x100000(uImage),0x1fb00000@0x500000(rootfs)

How to split rootfs into two partitions?

============
Do you think such approach will help to survive power surges?
What should be next steps?

Thanks a lot.
