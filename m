Received: from lizzard.sbs.de ([194.138.37.39])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZC4Cm-0001Ja-LG
 for linux-mtd@lists.infradead.org; Mon, 06 Jul 2015 11:04:57 +0000
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by lizzard.sbs.de (8.15.1/8.15.1) with ESMTPS id t66B4Vns019295
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-mtd@lists.infradead.org>; Mon, 6 Jul 2015 13:04:31 +0200
Received: from DEFTHW99ERMMSX.ww902.siemens.net
 (defthw99ermmsx.ww902.siemens.net [139.22.70.142])
 by mail1.sbs.de (8.15.1/8.15.1) with ESMTPS id t66B46eZ017656
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Mon, 6 Jul 2015 13:04:31 +0200
From: "Egli, Samuel" <samuel.egli@siemens.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: autoresize causes insufficient reservation of PEBs for bad PEB
 handling
Date: Mon, 6 Jul 2015 11:04:21 +0000
Message-ID: <27E9275BC1C8554E840881B19B62BE421A8FD9@DENBGAT9EI1MSX.ww902.siemens.net>
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

Hi all,

I have difficulties to understand why I get the following warning message
at linux start up:

...
[    4.777488] UBI warning: print_rsvd_warning: cannot reserve enough PEBs =
\
for bad PEB handling, reserved 40, need 80
...

My assumption is that if I don't specify the size of one volume=20
UBI will choose the right size for the volume and reserve the=20
right amount of PEBs for bad block handling. With 20/1024 set,vi I
expect indeed to have 80 blocks reserved. But somehow this
does not work. I observed that I get this warning when vol_flags
is set to autoresize. In this case only 40 blocks get reserved.
Using for all volumes the vol_size parameter and omitting=20
autoresize, I can avoid this situation and I get my 80 blocks reserved.

However, I don't understand why and it seems odd to me that
autoresize would work this way.=20

Can somebody confirm this observations or explain why this
works like this. Maybe I'm also doing something wrong.

See below how I generate the ubi image.

General setup
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
flash size: 4096 PEBs
mtd partition size: 4065 PEBs
number of volumes: 3

Linux version:
Linux dxr2 3.14.36-r2 #1 PREEMPT Tue Jun 30 10:26:05 CEST 2015 armv7l GNU/L=
inux


Config 1
=3D=3D=3D=3D=3D=3D=3D=3D
2 volumes with fixed size
1 volume has vol_flags=3Dautoresize and vol_size not defined

mkfs.ubifs -r ../rootfs/path -o rootfs.ubifs -F -m 2048 -e 126976 -c 4065
mkfs.ubifs -r ../conf/path -o conf.ubifs -F -m 2048 -e 126976 -c 4065
ubinize -o rootfs.ubi -m 2048 -p 131072 -O 2048 ubinize.cfg

ubinize.cfg:
 [rootfs_a]
 mode=3Dubi
 image=3Drootfs.ubifs
 vol_id=3D0
 vol_type=3Ddynamic
 vol_name=3Drootfs_a
 vol_size=3D140MiB
 [rootfs_b]
 mode=3Dubi
 vol_id=3D1
 vol_type=3Ddynamic
 vol_name=3Drootfs_b
 vol_size=3D140MiB
 [configuration]
 mode=3Dubi
 image=3Dconfiguration.ubifs
 vol_id=3D2
 vol_type=3Ddynamic
 vol_name=3Dconfiguration
 vol_flags=3Dautoresize

--> only 40 blocks get reserved vor bad PEB handling

Config 2
=3D=3D=3D=3D=3D=3D=3D=3D
All 3 volumes with fixed size

mkfs.ubifs -r ../rootfs/path -o rootfs.ubifs -F -m 2048 -e 126976 -c 4065
mkfs.ubifs -r ../conf/path -o conf.ubifs -F -m 2048 -e 126976 -c 4065

ubinize.cfg:
 [rootfs_a]
 mode=3Dubi
 image=3Drootfs.ubifs
 vol_id=3D0
 vol_type=3Ddynamic
 vol_name=3Drootfs_a
 vol_size=3D140MiB
 [rootfs_b]
 mode=3Dubi
 vol_id=3D1
 vol_type=3Ddynamic
 vol_name=3Drootfs_b
 vol_size=3D140MiB
 [configuration]
 mode=3Dubi
 image=3Dconfiguration.ubifs
 vol_id=3D2
 vol_type=3Ddynamic
 vol_name=3Dconfiguration
 vol_size=3D341MiB

--> ok, 80 blocks reserved but cannot use autoresize

Kind ragards

Sam
