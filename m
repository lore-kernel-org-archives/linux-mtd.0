Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDZg6-0003PT-BP
 for linux-mtd@lists.infradead.org; Thu, 07 Mar 2013 12:12:06 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Bill Pringlemeir <bpringle@sympatico.ca>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: 'ubi clone' from Live NAND.
Date: Thu, 7 Mar 2013 12:11:59 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E99E24B@DBDE01.ent.ti.com>
References: <BLU0-SMTP76D0EA572C27BC1C088C1FB8E40@phx.gbl>
In-Reply-To: <BLU0-SMTP76D0EA572C27BC1C088C1FB8E40@phx.gbl>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

> If 'rootfs.ubi' is the 'ubinize' image, then I can mount and see the
> file system on my PC.  However, if the 'rootfs.ubi' is a 'dump' of the
> NAND flash, I fail with the following 'dmesg',

[pekon]=20
I have tried this, using following steps, and it works well

(1) nanddump   -b -s 0x0  -l <size_of_source_partition>  -f  <image_dump.bi=
n>  <source_partition>
(2) flash_erase   <target_partition>  0 0=20
(3) nandwrite -n -r   <target_partition>         <image_dump.bin> =20

where,
source_partition=3D partition on source device from which NAND binary would=
 be dumped. (/dev/mtdX)
target_partition=3D partition on another device which NAND dumped image wou=
ld be flashed (/dev/mtdY)


You need to keep few things in mind..
(1) sizeof(target_partion) > sizeof(source_partition), So as to take care o=
f bad-blocks present on target device.

(2) '-n' option in nandwrite tells NAND driver not to calculate ECC while p=
rogramming nand, as its is already part of 'raw' binary image

(3) You need to  'nanddump' complete source_partition (and not just image-s=
ize), because of following reasons
     (a) Image data may be shifted to other offsets due to presence of bad-=
blocks
     (b) If you are using 'autoresize' option, then UBIFS Volume may expand=
 itself to cover entire free space first mount.
[Refer http://www.linux-mtd.infradead.org/doc/ubi.html#L_autoresize]


with regards, pekon
