Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F022C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 31 May 2022 20:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2tLOohFylg9o7vj0dVIUQoNBXOKQ5w/oaF3pNPt/6c=; b=jA4Hxfs0YkSqx85LHchLbBrcAe
	xwz1no1Q/fQjtc2ftIb15XCNh4wlTIjQ1vlLFJR5pCZRuKoX777imRIUXfsj3J1C5mX/lt06y90wP
	7Rcr+epHG4zoFxFqU8P1nAT8p3sJNIeUeHwSpzjcv9ztZZMReJH9y9ZOLkrg+MGnIq02roUWHFVml
	6l5VfsXd+PLomDhgQBSZD2m0iYWyJf3uoqOfXEfQEKm60BTrviVXNnPcydNantjFrwYvzqHhLXuZx
	urFnA5Ix+7Oqdyt+gury/kbzaq2akuLBCivUmsT8LUYXAYx34mNZVeoCLlDAmtAhoEMd/cAbNdZII
	zLHFeGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw82B-00CPN5-0m; Tue, 31 May 2022 20:00:07 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw822-00CPLZ-0q
	for linux-mtd@lists.infradead.org; Tue, 31 May 2022 19:59:59 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nw81t-0005Co-D1; Tue, 31 May 2022 21:59:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nw81r-005hZM-R2; Tue, 31 May 2022 21:59:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nw81p-00DN6X-Gl; Tue, 31 May 2022 21:59:45 +0200
Date: Tue, 31 May 2022 21:59:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	mark@msapiro.net, workflows@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	MTD Maling List <linux-mtd@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: Getting rid of infradead.org - corrupted subjects
Message-ID: <20220531195944.a4gyevqfxdafo5qa@pengutronix.de>
References: <b36280be-9993-9a78-0960-4094efeed1aa@linaro.org>
 <CAMuHMdWL93+r0cofwHKj1k-gUo9nk3OzUf6gtY68sK4JNibyNg@mail.gmail.com>
 <eb5ab9553c419b8259f5494664865597b6c5d4db.camel@infradead.org>
 <20220525192329.iomxf2imkaymbjc3@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220525192329.iomxf2imkaymbjc3@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_125958_089042_FE7C2F37 
X-CRM114-Status: GOOD (  38.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7220158525279811880=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7220158525279811880==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qe7jpan2q2japypi"
Content-Disposition: inline


--qe7jpan2q2japypi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, May 25, 2022 at 09:23:32PM +0200, Uwe Kleine-K=F6nig wrote:
> On Wed, May 25, 2022 at 10:55:18AM +0100, David Woodhouse wrote:
> > On Wed, 2022-05-25 at 10:34 +0200, Geert Uytterhoeven wrote:
> > > CC dwmw2
> >=20
> > Thanks, Geert.
> >=20
> > > On Wed, May 25, 2022 at 10:07 AM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org> wrote:
> > >=20
> > > > The address list is semi-random as I don't know whom to approach.
> > > > Problem: infradead.org corrupts email subjects by changing:
> > > > s/,/, /
> >=20
> > I found an old thread on mailman-users which appears to be claiming
> > that it's just standard folding as described in RFC2822 =A72.2.3.
> >=20
> > https://mail.python.org/pipermail/mailman-users/2007-May/057119.html
> >=20
> > 2.2.3. Long Header Fields
> >=20
> >    Each header field is logically a single line of characters comprising
> >    the field name, the colon, and the field body.  For convenience
> >    however, and to deal with the 998/78 character limitations per line,
> >    the field body portion of a header field can be split into a multiple
> >    line representation; this is called "folding".  The general rule is
> >    that wherever this standard allows for folding white space (not
> >    simply WSP characters), a CRLF may be inserted before any WSP.  For
> >    example, the header field:
> >=20
> >            Subject: This is a test
> >=20
> >    can be represented as:
> >=20
> >            Subject: This
> >             is a test
> >=20
> > But this is folding at a *comma*, not at whitespace. The original
> > subject line was (in a single line):
> >=20
> > Subject: [PATCH v2] dt-bindings: mtd: jedec,spi-nor: remove unneeded pr=
operties
> >=20
> > ... and Mailman 'folded' it in the wrong place to:
> >=20
> > Subject: [PATCH v2] dt-bindings: mtd: jedec,
> >  spi-nor: remove unneeded properties
> >=20
> > That *isn't* proper folding because it didn't happen at a whitespace.
> >=20
> > I do need to upgrade to Mailman 3 at some point; I've been
> > procrastinating on the basis that it "ain't broke". For the time being
> > I've just disabled folding in MM2 with a trivial hack:
> >=20
> > --- Message.py.orig	2022-05-25 02:51:05.917145192 -0700
> > +++ Message.py	2022-05-25 02:50:44.137142069 -0700
> > @@ -49,7 +49,7 @@ class Generator(email.Generator.Generato
> >         Headers will by default _not_ be folded in attachments.
> >      """
> >      def __init__(self, outfp, mangle_from_=3DTrue,
> > -                 maxheaderlen=3D78, children_maxheaderlen=3D0):
> > +                 maxheaderlen=3D0, children_maxheaderlen=3D0):
> >          email.Generator.Generator.__init__(self, outfp,
> >                  mangle_from_=3Dmangle_from_, maxheaderlen=3Dmaxheaderl=
en)
> >          self.__children_maxheaderlen =3D children_maxheaderlen
>=20
> For the record: Some time ago I debugged that myself, too and found an
> equivalent change. So this looks good to me.

small supplement: I found the change I did back then:

--- /usr/lib/python2.7/email/header.py    2018-09-26 20:42:22.000000000 +02=
00
+++ /usr/lib/python2.7/email/header.py    2018-09-26 20:42:22.000000000 +02=
00
@@ -371,7 +371,7 @@
         joiner =3D NL + self._continuation_ws
         return joiner.join(chunks)

-    def encode(self, splitchars=3D';, '):
+    def encode(self, splitchars=3D' '):
         """Encode a message header into an RFC-compliant format.

         There are many issues involved in converting a given string for us=
e in

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qe7jpan2q2japypi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKWc60ACgkQwfwUeK3K
7AnKhggAoZDvxOMPgFG98lTEDsZhLsqy77RVMZ3z0wYiRvpmWgitlGDH10N34LP/
XMJQieRCP6XuM3Q+5PloKEbofm6tyMc0T4I4VI1YbiQq0K9UwO8ku7jiD/rl5WD0
GM8+mt70pRSxQCerqrneBqzXFFg3VWYcGhUAYTyE4pBki6pAMenOa8+5tnZ+XBOY
mD0cWW2oxm2npOXbh7dYbOVobwFb1r2jcNFbKD6UKQ/igpRCLCDj3cqJrmTd/XWL
XLSOqDW3e3ogLIwXOkp5b35e/fW+yjRFHi7AAZ/a3JTG3FfXJQcH0uotIvvEh58g
tAm7v1Mp3UvZR44eH+4oYc5j0CEEZQ==
=VGcY
-----END PGP SIGNATURE-----

--qe7jpan2q2japypi--


--===============7220158525279811880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7220158525279811880==--

