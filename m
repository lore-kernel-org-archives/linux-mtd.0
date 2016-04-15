Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqybv-0000uA-TG
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 07:56:19 +0000
From: Markus Pargmann <mpa@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Han Xu <han.xu@nxp.com>, David Woodhouse <dwmw2@infradead.org>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Huang Shijie <shijie.huang@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Stefan Christ <s.christ@phytec.de>, Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH RESEND] gpmi-nand: Handle ECC Errors in erased pages
Date: Fri, 15 Apr 2016 09:55:45 +0200
Message-ID: <7168760.YSQBa3GsdA@adelgunde>
In-Reply-To: <20160413005155.03cb7bc6@bbrezillon>
References: <1456059126-25469-1-git-send-email-mpa@pengutronix.de>
 <DB5PR0401MB1845DD983AF9195311DEB20F97950@DB5PR0401MB1845.eurprd04.prod.outlook.com>
 <20160413005155.03cb7bc6@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart81158817.HsAFrMzeWr";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nextPart81158817.HsAFrMzeWr
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 13 April 2016 00:51:55 Boris Brezillon wrote:
> On Tue, 12 Apr 2016 22:39:08 +0000
> Han Xu <han.xu@nxp.com> wrote:
>=20
> > > Thanks for the feedback. Talking with a coworker about this we ma=
y have found a
> > > better approach to this that is less complicated to implement. Th=
e hardware
> > > unit allows us to set a bitflip threshold for erased pages. The E=
CC unit
> > > creates an ECC error only if the number of bitflips exceeds this =
threshold, but
> > > it does not correct these. So the idea is to change the patch so =
that we set
> > > pages, that are signaled by the ECC as erased, to 0xff completely=
 without
> > > checking. So the ECC will do all the work and we completely trust=
 in its
> > > abilities to do it correctly.
> >=20
> > Sounds good.
> >=20
> > some new platforms with new gpmi controller could check the count o=
f 0 bits in page,
> > refer to my patch https://patchwork.ozlabs.org/patch/587124/
> >=20
> > But for all legacy platforms, IMO, considering bitflip is rare case=
, set threshold to 0 and
> > only check the uncorrectable branch and then correct data sounds be=
tter. Setting threshold
> > and correcting all erased page may highly impact the performance.
>=20
> Indeed, bitflips in erased pages is not so common, and penalizing the=

> likely case (erased pages without any bitflips) doesn't look like a g=
ood
> idea in the end.

Are erased pages really read that often? I am not sure how UBI handles
this, does it read every page before writing?

>=20
> You can still implement this check in software. You can have a look a=
t
> nand_check_erased_ecc_chunk() [1] if you need an example, but you'll
> have to adapt it because your controller does not guarantees that ECC=

> bits for a given chunk are byte aligned :-/

Yes I used this function in the patch. The issue is that I am not quite=

sure yet where to find the raw ECC data (without rereading the page).
The reference manual is not extremely clear about that, ecc data may be=

in the 'auxilliary data' but I am not sure that it really is available
somewhere.

Best Regards,

Markus

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart81158817.HsAFrMzeWr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXEJ6BAAoJEEpcgKtcEGQQ2UcP/2GqNb06pwnMkgSmZSXy5sQC
zk3NRtHJ/HRIxEjeo8BGwmt97kfhLiDtW7sljts+7Sr76f+CLJJG441dFRUgKwE7
DxXBhJYWgLUryObFEyrvLSqMNjilE36yrBY/QuAkl25a9sfVeXAsUmYTKCAJI/eh
xH2d8y/oVkFH5WJzyapznFR2q6tJBCcQeG3EPq8tGS4fsB7OGSNC5yrPaL/PM/KL
lDMD5txbTPbTM9fS11jzlnIu9bhrPO4yxiobVpMkXeuEqSC8eekBsP9+1rW4WI07
FALLIJlMya/Na0JcQuPN/7funiHZec4cKNg7hk+KxJAYjzOR3bD4Be9h9ZzIsp89
NF5RfCvsdZxxLE55Fc7ljUQjfhd1utHzdne0yrmIlxTwqzgw5nsX+k92zDWp5mBz
g6lDPVOOlPEHx7ondENX3GcPvz6iP6ZDEC8qlKAX8wAb5O/yEpG58XvYN/1zJUv+
Uc1jcNPczcKU8mPkSZvEvQGe9bKbq+F6BTWKpmi60xIpPcyP9lWTuv1lhn+RvVW4
5a1FwlmzMWJdifKnpUPCG86SVy1jh3jqrl1RSf8Ha5p8TCVAztbboPVw4Whcgaeg
m9MyX+XzdgIszjOi8dd6Tj64hZv6dXAI5akonYDCyw7hMqplVGc0vRItscZ62Y95
Om2ZmxTzV4im9ze38ZUs
=lGac
-----END PGP SIGNATURE-----

--nextPart81158817.HsAFrMzeWr--
