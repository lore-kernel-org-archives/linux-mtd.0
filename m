Message-ID: <1328959692.22240.103.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V3] MTD: atmel_nand: Update driver to support
 Programmable HW ECC controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hong Xu <hong.xu@atmel.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Date: Sat, 11 Feb 2012 13:28:12 +0200
In-Reply-To: <1328491977-30448-1-git-send-email-hong.xu@atmel.com>
References: <1328491977-30448-1-git-send-email-hong.xu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-22Q4k/WpYL2OXOkHr5/O"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, ivan.djelic@parrot.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-22Q4k/WpYL2OXOkHr5/O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-06 at 09:32 +0800, Hong Xu wrote:
> +static int16_t *pmecc_get_index_of(struct atmel_nand_host *host)
> +{
> +       int16_t *p =3D (int16_t *)host->rom_base;

I did not really get into details, but you annotate rom_base with
__iomem, and then you have to cast it to int16_t in several - this does
not look very nice.

Could you please CC the arm list? There are much more people who can
give this code a review.

--=20
Best Regards,
Artem Bityutskiy

--=-22Q4k/WpYL2OXOkHr5/O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPNlDMAAoJECmIfjd9wqK0ks4QAMzl7iWrMWZvnrETtSug34u3
TzwosL2FLYwwRkAlZwzI1C3tf6Z1iUaB4Q5O8ThRYGNqrUL1krL66Q9cd4we6z0l
mPuWmhUGFAHjMrMi6GpHsfkpWMIDlwqbZn3oDuBCgD4tX0XbeyE83u7vfeyQ9kcH
COJdWqhniP6Lwz8+/9PRRKHHgvAKlX0DfYg6+ZHCpEIFjnImchWRaV+hu5/2T68e
hXhwEUrsBujFBhj3VL+HjyEGH0lBijA4DtSLNl6pnXOx18TVyrCjuRhWPI4R02cw
2+nmK7aCfNXDbE/t+dCdJPu4zJ9fBaE+u19kgOCvDP5wyCACcehtv2Tl4zw5PLeD
wfj7xXBe8dwYn290nrJ3XxXa9sgxUVeKQOntdkh59bWFtHGySB+IrQeHNy14a/lP
9KkIf3Q8xQlhUG7wUrzNiQ2cWaiHphEpp0zCxBPLCT8MhtypGLcJf8ST09OnNWDd
TtI5Pr7WkVni+m4DDOGhQFjVmd1NInRlvnkdmVGWSnmNYiAPRrGdJE0lursv1C7T
7605MT9fYWzi98S1LWd+iH4qEV9sFwzeuIptldb2/lHx+waWitXqIfSmZH8i9BYi
556MISE6qudxY6LRHeSz1rSYUBvQ0bJKDIuqhIr5DRq7Lqj5hinCfXj+BHvXU6yY
n7hi8bsSanyoPZyoTjR8
=OUR8
-----END PGP SIGNATURE-----

--=-22Q4k/WpYL2OXOkHr5/O--
