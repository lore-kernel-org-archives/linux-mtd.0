Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6NSI-0002Kw-En
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2012 15:11:50 +0000
Message-ID: <1346167008.2848.412.camel@sauron.fi.intel.com>
Subject: Re: [RFC][PATCH] mtd: bcm47part driver for BCM47XX chipsets
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Tue, 28 Aug 2012 18:16:48 +0300
In-Reply-To: <1346166478.2848.411.camel@sauron.fi.intel.com>
References: <1345847412-24509-1-git-send-email-zajec5@gmail.com>
 <1346166478.2848.411.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6XCr+aTD9nk3nImRNSHp"
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


--=-6XCr+aTD9nk3nImRNSHp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-28 at 18:07 +0300, Artem Bityutskiy wrote:
> On Sat, 2012-08-25 at 00:30 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> > This driver provides parser detecting partitions on BCM47XX flash
> > memories. It has many differences in comparision to older BCM63XX, like=
:
> > 1) Different CFE with no more trivial MAGICs
> > 2) More partitions types (board_data, ML, POT)
> > 3) Supporting more than 1 flash on a device
> > which resulted in decision of writing new parser.
> >=20
> > It uses generic mtd interface and was successfully tested with Netgear
> > WNDR4500 router which has 2 flash memories: serial one and NAND one.
>=20
> Would you please send a defconfig which I could use to compile-test
> this?

Also, why did you decide to add one more bcm partitions parser instead
of extending the existing one to support more types?

--=20
Best Regards,
Artem Bityutskiy

--=-6XCr+aTD9nk3nImRNSHp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPODgAAoJECmIfjd9wqK0kMYP/jsAMFlEbU2aWglHTjwE8gQv
2pHjayCi3bDcVJQiFIAI71um9i/HnFt6z9V8AFMQUg/6DLm/WUNRW/iUHdZFcGgU
nOHbgrkIXLXDYaFdLOp8cn20NfnThhxCXx7bCWhKdIMpKKGpM7x8a23tpqKl8a3/
rSrLgq/+03dne/rq71zeXmQInrd6D/SBcOX+m8RItyrTagGnCKbbUoCOKDbzjeQv
INdO/AyfPrP5UPVCPK4CcfFRbPw+9JiGjLM2vw/9Gx/cXSswNND0OPH2kVmMKsJj
Mt+CU7pcbpymyzKfPeGXW1Cg+I+9gYE6fogHO33iVjATzw7ZRzoQXdZR2+gDXmRb
IBuvaHcW3dx/d/X+UyMfg+6Jt9vjAwATWDuyq1jaNkruZBHwJpSAZQ4KtYEl3SFo
+wwf8dfWfq8fGWvZdqmria5h4n+xNcGYoMv5YQzuFyX9UClGW5PfiIt9L4NmZAoo
ttXNxcoLPp0wHfJxA5Gj2yjZHj6k1/G6ZqWjbgdkvNZjzj2Df9WiEwI1BrkPPiCX
nabQUiJKHbrTA3VzwZJDf3MLmwcJpzL3/mVjbzKZ8Ehxu6wOgdHu1ev6cKSlDnQp
UriQ/SOXIR4q6JsQDwhQ9RvXrvrW0ab2YVvE7Z214RgyiVWtSSrDw676vm4mP2y+
51G8RW6vR6ivELFSiOt8
=hoTx
-----END PGP SIGNATURE-----

--=-6XCr+aTD9nk3nImRNSHp--
