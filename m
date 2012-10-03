Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TJMl7-00064V-Ik
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2012 11:04:58 +0000
Message-ID: <1349262302.2017.141.camel@sauron.fi.intel.com>
Subject: Re: UBI: Fastmap request for inclusion (v19)
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Richard Weinberger <richard@nod.at>
Date: Wed, 03 Oct 2012 14:05:02 +0300
In-Reply-To: <20121003103625.0bbff63c@spider.haslach.nod.at>
References: <1348674710-102885-1-git-send-email-richard@nod.at>
 <1349252745.2017.120.camel@sauron.fi.intel.com>
 <20121003103625.0bbff63c@spider.haslach.nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-J2DZi4I/dIUN2T5csNcw"
Mime-Version: 1.0
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-J2DZi4I/dIUN2T5csNcw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-03 at 10:36 +0200, Richard Weinberger wrote:
> Am Wed, 03 Oct 2012 11:25:45 +0300
> schrieb Artem Bityutskiy <artem.bityutskiy@linux.intel.com>:
>=20
> > On Wed, 2012-09-26 at 17:51 +0200, Richard Weinberger wrote:
> > > UBI Fastmap is an optional feature which stores the physical to
> > > logical eraseblock relations in a checkpoint (called fastmap) to
> > > reduce the initialization time of UBI. The current init time of UBI
> > > is proportional to the number of physical erase blocks on the FLASH
> > > device. With fastmap enabled the scan time is limited to a fixed
> > > number of blocks.
> >=20
> > Aiaiai complains and linux-next build fails :-( Last time I forgot to
> > enable the fastmap kbuild option so aiaiai checked with that option
> > disabled. Now I enabled it with a simple hack (default n -> default y)
> > and here are aiaiai's complaints - there is a build failure for
> > ARCH=3Di386.
>=20
> Build fix for linux-next is on the way into your inbox.
> I'm currently looking at the aiaiai output.

It did not help. I still get:

ERROR: "ubi_update_fastmap" [drivers/mtd/ubi/ubi.ko] undefined!
ERROR: "ubi_scan_fastmap" [drivers/mtd/ubi/ubi.ko] undefined!
ERROR: "ubi_calc_fm_size" [drivers/mtd/ubi/ubi.ko] undefined!

Please, see branch 'linux-next' in UBI to see what I actually tested.

--=20
Best Regards,
Artem Bityutskiy

--=-J2DZi4I/dIUN2T5csNcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQbBveAAoJECmIfjd9wqK0/b8P/A/y6xZ0yXl8rZ/BXu01V+/E
UleEa2bnQcT/7W2t+5CsV4HKjZcfEdRz+O4HhWRA37PmxsWRxs4EaBUiAZH+plca
QrVpE0eLbfAXJxFnnbAr2x1TONz7O2k+fv7fj+bDmvKkiX0X04Wa//fQRQaOSmpN
zq116Qwn8F+qYYmd6tNa6VHMj2jeI5LeokuNPMLKdRr0JxULGkDlY7HSwfYAA0FH
4aVRyuYXvqTSIsEj4yrRIC2Ai2Q2c6aaHnpC5ZY1h0YdxR1eDzyZr8qTSAKyx/pf
jNuidU7yVo8wKq3KOi4n+fo1058EbCNuc7nyaw0S/ibD7PFzMC2ANU/GOlbWTbpd
cmSyKSB8nUQi6BlhD54keADZQliQ4nEpBiRHyAseOEX48kS+xmOKerUE+JXjUJDf
f6Vt6mNrRLbHfv+qLlFqrqVYqP35iqE292Mmi8DDSglr303j2VjpjOYvy3CWeGvT
KnZEjLo8zU2DE61ZFXAFYg5rOkcp3nGZV3lA3U+zhk1ceagiTXN8cYnd5uBo/8lY
U2ynSnETbA+w71XPWVcdqDqi7/k1W5kowPoJb//EbteuzVXLMbLBKsKGP9jAQs1r
AiiT11cYq7DfaU7a+6gO6zw+k4L/7K9HX/hpDgpP/t4VRJChfqEOFrEcG4SBx87u
z0cK69ez/LYcD7TgFQ84
=9/OW
-----END PGP SIGNATURE-----

--=-J2DZi4I/dIUN2T5csNcw--
