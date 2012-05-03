Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPtXp-0002GW-VN
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 10:45:58 +0000
Message-ID: <1336042158.13013.38.camel@sauron.fi.intel.com>
Subject: Re: ubiattach fails after mkvol with "vtbl_check: bad CRC..."
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Shawn J. Goff" <shawn7400@gmail.com>
Date: Thu, 03 May 2012 13:49:18 +0300
In-Reply-To: <CAGiDA6KgHTQehUPtN_wT90unaHwZPzre7V5WCOEipaVpzbxJOQ@mail.gmail.com>
References: <CAGiDA6KgHTQehUPtN_wT90unaHwZPzre7V5WCOEipaVpzbxJOQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-igLVtbeEaw+rxszl+dqB"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-igLVtbeEaw+rxszl+dqB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-01 at 10:39 -0400, Shawn J. Goff wrote:
> Sorry if this is a double-post; I haven't seen a bounce-back, but I also
> didn't see it go on the list.
>=20
> I am having trouble attaching an ubi device after creating a volume on
> it. My procedure is as follows (a full console log is at the end of
> this e-mail):
>=20
> ubiformat /dev/mtd6
> ubiattach -m 6
> ubimkvol /dev/ubi0 -N root0 -s 11MiB
> ubidetach -m 6
> ubiattach -m 6
>=20
> When I try to re-attach, the UBI module produces messages:
>=20
> [ 2558.700000] UBI error: vtbl_check: bad CRC at record 0: 0x2863aedc,
> not 0xcd06c54d
> [ 2558.710000] UBI error: vtbl_check: bad CRC at record 0: 0x2863aedc,
> not 0xcd06c54d
> [ 2558.717500] UBI error: process_lvol: both volume tables are corrupted
> [ 2558.725000] UBI error: ubi_attach_mtd_dev: failed to attach by
> scanning, error -22
>=20
> If I don't make a volume, but just format the mtd device, then I can
> attach and detach just fine; it's only after making a volume that it
> gives this problem. I've tried making the volume both static and
> dynamic, and I've tried writing a filesystem with ubiupdatevol; it
> always has this issue. The mtd device itself works fine. I can write
> and read data from it, I can run mtd_speedtest and mtd_stresstest with
> no problems.

Try to enable UBI I/O checks - they are in debugfs - chk_io file, write
1 there to enable the checks.

The http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug section
is out-of-date :-(

--=20
Best Regards,
Artem Bityutskiy

--=-igLVtbeEaw+rxszl+dqB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPomKvAAoJECmIfjd9wqK0UBsP/17GrMWot1YdKwH/euWwaqIr
8dCkKRjeHCfDObe5IoODe53cgw+U4B5zfKnYnYz4nRH0TRCWfmQD1d4zRkiAWzaT
6UGLyekIktYDXvzxQDngejcz60jnUjHyrCkeOgGluBljF5YJUFZI8xoFDsr5zliX
qVHxIrwUG7U/HU+81HF3eERDwgHuBKDC1mqUEWm+CktwjMiRQ8Az44Pc2OKaijIS
D/CKMyahqgJup2j+XYioBQr8TqgqAYdLuZ49J/EoC5n27a3pFI1h2FwU30vujpMx
ZsUkT8U+zEe2MLOCkIwfNapY6O1v2GrGeF0qSn0V0lN3W85cF8QwAXBPLh1BP/ae
Jghul1mnZ3YCAEt46xowLyJr70UN3GGvk6YSO2KVyDU90IQ8dMvjjuK2hpBx6rrm
yVopzPDuwWysm0EnWx0uxGCAUaNc51WLbxBgOI3cBCwI7V/Lwts9qRkfWiuJbg4S
uUPGG2ot3EBwRA8zfBQP9ctMfp+01kBs8Qb2XTNJ5lm7TO3bzv3gYXQGeXiW0y3N
ompSDI2i6iQr8dz0s2AIgTSDLY+lO+9IlpttOvO58v31uJPA5dQqxUHWS1GOOy/5
07uQOP0LEPL4Aq6c0NdIMFbLILjFFHJ66IBO7WP7C0t0FClS5c0uldxb/6K79O1s
3/uADKC2+PDuHyeJo02k
=okLH
-----END PGP SIGNATURE-----

--=-igLVtbeEaw+rxszl+dqB--
