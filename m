Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Ghpu5-0004FK-M7
	for linux-mtd@lists.infradead.org; Wed, 08 Nov 2006 11:03:58 -0500
Subject: Re: UBI and OneNAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
References: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
Content-Type: text/plain; charset=utf-8
Date: Wed, 08 Nov 2006 18:03:40 +0200
Message-Id: <1163001820.3800.2.camel@sauron>
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

On Tue, 2006-11-07 at 02:35 +0000, =EB=B0=95=EA=B2=BD=EB=AF=BC wrote:
> It is my sequence.
>=20
> # mkdir -p /mnt
> # insmod ubi.ko mtd=3D3
>=20
> UBI: attached mtd3 to ubi0
> UBI: MTD device name:            "rootfs"
> UBI: MTD device size:            16 MB
> UBI: physical eraseblock size:   131072 bytes (128 KB)
> UBI: logical eraseblock size:    126976 bytes
> UBI: number of good PEBs:        127
> UBI: number of bad PEBs:         1
> UBI: smallest flash I/O unit:    2048
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI: max. allowed volumes:       124
> UBI: wear-levelling threshold:   4096
> UBI: number of internal volumes: 2
> UBI: number of user volumes:     0
> UBI: available PEBs:             122
> UBI: total number of reserved PEBs: 5
> UBI: number of PEBs reserved for bad PEB handling: 1
>=20
> # mount -t jffs2 /dev/mtdblock3 /mnt
This is incorrect. MTD3 now belongs to UBI only. Do not try to do
anything with it. You can only create UBI volumes now, and mount the
_volumes_!

>=20
> / # mount -t jffs2 /dev/mtdblock3 /tmp
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 0x=
4255 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: 0x=
0001 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000003c: 0x=
cedc id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000800: 0x=
4255 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000804: 0x=
0101 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000808: 0x=
ff7f id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000083c: 0x=
25b8 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000010a8: 0x=
16f1 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001154: 0x=
16f1 id
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001200: 0x=
16f1 id
> ...
> Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
> empty_blocks 0, bad_blocks 1, c->nr_blocks 128
> mount: Mounting /dev/mtdblock3 on /tmp failed: Input/output error
Of course it is expected. UBI writes its headers to MTD3 and you try to
feed it to JFFS2. Do not do this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
