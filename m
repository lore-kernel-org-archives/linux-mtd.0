Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUB5a-00027Y-HD
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 06:18:31 +0000
Message-ID: <1337062917.2528.109.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: add crypto lookup field to tree node cache
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Tue, 15 May 2012 09:21:57 +0300
In-Reply-To: <alpine.DEB.2.00.1205111323010.17715@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205111323010.17715@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FW+WWRMvvIDWEQ9NVToS"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FW+WWRMvvIDWEQ9NVToS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-11 at 13:24 +0200, Joel Reardon wrote:
> This patch adds a new field to the TNC's zbranch and allows it to be set =
when
> a node is added or replaced. The field is called 'crypto_lookup' and it r=
efers
> to a location in the key storage area---a pointer to a key that is used t=
o
> encrypt/decrypt the data node. It can be set to 0 or a negative number wh=
en it
> is not being used. When a new node is added, this value is passed and set
> When a node is replace, the old value is replaced with the new value.
>=20
> These values will be used in future patchs. Replacing a
> crypto_lookup value will also mark the old value as deleted and the new v=
alue
> as used; adding a new node will mark the value as used. Additionally, del=
eting
> or removing TNC nodes will mark the values as deleted.
>=20
> TNC's crypto_lookup values are not stored on disk. They will be stored in=
 the
> data
> node's header. Therefore, if a crypto_lookup value is invalid (but a vali=
d one
> is to be expected and needs to be used) then a function will be added tha=
t
> reads the data node to
> obtain the value. Additionally, when a data node is ever read, the
> crypto_lookup position that is read will be set in the corresponding zbra=
nch.
>=20
> The values are not stored on disk to avoid having different on-disk forma=
ts of
> the the ubifs_branch structure.
>=20
> Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>

Pushed to the "joel" branch, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-FW+WWRMvvIDWEQ9NVToS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsfYGAAoJECmIfjd9wqK010QP/0mgcrElk2XJQFcAEn1o9POj
Nz3dP+xlkQNdQsH+lhJZ6shS3W91DFtG2MZFxjo3rc09jovDtpuhyhRlDMt5QSEh
R0sUowIrbGHNGhBJQSqsQTB6HvPbXvO2hlYEzeP4PGKYezd4LwE+/dVmATomiKBR
nPPnaP6yUvPbSYhiwVcymJt/gme4Ty2Me4Py7bP+oeyO3iXG/V1oqWJVteGve8eC
4c2y6Jo/m5kvDL9lMOywRqSu6FDTHjxtLZPKUpd1NjzAQKIuhR/0jNLWccTSEqTi
v1e0w2rQaXrGPkTKBIRMO/msOHudfFRG1JU0h99jYxtGXzNQvTFMOopuBxHUA0Cm
7N1jdqUl9meLh3ys/lL38sqQDYepHn1e0f/BlXRREVwf+wpvl5AOtuQ3gFdBeIRZ
7BUcVLI6QcEVNKbBV8eWkLKtoRthPGoUWpTEsoSRHZhxXT7jPeGL1tAqVTPK2vqS
CM0g3cLv3tS4i8yw2bS3fv7Ld2h3NO+FIyMBcL8uN2aTdjYOzTsEdy5KFxl7mCm7
Zb2J8Aqy5UJglJsO4t6yMWmPbsxjhHLAhx+J6JtGxDaE3pyG8Vx8Vd/pg50bn/pR
8icyL5Pyf7cvozsrvVDkzHaThxsDdKYv+V+RWGRollghRpC+Vu1gavend/hNzY2Z
MZwSUEjeg3eP/ajFEU97
=bu/N
-----END PGP SIGNATURE-----

--=-FW+WWRMvvIDWEQ9NVToS--
