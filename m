Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2081-0003pU-MN
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 13:28:50 +0000
Message-ID: <1345124012.3393.239.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] UBI: replace MTD_UBI_BEB_LIMIT with user-space
 parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Thu, 16 Aug 2012 16:33:32 +0300
In-Reply-To: <20120816134234.32b468f6@pixies.home.jungo.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-5-git-send-email-richard.genoud@gmail.com>
 <20120816115713.726da8f2@pixies.home.jungo.com>
 <CACQ1gAhFJ6AKYJpc1ZiHm+3Y=APnwUmVL3f0KW=OFMDMWzCVJg@mail.gmail.com>
 <20120816134234.32b468f6@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Zi4A6TeR2ULkc0Sb7JEg"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Zi4A6TeR2ULkc0Sb7JEg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-16 at 13:42 +0300, Shmulik Ladkani wrote:
>=20
> Does it make sense to set a zero limit? dunno.
> For testing purposes, maybe.
>=20
> Artem, what do you think? prohibit a zero beb limit?=20

We do not have that big user-base. No one uses 0 in the tree, most use
the default. I never heard anyone using 0. I did not use it also. I
think it is OK to have the lower range start from non-zero. But why it
is 2 and not 1 - I am not sure :-)

--=20
Best Regards,
Artem Bityutskiy

--=-Zi4A6TeR2ULkc0Sb7JEg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLPasAAoJECmIfjd9wqK0htgP/jPoH3TK1jsXH1Qx49TcB/8x
NcTrDz2GNE6PLtFC4ILBG22vB/Ibij0dx7tXF453p5kfHucleBUmn5p1VeXtQSBy
WLwEUSHBbQAFIf44+ZcscmqpXCG7BKG5DFRHKN5CDq070DrGYkVN7liDJyXqmruj
0fnchqAhU0Inlm9b2XWAE/d8eiOAUvZrkTR9uYR0e4LjeJHF5+mrj6fMEAzEDaeZ
V2ejwvOZV6rL+iqXd5JlW/5YIyAS5cuAH3F9DC9A8u7a4/IdZuO0G2qPXUf5CHK6
0i8VFZJLFq8DxrAwhBnfn1VHiQjBrpc2lBO7zLldAshkZxctTWaQEMXRNdpmV6/v
ApVJHX5ZmDbiIS1lhGwvM7SYq5MoiivFuicrcDkMHbLW7GsGmVycGxwq4FeoxWZu
GtgCPzNr5JSEgzdTTFciMZea5xrXpx05JEKUMjknMixP9pdpDtDvqAuS61uOAqJd
uIPSE0yGwspMO/lSr6RhlRhD9EjDGxw2pueCQb75m6Xw2EzkKi5g6j2iEwNZtePv
ChvN28tgAUpznVhzXP/Fqe4Rh3zUyCqcO1df9V19ebzR56IvXoG9L+c61mSErXvm
7Iq02AAf82WJOHXHdsEAL5btPamWjAIdPHOJjG5nYpwJLcSD0XHrkf2dxfWQQlCt
MRFDKg6IfOoHGkQ7RnDO
=fH2V
-----END PGP SIGNATURE-----

--=-Zi4A6TeR2ULkc0Sb7JEg--
