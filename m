Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScPvZ-0001lV-K1
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 23:46:14 +0000
Message-ID: <4FCFEBC2.9000009@nod.at>
Date: Thu, 07 Jun 2012 01:46:10 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/5] UBI: fastmap: add more TODOs
References: <1338909119-5188-1-git-send-email-dedekind1@gmail.com>
 <1338909119-5188-2-git-send-email-dedekind1@gmail.com>
 <4FCFCBDD.8030907@nod.at> <1339025892.8066.16.camel@brekeke>
In-Reply-To: <1339025892.8066.16.camel@brekeke>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigF952B6230A99926F975FE048"
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigF952B6230A99926F975FE048
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 07.06.2012 01:38, schrieb Artem Bityutskiy:
> On Wed, 2012-06-06 at 23:30 +0200, Richard Weinberger wrote:
>> I'm confused to find bad PEBs I'd still need a full scan, right?
>=20
> If full scan means call mtd_block_isbad() for each PEB, then yes.
>=20
>>>  	ret =3D ubi_io_read(ubi, fmsb, sb_pnum, ubi->leb_start, sizeof(*fms=
b));
>>>  	if (ret && ret !=3D UBI_IO_BITFLIPS) {
>>> +		/* TODO: what are the error codes > 0 ? Why is this check? */
>>
>> To catch UBI_IO_BAD_HDR, UBI_IO_BAD_HDR_EBADMSG and friends.
>=20
> Which are never returned by ubi_io_read().

Also never ever in future?
If so, I'll drop this check.

>> AFAIK ->magic is the only __b32 field where I not use be32_to_cpu() be=
cause it's useless here.
>=20
> Why is it useless?
>=20
> if we have the following bytes starting from address 0xC0000000:
> 7B 11 D6 9F
>=20
> then we do:
>=20
> unsigned int *p =3D 0xC0000000;
> printk("%#x\n", *p);
>=20
> we should see:
>=20
> 0x7B11D69F on BE system (e.g., powerpc)
> and
> 0x9FD6117B on LE system (e.g., x86).
>=20

Damit, you are right!
Sorry,
//richard


--------------enigF952B6230A99926F975FE048
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPz+vDAAoJEN9758yqZn9eiD8IAIxYnBquynNJJw9SKYwf1k5i
ZV33pO3WAuxQSwbBV7oiGeebhxbg1ZRtoKSkQ/gLKU9m2F+3pLmHIAKudKYZx9OC
IgVm00+a74L69KK3e+bcyU6d/pIEKSI2Dw0mMSsVbtM8aU/0Ob4PWOjHMPurL+tB
qQl4A5AyqCX0qV0ROxiq1pI5SsZXXBKTCUA92xUlfA1aEgK1arzo7ZMcrptggtnR
9msLZVLG9YC2o6tSPkEcrKjmS5rEYQGRPUQNSFIJeOgRXXDs27NCNGG51iMaJrLM
EXZ8DOOhVBDLHfBIY2oC8aPXC/J5dMCGapYWEaKol1cdrz5gOJ99TSRYLU4+IfY=
=KD/e
-----END PGP SIGNATURE-----

--------------enigF952B6230A99926F975FE048--
