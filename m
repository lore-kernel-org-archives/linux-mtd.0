Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXD3o-0003u4-I4
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 14:28:57 +0000
Received: by mail-iy0-f177.google.com with SMTP id y26so24504iab.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 06:28:56 -0800 (PST)
Subject: Re: [PATCH] mdt nand: omap2+ use platform options
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 04 Dec 2011 16:29:57 +0200
In-Reply-To: <CAN8TOE-YkQvm76ZXxh-CBF05y6BoHY+FM95-TtJdAiP0knhZtg@mail.gmail.com>
References: <CAN8TOE9=ux=suwcQMwJY1XUhp_mnD_DL613ffF1-HTL1OVB2PQ@mail.gmail.com>
 <1322557213-23565-1-git-send-email-j.weitzel@phytec.de>
 <1322728943.2332.13.camel@koala>
 <CANOLnOOE3a0BP0TcLnRAmq5YAiHLZTpkbriDh9WtkkBT7TotFA@mail.gmail.com>
 <CAN8TOE-YkQvm76ZXxh-CBF05y6BoHY+FM95-TtJdAiP0knhZtg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-739owEoSIB4eRj37Ri+Y"
Message-ID: <1323009003.9400.64.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: Jan Weitzel <j.weitzel@phytec.de>, tglx@linutronix.de,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 Grazvydas Ignotas <notasas@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-739owEoSIB4eRj37Ri+Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-12-02 at 09:28 -0800, Brian Norris wrote:
> On Fri, Dec 2, 2011 at 2:20 AM, Grazvydas Ignotas <notasas@gmail.com> wro=
te:
> > On Thu, Dec 1, 2011 at 10:42 AM, Artem Bityutskiy <dedekind1@gmail.com>=
 wrote:
> >> On Tue, 2011-11-29 at 10:00 +0100, Jan Weitzel wrote:
> >>> Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
> >>
> >> Pushed to l2-mtd-2.6.git, thank you!
> >
> > This breaks build here, did you really test it, Jan?
> >
> > drivers/mtd/nand/omap2.c: In function 'omap_nand_probe':
> > drivers/mtd/nand/omap2.c:1078: error: 'struct omap_nand_platform_data'
> > has no member named 'options'
>=20
> This is exactly what I was asking already. I don't see 'options' in
> 'struct omap_nand_platform_data' in
> 'arch/arm/plat-omap/include/plat/nand.h', even in linux-next.

Yes, sorry, I've payed not enough attention to the patch.

--=20
Best Regards,
Artem Bityutskiy

--=-739owEoSIB4eRj37Ri+Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO24PlAAoJECmIfjd9wqK0PVIQALjDCOYPZcjGaI9EuFURD1De
AenL4IgO+DLx/ddHW71kY8Q1TZgmgi6iruNpEfSslmJpO8j4hziqvlDPCzUyBtdD
H3vAjCypNaZ3dhQDMQr4ycb3kcQMV0iD5P6BidNCYVMnl7xEgkGT6ISbdwfwqtqR
jBbzzwfLsOKiBFf5VJxRhkXFFitOg8Hy+sOLvI2Z/eKe9e+MJSZhuoVHdpLSFvku
YhkCjHjL6f+CcSo6fLuMTdxCFD5PxT6wydlS/9nMmMnZHsTBRQjn4lIyKu2GLcUL
9tX+eUtnCKeEtnzN4/w6NxuKdCvybHKMZVKaFeNALBPKyQaVTcsc1j+Y9yJwzeLL
QJGrdQQy+ElpFLigdw0rpiQkNBcwB49FJkccZlQcOU7pEtsWMzzWE9Aq7Iz2ERPR
IrAFqdS+tCJxd+AV3CDJvpqWPINsc/gxb2fbvc7nxg2xHZfF0R/+mu3Es8GtqjJ2
uPv2X8Bch/mk2Bd8u83LnBFczibOjfdRL+zVZ0kq6/Zv2yz3EOkzRtGe+N+nosfU
qU9z7L+xedC7x3X1YymZa8kC1u0woEykQ4EOfY6iR6+2KaT9hCgDOPl9nQEuxqMH
2PwtLeOwlGSOicw1OUru1toYQ0TfBTbt5jDFOaoz/rAEWpneS5/tb8f4TlKNy9eE
Cw1L4JUQhTtQcqk2GPVj
=eWTW
-----END PGP SIGNATURE-----

--=-739owEoSIB4eRj37Ri+Y--
