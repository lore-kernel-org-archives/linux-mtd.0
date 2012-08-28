Received: from [192.55.52.88] (helo=mga01.intel.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6LMU-0004UE-RS
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2012 12:57:44 +0000
Message-ID: <1346158956.2848.401.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Tue, 28 Aug 2012 16:02:36 +0300
In-Reply-To: <1343514565-8983-2-git-send-email-festevam@gmail.com>
References: <1343514565-8983-1-git-send-email-festevam@gmail.com>
 <1343514565-8983-2-git-send-email-festevam@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ZmEDGxnpMcFsfRg314Ng"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org, marex.vasut@denx.de, kernel@pengutronix.de,
 shawn.guo@linaro.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ZmEDGxnpMcFsfRg314Ng
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-07-28 at 19:29 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>=20
> When building MTD_NAND_GPMI_NAND as module, the following error shows up:
>=20
> ERROR: "nand_update_bbt" [drivers/mtd/nand/gpmi-nand/gpmi_nand.ko] undefi=
ned!
>=20
> Export nand_update_bbt to fix it.
>=20
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed both to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-ZmEDGxnpMcFsfRg314Ng
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPMFsAAoJECmIfjd9wqK0OqkP/0zE9kshN2+JG8tHFdd+tPgx
CGPoSLMD+EEXkyp6VAxiPOdzGMTt9zbMDo4kJKzxbk9+n0pFmblk7/DgFs7fu0lv
WfG13/2+s3NgTBiLmUV3TgYNRMiNk5T9fte/u5VrDR00zGCCM4U0ghm7ejmQ+UPx
24c2G4PN6uan5Qg8EBKcAYh+8lPUFOf9zl05NmWlXq52ZOedVloSGbbSoniYJTFa
oE2pk/28QEKo9A5tG6t0pwj/QHt3yijxseSs+X1Ani7nTVqV5lS2XkgnJVHQRAyr
yTpO6h8xyAdIoCU67aUFts5snghEZLlycnoFbgb+QyoW5td7Ci5Tia31XX2iNOX9
fQR+MI9Dv5za49E1AC1azOTO1NI+Fq4sNmLHRzWJETHUiIStNyxWEO82DrpKNGx7
qJ7x0tzGlQYBzVc0V0H185QAd35tctAjIE4OFET/oTMLgEy4tP8eIzQk6uQJ/eit
ujlYRzoqUTh5JW9Xvo30J479ktGbRhY/ble0qG7yCZrF35cwYeDKzfTE/c7orFot
+1xDp2YdFc+kPLAFVN+oCBqBlfKZj+oj8nedF1j7CdS+Dr9/cfuUfACrv9zopk7V
szKutTRjxgCkVjZW0VPIWdRJVnHj2SgheBv1thqH5Nu8nWcEnC4mFDqdzWFp2xF1
etMkpktOJhdDAQPmEq0+
=g4UI
-----END PGP SIGNATURE-----

--=-ZmEDGxnpMcFsfRg314Ng--
