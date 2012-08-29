Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6eDM-0004C2-M3
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 09:05:33 +0000
Message-ID: <1346231430.2848.449.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: cmdlinepart: fix the wrong partitions number
 when truncating occurs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 29 Aug 2012 12:10:30 +0300
In-Reply-To: <20120829115112.389fc40c@halley>
References: <1345904767-23011-1-git-send-email-shijie8@gmail.com>
 <20120825120231.73577d6a@halley>
 <CAMiH66HyfNEzEHGyZUcLJ_01PNVHqA44fjAqXsyM2c-HHms8hQ@mail.gmail.com>
 <20120826090603.6b833e54@pixies.home.jungo.com>
 <1346228165.2848.432.camel@sauron.fi.intel.com>
 <20120829115112.389fc40c@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gtlvJMTIw7umlN5Uutgm"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, Huang Shijie <shijie8@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-gtlvJMTIw7umlN5Uutgm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-29 at 11:51 +0300, Shmulik Ladkani wrote:
> > While you suggestion is clever, do we really benefit from this?
>=20
> Artem, please note this is just a side effect of what I've suggested
> (that its, continue parsing after first truncated partition), not a real
> use case I'd expect and intentionally wish to support.

Sorry, I was not reading carefully enough. Could you please recap - are
you fine with Huang's latest patch-set or not :) To me sorting and then
dropping 0-size partitions looks like a simple and robust approach.

--=20
Best Regards,
Artem Bityutskiy

--=-gtlvJMTIw7umlN5Uutgm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPdyGAAoJECmIfjd9wqK0kxwQAJAMK/wQti0bE0QbWAYtb3qv
7ZzrLPp3EFxxGgsZJv7XzA9QVHITVRG1AzBT4FiV1GIn8EKV1JuA74bvRNen2kex
WFjQrZlhoUPIR0QcIAklcHrUx6nmYezY3CdDL/mFnAVMg43J8CbSkaFtJeZRSUtL
3Bs6hd/UngLAjafQ+jPkGDjGzBLoi084C2EPxDyvEe9B5hjTQop3RYK+xQ0s12U8
0zKnV/OXsm7ur2WFJaS8sw5grdmG64YIdg4bg5L0T01G8g8wYW4hPUnr7VDjtzpH
lEjlwswdYS7tnZznBB2D0dr/a9jhCPs7uqfU8JCUYolUVyShXLLziu8+8gh4BVcy
6je/Zpz9jXLYDiC7av6GKlt/RxCiZogz0TNQZq2IIuTWQqnWroXwccgg3Whc/T3V
kjTEpIzChsbzvzaeQmg2FY9vkKRbnN2quO0uLmi+sVu9T+5GHdwtywdjYb/iPcD+
6I9TqCw++9s0x5+MXxTlWis4wf+7O4C6b4FsstH/q0iAUOBKX87qdmI1bHQhe+PV
F0huD4fu/7A2Mc9nx3TjBaU1BnaL51oMdp5ixctoqH3siix9y8M6Lvbk+vz46dSn
ZUBOnw6o4sOGXNZznzbFrPgS3Qrhw/Bstt9ivO/27wKPHvqEEaMhmb3PVMpXtGmR
E5+Q3G1WUr66FMNaela+
=T11e
-----END PGP SIGNATURE-----

--=-gtlvJMTIw7umlN5Uutgm--
