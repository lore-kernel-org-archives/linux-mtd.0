Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IAiQv-0007eW-Ph
	for linux-mtd@lists.infradead.org; Tue, 17 Jul 2007 04:29:29 -0400
Subject: Re: UBI: Incorrect initial value for ubi->avail_pebs
From: Artem Bityutskiy <dedekind@infradead.org>
To: John Smith <john@arrows.demon.co.uk>
In-Reply-To: <Pine.LNX.4.33.0707141836500.19907-100000@arrows.demon.co.uk>
References: <Pine.LNX.4.33.0707141836500.19907-100000@arrows.demon.co.uk>
Content-Type: text/plain; charset=utf-8
Date: Tue, 17 Jul 2007 11:29:03 +0300
Message-Id: <1184660943.3531.141.camel@sauron>
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

Hi,

On Sat, 2007-07-14 at 19:08 +0100, John Smith wrote:
> I suggest that the initial calculation of ubi->avail_pebs
> is incorrect. But perhaps it is intentionally done this way.
>=20
> A number of erase blocks, controlled by CONFIG_MTD_UBI_BEB_RESERVE,
> are reserved for handling bad blocks. The number of actual bad blocks
> are also reserved. I think it would be better if the actual bad blocks
> were taken from the CONFIG_MTD_UBI_BEB_RESERVE allocation.

Yeah, we always reserve this configurable percent of good eraseblocks in
case we have more bad eraseblock in future

>=20
> In more detail, during scan time the calculation of ubi->avail_pebs
> goes roughly:
>=20
>   /* in attach_by_scanning() */
>   ubi->good_peb_count =3D ubi->peb_count - ubi->bad_peb_count;
>=20
>   /* in ubi_read_volume_table() */
>   ubi->avail_pebs =3D ubi->good_peb_count;
>=20
>   /* in init_volumes() */
>   reserved_pebs =3D  sum of volume sizes
>   reserved_pebs +=3D size of layout volume
>   ubi->avail_pebs -=3D reserved_pebs
>=20
>   /* in ubi_wl_init_scan() */
>   #define WL_RESERVED_PEBS 1
>   ubi->avail_pebs -=3D WL_RESERVED_PEBS
>=20
>   /* In calculate_reserved() */
>   ubi->beb_rsvd_level =3D ubi->good_peb_count/100;
>   ubi->beb_rsvd_level *=3D CONFIG_MTD_UBI_BEB_RESERVE;
>=20
>   /* in ubi_eba_init_scan() */
>   ubi->beb_rsvd_pebs =3D min(ubi->beb_rsvd_level, ubi->avail_pebs)
>   ubi->avail_pebs -=3D ubi->beb_rsvd_pebs;
>=20
> The effect is that existing bad blocks on the device are allocated
> from the budget of blocks for data rather than from the budget of
> blocks for bad blocks.

When a NAND device is shipped it already has some bad eraseblocks. The
number of them is unknown, but they usually guarantee that the number
does not exceed some limit. I just wanted to ensure we always have a
reserved pool which does not depend on the number of already existing
bad eraseblocks. But yes, I can believe that this approach may be too
simple and cause troubles.

>=20
> To fix, I suggest that in ubi_read_volume_table() in vtbl.c the
> initial value of ubi->avail_pebs should be set by
>=20
>     ubi->avail_pebs =3D ubi->peb_count ;
>=20
> and for consistancy, the beb_rsvd_level should come from
>=20
>   ubi->beb_rsvd_level =3D ubi->peb_count/100;
>   ubi->beb_rsvd_level *=3D CONFIG_MTD_UBI_BEB_RESERVE;

Well, may be. Provide some arguments against current approach please.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
