Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGvbk-000827-Da
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 16:36:41 +0000
Received: by wwe32 with SMTP id 32so6771832wwe.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2011 09:36:37 -0700 (PDT)
Subject: Re: UBIFS recovery fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Thu, 20 Oct 2011 19:36:19 +0300
In-Reply-To: <Pine.LNX.4.64.1110181007100.30940@lnxricardw.se.axis.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<Pine.LNX.4.64.1110181007100.30940@lnxricardw.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-SrscFB/gt30AUebab3+R"
Message-ID: <1319128586.20953.19.camel@sauron>
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


--=-SrscFB/gt30AUebab3+R
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-10-18 at 10:11 +0200, Ricard Wanderlof wrote:
> On Mon, 17 Oct 2011, Artem Bityutskiy wrote:
>=20
> > [...] Unfortunately, no one really invested time into making UBIFS=20
> > support MLC very well. It needs some more work. It also have some issue=
s=20
> > related to unstable bits in modern SLC.
> >
> > In short - if you want to use UBIFS on MLC - you should not have unclea=
n
> > reboots. If you want to make UBIFS 100% uclean-reboot save on MLC - you
> > need to work on it some more.
> >
> > We (the original authors) developed and tested it on very robust SLC
> > NAND.
>=20
> Do you have any specifics on what the issues are with MLC ?

Yeah, described at the web site, please send patches if you have
something to add!

> Since UBI implements bit scrubbing and eraseblock torture on questionable=
=20
> blocks it would seem that a lot of the work has been done in order to=20
> handle unstable bits. Is there some issue which is related specifically t=
o=20
> bit flips happening while the system is powered off?

The definition of unstable bits in MTD community is probably not what
you though of. I've added the docs at the web site as well :-)

--=20
Best Regards,
Artem Bityutskiy

--=-SrscFB/gt30AUebab3+R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOoE4DAAoJEJtuLFy+q7feheIIAI6H69xXETWYMot2d/gWrc6c
F/0yFYzhkkfDFoVG74m7355tPXWZgzD5zjCrGK0q6ozZDcg2A74JhTEFTWnHgiyQ
noEsLRiGPjkswTaRTc3X8bKwa6hANLyuY/yqH7g3z8pPPkZGavrcIsvE8Cd4HNn1
kt4OIvFMcnkL8IBILfZdrDzekZnEAO4vNSfXMU1VIPsrLFOKuL6Xfy8L3uj+859F
2nR/0Mwp4s48fC/dRpOg7N58eg3s0U79rSVoMhUsO4wPAKvOOMQVIAjNXHgfNs43
XRUcfsIf8N9fRRcyeActBfDCDAoP01mIAgrnflpDPD2ghbFGKybfs4I5O/MpUS4=
=KpfF
-----END PGP SIGNATURE-----

--=-SrscFB/gt30AUebab3+R--
