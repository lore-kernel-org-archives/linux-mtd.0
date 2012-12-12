Message-ID: <1355325103.3400.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: gpmi: reset BCH earlier, too, to avoid NAND
 startup problems
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Wed, 12 Dec 2012 17:11:43 +0200
In-Reply-To: <1354740362-20412-1-git-send-email-w.sang@pengutronix.de>
References: <1354740362-20412-1-git-send-email-w.sang@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uMIMS8Ua1vh5vE/RZyi1"
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <david.woodhouse@intel.com>,
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


--=-uMIMS8Ua1vh5vE/RZyi1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-12-05 at 21:46 +0100, Wolfram Sang wrote:
> It could happen (1 out of 100 times) that NAND did not start up
> correctly after warm rebooting, so the kernel could not find the UBI or
> DMA timed out due to a stalled BCH. When resetting BCH together with
> GPMI, the issue could not be observed anymore (after 10000+ reboots). We
> probably need the consistent state already before sending any command to
> NAND, even when no ECC is needed. I chose to keep the extra reset for
> BCH when changing the flash layout to be on the safe side.
>=20
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Huang Shijie <b32955@freescale.com>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: David Woodhouse <david.woodhouse@intel.com>
> ---
>=20
> Would be really great to have in 3.7. Also a stable-candidate IMO.

Pushed to l2-mtd.git, thanks

If you believe this is suitable for stable, please let me know.

--=20
Best Regards,
Artem Bityutskiy

--=-uMIMS8Ua1vh5vE/RZyi1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQyJ6vAAoJECmIfjd9wqK04noP/RlBK5y8+si/3XCknOeBvC4U
SF1XDLjY5KOvIJVB4t91Te2lXWNmxX1JRIKP3yQPFkTzjkfO4lhvfrz1KHEVTkbI
k9aRT6zowdVfX4u2X+a1UhBG/Mb0SjAmCXNYtxyY3MibBWGXBiMSzSyw92kgx+X9
nbRNwwCa15iY8NMV73BJ6LRRoTYov+gAdvTEJ8w18CFCf5A4dUKd/fjBWnRYfprV
QSaCofogJ7Y9GY7zP48cpjeMM/MiuWDaA3hQRswl/QBAZbkK3/whNLe3RPhizKxz
t4qnnLU4XTttBK8w09uBPLVDhRCAk5D9tETsMj85TvOyfqOF2LnWHLqimbNCIOiG
dhi4dx6rtKe7xQpIetz8v/csjDJKEqcaWRu5IHyyraBJErlgzzW68W4/uSV90A6g
s7MMPuocZTKSqEELFMX8KAiw0sMJghNeZrhbG3PHa1/BEKJ7fQob4VBLON0BsGl7
CWsJTnSvAdB15EMS6nozSsksnvIdXfqS5EjcJjwfCDADy3BSeO+MwFOTk3pdSofL
2y3hSNqSUCYZmvwU+mH+cZ4XKSlPaq04o76nwJ2y1IYn8xflrvDYWg4DQj9k+4q5
mZZydSbzGcf+tdeVAU4GE5IoANK2AM9hU6MF9eoaE//XQ2e+Z4gRAfu+Be2aEBao
7gXJz09bjUlTPaZtzb+H
=KfqA
-----END PGP SIGNATURE-----

--=-uMIMS8Ua1vh5vE/RZyi1--
