Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmmCZ-0006Q2-Ik
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 13:02:21 +0000
Received: by iakl21 with SMTP id l21so10369948iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 05:02:18 -0800 (PST)
Message-ID: <1326719043.14299.88.camel@sauron.fi.intel.com>
Subject: Re: ubiformat & linux 3.0.14-rt
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tim Sander <tim01@iss.tu-darmstadt.de>
Date: Mon, 16 Jan 2012 15:04:03 +0200
In-Reply-To: <201201161359.49629.tim01@iss.tu-darmstadt.de>
References: <201201131006.33998.tim01@iss.tu-darmstadt.de>
 <201201161143.23934.tim01@iss.tu-darmstadt.de>
 <1326712798.14299.53.camel@sauron.fi.intel.com>
 <201201161359.49629.tim01@iss.tu-darmstadt.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Wkr7OHUBvJ+52XZJ5gue"
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


--=-Wkr7OHUBvJ+52XZJ5gue
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-16 at 13:59 +0100, Tim Sander wrote:
> Hi Artem
>=20
> Am Montag, 16. Januar 2012 schrieb Artem Bityutskiy:
> > On Mon, 2012-01-16 at 11:43 +0100, Tim Sander wrote:
> > > > http://git.infradead.org/ubifs-2.6.git/commit/1f5d78dc4823a85f112aa=
a2d0
> > > > f176 24f8c2a6c52
> > > > http://git.infradead.org/ubifs-2.6.git/commit/d34315da9146253351146=
140e
> > > > a4b 277193ee5e5f
> > >=20
> > > Do you think it is worthwhile checking the ubifs 3.0 backport with th=
e
> > > above two cherry-picked?
> >=20
> > I've pushed them to the ubifs-v3.0 back-port tree as well. But I think
> > they are useless - sorry, I was confused.
> Ok i was wondering that logging was causing this cind of behavoir...
>=20
> > Also, if you say this happens when you run ubiformat - this is somethin=
g
> > about your flash driver. Do you use NOR or NAND? Can you detect which
> > interrupt takes too much time? If the theory is that this is your flash
> > driver interrupt - can you verify it by injecting some instrumentation
> > to the interrupt handler?
> This is a arm i.mx35 (pcm43) platform using the nor and nand driver. The=
=20
> mxc_nand driver is loaded later which seems to be around the same time th=
is=20
> message:
> "sched: RT throttling activated" comes up and the ubi on the nand gets=
=20
> attached. I will see what if i can dig s.t. up with the instrumentation a=
nd=20
> will report back.

My theory is that this is related to the NOR driver then. UBI does not
use interrups. UBIFS uses hrtimer so it does have some code which may
run in interrupt context, but all it does - it wakes up a thread and
finishes.

--=20
Best Regards,
Artem Bityutskiy

--=-Wkr7OHUBvJ+52XZJ5gue
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFCBDAAoJECmIfjd9wqK03VkQALBHjZRSulXAphIMTJTQEnOs
dkmEkc/o2cNJ70v0bsjR5GmZKlVAa3m5F+UKXlDLRp95CaB9lGbALl2di/IbMX11
RSt0RM80ijogrbNOXNowrqqbINpkdUwzGXmYxfRtKKlgONEValx1OorG8BS3Vdpz
lF6uSxYj7nLeiKfe4xihNJBasmVFf1az4A1PSTAJMJeZJKLp6KVWg6f66PP0M9Fd
WmFe4qyP4/unLUrB2HwLv16kTsRIiTyortXbkoni/mLKYXwPymLErNs+c1/H3znk
bZXRKSXWy2n132T8JvXCrEVxEfFPj4R3Su9f0SoJ4B0SgP2WL/V2RkTSob9Sqe0U
pWrL+bN0BHh6Ap3OuKojwOIUn3M99kmtmNcxdkL3aYtQAUelVk4xvv68M7qb0vk8
NfCZGyYAxurg8z4X6JQCyI1sz61tY5nkeidsHRWtoN77YdHY1U0xt5BlAyX+1mNZ
Pnvco+rd3I4/NegwkdnycUiyVjIujJTNUf1EmUetTqaqRJf2WDH6mt8AkNQa8QJY
80NYaOv12wt7HM8UwMLev5+3eGCkYENFyYMwdZbItoHSyAXE5yGAz6fpF/KKPFkd
f9K97Nw6K+C5gzbUylmvdgDavM5t2yMBfOWd8JxVgDkqRd7G7yF1wM+3Z1b1t0yV
GHRwPor21TQYWTmfcnrM
=Z2Au
-----END PGP SIGNATURE-----

--=-Wkr7OHUBvJ+52XZJ5gue--
