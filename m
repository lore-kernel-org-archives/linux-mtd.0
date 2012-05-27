Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SYci5-0006FK-Nr
 for linux-mtd@lists.infradead.org; Sun, 27 May 2012 12:36:38 +0000
Received: by laap9 with SMTP id p9so1931423laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 27 May 2012 05:36:35 -0700 (PDT)
Message-ID: <1338122182.19389.0.camel@koala>
Subject: Re: [PATCH 09/15] nand: mxc_nand: Use
 clk_prepare_enable/clk_disable_unprepare
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Sun, 27 May 2012 15:36:22 +0300
In-Reply-To: <1337987696-31728-9-git-send-email-festevam@gmail.com>
References: <1337987696-31728-1-git-send-email-festevam@gmail.com>
 <1337987696-31728-9-git-send-email-festevam@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DPJNHmX5Mh4oEsph2v2A"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, shawn.guo@freescale.com, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-DPJNHmX5Mh4oEsph2v2A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-25 at 20:14 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>=20
> Prepare the clock before enabling it.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-DPJNHmX5Mh4oEsph2v2A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPwh/GAAoJECmIfjd9wqK05xYP/i7jo8YKIYRkRxkuBbiX0fdO
LMGg3gHfPpmz2lWr7llV4KVHlXmgFHKfsv4y3sdE2UWE0FnqucG6tXJRig8trqza
NpKOhSWY18Yow2C4C6B6TMOFRE2A2L/vcOVSWMWn/7YpzPhL4hkXaHDJUe3EPfy/
NzBafXR1mMlSpTlPFniWpPTNntAnEWyrEhtbJFIFHzCIFsRHie6JZVJVGblD/8B8
eXduEL2JY3qEJvLe2ueRx8G4QPK467j012e+NgnYvypmb5L9SPnaqhQpgjiJUjBk
+ByDq7+7zruDKWRD1yRB4ZE+h7x14gPrVIVw9VU57qvQI9OdhbFD6lzeIyKLCQM5
2nnFpXlbFbomMvhEI9VcBEyqKiLO2e0g+mozRNJxM6M0PhnSBG9WsZMiUykRQPh6
E1vTJNMoekwoMy6HE6Jm+7e+185MQaMVTbHj2D2WTr5K6XviYo04FCrQndcyc3hY
aoMzMaZhE122BVWhOj1cWaGZuhkmvbRYeU5moREiEpnqQJcc3cbBb60+AT8nXZXw
Tt3qD9eTbaiP/GU1O8W6LqaKJeTdsNcWSSwmevQQov5PP/lrTgmXdl0wnNrejjyu
r1UiTCNKhn/VVs+pu5GOD1rsqdblsfYzmabdrLcEGsTOlD03KQgIZQaegfU7bGmC
ThLHLt0BZ29jT/9QS3mj
=xuXG
-----END PGP SIGNATURE-----

--=-DPJNHmX5Mh4oEsph2v2A--
