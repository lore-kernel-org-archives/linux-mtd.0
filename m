Message-ID: <1345818199.2848.314.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: kill MTD_NAND_VERIFY_WRITE
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Fri, 24 Aug 2012 17:23:19 +0300
In-Reply-To: <1344998325-3279-1-git-send-email-shijie8@gmail.com>
References: <1344998325-3279-1-git-send-email-shijie8@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-hT6WUK0bwfZaL2w8UGUo"
Mime-Version: 1.0
Cc: tony@atomide.com, paul.gortmaker@windriver.com, julia@diku.dk,
 laurent.pinchart@ideasonboard.com, jamie@jamieiles.com, ivan.djelic@parrot.com,
 stigge@antcom.de, mikedunn@newsguy.com, mcuos.com@gmail.com,
 jkrzyszt@tis.icnet.pl, dbaryshkov@gmail.com, hechtb@gmail.com,
 manuel.lauss@googlemail.com, u.kleine-koenig@pengutronix.de,
 rmk+kernel@arm.linux.org.uk, axel.lin@gmail.com, marex@denx.de, arnd@arndb.de,
 leiwen@marvell.com, s.hauer@pengutronix.de, b35362@freescale.com,
 scottwood@freescale.com, linux-arm-kernel@lists.infradead.org,
 maximlevitsky@gmail.com, fabio.estevam@freescale.com, sbranden@broadcom.com,
 nico@linaro.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org,
 shmulik.ladkani@gmail.com, jdzheng@broadcom.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, aletes.xgr@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-hT6WUK0bwfZaL2w8UGUo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-14 at 22:38 -0400, Huang Shijie wrote:
> Just as Artem suggested:
>=20
> "Both UBI and JFFS2 are able to read verify what they wrote already.
> There are also MTD tests which do this verification. So I think there
> is no reason to keep this in the NAND layer, let alone wasting RAM in
> the driver to support this feature."
>=20
> So kill MTD_NAND_VERIFY_WRITE entirely.
>=20
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-hT6WUK0bwfZaL2w8UGUo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN45XAAoJECmIfjd9wqK0tMcQAKMgHB5HxZLb2D0P6W1t/Kfq
72pu2CGopTqDIAGDfXGZk6eWnDbQ+NMJbf3y4pCeZEGlS2t01Xy5TgOmnIazYzvK
fHKSIkbwYE+y6f29jI5TBoRs/VfdKmIdzyjfYAgbO/jfUkG2iAXUX1YaULX2e6yI
gTZRaH4pFbw7SQKP4G9rWEMl0kapQhEf3QceQywneFf45yf0coV34KkB1GzXsepC
6BSEPRnKxjOOyOHWK/BCOvFrkeb3GRnS4De+AdohDvTcignbcoeTm0SVgGOCFRgu
FB4AV9njDiN+H3gX9IVFJ/uVYMQA0FEEGIgXReKfa3aya3MnYNdc7qtljUGLmLWT
dbScnd03Cx3V+Of+6d6wOKDsI+uiGMq/q1A/bLJ5smeh4hvf5ki+ITEZxhCPncJf
SF5fv8QjcxzzpkdXSwpRtbEfRL7CCcZ9e0jDAzsPqGXsAsiXDDo5PO7FJnC+OlOv
LvR+0WdC7K4ufqX94ozG92pp+A2ZPtd3azmcfYr0iIVNUnw7JDfG1pejPPPrTP/J
gVaig7aQ+4ZBFbVPMNLNhkpaCKCr/aRkG7oR+4xCYuS7P2P8mrEeFskYrfYzkQlG
66WW34kinYYH5NS83z4KJ+xdg5TsH8jpEPJHywZfJLSB5t+KCAi1CYm9HYNBjB/s
NwSLbeXF6trRDtW8Hwja
=reLj
-----END PGP SIGNATURE-----

--=-hT6WUK0bwfZaL2w8UGUo--
