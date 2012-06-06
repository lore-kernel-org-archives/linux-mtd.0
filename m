Message-ID: <1338990096.6875.52.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6] MTD: LPC32xx SLC NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roland Stigge <stigge@antcom.de>
Date: Wed, 06 Jun 2012 16:41:36 +0300
In-Reply-To: <1338974414-5308-1-git-send-email-stigge@antcom.de>
References: <1338974414-5308-1-git-send-email-stigge@antcom.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4702nwg7fga9mZeThSKX"
Mime-Version: 1.0
Cc: srinivas.bakki@nxp.com, lars@metafoo.de, linux@arm.linux.org.uk,
 linux-doc@vger.kernel.org, leiwen@marvell.com,
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


--=-4702nwg7fga9mZeThSKX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 11:20 +0200, Roland Stigge wrote:
>  drivers/mtd/nand/lpc32xx_nand_slc.c                   | 1060 +++++++++++=
+++++++

Can you please rename it to lpc32xx_slc.c? It is already in the "nand"
sub-directory, no need to add "nand" to the file name.

--=20
Best Regards,
Artem Bityutskiy

--=-4702nwg7fga9mZeThSKX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPz14QAAoJECmIfjd9wqK0V6oQANCYRPLO5K9qalkxC83P9V+A
2LYCUIaXWs0zvNT/Ho+8M+faTu+pBHMlDsknaiG6IaX/uj9AgD/M+pGD4t6A3MgA
OUHtFZhEXEStAak87n5Nfa8+GjDsDGoLfIalhc4LWXTAxlzExcB2+DEdY9xpQtKR
YjplXhEedBbuLEMMp88uX8nLzFvFTQdf888EGLs18N2RqrYy/vVcspGVCmqUYCmo
oglv3tRxS6yCpfHqwv6L8h/lWq29xOmOObQZXzJzMrC6/0t3yRvOTppmsaOMFIiH
WoxhZpC3lvCyyf2qN3Yp0Cpu3FLHVU75vhTYjptiXkugpx7Q69AUIbnJf9L169wN
bONf+iqwxAzbkHmiTxwAOAt/GQSDL4Zl5LZVk6ywxInFpK4YrRwfcclfX/ZEXhGR
Fm7diq2Ng7Vo9ZZClHziatTfcq6FlFGykoMCQrGm4vk3Ck2cUlyHuIfhyQ424nUZ
HL2B+eJk/QVQAcVONXZjeeGwbSWkd8ew7FlGV34OLljdLza7kkkD1gCdrwaRy15p
QjdNipn90vlFtBBReI//ynExJaRog57tZNGZ9guAsfDwWtvDgPKnaOzSfC94cc0B
UeZPXVOD16yoTaCHWI0zNz50X2SQx+dWeNYGXcxjpJ/npWpwLVWJX6AmNYqMhRS1
Au7LogFVYeJysWE5mwlb
=7oQh
-----END PGP SIGNATURE-----

--=-4702nwg7fga9mZeThSKX--
