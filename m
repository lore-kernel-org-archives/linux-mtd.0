Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3u73-00071p-RZ
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 23:13:34 +0000
Date: Tue, 1 Dec 2015 23:12:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Stephen Warren <swarren@nvidia.com>, "Andrew F. Davis" <afd@ti.com>,
 Marek Vasut <marex@denx.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Gabor Juhos <juhosg@openwrt.org>,
 Bean Huo =?utf-8?B?6ZyN5paM5paM?= <beanhuo@micron.com>,
 Furquan Shaikh <furquan@google.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Message-ID: <20151201231233.GA1929@sirena.org.uk>
References: <cover.1448988089.git.hramrach@gmail.com>
 <8c34c7790244489c2ce0072c72bd9bc7c4cdb965.1448988089.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2GxxjMFQpcQtANqJ"
Content-Disposition: inline
In-Reply-To: <8c34c7790244489c2ce0072c72bd9bc7c4cdb965.1448988089.git.hramrach@gmail.com>
Subject: Re: [PATCH v5 08/10] spi: expose master transfer size limitation.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--2GxxjMFQpcQtANqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 01, 2015 at 04:51:06PM -0000, Michal Suchanek wrote:

> +static inline size_t
> +spi_max_transfer_size(struct spi_device *spi)
> +{
> +	struct spi_master *master = spi->master;
> +	if (!master->max_transfer_size)
> +		return 0;
> +	return master->max_transfer_size(spi);
> +}

Can we change this to return SIZE_MAX instead (ie, the maximum value for
a size_t)?  That way callers don't need to worry if there is a limit, if
they want to handle it they can just unconditionally assume that a limit
will be provided.

--2GxxjMFQpcQtANqJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXilhAAoJECTWi3JdVIfQK9UH/jE+6AVpFzPt0VbOKZrcz2Vg
v7RRHUgejDpmu1oX/BYWkKtP8s+8148lOXNTH8kXoGEbXbNpFCe9iAv7Y/7YXQx8
fbXnMj+pdJcJGOddZbWbrAkybuJ27gN0zubQP+i3QhP3YOw8qbZHtgJMl2qpmX1/
aWy26urStV//8UnvzPUERIIvf1G77zJuSDuo164tqcgipuw6Y+uBu66ppYHivIxX
RXefE+RIFL3YEJiEdVzVC7DLl0XWjN+Ao6HDGbyUDCn/2PiW9lQuOpUToUxaMMQG
qBMroy5ZZW2md92GniJz1vfzPdUdQB+XZbIqu2TpeLeWv7OlnhlemwfolwHHxLQ=
=O0zK
-----END PGP SIGNATURE-----

--2GxxjMFQpcQtANqJ--
