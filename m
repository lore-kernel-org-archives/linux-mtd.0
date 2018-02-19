Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1enlte-0001sg-6M
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 13:54:23 +0000
Date: Mon, 19 Feb 2018 13:53:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>, Vignesh R <vigneshr@ti.com>,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [RFC PATCH 1/6] spi: Extend the core to ease integration of SPI
 memory controllers
Message-ID: <20180219135357.GE32761@sirena.org.uk>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-2-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Content-Disposition: inline
In-Reply-To: <20180205232120.5851-2-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2018 at 12:21:15AM +0100, Boris Brezillon wrote:

> Some controllers are exposing high-level interfaces to access various
> kind of SPI memories. Unfortunately they do not fit in the current
> spi_controller model and usually have drivers placed in
> drivers/mtd/spi-nor which are only supporting SPI NORs and not SPI
> memories in general.

> This is an attempt at defining a SPI memory interface which works for
> all kinds of SPI memories (NORs, NANDs, SRAMs).

It would be helpful if this changelog were to describe what the
problems are and how the patch addresses them.  Someone reading the git
history should be able to tell what the patch is doing without having to
google around to find a cover letter for the patch series.  It also
feels like this should be split up a bit - there's some preparatory
refactoring here, a new API, and an adaption layer to implement that API
with actual SPI controllers.  It's a very large patch doing several
different things and splitting it up would make it easier to review.

I have to say I'm rather unclear why this is being done in the SPI core
rather than as a layer on top of it - devices doing the new API can't
support normal SPI clients at all and everything about this is entirely
flash specific.  You've got a bit about that in your cover letter, I'll
reply there.

> @@ -2155,10 +2181,14 @@ int spi_register_controller(struct spi_controller=
 *ctlr)
>  			spi_controller_is_slave(ctlr) ? "slave" : "master",
>  			dev_name(&ctlr->dev));
> =20
> -	/* If we're using a queued driver, start the queue */
> -	if (ctlr->transfer)
> +	/*
> +	 * If we're using a queued driver, start the queue. Note that we don't
> +	 * need the queueing logic if the driver is only supporting high-level
> +	 * memory operations.
> +	 */
> +	if (ctlr->transfer) {
>  		dev_info(dev, "controller is unqueued, this is deprecated\n");
> -	else {
> +	} else if (ctlr->transfer_one || ctlr->transfer_one_message) {
>  		status =3D spi_controller_initialize_queue(ctlr);
>  		if (status) {
>  			device_del(&ctlr->dev);

This for example feels like a separate refactoring which could be split
out.

> +	if (op->data.dir =3D=3D SPI_MEM_DATA_OUT)
> +		dmadev =3D ctlr->dma_tx ?
> +			 ctlr->dma_tx->device->dev : ctlr->dev.parent;
> +	else
> +		dmadev =3D ctlr->dma_rx ?
> +			 ctlr->dma_rx->device->dev : ctlr->dev.parent;

Please don't abuse the ternery operator like this :(

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlqK1vQACgkQJNaLcl1U
h9DUDgf8C7HSlJkXx8tPONghpcW9dYpUtixzw2psz5xETn9EXPJEAo2i+TZwokF0
zXt0NPzQxoGnhd6BmqH0QZHbFqzLcn90nQ4YVarXdPXDtZ7nFxIyKmo8PeukaOuO
6AqDyn3q6Gc07Hb+RDWPX9JQF70qEyJ2HGmOmNl0TOmKG7AB9ke73nfTsWTWqi9m
irnnwzGs1jvNzcFM73ydH9xli6zFut0aeo/NYLNX7nVFL7UoVa5KMW1zHyS4RC32
b0gRaPSTqTtkbG7fsJB7mB9jgxSt64cnud5CbgdYQEuHzmzL9+K0lniIGosgHtNc
Tb6Go3Mtz7jINrYrSCZARDj43q6uPA==
=NZc4
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--
