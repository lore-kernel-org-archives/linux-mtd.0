Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6zyS-0002he-G5
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 08:19:37 +0000
Message-ID: <1346315075.2848.538.camel@sauron.fi.intel.com>
Subject: RE: [PATCH] Test for multi-bit error correction
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Date: Thu, 30 Aug 2012 11:24:35 +0300
In-Reply-To: <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
 ,<1346310033.2848.536.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bR2kY5KaitavkSoRl+Qo"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-bR2kY5KaitavkSoRl+Qo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-30 at 18:05 +1000, Iwo Mergler wrote:
>=20
> I'm not sure what to do about this. Checkpatch.pl also complains if I
> split the strings.
> I could declare the format strings as const char * somewhere else, but
> I consider the
> resulting code being less readable. Any suggestions?=20

I think you can ignore these ones.

--=20
Best Regards,
Artem Bityutskiy

--=-bR2kY5KaitavkSoRl+Qo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPyNDAAoJECmIfjd9wqK0lZoP/275/Gq+6pR9JL3QL5UfWua5
7cP8k8Gj9h8KbPLhF4HFhcy+IW+GsG/EbLnAz9Fxvy9uTMqKiO23fP3KqJZmI1/q
aobqjO4AW3hsYynuu+D/wBx9+h9moLdr3R300bvF2XimkGfO/1i6aM5L9kzKMI/V
IL5XA0a+nUKQ6d+nDnkn/SSmDnjiFglT7O+KxQoRgouVx8H0pKnxfm3tMO2+Lfeu
FrvS3+pUkUfnisFQZZSgvMCENKqyDt3z4yTNQ61AqP8MOKsL/j04mPYxBkwwrpRd
gV4hudUfNQTPoYHwMD/9tqKwEZUjbicmY0aC/A5ZIr0y6wQBbGFTvg2RFIuyf8tY
E8wCMLLF/NS+WQ3u+ynEbADqV1UNpmeUcAwOW1JbX++ijip65FmdS0jWLjR0U5NN
3BGDrxlJHIqxSBWFMi4wOHTNvAYZuSMSU8C5uIR+kLaZdW6b8/64hORH+t0QX19e
Ltc5Dil/VK7PBGA36Vol9j/2T3FxUL0ovlDTN7o2oUx/SGeEiRDNKwRtzfo6wxF5
LYas3r4uajnFPKBjxb3d4LyKrgsr3Hoh38NPy1h1bTfFaVHcBTWEZvzpB2rF1roq
ywyk1b7UQSa8B3yAccHjXkabfLHKjIFOt4zcyE38OswXHiNq+ZySZVd7z975SK4f
ZDXGoQgjmWVf1AwgWYXx
=e9Bi
-----END PGP SIGNATURE-----

--=-bR2kY5KaitavkSoRl+Qo--
