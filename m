Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2hGm-0001X0-Tq
 for linux-mtd@lists.infradead.org; Sun, 21 Dec 2014 14:14:05 +0000
Message-ID: <5496D585.8070605@rempel-privat.de>
Date: Sun, 21 Dec 2014 15:13:25 +0100
From: Oleksij Rempel <linux@rempel-privat.de>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org,
 "boris.brezillon@free-electrons.com >> Boris Brezillon"
 <boris.brezillon@free-electrons.com>, computersforpeace@gmail.com
Subject: Re: should nand driver create ECC for a page after ERASE cmd?
References: <54953675.1020102@rempel-privat.de>
 <54962684.9040003@vanguardiasur.com.ar>
In-Reply-To: <54962684.9040003@vanguardiasur.com.ar>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rfHuSPnI0heGdsCTdRrTo6EdRR0V7dVTL"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rfHuSPnI0heGdsCTdRrTo6EdRR0V7dVTL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 21.12.2014 um 02:46 schrieb Ezequiel Garcia:
> On 12/20/2014 05:42 AM, Oleksij Rempel wrote:
>> Hello all,
>>
>> i'm trying to pass mtd/tests for my driver.. on pagetest i fail on thi=
s
>> place:
>> http://lxr.free-electrons.com/source/drivers/mtd/tests/pagetest.c#L311=

>>
>> after ERASE cmd this test trying to read same page. Driver will report=

>> ECC error on read, because erased page has no ECC data in OOB.
>>
>> What is correct way to handle it?
>>
> [..]
>=20
> This might help, although I'm not sure it's the best solution.
>=20
> $ git grep is_buf_blank drivers/mtd/nand/pxa3xx_nand.c
>=20

Thank you! It should be good starting point.


--=20
Regards,
Oleksij


--rfHuSPnI0heGdsCTdRrTo6EdRR0V7dVTL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iF4EAREIAAYFAlSW1YYACgkQHwImuRkmbWld4gD/QlWcLlyh1mpXAZZqimpqWa9d
Nzt4GCmKWMmhrtjyvKkA/jpkcbiAGhSHM0jmhlzCPLdXlL4EB+1w8alidhsc+QQ1
=MfSP
-----END PGP SIGNATURE-----

--rfHuSPnI0heGdsCTdRrTo6EdRR0V7dVTL--
