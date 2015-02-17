Date: Tue, 17 Feb 2015 10:47:44 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150217094744.GI25269@lukather>
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
 <87oaotaa6r.fsf@free.fr> <20150216205825.GG25269@lukather>
 <87k2zha69p.fsf@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="2nTeH+t2PBomgucg"
Content-Disposition: inline
In-Reply-To: <87k2zha69p.fsf@free.fr>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--2nTeH+t2PBomgucg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 10:36:02PM +0100, Robert Jarzmik wrote:
> Maxime Ripard <maxime.ripard@free-electrons.com> writes:
>=20
> >> I don't think an mdelay(256) is acceptable.
> >
> > That's very true that this driver would need some love, but
> > valentine's day was last week.
>
> That doesn't cope with the 256ms mdelay. And a potential big mdelay
> is not what I'd call a bug fix, see below.

I really don't care about the delay itself, really.

Just splitting the readsl into several chunks seems to slow the FIFO
draining enough so that we don't even need to poll the RDDREQ bit.

I was asked (rightfully) for a timeout, and since there's no
particular indication in the datasheet on this, I came up with a
totally random and made-up number. If you want to suggest any other
random number, I'd be happy to use it.

Plus, saying that this is strictly equivalent to mdelay(256) is just
bad faith. It is a (very very very unlikely) worst case scenario.
During my tests, I've never experienced even a single delay being
used, let alone every single reads needing to poll the bit for 5ms,
always succeeding at the last attempt.

If we really care about this, we might as well start caring about
other theoretically possible situations, such as the NAND chip being
ripped off the board by an asteroid.

> > I'm sorry, but this is a patch targeted for stable. This is a pure
> > bugfix. I won't rewrite the whole driver solely to make the driver
> > better, especially since that would make such a patch (or more likely
> > a whole serie) unsuitable for stable.
>=20
> This is the rewrite I was asking for (not tested), consider it against yo=
ur
> "rewrite the whole driver" :
>=20
> 	Modified   drivers/mtd/nand/pxa3xx_nand.c
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index e512902..6e569e9 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -576,11 +576,20 @@ static void start_data_dma(struct pxa3xx_nand_info =
*info)
>  {}
>  #endif
> =20
> +static irqreturn_t pxa3xx_nand_irq_thread(int irq, void *data)
> +{
> +	struct pxa3xx_nand_info *info =3D data;
> +
> +	handle_data_pio(info);
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
> @@ -622,7 +631,7 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *dev=
id)
>  		} else {
>  			info->state =3D (status & NDSR_RDDREQ) ?
>  				      STATE_PIO_READING : STATE_PIO_WRITING;
> -			handle_data_pio(info);
> +			ret =3D IRQ_WAKE_THREAD;
>  		}
>  	}
>  	if (status & cmd_done) {
> @@ -663,7 +672,7 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *dev=
id)
>  	if (is_ready)
>  		complete(&info->dev_ready);
>  NORMAL_IRQ_EXIT:
> -	return IRQ_HANDLED;
> +	return ret;
>  }
> =20
>  static inline int is_buf_blank(uint8_t *buf, size_t len)
> @@ -1688,7 +1697,8 @@ static int alloc_nand_resource(struct platform_devi=
ce *pdev)
>  	/* initialize all interrupts to be disabled */
>  	disable_int(info, NDSR_MASK);
> =20
> -	ret =3D request_irq(irq, pxa3xx_nand_irq, 0, pdev->name, info);
> +	ret =3D request_threaded_irq(irq, pxa3xx_nand_irq,
> +				   pxa3xx_nand_irq_thread, 0, pdev->name, info);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to request IRQ\n");
>  		goto fail_free_buf;

While I agree that this change would be needed, it is still not stable
material, so both patches will have to go through separate ways (and
one will live without the other).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--2nTeH+t2PBomgucg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU4w5AAAoJEBx+YmzsjxAgb60QAKJUjWGw+TTJCz938czgKuy/
+7zJxcz/OlWIEx+4IVpa2bQwkJOffvem6CQ4Si0VBTjKJdIXfm3C/rqoLE3zLjvP
AzfOgkMvCxgYTS2Cr/6v2ONCimiWgBwQN5mZ/BQ8+hZHwKYmDjuEBqajndK9OloT
7vqmgQxNGp2O/ZyyECCCYNBtyiPGIjlhVX0jIg+enutGP5zG8VmCo+aMIhBxZbtB
gssff1Qvjqv6Y4pz3XEKJQSMpUDWewtz2ROw2zrHHZ21avQOfQnWNqpPWZpAWGOz
rEZFvMGFYwJW2cxt2vsXDnSqkVXoGIo8WUb3nklr4TAo/2GpA6UXx76b334az+zM
j4yn1LoBZM04O0R+97pcgljfqrKi+GxA/VvOd91k6hx4RXOa8fpmNePDn5T+M1Ld
ZAPymZbNixELGJVDtg6AKazI5yGKeAbMuGV444M5Qrvc+hsDwHGiZtTGU5b/hHF+
EmA/64aMegE5rlBaR9Irh/8PoQ6pirBp8nejvEm7wMVOTKEDwthh+wdxt6VwtAKu
ldJ4t855V2n7Jh12qLKSyfhah3+hvCQ7GQLNi9/tBRXSM7/foyqHTODI9vB2tPz2
yql1IhhYa1Ecc8e2oaCTjc0T0HfLesSCJdZHf83Za8aLT7xcPd1ghmGgKqyYVDvN
c51LdsxSqx2+NLpMrXNo
=4Xsu
-----END PGP SIGNATURE-----

--2nTeH+t2PBomgucg--
