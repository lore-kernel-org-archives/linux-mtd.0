Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWB3D-0006kX-NW
 for linux-mtd@lists.infradead.org; Sun, 20 May 2012 18:40:20 +0000
Received: by lbbgg6 with SMTP id gg6so3867163lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 20 May 2012 11:40:17 -0700 (PDT)
Message-ID: <1337539215.1745.11.camel@koala>
Subject: Re: [PATCH] UBIFS: add ksa_pos to replay buds, read when replaying
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Sun, 20 May 2012 21:40:15 +0300
In-Reply-To: <alpine.DEB.2.00.1205201418170.27583@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205201418170.27583@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-9er1qBiRnbqeAFWZUooY"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-9er1qBiRnbqeAFWZUooY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-05-20 at 14:28 +0200, Joel Reardon wrote:
> This patch read the ksa_pos from data nodes to the replay buds when perfo=
rming
> a replay after unclean commit. This is critical for the correctness of th=
e key
> state map, because the keys that are assigned to uncommited data nodes wi=
ll be
> considered "unused" after mounting but will be considered "used" after
> replaying. The ksa_pos values stored in the replay bud are passed to the =
TNC
> using ubifs_tnc_add.
>=20
> This was tested by assigning distinct ksa_pos values and disabling commit=
ing.
> Data was written and then the drive was remounted. The ksa_pos values wer=
e
> read from the journal and outputted while replaying. When the file was la=
ter
> read, it was confirmed that the ksa_pos values were already loaded into t=
he
> TNC.
>=20
> Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>

Pushed to the "joel" branch as well.

--=20
Best Regards,
Artem Bityutskiy

--=-9er1qBiRnbqeAFWZUooY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPuTqPAAoJECmIfjd9wqK08sgQAKe0wqzhOfZHwhCvtaAzJKVE
5W6TYiRF8+MkdM2whHoJ2fWZrbtzPbyzgr/xCQNiExe9UY64qNLBbEyMgK5DXafp
GPBVZq0PYV8rdBPmCs2XBp8S83JmwMHxLVHTdXnwLSyOO16mo6ETyCbGo5dHEL2s
CMFQfpWPMKmk4ey14ihOEyxJOb4IJy+XoUiroqfJVoaMFBdPJTzjssP99Kh7ej44
vroGIqsjGq7KnIlvUW5A9LPQ6Y/ERx4TzZvN4sf6VEZVOn2U4U5ynj/sKrfbYyb3
k2I8gwEOzrtDDkc1RulH8iQb5T0U/nzs6A2sDE1TdPBuDzJ8fTezq/7ORVLXbbtR
p8Zi80oZyBAHJW/4W4Nh6l1aGFeZqAE0Q8yNwSQqayKGHHNRXBJwXu41zKwBEnM/
7ZGjBOiZO0t4VQf3j8idcxhlNmQsSfLKOsypv1GqXtAvO3W6JmGtkks7PTehezGG
WFOCPK2nguj/kiFTeSLivtRwRAvb5PWLdWLDNz6Ce7ci0cs6NqYsGntLlJFeKcUm
EDTIcXv1j0wQ7KgvCIBkeIApchLUkd9V3uQTxpZ1LkyfGBrxnMlNHVFpbr/zZ22d
zXQnErbmHg55BYOwlSVskF3AZvU1yu5h/UTumQuZN6AwkZ+NjHwfcShcuTOZZ8+b
W7PSh3PrdEDMXx+sTpXM
=5jg2
-----END PGP SIGNATURE-----

--=-9er1qBiRnbqeAFWZUooY--
