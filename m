Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T46ao-0007bn-UJ
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 08:47:16 +0000
Message-ID: <1345625519.2848.132.camel@sauron.fi.intel.com>
Subject: Re: new 3.5.2 ubifs debug assert
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MichaelHench@gmail.com
Date: Wed, 22 Aug 2012 11:51:59 +0300
In-Reply-To: <CAHyXW61bzWmjn2ioW9bHKbVHkCBf4xQ7mDEzjDrF24J43NBSgg@mail.gmail.com>
References: <CAHyXW63+bY-Dq_miAWMQc=RYqaBwGrZHn95wgJXuK3NHWsnzbg@mail.gmail.com>
 <1345575791.1886.1.camel@kyv>
 <CAHyXW61bzWmjn2ioW9bHKbVHkCBf4xQ7mDEzjDrF24J43NBSgg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+UpvAWmEGf3zQfdYOS05"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+UpvAWmEGf3zQfdYOS05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-21 at 14:44 -0500, Michael Hench wrote:
> On Tue, Aug 21, 2012 at 2:03 PM, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
> > Hi, the below (and attached) patch should fix the issue. Thanks for rep=
orting.
> > Could you please give it a try?
> >
>=20
> seems to work...

OK, I'll add

	Tested-by: Mike Hench <MichaelHench@gmail.com>

and send the fix to Linus. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-+UpvAWmEGf3zQfdYOS05
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNJ2vAAoJECmIfjd9wqK0f3sQAM/bsUZnPwnhtgHyc2n5pgKb
rk8RlZ5emQtJDRGWhZg2MIPbE67ZNRoBFg/tsQh6lq1kfNw1b0iy4HAEqhnK9sLy
jhhzAcG5yNU9JHflVL/o2BUD+sFC7ji4OweSGMl+LTRDfNFteS5/6mq4K235bNHw
V24/bEYXsKJQg3FafZrvVojLyb6tt06OFzDpKU0YpllgNlIHRY8M4+Qvqva4gnrJ
sMu82BZYR117xGoLfHJeZLHJhPQOpWi4cuMh7u1w463WBa7NLYsrupxRU3v4rYa6
r0kCUuPq7gdSBFw+AQ2y/XXSvqamz7T+qUzqZMPdWtPxbKCfaYiGDnXbzacuoyuc
HXDj+KuK5Y7FRAqSy/HZJG/GmvUGYHgKkcukhrymStQktx4AIcctDg2EefhYhqDd
bRNaOEYJiJuB12+goymfG4M0RBP09q9hs94FWPih7l39ji4JqbooICOvNHFyXgIe
tiRZtuXb09HBkB1u0brusVu4jZq8YPqnAfzRbp3Stt/mN4cDcheQxaOryn44PEUp
Dpgx+VqXxzFSCkyGJ+OiMr335G+TUF7qjwO61l4XglFTUoxpZ8Rd/setEXEmIKQQ
cRjJ5jWnTIaudbxymgnV02cA5Qf8CF21H0CFlQkcfNeDBcKY5PtVs9qQpS64Zmhz
5D5F5MbVSNUpu1zq38Ly
=cpDL
-----END PGP SIGNATURE-----

--=-+UpvAWmEGf3zQfdYOS05--
