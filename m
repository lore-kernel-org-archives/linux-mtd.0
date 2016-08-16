Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZiuG-00029H-CF
 for linux-mtd@lists.infradead.org; Tue, 16 Aug 2016 18:16:09 +0000
Date: Tue, 16 Aug 2016 19:15:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, vikram.prakash@broadcom.com,
 andy.fung@broadcom.com, jon.mason@broadcom.com, jchandra@broadcom.com,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Message-ID: <20160816181536.GX9347@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-3-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KG+zyBxh8BrwB1om"
Content-Disposition: inline
In-Reply-To: <1469830393-13295-3-git-send-email-kdasu.kdev@gmail.com>
Subject: Re: [PATCH v5 2/8] spi: bcm-qspi: Add Broadcom MSPI driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--KG+zyBxh8BrwB1om
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2016 at 06:13:07PM -0400, Kamal Dasu wrote:

> +static int bcm_qspi_transfer_one(struct spi_master *master,

> +		if (qspi->next_udelay) {
> +			udelay(qspi->next_udelay);
> +			qspi->next_udelay = 0;
> +		}

Why is the driver manually implementing delays in a transfer_one()
function?  The core will add any required delays between transfers, this
will result in us delaying twice.

> +		read_from_hw(qspi, slots);
> +		if (qspi->cs_change) {
> +			usleep_range(10, 20);
> +			qspi->cs_change = 0;
> +		}

Similarly here, the core will do chip select changes.

> +	if (spi_transfer_is_last(master, trans))
> +		hw_stop(qspi);

The only thing I can see that looks like it might make a difference here
is this hw_stop() operation but all that does is update an internal
state machine so there's no limitation on it needing to be done before
the above operations that I can see.

> +	ret = clk_prepare_enable(qspi->clk);
> +	if (ret) {
> +		dev_err(dev, "failed to prepare clock\n");
> +		goto err2;

Please use named labels rather than numbered, it makes life a lot easier
if anything gets changed.

> +EXPORT_SYMBOL_GPL(bcm_qspi_probe);

This needs some explanation or to be added along with the user.

> diff --git a/drivers/spi/spi-brcmstb-qspi.c b/drivers/spi/spi-brcmstb-qspi.c
> new file mode 100644
> index 0000000..c7df92e
> --- /dev/null
> +++ b/drivers/spi/spi-brcmstb-qspi.c

This should really be a separate patch, it's a separate driver and very
surprising to find it here.

--KG+zyBxh8BrwB1om
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXs1hHAAoJECTWi3JdVIfQInEH/3EUS1oTuq6t2M3JOjf59Bmt
ZoDUGOiL41sBtjo74JG1LEUB4ue3Zqjxzkz0t7P9hmXv9Qqq8Y3baPFHELLbkhe5
OsTLDJnuvrrkdN9i+OCUizW7FSb9qLPpvE+b2UOHLxyitzSwie7kSbFCb0DwbA4G
WvRT2LdPuHVRSfCW/ai/n4NWU51NEQLiZZBEUd1vB7QQGofJSiSiW5XH5jX8U6gl
Wh/daHQNIplLcziHfAFWEPDAYxIDvULMp/5URVbJR2LTjt7wlPVRlmIP1CtlVpmF
8PY5Av5nbmtLi+mwxiGUmCvn0eQbfNDkBKyMQ2vJoi+0dnN/NmeYicfdz7NTpus=
=N3sm
-----END PGP SIGNATURE-----

--KG+zyBxh8BrwB1om--
