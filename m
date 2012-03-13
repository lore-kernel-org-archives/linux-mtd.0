Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7NLo-0003Zw-QN
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 08:45:01 +0000
Message-ID: <1331628462.12037.56.camel@sauron.fi.intel.com>
Subject: Re: UBIFS crash (was Re: Problems with mtd_oobtest)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matej Kupljen <matej.kupljen@gmail.com>
Date: Tue, 13 Mar 2012 10:47:42 +0200
In-Reply-To: <CAHMF36EpG5T2L3GDfgqPKA2XBqw2SipzX1OxXP0SDh==djgcsQ@mail.gmail.com>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
 <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
 <1331619893.2443.10.camel@koala>
 <CAHMF36EpG5T2L3GDfgqPKA2XBqw2SipzX1OxXP0SDh==djgcsQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Sj63cyi/Ngz64q5X733Q"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Sj63cyi/Ngz64q5X733Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-03-13 at 08:32 +0100, Matej Kupljen wrote:
> Dear Artem,
>=20
> >> What could be the cause of such many errors in FS?
> >> I am really running out of ideas, how to solve this, so any hint would
> >> be appreciated.
> >
> > This looks like non-UBI/UBIFS issue but more like issue with your flash
> > driver or HW. Start stress-testing the driver. Try MTD running mtd test=
s
> > over night.
>=20
> O.K.
> I already tried that, but only the mtd_oobtest failed.
>=20
> Which tests should I run? All of them or maybe just mtd_stresstest?
>=20
> Do I need to format the NAND?
> I'll boot it with rootfs on SD card and try the stresstest.

I think the mtd_torture test would also be a good one to run for a day
of 2.

--=20
Best Regards,
Artem Bityutskiy

--=-Sj63cyi/Ngz64q5X733Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPXwmuAAoJECmIfjd9wqK0wq4P+wf1pqT+NbH875Z/fI97AwBI
v9yTlL0dm80DKtVZ+h4ctvbgdx9GwXL03F3TyashpqldRK2vzPPpTMF27An0Cgvo
u+EPTwEnrdnjnrwX31mggt5IAA244872rEQ/wjuyUXG6lOkjXU5IIY9l6/VZFevK
1/21SJbcfWFcEbUpoyrPlUY+ZLrYXG390CtBKOFUP8KnWcwLKEp6cCC6yF3GmPI8
8gI7lXNLZy3z2mVqn3GDls48M4xnPVSTk+tYZzvkjrzxi33Ww1zckebI0f4P9w1+
E9HSuuw9QCFoIVeKeFN5cU1vvgqUnOp+2z0OkUe6GFXbNUjJ56H14Hk7Zxh6c5Bl
Xovi+Ygi4ci2nJVsM56sJxWkAW36RtMm6LDOQwLTa0LyViFOeEQeyxY6CjIRhgi6
J+gOJSf+cOwHQB/dLiocDc9K6QrlekRBYHVpzvQiARRqn67JN99svjDcvtTBsGfn
1g9qE63zsnSHY5bQX8QN4klEigU+aFf3z0/kvajgHvHBWsWo1E/6MFOtZkEk3h7n
Xx1oV46HyO1+i+RAyYMdgAYZV7NLvXON6M6pVmn+PMiEDtUJnHzdrXaRXaNP4+kG
e1baUH6Tj8gZCK7h/FakQDv3YBKyjZ+nclGNpxOzsgQ1BC7IGYCX3oezkLAI1/CA
5agQykahJrepcyzV3L2l
=hL/9
-----END PGP SIGNATURE-----

--=-Sj63cyi/Ngz64q5X733Q--
