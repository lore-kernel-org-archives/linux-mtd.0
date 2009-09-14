Received: from smtpin1.mailsecure.in ([121.241.224.1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MnBTu-0008EN-79
	for linux-mtd@lists.infradead.org; Mon, 14 Sep 2009 13:20:38 +0000
Message-ID: <4AAE4397.1060200@tataelxsi.co.in>
Date: Mon, 14 Sep 2009 18:52:31 +0530
From: Rahanesh <rahanesh@tataelxsi.co.in>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Boot failure after erasing a file in flash
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have four mtd partitions on the board.
Size of mtd1 is  7.18MB.

So when i create JFFS i give pad as 7.18MB , which will pad zeros to=20
make the jffs size to  7.18MB if the jffs size is less than 7.18MB. hope=20
my understanding is correct?

mkfs --pad=3D0x730000 --root=3D/input_dir --eraseblock=3D0x10000 --output=
=3Djffs

U boot uses Linux image (/Linux/uImage) from jffs  and boots up and=20
mounts the mtd1 partition to the ramdisk. So i have entire mtd1=20
partition  mounted as flash directory in ramdisk(root file system of Linux).

These are the console messages when u-boot brings up Linux...

*Hit any key to stop autoboot:   =08=08=08 0
### JFFS2 loading '/Linux/uImage' to 0x80800000
Scanning JFFS2 FS:............................ done.
### JFFS2 load complete: 2432748 bytes loaded to 0x80800000
## Booting image at 80800000 ...
   Image Name:   Linux Kernel Image with ramdisk.
   Created:      2009-09-13  17:49:39 UTC
   Image Type:   MIPS Linux Kernel Image (gzip compressed)
   Data Size:    2432684 Bytes =3D  2.3 MB
   Load Address: 80100000
   Entry Point:  804ba000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK*

Once the jffs is mounted as flash directory  and  If  i do a rm -rf to a=20
file inside flash directory and then reboot

it shows following error while uboot trying to bring Linux

*Hit any key to stop autoboot:  =08=08=08 0
### JFFS2 loading '/Linux/uImage' to 0x80800000
Scanning JFFS2 FS:   =08=08. ............................ get_fl_mem: can't=20
alloc -560169186 bytes
off =3D 0xad2f7b28 magic 0x1985 type 0x49c6 node.totlen =3D -560169186*

Any idea?


If i create the JFFS without pading , then there is no such isssue..

Please help on this!!!!!!!!!!


Thanks
Rahanesh
