Received: from mail128.messagelabs.com ([216.82.250.131])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JMn0R-0003M5-8X
	for linux-mtd@lists.infradead.org; Wed, 06 Feb 2008 16:20:22 +0000
Received: from il06exr01.mot.com (il06exr01.mot.com [129.188.137.131])
	by motgate8.mot.com (8.12.11/Motorola) with ESMTP id m16GKAw8015236
	for <linux-mtd@lists.infradead.org>;
	Wed, 6 Feb 2008 09:20:10 -0700 (MST)
Received: from il06vts03.mot.com (il06vts03.mot.com [129.188.137.143])
	by il06exr01.mot.com (8.13.5/Vontu) with SMTP id m16GK9Tc007071
	for <linux-mtd@lists.infradead.org>;
	Wed, 6 Feb 2008 10:20:10 -0600 (CST)
Received: from ct11exm60.ds.mot.com (CT11EXM60.am.mot.com [10.177.8.44])
	by il06exr01.mot.com (8.13.5/8.13.0) with ESMTP id m16GK8FV007056
	for <linux-mtd@lists.infradead.org>;
	Wed, 6 Feb 2008 10:20:09 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: mtdblock mount issue
Date: Wed, 6 Feb 2008 11:20:06 -0500
Message-ID: <A2EC06CB0E393B4C8EB220B286B7083E058EFCAC@ct11exm60.ds.mot.com>
In-Reply-To: <47A71EF4.2090202@gmail.com>
References: <47A71EF4.2090202@gmail.com>
From: "Adams Richard-W36112" <rgadams@motorola.com>
To: "Max Stirling" <vicky.irobot@gmail.com>, <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org=20
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=20
> Max Stirling
> Sent: Monday, February 04, 2008 6:20 AM
> To: linux-mtd@lists.infradead.org
> Subject: mtdblock mount issue
>=20
> Hi,
>=20
> I am trying to mount a cramfs partition from flash. I have=20
> the low level driver written and MTDBLOCK_RO module is enabled in MTD,
>=20
> My mount fails with invalid argument error.
>=20
> /mount: Mounting /dev/mtdblock on /home/crfs failed: Invalid argument/
>=20
> I am using a 512 byte NAND flash 16byte spare.
>=20
> I can find cramfs in /proc/filesytems and the mtdblock is=20
> under /proc/devices.
>=20
> I had enabled a few debug statements in the mtdblock_ro and=20
> the low level nand driver code. I find that the mount is=20
> reading 32 pages after which it fails with invalid argument.=20
> Below is the log.
>=20
> If you see the log below, the flow of code is
>=20
>  cramfs_read =3D=3D> do_blktrans_request =3D=3D> mtdblock_readsect=20
> =3D=3D> mt_read(my low level read function which returns success)
>=20
> I even dumped the hex of the data being read by my low level=20
> driver module and found to match the cramfs image that I=20
> wrote to the flash.
>=20
>=20
> ######################*LOG*##########################
>=20
> /home # mkdir crfs
> /home # cat /proc/devices | grep mtdblock
>  31 mtdblock
> /home # cat proc/filesystems | grep cramfs
>     cramfs
> /home #
> /home # mknod /dev/mtdblock b 31 0
> /home # mount -t cramfs /dev/mtdblock /home/crfs
> mount: /dev/mtdblock is write-protected, mounting read-only
> cramfs_read
> do_blktrans_request nsect:8 block:0
> mtdblock_readsect
> mt_read offset:0
> mt_read status:0
> mtdblock_readsect
> mt_read offset:512
> mt_read status:0
> mtdblock_readsect
> mt_read offset:1024
> mt_read status:0
> mtdblock_readsect
> mt_read offset:1536
> mt_read status:0
> mtdblock_readsect
> mt_read offset:2048
> mt_read status:0
> mtdblock_readsect
> mt_read offset:2560
> mt_read status:0
> mtdblock_readsect
> mt_read offset:3072
> mt_read status:0
> mtdblock_readsect
> mt_read offset:3584
> mt_read status:0
> do_blktrans_request nsect:8 block:0
> mtdblock_readsect
> mt_read offset:4096
> mt_read status:0
> mtdblock_readsect
> mt_read offset:4608
> mt_read status:0
> mtdblock_readsect
> mt_read offset:5120
> mt_read status:0
> mtdblock_readsect
> mt_read offset:5632
> mt_read status:0
> mtdblock_readsect
> mt_read offset:6144
> mt_read status:0
> mtdblock_readsect
> mt_read offset:6656
> mt_read status:0
> mtdblock_readsect
> mt_read offset:7168
> mt_read status:0
> mtdblock_readsect
> mt_read offset:7680
> mt_read status:0
> do_blktrans_request nsect:8 block:0
> mtdblock_readsect
> mt_read offset:8192
> mt_read status:0
> mtdblock_readsect
> mt_read offset:8704
> mt_read status:0
> mtdblock_readsect
> mt_read offset:9216
> mt_read status:0
> mtdblock_readsect
> mt_read offset:9728
> mt_read status:0
> mtdblock_readsect
> mt_read offset:10240
> mt_read status:0
> mtdblock_readsect
> mt_read offset:10752
> mt_read status:0
> mtdblock_readsect
> mt_read offset:11264
> mt_read status:0
> mtdblock_readsect
> mt_read offset:11776
> mt_read status:0
> do_blktrans_request nsect:8 block:0
> mtdblock_readsect
> mt_read offset:12288
> mt_read status:0
> mtdblock_readsect
> mt_read offset:12800
> mt_read status:0
> mtdblock_readsect
> mt_read offset:13312
> mt_read status:0
> mtdblock_readsect
> mt_read offset:13824
> mt_read status:0
> mtdblock_readsect
> mt_read offset:14336
> mt_read status:0
> mtdblock_readsect
> mt_read offset:14848
> mt_read status:0
> mtdblock_readsect
> mt_read offset:15360
> mt_read status:0
> mtdblock_readsect
> mt_read offset:15872
> mt_read status:0
> cramfs_read
> mount: Mounting /dev/mtdblock on /home/crfs failed: Invalid argument
> /home #
>=20
> ########################################################
>=20
>=20
> I hope I have provided the maximum information. Looking=20
> forward for some=20
> help.
>=20

You need to mount the file system as read only. I believe I've seen this
error when I've mounted a squashfs (also a read only file system)
without specifying the read only option.

Try this command:
mount /dev/mtdblock /home/crfs  -t cramfs -o ro

Rick
