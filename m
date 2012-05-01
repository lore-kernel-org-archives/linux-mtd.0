Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPBwd-0004tT-Vs
 for linux-mtd@lists.infradead.org; Tue, 01 May 2012 12:12:41 +0000
Received: by lagy4 with SMTP id y4so2957906lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 05:12:36 -0700 (PDT)
Message-ID: <1335874342.2095.5.camel@koala>
Subject: Re: [PATCH v3 09/10] mtd: nand: utilize oob_required parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 01 May 2012 15:12:22 +0300
In-Reply-To: <CAN8TOE80t39VYw328p1O8Hh6XdjGn5JLuG3ZftqH3e7u+JQp2Q@mail.gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-10-git-send-email-computersforpeace@gmail.com>
 <20120429154707.01c7be55@pixies.home.jungo.com>
 <CAN8TOE-+4FP1rR82L2Kfg__MgmsmMQZuZ_BO_FCcvSZDasChNw@mail.gmail.com>
 <4F9EF447.6060506@freescale.com>
 <CAN8TOE80t39VYw328p1O8Hh6XdjGn5JLuG3ZftqH3e7u+JQp2Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-5qCJs4UM/5FU7wXvqiE4"
Mime-Version: 1.0
Cc: Scott Wood <scottwood@freescale.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-5qCJs4UM/5FU7wXvqiE4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-30 at 14:49 -0700, Brian Norris wrote:
> On Mon, Apr 30, 2012 at 1:21 PM, Scott Wood <scottwood@freescale.com> wro=
te:
> > On 04/30/2012 02:59 PM, Brian Norris wrote:
> >> I see. This is the kind of issue I was alluding to back in v2:
> >>
> >> "For instance, is there any sort of hardware that expects the whole
> >> page + OOB to be read via chip->read_buf() for all reads..."
> >>
> >> This situation comes up if NAND_NO_AUTOINCR is not set. But really, it
> >> looks like we *always* have NAND_NO_AUTOINCR enabled, and so we
> >> *always* send a new READ cmd. I know that it's possible for some board
> >> driver to override this, but I don't see that anywhere...
> >
> > If it's never used, maybe just remove autoincrement support altogether
> > and simplify the code?
>=20
> Fine with me. I'd like some word from a Artem or David though.

My opinion is that we have too much cruft and killing unused feature is
fine.

--=20
Best Regards,
Artem Bityutskiy

--=-5qCJs4UM/5FU7wXvqiE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPn9MnAAoJECmIfjd9wqK0dVYP/R9zNAL49csVcAQTRAb+e5sk
AhPYR+unurPyUpAvju60jC2xCoES0Qc82pUP6y10VL+6eLZiLsxlItjA/f3vIBkU
teeNaJAsmHOIRg+5wxdSmfCrvwQ2GZ76BDuEFo6ReYHV728hTtTgj6yOak6CbpoT
ih5rEcm+uoxpZf6ZU2+s9PNeBnC/igbUWfgLyfaBFJJhZPR9EW5JMCNsDlh6QbY8
IDHjXJVPg59LfOrhzWbiF7fx2T1YNSZwr/xqu/Ta4Le3LtQgpEduD5xY2MyTDkHl
SllM0hjCJd1wM/qga2CDpNvSBDp9qY6WVQqIG89WbmOQZ9iMgBlmExlIF7bn1UVP
ZRAxMh4Et9m8TB/XiOCCNLAZUwkJpOAIiWcnhxcBTrWYFb4OIi4LOfmKWmM9bdLp
Q60Kq2xGIpoDhfroL2bCSzl+wW/16woPemsBmoUuBJjiW4C1isc0KkgQ2HJXbCF2
TgsmfzEKOt+sl6yu1Fxr2S1tKt4Yx+C32qvJ/0disS3n1nJPVUVaZWDlZZrxloIl
eQgMfDUwRqTYYxLHl55i2iHqJBirgjTSMwm+b8xM6TIRBJ5+J9fbkQPHfJ88gyf2
nz45yA2iJnJn+GEfnMloRSVRW1PiHBrngh3EMtFADJsuUmKBPTG9ki/XHh0QaPi0
pMbDkXhm96EgIGs2auwI
=Wytn
-----END PGP SIGNATURE-----

--=-5qCJs4UM/5FU7wXvqiE4--
