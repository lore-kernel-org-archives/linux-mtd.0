Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JheR0-0002Ul-SD
	for linux-mtd@lists.infradead.org; Fri, 04 Apr 2008 05:25:55 +0000
Subject: Re: can't mount ubifs on volume smaller than 265 LEBs/32MiB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080404041251.GA2752@cloud.net.au>
References: <20080404041251.GA2752@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Fri, 04 Apr 2008 08:25:50 +0300
Message-Id: <1207286750.8040.21.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-04-04 at 15:12 +1100, Hamish Moffatt wrote:
> I need a ubifs on a small volume (around 16MiB or less) but I've found
> that I can't get the volume to mount if it's that small.
>=20
> With a LEB size of 126kb, any file system < 265 LEBs won't mount,
> failing in validate_sb.
>=20
> # ubimkvol /dev/ubi0 -N config -S 264
> Volume ID 2, size 264 LEBs (34062336 bytes, 32.5 MiB), LEB size 129024 by=
tes (126.0 KiB), dynamic, name "config", alignment 1
> # mount /rw
> mount: mounting ubi0:config on /rw failed: Invalid argument
>=20
> # dmesg
> [...]
> [ 1191.360000] UBIFS error (pid 2804): validate_sb: bad superblock
>=20
> # ubirmvol /dev/ubi0 -n 2
> # ubimkvol /dev/ubi0 -N config -S 265
> Volume ID 2, size 265 LEBs (34191360 bytes, 32.6 MiB), LEB size 129024 by=
tes (126.0 KiB), dynamic, name "config", alignment 1
> # mount /rw

Cannot reproduce this with nandsim.

$ sudo modprobe nandsim first_id_byte=3D0x20 second_id_byte=3D0xaa
third_id_byte=3D0x00 fourth_id_byte=3D0x15

$ sudo modprobe ubi mtd=3D0

$ sudo ubimkvol /dev/ubi0 -N config -S 264
Volume ID 0, size 264 LEBs (34062336 bytes, 32.5 MiB), LEB size 129024
bytes (126.0 KiB), dynamic, name "config", alignment 1

$ sudo mount -t ubifs ubi0:config /mnt/ubifs/

Could you please enable debugging, retry and send me dmesg output? Or
any suggestion what I could do to reproduce the problem?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
