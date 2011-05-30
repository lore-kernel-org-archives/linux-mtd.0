Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QR1Fa-0007yI-I5
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 12:07:16 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QR1FW-0005gh-Q3
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 14:07:10 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 May 2011 14:07:10 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 May 2011 14:07:10 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubi] Wrong major:minor
Date: Mon, 30 May 2011 14:06:57 +0200
Message-ID: <jlt6u6h28631h09gotqakl7ihtdcsbga7k@4ax.com>
References: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
	<BANLkTimab0pKp68f_coPfsjm_6GdKAxSew@mail.gmail.com>
	<i1q6u61tl5go0ou25i0dcupco020ea94a3@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 May 2011 11:53:44 +0200, Gilles <gilles.ganault@free.fr>
wrote:
>Any idea why mdev doesn't create /dev/ubi0?

Made some progress: To get /dev/ubi0, it's required to attach, and
_then_ rerun "mdev":
=================
> ubiattach /dev/ubi_ctrl -m 2

> mdev -s
mdev: /sys/class/block/mtdblock0/bdi: No such file or directory
mdev: /sys/class/block/mtdblock1/bdi: No such file or directory
mdev: /sys/class/block/mtdblock2/bdi: No such file or directory

> ls -al /dev/ubi*
crw-rw----    1 root     root      251,   0 Dec 31 16:14 /dev/ubi0
crw-rw----    1 root     root      251,   1 Dec 31 16:14 /dev/ubi0_0
crw-rw----    1 root     root       10,  63 Dec 31 16:00 /dev/ubi_ctrl

> ubimkvol /dev/ubi0 -m -N ubifs0
Set volume size to 253016064
mtd: Giving out device 3 to ubifs0
Volume ID 0, size 1961 LEBs (253016064 bytes, 241.3 MiB), LEB size
129024 bytes (126.0 KiB), dynamic, name "ubifs0", alignment 1

> cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00001000 "ROMfs"
mtd1: 00800000 00020000 "linux kernel(nand)"
mtd2: 0f800000 00020000 "file system(nand)"
mtd3: 0f14b800 0001f800 "ubifs0"
=================

I have a couple of questions:

1. I tried populating the mtd2/ubifs0 partition with rootfs.ubifs from
the workstation, which failed:

> cd /var/tmp ; wget -c http://workstation/roots.ubifs
> ubiupdatevol /dev/ubi0_0 /var/tmp/rootfs.ubifs
> mount -t ubifs ubi0:ubifs0 /mnt
UBIFS error (pid 87): validate_sb: LEB size mismatch: 204800 in
superblock, 129024 real
UBIFS error (pid 87): validate_sb: bad superblock, error 1
mount: mounting ubi0:ubifs0 on /mnt failed: Invalid argument

So I reformated the partition, and tried with rootfs.ext2:

> ubidetach /dev/ubi_ctrl -m 2
> ubiformat /dev/mtd2 -s 512 -O 512
> ubiattach /dev/ubi_ctrl -m 2
> ubimkvol /dev/ubi0 -m -N ubifs0
> ubiupdatevol /dev/ubi0_0 /var/tmp/rootfs.ext2
> mount -t ubifs ubi0:ubifs0 /mnt
UBIFS error (pid 108): ubifs_read_node: bad node type (0 but expected
6)
UBIFS error (pid 108): ubifs_read_node: bad node at LEB 0:0
mount: mounting ubi0:ubifs0 on /mnt failed: Invalid argument

2. Since the appliance is a closed-box, users can't plug anything
anyway: In this case, besides taking more time to detect devices and
creating the relevant dev nodes, are there drawbacks about using mdev
+ dynamic dev nods over a static list of dev nodes?

3. Since the root file system lives in mtd2, which is now formatted as
Ubifs, why does ubimkvol create a third mtd partition (mtd3)? Will
writing to mtd3 write actually data to mtd2 (for persistence)?

Thank you.
