Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbtBS-0001uR-Jv
 for linux-mtd@lists.infradead.org; Tue, 05 Jun 2012 12:48:27 +0000
Message-ID: <1338900730.2507.49.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: add JEDEC ID for w25q32wd to chip table
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "ing. Federico Fuga" <fuga@studiofuga.com>
Date: Tue, 05 Jun 2012 15:52:10 +0300
In-Reply-To: <1338478732-31992-1-git-send-email-fuga@studiofuga.com>
References: <1338478732-31992-1-git-send-email-fuga@studiofuga.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+V6l5hlBmvNjzYh5eh5t"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+V6l5hlBmvNjzYh5eh5t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-31 at 17:38 +0200, ing. Federico Fuga wrote:
> From: "ing. Federico Fuga" <fuga@studiofuga.com>
>=20
> Adds JEDEC ID for the 1.8V version of WinBond w25q32
>=20
> Signed-off-by: Federico Fuga <fuga@studiofuga.com>
> ---
>  drivers/mtd/devices/m25p80.c |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 7c60ddd..93ea3c1 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -757,6 +757,7 @@ static const struct spi_device_id m25p_ids[] =3D {
>  	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
>  	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
>  	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
> +	{ "w25q32wd", INFO(0xef6016, 0, 64 * 1024,  64, SECT_4K) },

It is w25q32wd, not w25q32wd.

--=20
Best Regards,
Artem Bityutskiy

--=-+V6l5hlBmvNjzYh5eh5t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzgD6AAoJECmIfjd9wqK0PWwQALkYtsly7t3PIy+GarebFe0u
e9LYZxLoIcMTXjs7scN8w3R88hQRL8OMRdafNWm34cyFmk6JVz8p85KGlcaikqbU
ewzjUkAzhTBD16SYqyKnk8couDXMY9AxqBViBbOwB3I1oMHXvY0jVJEWaSWjRR/4
RnKQy6Cn4I66BHLQrGDgkeQFEHf4HfrMxtZ4QFYb/WGVxu/88HQnarZhTBmBFObJ
xHV342/nYZ29b1YhOGFUKjzFGObc+ZYeSW8QNPIGV2DG/irPJ2rKTaX4hUtUjMQ4
FYhKRkoTGx3CC2lBSZXIsEw/+Mt1ugLaKXhZXyEylRTG3Q3ZxN2zrDEe9EH6cmLM
zlKDzI9OLzrU0FAUe807DEiIJo2520vm9MJCJPgqoau54dfEzUMqQhcPzjZW3Qca
tDpZF2KaDB7/V+O0heCYMNMRu5EbgZ3nB3m9tFhqzDMNt47GjM7BuQb4GmiWj/fV
AD0JAdB34nkg/LakvPLKQTO6Li8ZSZw1rEBf8r5cuwqhzG8HKOcnppwCitEFND1k
RJ0keVxti4nn04fnrfaQ+iNK3cEHe34vjpeofA67cs4FKGdDodYJLzGG3Erg63c/
SFjSh466uQw8q8EMDKENapxeei9gWkHwP7uwz2jsThDhka6xUdVc45o7kygeq1zP
CYT1Ts4RRHKSB91p/Qoa
=HQAC
-----END PGP SIGNATURE-----

--=-+V6l5hlBmvNjzYh5eh5t--
