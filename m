Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZjIG-0003eQ-9g
 for linux-mtd@lists.infradead.org; Tue, 16 Aug 2016 18:40:56 +0000
Date: Tue, 16 Aug 2016 19:40:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, vikram.prakash@broadcom.com,
 andy.fung@broadcom.com, jon.mason@broadcom.com, jchandra@broadcom.com
Message-ID: <20160816184030.GB9347@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-9-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dWDJ72qfEa57oDWE"
Content-Disposition: inline
In-Reply-To: <1469830393-13295-9-git-send-email-kdasu.kdev@gmail.com>
Subject: Re: [PATCH v5 8/8] spi: nsp-qspi: Add Broadcom NSP, NS2, Cygnus SoC
 support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--dWDJ72qfEa57oDWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2016 at 06:13:13PM -0400, Kamal Dasu wrote:

> -		irq = platform_get_irq_byname(pdev, name);
> +		if (soc && qspi_irq_tab[val].irq_source == MUXED_L1) {
> +			/* all mspi, bspi intrs muxed to one L1 intr */
> +			irq = platform_get_irq(pdev, 0);
> +			of_property_read_string(dev->of_node,
> +						"interrupt-names",
> +						&name);
> +		}

I am confused why we are parsing the interrupt-names property here?

> +	/*
> +	 * Some SoCs integrate spi controller (e.g., its interrupt bits)
> +	 * in specific ways
> +	 */
> +	if (soc) {
> +		qspi->soc = soc;
> +		soc->bcm_qspi_int_set(soc, MSPI_DONE, true);
> +	} else {
> +		qspi->soc = NULL;
> +	}

The variable name "soc" here doesn't seem hugely descriptive when it's
just for the interrupt controller.

--dWDJ72qfEa57oDWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXs14cAAoJECTWi3JdVIfQkvgH/2wU7JcMsOOSEDDIujt9dxW1
Mt5c5K0rpzMG7Q1IXKTqBdGRpq4i1ocmxqgbblp3YEjDLRrygwe5gqXHnxdGtpSj
byNmPopxss8+q+0Sd3MCfOsJD8TTMfRpUrC/rhL05pfr256omQvfKxj/VXYBBIn9
17kjxqlZkCBP2LPQ7bhYNzay0tUpi1a8JxWuV1FxKSSOOFovNdH87wRfrAYvNZOl
CVjur9GEl5a1403lO2F1o0EN2vRwQi7vKXw5qPcTK4/3cg/QuAfBEXspDsmAWIPB
A2FENTootM4StSBno1Jj03DYFl+APv3i7ahQWzFubnz7QY+lDmMC3uqj840BH6A=
=SOBc
-----END PGP SIGNATURE-----

--dWDJ72qfEa57oDWE--
