Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlFuJ-000805-F2
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 10:30:16 +0000
Date: Tue, 26 Nov 2013 10:29:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131126102951.GX14725@sirena.org.uk>
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-3-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="eMGrAD5L3cjpiKtl"
Content-Disposition: inline
In-Reply-To: <1385451313-1875-3-git-send-email-sourav.poddar@ti.com>
Subject: Re: [PATCH 02/17] spi/spi.h: Add configure from slave support.
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com, balbi@ti.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--eMGrAD5L3cjpiKtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2013 at 01:04:58PM +0530, Sourav Poddar wrote:

>  	void	(*get_buf)(struct spi_master *master);
>  	void	(*put_buf)(struct spi_master *master);
> +	void	(*configure_from_slave)(struct spi_device *spi, u8 *val);

Clearly this is far too unstructured to be useful, this is only ever
going to work with one specific combination of slave and master since
there's absolutely no semantics defined.

--eMGrAD5L3cjpiKtl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlHgcAAoJELSic+t+oim9MAEP/jksyOHV60pekSBgUvF0lDQa
/20gnPmbYp9Z4uCZEiiWXOP7HUhfvngAgVS2d6RuFLf1Km0FJ2Z9d0rs0gAZsvSo
LnzVuSdAMtDgKjjuKqJmpL2DiOtRk9veL8w+D30e5uqjY4R4PWlbnWRAZ2RNwvpn
9pVJHfHdAvKvkgpjCZ7FMIGJbW2hHmgieNP5m5B8TvRS0nycQuoBXwRYsbpLDIKf
Munb9Rg0nibRXUU1EDvx7nBGRETX961nP3Ix9aDvlBkvAihZ4L7+B76VdY0t9Ya6
du92IbzDnDexkkxEgMcVZQmgBJOEz3xwBgv3qsPFzB2spPDzqcR8F9rnsegWUvlM
E+znd+fCesDyE2s3jC2tk7C4vrX5amcZ910hHvvYYRT/Oir3ET37NKugAZ+Y8EHK
RHyjH1BEzdm774fAz8TDena31kzGyMBBZoYDCIqEPeMPkC6PUiOVD9nqMLue/iQF
+pvYTqFKiVz9Q/4KDRhyl2ChCqCPL6wlIXKzVne//1oWWjIT/Sy7PUvbNvQhn8Ga
40joh9duOjS7ND2gA2FLV07OdchctHiKnbcQGfXegWGagWLTx0X/IdX7RE/Jof0g
hG9+NInn+XNMXNfbq+xw5PPEOqMI4BxLE/HcIh4WFNBYKtNFlPjvTKMlsdwYvt3N
u1uSdPIIXWsXMN1DkJIa
=gnfI
-----END PGP SIGNATURE-----

--eMGrAD5L3cjpiKtl--
