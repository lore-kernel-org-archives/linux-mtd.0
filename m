Message-ID: <1338993390.6875.63.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6] MTD: LPC32xx SLC NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roland Stigge <stigge@antcom.de>
Date: Wed, 06 Jun 2012 17:36:30 +0300
In-Reply-To: <4FCF68DE.6000701@antcom.de>
References: <1338974414-5308-1-git-send-email-stigge@antcom.de>
 <1338989921.6875.50.camel@sauron.fi.intel.com> <4FCF68DE.6000701@antcom.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Ef4+bn1I7oqMnE/pAFFN"
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


--=-Ef4+bn1I7oqMnE/pAFFN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 16:27 +0200, Roland Stigge wrote:
> >> +#else +#define lpc32xx_nand_resume NULL +#define
> >> lpc32xx_nand_suspend NULL +#endif
> >=20
> > 0, not NULL.
>=20
> Can you please point me to an explanation for this? NULL sounds

Right, sorry, that was incorrect.

--=20
Best Regards,
Artem Bityutskiy

--=-Ef4+bn1I7oqMnE/pAFFN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPz2ruAAoJECmIfjd9wqK0AhsP/Rl8yELzehgMokWZaJPv4sxY
TX4yqAqO7Jd2T4VFnjj8z84dXcYsHuFgYsJPmEtn9pLwmDC85FMQZTSNz5mTYxZe
9sElONk5SD3qEa6WsOzqbQ2ehnIA9/7o0kq8qNV/z92OTwrQtD29VlY7u1ENF4dY
2q/RUZozxAYIeQZ/kSqBwSV2aErbcTX8CiltYGXboRqA1BPSVGtOkDAPC/tZJNM2
OlF7AaCAUAdUcGxJvPrH2L1vU8+ctnJwn2raZrEkeZQWMudryWPtNd95UZ5IV79z
Y8x+O64XG0RZxa+P0gGmwukORfpRDj8qayEbnmM3blzWwlB8IvA6dd0OLLY0wTXy
ffQGT2vgG1G2XCOGfkPF6VEkuDRDgeF4nwydm7WLjpbRZLA0zqjo5cv+MaFx/mek
le3pkuZiZPb9CALIDzuCX0Xd/oRONRRdGRBymVN9+8RhYCHLuwPPQdzgCTJPIPwG
+HahoagrheSuheiG6Rvsesa2tgjnePf71Y0UsP/mXr9nGG2S0WMaYnKx/BcI0lEL
MnrhIQ1ItnYw10rkYdNS9cUXiUPB75YZm4xjh4YHcypnAWZ1oJv0MmBESEewEXwM
mJwqZrfPgOdelgiJukSAjKivvUhkIguan7rKyc4FTi06AaETYnybhJ8lqcYT9I3L
3V7M12mj7jX8bLgyUzzn
=wGXp
-----END PGP SIGNATURE-----

--=-Ef4+bn1I7oqMnE/pAFFN--
