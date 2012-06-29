Message-ID: <1340975067.3070.180.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v10] MTD: LPC32xx MLC NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Date: Fri, 29 Jun 2012 16:04:27 +0300
In-Reply-To: <CAAAP30HZ1Z5U44wLwSEfcaJSLmVp8AbXPTCagS31hnoCy_tf-g@mail.gmail.com>
References: <1340834129-15545-1-git-send-email-stigge@antcom.de>
 <1340973434.3070.168.camel@sauron.fi.intel.com>
 <CAAAP30HZ1Z5U44wLwSEfcaJSLmVp8AbXPTCagS31hnoCy_tf-g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-B38n0FokRUfCGVsXP7DU"
Mime-Version: 1.0
Cc: Roland Stigge <stigge@antcom.de>, srinivas.bakki@nxp.com, lars@metafoo.de,
 linux@arm.linux.org.uk, linux-doc@vger.kernel.org, leiwen@marvell.com,
 devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, b32955@freescale.com, linux-mtd@lists.infradead.org,
 hechtb@googlemail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-B38n0FokRUfCGVsXP7DU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-29 at 09:56 -0300, Alexandre Pereira da Silva wrote:
> > @@ @@
> > +drivers/mtd/nand/lpc32xx_mlc.c: In function 'lpc32xx_nand_probe':
> > +drivers/mtd/nand/lpc32xx_mlc.c:679:10: warning: variable 'sr' set but =
not used [-Wunused-but-set-variable]

gcc 4.6, aiaiai uses W=3D1 when building.

> > +drivers/mtd/nand/lpc32xx_mlc.c:561:24: error: bad constant expression =
[sparse]

This is sparse, not gcc.

--=20
Best Regards,
Artem Bityutskiy

--=-B38n0FokRUfCGVsXP7DU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7afbAAoJECmIfjd9wqK0hNIP/1RyhN3l041+KGPGjWa9LSxP
slXQ5VinUb2uYcmruYPkTTcCMI+sXSxMwv0FwX5JyQxEKumtcBlYDFLeAc2e9eyG
vyhY0jwvtZBluqWqw0qcq3eFulbkAAhGT2kXBDMhJT/JoUQB46gnyExdlSNS99p2
CFCPirg5VQbDeZGVNUKN/Y9AAjq8PDx8noPieIlzpRRn2vjFHwaGacDSFkvSw2MH
rrmL25ZRT8vfpig7m+1pTpVBBWT5d/LV/T0ag11kujbblyypazQyIQfh8KgpzTAS
wl+OKMLVnB9UjJUKjOJ6BxMTJFeIjOB4P2f9/rOeUWoV4Ogu4gcabqfxFtyI2REQ
rb3eHPiyGfyTXvrw8yw9MqYuyu9zYw+pigMeyaQEZ0PvMFVfMCBSBY2tBoZMC0q9
4oxq7Q5hqaBSAbF3xJc7KxEcBnF4E1S4bPzbVu5JNJdbG+BJ5diCesHMJTON5PNj
WPdavmX75q6a4FTAVupS9lI428WoWh7YQYEsLZZkeIfL1zjJbJylEUw/yfYzisuD
4AvbauEQU8JCiWqFvAAb22j1K0KnKS3AHm4Ym9ikp3T+4M2A58ch0eGWYNnY8aSA
ibAlvC4jDx8fuAtOjZiOHJjlpMl1b+MhsEWhFzOdtQZPSXhNqBz7Ulm61vuCopYe
H15CFragPXRWILi9nb4T
=5mS7
-----END PGP SIGNATURE-----

--=-B38n0FokRUfCGVsXP7DU--
