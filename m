Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YO1k1-00083T-CR
 for linux-mtd@lists.infradead.org; Wed, 18 Feb 2015 10:20:26 +0000
Date: Wed, 18 Feb 2015 11:16:46 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] mtd: pxa3xx-nand: handle PIO in threaded interrupt
Message-ID: <20150218101646.GO25269@lukather>
References: <1424203617-29431-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="8WA4ILJSyYAmUzbY"
Content-Disposition: inline
In-Reply-To: <1424203617-29431-1-git-send-email-robert.jarzmik@free.fr>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--8WA4ILJSyYAmUzbY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2015 at 09:06:57PM +0100, Robert Jarzmik wrote:
> Change the handling of the data stage in the driver : don't pump data in
> the top-half interrupt, but rather schedule a thread for non dma cases.
>=20
> This will enable latencies in the data pumping, especially if delays are
> required. Moreover platform shall be more reactive as other interrupts
> can be served while pumping data.
>=20
> No throughput degradation was observed, at least on the zylonite
> platform, while a slight degradation was being expected.
>=20
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>

On a sidenote...

> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index 96b0b1d..237c92c 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -569,11 +569,25 @@ static void start_data_dma(struct pxa3xx_nand_info =
*info)
>  {}
>  #endif
> =20
> +static irqreturn_t pxa3xx_nand_irq_thread(int irq, void *data)
> +{
> +	struct pxa3xx_nand_info *info =3D data;
> +
> +	handle_data_pio(info);
> +
> +	info->state =3D STATE_CMD_DONE;
> +	nand_writel(info, NDSR, NDSR_WRDREQ | NDSR_RDDREQ);
> +	enable_int(info, NDCR_INT_MASK);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
>  {
>  	struct pxa3xx_nand_info *info =3D devid;
>  	unsigned int status, is_completed =3D 0, is_ready =3D 0;
>  	unsigned int ready, cmd_done;
> +	irqreturn_t ret =3D IRQ_HANDLED;
> =20
>  	if (info->cs =3D=3D 0) {
>  		ready           =3D NDSR_FLASH_RDY;
> @@ -613,9 +627,11 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *de=
vid)
>  			start_data_dma(info);
>  			goto NORMAL_IRQ_EXIT;
>  		} else {
> +			disable_int(info, NDCR_INT_MASK);
>  			info->state =3D (status & NDSR_RDDREQ) ?
>  				      STATE_PIO_READING : STATE_PIO_WRITING;
> -			handle_data_pio(info);
> +			ret =3D IRQ_WAKE_THREAD;
> +			goto NORMAL_IRQ_EXIT;
>  		}
>  	}
>  	if (status & cmd_done) {
> @@ -656,7 +672,7 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *dev=
id)
>  	if (is_ready)
>  		complete(&info->dev_ready);
>  NORMAL_IRQ_EXIT:
> -	return IRQ_HANDLED;
> +	return ret;
>  }
> =20
>  static inline int is_buf_blank(uint8_t *buf, size_t len)
> @@ -1672,7 +1688,8 @@ static int alloc_nand_resource(struct platform_devi=
ce *pdev)
>  	/* initialize all interrupts to be disabled */
>  	disable_int(info, NDSR_MASK);
> =20
> -	ret =3D request_irq(irq, pxa3xx_nand_irq, 0, pdev->name, info);
> +	ret =3D request_threaded_irq(irq, pxa3xx_nand_irq,
> +				   pxa3xx_nand_irq_thread, 0, pdev->name, info);

Using IRQF_ONESHOT would allow you not to do the interrupt enable /
disable dance.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--8WA4ILJSyYAmUzbY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU5GaOAAoJEBx+YmzsjxAgAs4QAKZ59tojjJWwWgRjbW5eikOO
AQECiWde9Z7NSezu0us6OxtAMEgHXDwa20EpzERa9MhO+NjIAXkeJQczU+QpnkMA
/8KfIF8EXHivEoxlBqzGcdWQcm3ZHxrKjFBjW+z2z/2rGZYbaMcWOOm/UcbQM9sy
DuAxv2wMZ+YufmV+zOLtMOcbLctMia119SNRpQYXeApxt+gAO3SH77H5sy0VGxbM
Avci73VJZTn81ozOGIO/dYR5ExshnLepeyoLkCFF22CkK31vC5UY6U+lZi9jij8E
BoZJ9zrETDtqMbeEgizBv7AKhKo4fm7lcp9ZL2D5dWgkcek4u+NTv1AbCVt9Qdtm
vifQRpQI86f9Wj0wvGnCHUeS/GvWR6/3YPZAUKglmt0//yZ6Ij3dddT03BXciRwL
v5Qf2nz6AfC2SKe/O5yPH+RXZgWteYdP+9R1KfhlTkyraLEA8fR7DxgatNo0E9Lw
ooLlDdwCf3ueXFhsTGf1TOucwwrr6YMgbWBbCpHnHuwvhJVvlZb+PpbAeHYZJThl
5mdCZwxstUeVZPLcU1HH8MdTewSLMnkeyXctKtEQE6NT7uDYNzzvuDH/2mkRWp+F
KMHzykGtc6Jl7n3MlhmPk0bB8pwCKZ36TTbuKo4Rw9S/R/XX1UZkpH2vJR6YKVVa
T9BZpZ2hRB14m+lUZZTZ
=ri5A
-----END PGP SIGNATURE-----

--8WA4ILJSyYAmUzbY--
