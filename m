Received: from gate.sewerin.de ([77.75.200.26] helo=mail.sewerin.de)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8B7j-0008NA-Ke
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 12:49:16 +0000
To: linux-mtd@lists.infradead.org
Subject: time to mount static volume seems to be too long
MIME-Version: 1.0
Message-ID: <OFADA4774B.BD633326-ONC125786C.00461A66-C125786C.00466AC0@sewerin.de>
From: Bastian.Ruppert@sewerin.de
Date: Fri, 8 Apr 2011 14:48:34 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a TI OMAPL138 ARM9 with a 2.6.38-rc6-00071-gb9b65a4 kernel here.

mkfs.ubifs -V
Version 1.4

./ubinize -V
1.2

I created a rootfs image with the following commands:

mkfs.ubifs --root=/opt/rfsb/build/rootfs --leb-size=126976
--min-io-size=2048 --max-leb-cnt=608 -o
/opt/rfsb/build/images/image.ubifs 
WARNING: setting root UBIFS inode UID=GID=0 (root) and permissions to
u+rwx,go+rx; use --squash-rino-perm or --nosquash-rino-perm to
suppress this warning 

./ubinize --output=/opt/rfsb/build/images/image.ubi --min-io-size=2048
--peb-size=128KiB --sub-page-size=2048
/opt/rfsb/build/images/ubinize_rootfs.cfg 

The ubinize_rootfs.cfg is :

[ubifs]
mode=ubi
image=/opt/rfsb/build/images/image.ubifs
vol_id=0
vol_size=46080KiB
vol_type=static
vol_name=rootfs
vol_flags=autoresize

I can mount the rootfs, but with this configuration the rootfs mount
time is about 8 Seconds for the image in a 71MB Partition.

[...]
UBIFS: static UBI volume - read-only mode
UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: mounted read-only
UBIFS: file system size:   74534912 bytes (72788 KiB, 71 MiB, 587 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
[...]

/sys/devices/virtual/ubi/ubi0/ubi0_0 # cat type
static


When changing the vol_type attribute to dynamic, the mount time is
much shorter (about 1 Second).

[...]
UBIFS: mounted UBI device 0, volume 0, name "rootfs"
UBIFS: mounted read-only
UBIFS: file system size:   74534912 bytes (72788 KiB, 71 MiB, 587 LEBs)
UBIFS: journal size:       9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)
VFS: Mounted root (ubifs filesystem) readonly on device 0:14.
[...]

sys/devices/virtual/ubi/ubi0/ubi0_0 # cat type
dynamic

I can mount the dynamic volume as rw and I am able to write files.
It seems the volume is working fine so far.

The point of interest are the timings.
The static volume is designed for speed up booting and mounting, isn t
it? 
So i have expected an inverted behaviour of the timings.
Can you please tell why the static configuration is so slow?

Or I am missing something else?

Best Regards,

Bastian Ruppert.
