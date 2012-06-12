Message-ID: <1339498176.2401.27.camel@sauron.fi.intel.com>
Subject: Re: [RFC PATCH] MTD: nand: add return value for write_page()
 function in structure of nand_ecc_ctrl.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Tue, 12 Jun 2012 13:49:36 +0300
In-Reply-To: <1339153855-3761-1-git-send-email-josh.wu@atmel.com>
References: <1339153855-3761-1-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-5MZSAXLbdx9v3o7sfTPO"
Mime-Version: 1.0
Cc: bryan.wu@analog.com, jack.lan@freescale.com, nick.spence@freescale.com,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, scottwood@freescale.com,
 Dipen.Dudhat@freescale.com, tglx@linutronix.de, tie-fei.zang@freescale.com,
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


--=-5MZSAXLbdx9v3o7sfTPO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-08 at 19:10 +0800, Josh Wu wrote:
>  /**
> + * nand_write_page_none - [INTERN] raw page writen function with return =
value
> + * @mtd: mtd info structure
> + * @chip: nand chip info structure
> + * @buf: data buffer
> + * @oob_required: must write chip->oob_poi to OOB
> + */
> +static inline int nand_write_page_none(struct mtd_info *mtd,
> +                               struct nand_chip *chip,
> +                               const uint8_t *buf, int oob_required)
> +{
> +       nand_write_page_raw(mtd, chip, buf, oob_required);
> +
> +       return 0;
> +}=20

Thanks!

Would you please also make the wrtite_page_raw call-back return an error
code - it is just strange to change '->write_page' and avoid changing
'->write_page_raw'...

P.S. Not sure we still want these baroque header comments, but this is
just a side note and separate issue.

--=20
Best Regards,
Artem Bityutskiy

--=-5MZSAXLbdx9v3o7sfTPO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP1x7AAAoJECmIfjd9wqK0vioP/1LYY7pGj10BK3MST1RBxPES
ArGtFpaAAf1POoWoYbA9nluxdU4r8wlNrCl1Lbs2kpnsEEZTOeNbcis2RM/v19xW
5oWyin3+vRDEPKMz34xrHnSqLxmJPex1wwk49AXG7WvdOWLT/mWuCeUjW0SBl04j
13nL8sDoGwsEAJl4exL5uUdWFgLuBNivhJqtYdHkHNnW2F4eJF7qMGy8uNrjxUTT
IotQ/YLpYCdAyzJPHfedAboOygycv2yY/ceJl077xwAwto7n/EffHo6XlgbDrhED
kZDJ4n5otruvu7mM1hrSdKwssdKn0wdowEJ+xj4PeS83qNJB0YSB+OKGN3VtjDYE
Zvqch18woAjOYaLCgXGm6NRSwkMTqWQqc0dU+jygiIBnuoFETpEvKr8byiFGeFD8
zYrqm5iIhcdbXH03kRddVTjANpR3PoalrO5frprCyWBGa61qBXsxb5qcM+iaJM6c
YbNTYOM+Xgl1tGxdP9JRLBGfFg7SeB3t7stF8iy5QlfM3TKYzWOUWgRKdO5DBP6H
N5Ss7y5vSok0nE2Kt943hD3Ttl1mJC7oEZZWtVoEAyN47HkrJFDL0X5kkCuWUgrQ
ycTmuO8dRSD+5L658CwbJuN4Mk9PRoaCkRA00mFsdyrND0uGN07OcWABqegraNxa
Gvfzr+TykaFMebCAF+op
=rxPo
-----END PGP SIGNATURE-----

--=-5MZSAXLbdx9v3o7sfTPO--
