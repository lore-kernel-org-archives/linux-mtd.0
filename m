Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjnUl-0001Ht-61
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 08:21:03 +0000
Message-ID: <4FEAC26A.4020708@nod.at>
Date: Wed, 27 Jun 2012 10:20:58 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 13/21] UBI: Fastmap: Introduce WL pool Signed-off-by:
 Richard Weinberger <richard@nod.at>
References: <1339584138-69914-1-git-send-email-richard@nod.at>
 <1339584138-69914-14-git-send-email-richard@nod.at>
 <1340770405.2317.10.camel@koala>
In-Reply-To: <1340770405.2317.10.camel@koala>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig557E7C0CAC99D203DEEED5E1"
Cc: Joel Reardon <joel@clambassador.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig557E7C0CAC99D203DEEED5E1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 27.06.2012 06:13, schrieb Artem Bityutskiy:
> On Wed, 2012-06-13 at 12:42 +0200, Richard Weinberger wrote:
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>  drivers/mtd/ubi/build.c     |    4 ++
>>  drivers/mtd/ubi/fastmap.c   |   51 ++++++++++++++++----------
>>  drivers/mtd/ubi/ubi-media.h |    2 +
>>  drivers/mtd/ubi/ubi.h       |    1 +
>>  drivers/mtd/ubi/wl.c        |   82 ++++++++++++++++++++++++++++++++++=
++++----
>>  5 files changed, 112 insertions(+), 28 deletions(-)
>=20
> Hi, I've rebased the fastmap branch against v3.5-rc4, and your patches
> do not apply cleanly anymore, because there are collisions with Joel's
> changes which were merged recently. I've applied everything up to this
> patch and pushed out. Could you please re-base and re-send your queue?
> Thanks!
>=20

I'm confused.
schedule_erase() needs now vol_id and lnum as parameters but
the erase worker does not use them at all.
Am I missing something?

Fastmap is using schedule_erase() in ubi_wl_put_fm_peb() too,
but ubi_wl_put_fm_peb() does not know anything about volume IDs or
LEBs.
It's used to return PEBs used by fastmap itself.
Fastmap's volume headers have always lnum =3D 0 and
vol_id =3D UBI_FM_SB_VOLUME_ID or UBI_FM_DATA_VOLUME_ID.
Is this a problem?

Thanks,
//richard


--------------enig557E7C0CAC99D203DEEED5E1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJP6sJqAAoJEN9758yqZn9eaqMH+QEpnZ52+DrVR2KuYJPMlQIe
E5Xf/P9OAxHPEs+JyqWzm8SFCdQ48MTI8c2SDVJT5eB2cg13WqXQn46g1JukinaK
KublVmRs5f09GxAEo1srOA6oCNRjXonIJnHRLR5OCv6iWVSgDP/FKW5rNKrRJJVi
xupt1xBlmod5lVYdtsfnceX4FJeSyQwpaosSi+mGh/AaqBDwqKd2hpFj569P6CYT
EzGBvQSwyXosyPP29Ui6WBjikG0t1Hrm1sbbrlRCjASrkMtyQoIIgrAUSU8kF0x3
uh37ajWaRb6GDHXcz0xH9piuJo6GevptWbD9NQLZlZAKF+uizc1Thg9RKyswbaU=
=RLRB
-----END PGP SIGNATURE-----

--------------enig557E7C0CAC99D203DEEED5E1--
