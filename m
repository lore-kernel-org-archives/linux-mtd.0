Message-ID: <1340789196.29342.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v11 3/4] MTD: nand: add return value for
 write_page()/write_page_raw() functions in structure of nand_ecc_ctrl.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Wed, 27 Jun 2012 12:26:36 +0300
In-Reply-To: <1340618866-28776-4-git-send-email-josh.wu@atmel.com>
References: <1340618866-28776-1-git-send-email-josh.wu@atmel.com>
 <1340618866-28776-4-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-z0+265ZfC1roM/Q9MfME"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, jack.lan@freescale.com, nick.spence@freescale.com,
 tie-fei.zang@freescale.com, nicolas.ferre@atmel.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, scottwood@freescale.com,
 Dipen.Dudhat@freescale.com, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, plagnioj@jcrosoft.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, bryan.wu@analog.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-z0+265ZfC1roM/Q9MfME
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-25 at 18:07 +0800, Josh Wu wrote:
> There is an implemention of hardware ECC write page function which may re=
turn an
> error indication.
> For instance, using Atmel HW PMECC to write one page into a nand flash, t=
he hardware
> engine will compute the BCH ecc code for this page. so we need read a the
> status register to theck whether the ecc code is generated.
> But we cannot assume the status register always can be ready, for example=
,
> incorrect hardware configuration or hardware issue, in such case we need
> write_page() to return a error code.
>=20
> Since the definition of 'write_page' function in struct nand_ecc_ctrl is =
'void'.
> So this patch will:
>   1. add return 'int' value for 'write_page' function.
>   2. to be consitent, add return 'int' value for 'write_page_raw' fuction=
s too.
>   3. add code to test the return value, and if negative, indicate an
>   error happend when write page with ECC.
>   4. fix the compile warning in all impacted nand flash driver.
>=20
> Note: I couldn't compile-test all of these easily, as some had ARCH depen=
dencies.
>=20
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed this patch to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-z0+265ZfC1roM/Q9MfME
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6tHMAAoJECmIfjd9wqK0UakQAJH51T4MBM9/3AjI6uOsfX7N
JM+EgleS+/pcQb6UQC+tGRFWBxvaFWhx7vAk4RX8Ic4XuXSK70bAmg5dWzmObjTB
uRHgWwQodpnqc7LXzaZDeFR5IfTPbmx2prZowpsBklivoqJPKdbXv0Cixy1iBpT+
V5lJso8IXR8V7o3lYUs3epeVrU0jXUVX1Wezl6QFBzUOGDpy4xFXq6lXa9FRaEtq
tW0v51wg+FHFwy3IrkXnbBz5FKY2uetu41DeaHjhFP1BJRhWRjqhzVBaol+qp/ir
yFrOYPH9uMik30nASIwBtc9CDnL6F0AiMsYBbL2AzMFYVWTV9lQYu2VqKwuv5FgU
9YTVvFpfFIc7GS9SoFcZL7iqT+ERrzrBCoPXOQ7txvwQfTzB0xYwZK3FuXYBJ8Mh
s5Wyyomd/f2B5Yc5z58vv7wstLn9sTUh4TvYqtu0cgiv32LbuTnbbtmEkMW9PaxA
r5SDnR9SyMIbhjHjBgQUDfn8sbuyusI0Xg+K3EyhegoDMXs5t2qKzP3qt4s8TjAB
QEJlnSulYJsaIff15OuX4+jSH0Hoa7MaoiVpXs7kqtS2cZ7jVERVcfz0Cokr4iKx
utdeBC7XlvD+nl+tTnDxW9YlS+/YgNSo2W8hyr3/04qpXWbJh6xKmoK+Qc0jTCxo
psJwAjD3JVIMc8on62sh
=HVpe
-----END PGP SIGNATURE-----

--=-z0+265ZfC1roM/Q9MfME--
