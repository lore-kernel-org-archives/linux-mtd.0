Date: Tue, 17 Feb 2015 11:37:40 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150217103740.GK25269@lukather>
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
 <87oaotaa6r.fsf@free.fr> <20150216205825.GG25269@lukather>
 <87k2zha69p.fsf@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="AYsPlKobQGgtCvjI"
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


--AYsPlKobQGgtCvjI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 10:36:02PM +0100, Robert Jarzmik wrote:
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

I just gave this patch a try, and it blows up quite badly:
http://code.bulix.org/p96krc-87889?raw

It looks like there's more work here, most likely in the waitqueues
wake up.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--AYsPlKobQGgtCvjI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU4xn0AAoJEBx+YmzsjxAgFJgQAI3MRWw8AJC5h3/73EvQxAQA
XDADOSy2C7oSvvYBHJkcJXTF/teOgO/QdOJwuKLSv3S41y7PVeuS2z1oJFhljGMI
izbNClwxGGt/llxujxN4qkOLTv+UV0RGuK/rCESyzyt7SWfEHJTXUSG7RYsxycJ9
kmaYhO6h7Nzxc6RfXDctmyEAqciuHlWo7DvKVcaRHF/Wac/8vluZLdH1/4CuPaqs
KchgCu2oyzQ7YUsuyn75Gy8P/umB1srj/blM0nkrZ/dbstvTPwcrYRa0ZWJoJRDw
o8P/TCQWMIwE2YUpIc8HPWftiOwyBs8Qan4wcNA5jRQnB5AOxWLyqa61yCd/faTw
WyLYq7GsWzrhDe1HlfdWlrYhixdkKKcBLA24NqbPUO/Du7ZGTN0jyqUTFgnYUIX9
JUCBl16c8YATIV/cUqGmob+3oN8IXxkqwIz189wuqO68AriZxsqOZdswrqYaN2kG
OT33aYAHaIiRuOSmo56qgOv4mEEjBn+Luqhp3QHgR2hueb9kfUbTYnCxBn5qQImE
l/3KS2sG+z79fdunSZLCost+y9Svju74WSKOmecl2xCdTkC/6KLUCv1E/0n5kk+d
4T9W4Xc9AM58WxVc0KDAPRCbwtvufZIKU75khSn5xkaQULledaPE0YxzJLX4JuqD
5gW/Xp6YP7ZYTgmgWg+x
=br9e
-----END PGP SIGNATURE-----

--AYsPlKobQGgtCvjI--
