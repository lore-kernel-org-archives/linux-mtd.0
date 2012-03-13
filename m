Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7R4H-0005Ds-J8
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 12:43:10 +0000
Message-ID: <1331642742.3595.37.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Mar 2012 14:45:42 +0200
In-Reply-To: <CACRpkda26TT24Wrm5A7u2T-zTgWYHWC2EJD=frBAQX8ffkB3eA@mail.gmail.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
 <1e02585381b1fb93a8fd5b826ac33d355eaedaa5.1331119143.git.vipin.kumar@st.com>
 <1331298422.29445.23.camel@sauron.fi.intel.com> <4F5A181D.1080106@st.com>
 <1331305901.29445.39.camel@sauron.fi.intel.com> <4F5F1931.7060602@st.com>
 <CACRpkdbf1_4otJFK728LKO=neGFdC6YEHFX+R00iTL0dcvKe1A@mail.gmail.com>
 <CACRpkda26TT24Wrm5A7u2T-zTgWYHWC2EJD=frBAQX8ffkB3eA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-5sdSIjDUbxUsrGSHad+O"
Mime-Version: 1.0
Cc: Armando Visconti <armando.visconti@st.com>,
 Vipin KUMAR <vipin.kumar@st.com>, dbaryshkov@gmail.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-5sdSIjDUbxUsrGSHad+O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-03-13 at 13:39 +0100, Linus Walleij wrote:
> On Tue, Mar 13, 2012 at 12:56 PM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
> > On Tue, Mar 13, 2012 at 10:53 AM, Armando Visconti
> >
> >> Actually I checked better and I can say that:
> >>
> >>  1. We do have the provision to pass the partitions thru pdata and
> >>     cmdline
>=20
> Oh. no, wait. The driver is broken, I just realized:
> commit 0d04eda1430e9a796214bee644b7e05d99cfe613
> "mtd: fsmc_nand.c: use mtd_device_parse_register" broke
> the ability to pass in partitions from platform data and I did
> not realize until now. :-/
>=20
> > (...) and I get the default partitions from some SPEAr platform
> > currently,
>=20
> This is just because of the above bug.

Yeah, there were many bug-fixes like for this stuff. Please, base your
patch on top of the l2-mtd.git tree:

git://git.infradead.org/users/dedekind/l2-mtd.git

and add

Cc: stable@kernel.org [3.2+]

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-5sdSIjDUbxUsrGSHad+O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPX0F2AAoJECmIfjd9wqK09wEP/R9k1Obwgs3yVpre5uc2iF5Q
wGEHuh/CFnMfe4Mq2sWvKA+Ocu0jFpvSd/Yz7ws17374sSfgU+x/nhNkg/Lxz28N
J+B30/e/A/H9uD2mSB8+7TD2Ngs/NLZwl9bqL4FnC9MveP10viaZYEg4D1KiUD5l
Syq5UFTOypKI8sP33paqpL9ecCBa0VvM7e0FTDdE+t+oj+JGWsSgJtj0pTWBRUuu
NWmjxrHDNF6ex3Ao4cTMDad30C/lbESxgt8l+YHqLgwl1u/vRg8lFbEtPYHz95B6
0HH171BwHEL3jNVc62vhD2l5FfEjK1hEmJzFp/hBij0nQ10ehop7jpT+cJTtInYF
NL7oWJzaKMT5AcHWSYDbHrTPR09017nPVsfb/jKvj+3uihB0B7Cpa9KeunTr/w0S
MqcaTPykOx9IGCicQpr1EiauZUOM+wGeJFu7rwPO5qUvC5iiAVXoXsm/IOYLZfZl
r8FgDaD4tDRGBoa2HBF0y/qpCCu0/nI4YlI2PrH4wVzOUYtKb6ZiBGNhR9vQkO81
GCvo1bm3IYzWhA6p2GI/pGwYXMKzreTvh5TYT7QalmSAkAJdM/k69zjPpyFBQfP2
3xB4ICdsrXANzuV89jf6i0x4eT/Jm6PSP1S9wL/apIhkCbDeb8e+Cz9CoVSXMGUK
vGZTSAKxat0kvDFQBNfW
=d1j4
-----END PGP SIGNATURE-----

--=-5sdSIjDUbxUsrGSHad+O--
