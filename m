Received: from mail-yw0-f172.google.com ([209.85.211.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MdFF4-0006IS-EW
	for linux-mtd@lists.infradead.org; Tue, 18 Aug 2009 03:20:14 +0000
Received: by ywh2 with SMTP id 2so10000815ywh.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Aug 2009 20:19:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <39811fe10908171927g6ef3ec83x4ae3442b32380dc0@mail.gmail.com>
References: <39811fe10908171927g6ef3ec83x4ae3442b32380dc0@mail.gmail.com>
Date: Tue, 18 Aug 2009 11:19:53 +0800
Message-ID: <e8775dd00908172019s453df526o48b0ea450344a4c2@mail.gmail.com>
Subject: Re: UBINIZE and UBIFS
From: Jason Liu <liu.h.jason@gmail.com>
To: Jacky Lam <jackylam.gsl@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Your image burning tool has issues. You can try the ubi flasher tool
from the mtd-utility.
Anyway, you should drop program the page with all 0xff if you are
using MLC nand flash.

2009/8/18 Jacky Lam <jackylam.gsl@gmail.com>:
> Dear all,
>
> =A0 =A0 =A0 =A0I have a problem of embedding a UBIFS image by ubinize. He=
re is the
> config file I am using:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [rootfs]
> mode=3Dubi
> image=3Drfs.bin
> vol_id=3D0
> vol_size=3D10485760
> vol_type=3Ddynamic
> vol_name=3Drootfs
>
> [areatest]
> mode=3Dubi
> image=3Dtest.bin
> vol_id=3D1
> vol_size=3D15728640
> vol_type=3Ddynamic
> vol_name=3Dareatest
>
> [areauser]
> mode=3Dubi
> image=3Dareauser.bin
> vol_id=3D2
> vol_size=3D47185920
> vol_type=3Ddynamic
> vol_name=3Dareauser
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>
> =A0 =A0 =A0 =A0areauser.bin is created by:
>
> =A0 =A0 =A0 =A0mkubifs -v -g 1 -r areauser -o areauser.bin -m 4096 -e 516=
096 -c 92 -x none
>
> =A0 =A0 =A0 =A0The final image is created by:
>
> =A0 =A0 =A0 =A0ubinize -o final.raw.2 -m 4096 -p 512KiB ubinize_all.cfg
>
>
> =A0 =A0 =A0 =A0After burning the raw image to nand flash, everything work=
s fine and
> ubifs can be mount successfully. All the files are readable. But after I
> unmount the ubifs and want to mount again. The following error is happene=
d:
> ------------------------------------------------------------------------
> ...
> <Many ECC errors reported>
> ...
> UBI error: ubi_io_read: error -74 while reading 516096 bytes from PEB
> 55:8192, read 516096 bytes
> UBIFS error (pid 42): ubifs_scan: corrupt empty space at LEB 1:4691
> UBIFS error (pid 42): ubifs_scanned_corruption: corrupted data at LEB 1:4=
691
> UBIFS error (pid 42): ubifs_scanned_corruption: first 4096 bytes from
> LEB 1:4691
> UBIFS error (pid 42): ubifs_scan: LEB 1 scanning failed
> ...
> <Many ECC errors reported>
> ...
> UBI error: ubi_io_read: error -74 while reading 516096 bytes from PEB
> 55:8192, read 516096 bytes
> UBIFS error (pid 42): ubifs_recover_master_node: failed to recover
> master node
> mount: mounting ubi0:areauser on /mnt/areauser failed: Invalid argument
>
> -------------------------------------------------------------------------
>
> =A0 =A0 =A0 =A0However, if I runtime update the areauser.bin by ubiupdate=
vol, there is
> no such problem.
>
> =A0 =A0 =A0 =A0I have no cue on this, could anyone give me some suggestio=
n?
>
> =A0 =A0 =A0 =A0Thanks.
>
> BR,
> Jacky
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
