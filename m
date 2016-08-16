Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZj9t-0007f6-9j
 for linux-mtd@lists.infradead.org; Tue, 16 Aug 2016 18:32:18 +0000
Date: Tue, 16 Aug 2016 19:31:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, vikram.prakash@broadcom.com,
 andy.fung@broadcom.com, jon.mason@broadcom.com, jchandra@broadcom.com,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Message-ID: <20160816183148.GZ9347@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-4-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DHs1QIiRxKbdokJu"
Content-Disposition: inline
In-Reply-To: <1469830393-13295-4-git-send-email-kdasu.kdev@gmail.com>
Subject: Re: [PATCH v5 3/8] spi: bcm-qspi: Add BSPI spi-nor flash controller
 driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--DHs1QIiRxKbdokJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 29, 2016 at 06:13:08PM -0400, Kamal Dasu wrote:

> +	bcm_qspi_bspi_lr_start(qspi);
> +	/* Must flush previous writes before starting BSPI operation */
> +	mb();
> +	if (!wait_for_completion_timeout(&qspi->bspi_done, timeo)) {

The comment suggests that the memory barrier is misplaced or that
there's something missing?

> +		if (retry--)
> +			goto retry;

Please write loops using normal C looping constructs rather than goto
statements, it makes life a lot easier.  I'm not convinced that the loop
is safe as is with the completion reinitializaiton and so on, we should
at least be turning off the hardware before we reinitialize the
completion to avoid races with slow hardware.

> +	io_width =3D msg->data_nbits ? msg->data_nbits : SPI_NBITS_SINGLE;

Normal if statements please.

> +static irqreturn_t bcm_qspi_bspi_lr_err_l2_isr(int irq, void *dev_id)
> +{
> +	struct bcm_qspi_dev_id *qspi_dev_id =3D dev_id;
> +	struct bcm_qspi *qspi =3D qspi_dev_id->dev;
> +
> +	dev_dbg(&qspi->pdev->dev, "BSPI INT error status %x\n",
> +		qspi_dev_id->irqp->mask);

I'd expect this to be dev_err() or something, but then the message
claims this an error status and it doesn't seem to actually read that
=66rom the hardware.

> +#ifdef  QSPI_INT_DEBUG
> +	/* this interrupt is for debug purposes only, dont request irq */
> +	{
> +		.irq_name =3D "spi_lr_overread",
> +		.irq_handler =3D bcm_qspi_bspi_lr_err_l2_isr,
> +		.mask =3D INTR_BSPI_LR_OVERREAD_MASK,
> +	},
> +#endif

Why not?

--DHs1QIiRxKbdokJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXs1wTAAoJECTWi3JdVIfQ3tEH+gP9lEDqm9XEpD9qI7bAvp0o
is104GEg/78Q1Y7yGtLzAxg0G+jc3ola6z2st5xGzCQvaa16HX+eyM8LWfRz69w5
LNceCHkWD0ynkg4qlDkSRbhb1PLQxFRPLNVURmDsVDSgpCyQybjoUfSMdCMVLlfR
sahuj+pNRwZVau8ZrJop3rrSuGr6rlwNhfb97W+JTdfRoAzhDQ+FROCbNBrG7MQb
iWsp81B90UChvK1Ov/vtWNPpruTgeplbQabr9j2HTfLj0eFbNiUQDm1B+8pCgazO
QdDDh+rCG2jI+3mKYyu+u1yZ7h8BekejUwMc2R0QdN/P1qju6V5MHKPXGnmNOkA=
=qbUO
-----END PGP SIGNATURE-----

--DHs1QIiRxKbdokJu--
