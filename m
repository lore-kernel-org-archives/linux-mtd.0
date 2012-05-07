Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRT78-0003oF-GK
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 18:56:55 +0000
Received: by laap9 with SMTP id p9so1112619laa.36
 for <linux-mtd@lists.infradead.org>; Mon, 07 May 2012 11:56:52 -0700 (PDT)
Message-ID: <1336417009.2041.4.camel@koala>
Subject: Re: What would cause large block of NAND to be marked as bad?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Subodh Nijsure <snijsure@grid-net.com>
Date: Mon, 07 May 2012 21:56:49 +0300
In-Reply-To: <4FA80EEB.8040501@grid-net.com>
References: <4FA80EEB.8040501@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FcbRTGLkSnIPvmjtrX3T"
Mime-Version: 1.0
Cc: mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FcbRTGLkSnIPvmjtrX3T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-07 at 11:05 -0700, Subodh Nijsure wrote:
> Hello,
>=20
> I am working with some prototype hardware and I have seen some weird=20
> behaviour when testing power cut.
>=20
> On my board I have Micron MT29F2G08ABAEAH4 part and now have three=20
> boards on which close to 20-30 blocks have been marked as bad.
>=20
> We mainly run UBIFS on these boards, if there was flash data corruption=
=20
> we expected to see errors at UBIFS level i.e. not able to mount UBIFS=20
> file system but we didn't expect NAND blocks themselves to be marked as=
=20
> bad, due to power cut.
>=20
> What would cause large number of NAND blocks to be marked as bad, due to=
=20
> power cut?

Did you look at Mike Dunn's bitflip_threshold stuff? It is in my
l2-mtd.git tree. Look at this patch and the next ones from Mike:

http://git.infradead.org/users/dedekind/l2-mtd.git/commit/be1bb4ef1f98059f9=
d54623f3ed01423095fa967

Commit messages contain descriptions and references. May be for your
flash you need to set higher threshold?

--=20
Best Regards,
Artem Bityutskiy

--=-FcbRTGLkSnIPvmjtrX3T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPqBrxAAoJECmIfjd9wqK0p7gQAMYDa4tDGDV+2fuqd6y2a4Se
8r9rWQs9q7ccew0DxvlI1bUQvMw2gBxRwmB2TtNymyZQ0klGAj0pv1wb2X2gNXVe
HIxVzaVo7qL7tTgXRRYYnCIjHJ+29mUGzksgrI7n8fcA+Vw54uzvBC5b6LJ8l7ty
93fa1b3G/RLcla0vuGBuE7yA6P4KjupYxjdvoFkFMYEiVNgRGmbUlmbhS/4+TL/t
TMQW7eISBzC/Dxy2wtg7hSDmcECy3k8Q/TmitZMh/Ld/W1EkORZDWsGLKKbxdR53
YD40sCsWiBNoD/A6RohQptQ43sevSEZi4kwSgS7JCO3PypL/rQGaBDfO6br8qhz/
M1DCxErlkrc1hTPIK9XzyNj5O+ws7v6PhnEuLLcTNIPXEdBGpJEjGR3qDcmCm+bS
8DeanxzsItToWZ62uPECfTeh9MOCxs42/tQsLdiS5MgVwDNrX/oEdSm5DZ84w/if
XPd6QqTO0ZTar6xstu4I0xa4lqDlLKPldtVTnk/AEITzG899fKri227mVfHfb+j7
1aD+JtwQkoos66dEvAxVBV1p4zuCu8iqjSqihWuKMlwlJnaekSBIxs1TEKPOcCo+
IH4FQHdonOr2vFIU7tpfk3BqDmvpiJzkks46DdJwAFWaM8IRyixYml6KljpJI8gw
YGL1wlSJ606zn4OG9DuU
=lb1s
-----END PGP SIGNATURE-----

--=-FcbRTGLkSnIPvmjtrX3T--
