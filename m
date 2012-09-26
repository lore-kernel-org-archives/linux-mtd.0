Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGmHF-0005Pd-12
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 07:43:25 +0000
Message-ID: <1348645410.24309.25.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] mtd: prepare place for BCMA NAND flash driver(s)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Wed, 26 Sep 2012 10:43:30 +0300
In-Reply-To: <CACna6ryBwu3BFH=4PrmqnvL1qQdk5xcVCKb2=7UrCSpsvmpK5Q@mail.gmail.com>
References: <1347481275-995-1-git-send-email-zajec5@gmail.com>
 <1348645171.24309.21.camel@sauron.fi.intel.com>
 <CACna6ryBwu3BFH=4PrmqnvL1qQdk5xcVCKb2=7UrCSpsvmpK5Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SK5BiRRFv/O8CfhPfRdr"
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


--=-SK5BiRRFv/O8CfhPfRdr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-26 at 09:41 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> 2012/9/26 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Wed, 2012-09-12 at 22:21 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> +config MTD_NAND_BCM47XXNFLASH
> >> +     tristate "Support for NAND flash on BCMA bus"
> >> +     depends on BCMA_NFLASH && BROKEN
> >> +     help
> >> +       BCMA bus can have various flash memories attached, they are
> >> +       registered by bcma as platform devices. This enables driver fo=
r
> >> +       NAND flash memories.
> >
> > Could we please merge only non-broken stuff upstream. I understand your
> > intentions to merge something non-working first with a promise to make
> > it working later, but I do not think this is an acceptable approach.
> >
> > Why exactly you mark this one as broken? If it is R/O so far, and
> > reading works, and you tested it (how?), we can merge it I guess, just
> > make it clear that it is R/O in Kconfig help text.
>=20
> Yes, BROKEN can be dropped from this. I'll resend correct patchset
> after checking it with verify/aiaiai (i'm almost done! :) )

Great, thanks. Do not forget to tell about R/O in the Kconfig text
please!

--=20
Best Regards,
Artem Bityutskiy

--=-SK5BiRRFv/O8CfhPfRdr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYrIiAAoJECmIfjd9wqK0fqEP/33FGJ6qiVzVzbg8v5/vgW7a
t78W3CzLjDI9NRHVkyIsjFTuk89B20KXZAkT3yUYgGORMpgCF7WUB2m5NC30MeN+
uKr8gr5TheV9ZQEe7MuOnGqq54BHVYngxE74cYu8umvqhx1FuckDUKtDGC2WmsDB
PFiTS9Na+w5dsWkCriCHk+lshhNnA5x1EyJl8602yIST5T2dofdvGMrvvSfrcBwU
PLD8D1tQ6sqZiKAqNVTcb0f7LW9RpwjcY/PJrnu4hLEnhmvV4ibBlejH3Pu+u/fN
CgkU9wUk/sGqF9elpgs/ipboxBn4eIqym5SgfJKPRDpkHh9q/LBguKLThfgM9Ycr
5nQtPpClcHyf4mKcP/vJuGQDSGZjD05o2haLLQgkPz8l4980ytI8UYUzkV8rdBHB
SI+4mWShGjfl3MhQMGMGku3lE35ulb1Nrwa3TbV4tqjovvC4AU1XtQaA7wX0qIUc
qs6S0dp9Q9jDeJl7ScLMzqDBLpGAekTS9j7/GgD6kqwhqVnYOQKIo3Gkuj+3L+fh
+PV1lVzkTCqnO60kKoxt+w7/arOs4Rr6uCvsPsmbG0Xny2Acow+QE9JHdmgqx0+Q
oKfd8d88a6RWFOXFmKjZgzE1RNkwMrE+u5NfKjuT4KAGF4fH10ZMAUcE8qs9ob/P
XqpIseJQPNDaA49tq392
=5BlR
-----END PGP SIGNATURE-----

--=-SK5BiRRFv/O8CfhPfRdr--
