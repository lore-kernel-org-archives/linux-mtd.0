Received: from antispam02.maxim-ic.com ([205.153.101.183])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rpcvi-0003AM-Fh
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2012 09:44:43 +0000
Received: from maxdalex01.maxim-ic.internal (maxdalex01.maxim-ic.internal
 [10.16.15.101]) by antispam02.maxim-ic.com with ESMTP id kHvB5H6CAv2cBLc7 for
 <linux-mtd@lists.infradead.org>; Tue, 24 Jan 2012 03:24:52 -0600 (CST)
From: Brian Foster <brian.foster@maxim-ic.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [BUG v1.4.6] `ubinfo -a' confused about non-consecutive UBI device
 numbers
Date: Tue, 24 Jan 2012 10:24:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <201201241024.22372.brian.foster@maxim-ic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hello,

 Using mtd-utils v1.4.6 with a v2.6.36 Linux kernel,
 if I have non-consecutive UBI device numbers (in the
 example below, =E2=80=98ubi0=E2=80=99 and =E2=80=98ubi10=E2=80=99), then =
=E2=80=98ubinfo -a=E2=80=99,
 after printing the info for =E2=80=98ubi0=E2=80=99, errors with:

    ubinfo: error!: cannot get information about UBI device 1
            error 2 (No such file or directory)

 In case it matters, =E2=80=98ubi0=E2=80=99 was attached/mounted by
 kernel command-line (it's my rootfs).  My normal
 practice is for manually attached MTD and UBI device
 numbers to be the same (with 12(!) MTD devices this
 greatly reduces confusion!).

=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80
# ubinfo --version
1.1
#=20
# ubinfo -a		# Only `ubi0' (rootfs) is attached...
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:63
Present UBI devices:            ubi0

ubi0
Volumes count:                           1
[...]
#=20
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00020000 "physmap-flash.0"
mtd1: 00004000 00000001 "maximasp-nvram"
mtd2: 00002000 00000001 "maximasp-snvram"
mtd3: 00200000 00020000 "u-boot"
mtd4: 00080000 00020000 "env0"
mtd5: 00080000 00020000 "env1"
mtd6: 00400000 00020000 "kernel0"
mtd7: 00400000 00020000 "kernel1"
mtd8: 00500000 00020000 "kernel2"
mtd9: 06400000 00020000 "root0"
mtd10: 06400000 00020000 "root1"
mtd11: 12800000 00020000 "other"
#=20
# ubiattach -m10 -d10	# Now attach `mtd10' as `ubi10'...
UBI device number 10, total 800 LEBs (103219200 bytes, 98.4 MiB), \
   available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)
#=20
# ubinfo -a		# `ubinfo -a' is now confused...
UBI version:                    1
Count of UBI devices:           2
UBI control device major/minor: 10:63
Present UBI devices:            ubi0, ubi10

ubi0
Volumes count:                           1
[...]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

ubinfo: error!: cannot get information about UBI device 1
        error 2 (No such file or directory)
#
# ubinfo -d10		# However, `ubinfo -d10' is happy...
ubi10
Volumes count:                           1
[...]
#=20
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80

 Notice that =E2=80=98ubinfo -a=E2=80=99 is fully and correctly aware of
 the attached devices, listing only =E2=80=98ubi0=E2=80=99 and =E2=80=98ubi=
10=E2=80=99.
 Nonetheless, it tries to print information about/from
 the non-existent =E2=80=98ubi1=E2=80=99.

 I have not investigated, nor tried other/recent versions.

cheers!
	-blf-

=2D-=20
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Maxim Integrated Products      |  Web:  http://www.maxim-ic.com/
