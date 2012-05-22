Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWn99-0005DN-LM
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 11:21:00 +0000
Message-ID: <1337685876.2483.160.camel@sauron.fi.intel.com>
Subject: Re: Resizing of an existing UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Homann <homann@bury.com>
Date: Tue, 22 May 2012 14:24:36 +0300
In-Reply-To: <4FBB747D.10804@bury.com>
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com> <4FBB3E7F.3080807@bury.com>
 <1337674258.2483.123.camel@sauron.fi.intel.com> <4FBB5B82.8070009@bury.com>
 <Pine.LNX.4.64.1205221138410.4247@lnxricardw.se.axis.com>
 <1337681963.2483.140.camel@sauron.fi.intel.com> <4FBB747D.10804@bury.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-dBpw1HoaYR/MeqxxqN72"
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


--=-dBpw1HoaYR/MeqxxqN72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-22 at 13:11 +0200, Robert Homann wrote:
> On 05/22/2012 12:19 PM, Artem Bityutskiy wrote:
>=20
> > Yeah, if someone wrote such a tool, it would make sense to support
> > shrinking as well, because it is roughly a similar thin - you need to
> > relocate data from the end, amend the index and probably some other
> > UBIFS data-structures.
>=20
> This is getting interesting.
>=20
> On which level would such a tool operate? I guess it would have to do som=
e
> low-level operations directly on UBIFS structures, but it would use the U=
BI
> layer below only to get at the corresponding blocks. Other than that, the=
 UBI
> structures would not require direct manipulations, am I right? In this ca=
se,
> such a tool could be implemented without strict dependency on UBI.

It would work directly with the UBI volume. It would need to know the
UBIFS data structures. Yes, you should not have strict dependency on
UBI. Well, may be you'd need to use UBI ioctls to write your data back
to the eraseblock.

> Or would it be necessary to also touch UBI structures directly, in which =
case
> I guess it would become much more messy?

No, you should not need to touch UBI structures.

--=20
Best Regards,
Artem Bityutskiy

--=-dBpw1HoaYR/MeqxxqN72
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPu3d0AAoJECmIfjd9wqK0StwP/jt0FeNui+DgL6hlblO1gqCo
TBghFV8pIn4/Nc/6R8CoL42BAdIH81WJn47mVV5ClzpkGN0lSHgc1Qy18qTnNFUs
5yzRj64KhZXpdHBsQqlPDolkPEizgZj15rjYlDNRG/7NvhoBzaL2S+R6nc7e/1lx
W25J5Grfxu0QXMz/RX5MmmdLnzLRuZ1pWbNeY6nDdBRy3hdCrEo1IYWPc2lW1JE1
qxEW/vflVbPdA8cWTC02HxKU4/HZQLRXcoj1NNFeLT9boqyMZSFsWEesuJZsZrbL
uz0KYPqZ7ChPAkZ2ZzyZ0Q99hsupcyo3RvsBoKC+FbwNUvA7QQAautotNda/RMog
O32JIZRlO1a4hmGxaob/Z/GXLiVSmRT9DsyLPgbgBzToUrb/EMUPAKFx59+rdTwz
l/D0QQPiDOwDP7NWj6R0L/l4EFMOqTPqFTWUu1Wxh8eqOqLC+o5hCfuTPl+dEaBG
1lwbT7bZdiqyJCBDVuf4KWLDgxPkDfywbHVs4Sd2EHwuX8scdf1bRJX9nm2GVmPr
HOp6sTWJqCjwWmX2JXJkwbgTN9jzKWjLqGfTbJeHgobzNHRwVFRWS/YoMVpLiSIj
jr6zIlgZnagK1GOqHNI5GQTd00d6JVHk5nUwrl8BQqNo2MBA3MQ7LJWKelcfCLyG
ZqpGUNAkBmrUldhQUvTH
=V8u1
-----END PGP SIGNATURE-----

--=-dBpw1HoaYR/MeqxxqN72--
