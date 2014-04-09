Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXmEI-00024i-H5
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 06:43:27 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: gpuguy <hf.basit@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: While trying to open /dev/mtd2 for read/write access:
 Permission denied
Date: Wed, 9 Apr 2014 06:42:50 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3B08DF@post.tritech.se>
References: <loom.20140408T081131-273@post.gmane.org>
In-Reply-To: <loom.20140408T081131-273@post.gmane.org>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What do you have in your device tree for these partitions?=0A=
=0A=
// Mats=0A=
=0A=
________________________________________=0A=
From: linux-mtd [linux-mtd-bounces@lists.infradead.org] on behalf of gpuguy=
 [hf.basit@gmail.com]=0A=
Sent: Tuesday, April 08, 2014 8:14 AM=0A=
To: linux-mtd@lists.infradead.org=0A=
Subject: While trying to open /dev/mtd2 for read/write access: Permission d=
enied=0A=
=0A=
Looks like my MTD2,and MTD3 partitions are write protected. The OS is=0A=
booting from SD card on a ARM Cortex A 9 processor.=0A=
=0A=
root@Xilinx-ZC702-2013_3:~# mount /dev/mmcblk0p1 /mnt/=0A=
root@Xilinx-ZC702-2013_3:~#=0A=
root@Xilinx-ZC702-2013_3:~# cd /mnt/flash/=0A=
root@Xilinx-ZC702-2013_3:/mnt/flash#=0A=
root@Xilinx-ZC702-2013_3:/mnt/flash# ls=0A=
BOOT.BIN      image.ub      rootfs.jffs2=0A=
root@Xilinx-ZC702-2013_3:/mnt/flash# flashcp -v image.ub /dev/mtd2=0A=
While trying to open /dev/mtd2 for read/write access: Permission denied=0A=
root@Xilinx-ZC702-2013_3:/mnt/flash#=0A=
=0A=
=0A=
Even I tried alternate:=0A=
=0A=
root@Xilinx-ZC702-2013_3:/mnt/flash# flash_eraseall -j /dev/mtd2=0A=
flash_eraseall has been replaced by `flash_erase <mtddev> 0 0`; please use=
=0A=
it=0A=
flash_erase: error!: /dev/mtd2=0A=
             error 13 (Permission denied)=0A=
=0A=
=0A=
Here are additional info:=0A=
=0A=
root@Xilinx-ZC702-2013_3:/mnt/flash# mtdinfo=0A=
Count of MTD devices:           4=0A=
Present MTD devices:            mtd0, mtd1, mtd2, mtd3=0A=
Sysfs interface supported:      yes=0A=
=0A=
root@Xilinx-ZC702-2013_3:~# cat /proc/mtd=0A=
    dev:    size   erasesize  name=0A=
    mtd0: 00500000 00010000 "boot"=0A=
    mtd1: 00020000 00010000 "bootenv"=0A=
    mtd2: 001202c0 00010000 "image"=0A=
    mtd3: 00500000 00010000 "jffs2"=0A=
Also:=0A=
=0A=
root@Xilinx-ZC702-2013_3:/mnt/flash# mtd_debug info /dev/mtd3=0A=
mtd.type =3D MTD_NORFLASH=0A=
mtd.flags =3D MTD_BIT_WRITEABLE=0A=
mtd.size =3D 5242880 (5M)=0A=
mtd.erasesize =3D 65536 (64K)=0A=
mtd.writesize =3D 1=0A=
mtd.oobsize =3D 0=0A=
regions =3D 0=0A=
=0A=
root@Xilinx-ZC702-2013_3:/mnt/flash# mtd_debug info /dev/mtd2=0A=
mtd.type =3D MTD_NORFLASH=0A=
mtd.flags =3D MTD_BIT_WRITEABLE=0A=
mtd.size =3D 1180352 (1M)=0A=
mtd.erasesize =3D 65536 (64K)=0A=
mtd.writesize =3D 1=0A=
mtd.oobsize =3D 0=0A=
regions =3D 0=0A=
=0A=
root@Xilinx-ZC702-2013_3:/mnt/flash# mtd_debug info /dev/mtd1=0A=
mtd.type =3D MTD_NORFLASH=0A=
mtd.flags =3D MTD_CAP_NORFLASH=0A=
mtd.size =3D 131072 (128K)=0A=
mtd.erasesize =3D 65536 (64K)=0A=
mtd.writesize =3D 1=0A=
mtd.oobsize =3D 0=0A=
regions =3D 0=0A=
=0A=
root@Xilinx-ZC702-2013_3:/mnt/flash# mtd_debug info /dev/mtd0=0A=
mtd.type =3D MTD_NORFLASH=0A=
mtd.flags =3D MTD_CAP_NORFLASH=0A=
mtd.size =3D 5242880 (5M)=0A=
mtd.erasesize =3D 65536 (64K)=0A=
mtd.writesize =3D 1=0A=
mtd.oobsize =3D 0=0A=
regions =3D 0=0A=
=0A=
root@Xilinx-ZC702-2013_3:/mnt/flash#=0A=
=0A=
=0A=
=0A=
=0A=
How do I solve this issue?=0A=
=0A=
=0A=
______________________________________________________=0A=
Linux MTD discussion mailing list=0A=
http://lists.infradead.org/mailman/listinfo/linux-mtd/=0A=
