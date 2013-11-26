Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlHuY-0002Fo-Qa
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 12:38:40 +0000
Date: Tue, 26 Nov 2013 12:38:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131126123814.GE14725@sirena.org.uk>
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-2-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="qvqe4mReYAfpWQmG"
Content-Disposition: inline
In-Reply-To: <1385451313-1875-2-git-send-email-sourav.poddar@ti.com>
Subject: Re: [PATCH 01/17] spi/spi.h: Add get_buf/put_buf support in spi
 master..
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


--qvqe4mReYAfpWQmG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2013 at 01:04:57PM +0530, Sourav Poddar wrote:

> Add get_buf, put_buf api support in spi master.
> This can be used in a scenario where spi controller

I would expect that while the buffer is mapped the controller would be
unavailable for normal SPI API use so I'd expect some code that checks a
flag while a mapping is in place and errors out on normal SPI operations
during that time as well as the operations themselves.

--qvqe4mReYAfpWQmG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlJYzAAoJELSic+t+oim9BzYP/1ga7pIG7+8CG5+n2KG0w0S6
7YN4dRfqF8RKGISWaAQpjEvVKdZbHez6s1OXhnCzUv2duORyrZZIpFJRGM049P8M
xszuw5Go10phl+IaWlIYRQl5CMZe1ObUsKJNCBlkCL3ZMmvvEaiSK+T28e5MXEan
82ZlgW1j+ZX+rBPNOGmeEzyaa1AKmYVj9/9fUrUVzl+dEQjeHC2CfrOd8UJuv7JX
79wgV9zrm8IkttkylDTrt+mM4qoxvBiAmIu+EM6A8HDlYUiKEVLN8iGDn4Cshrnb
zfuKGxntuDDDVvyK4yMaQMfbeLs6Ku2YCeZ5WyO34M0a/7gskC/lfAM+Ppb7rn47
LszJw1mFVwGn+JOJOVpHb0J1md79K7WQvYF05fFv5Kw+xaEcPMD2g7flwhMTnmlj
MBKlkQmAuZAkHFFLBTb/yNAc7v8eDmpDFV1meHfLF2N1eTc3lIP50rtY71gk1vKp
eKwGjCX1GxHpV4QvHm1nQ18JjJB1IQelAQGY7DVPLPU3ljSoCE7ToX0W6/CjmAJT
z71X4J+/qwz6Qpg5nBkbZVBvLsYX+33pJ4WRppDjFK54TLGM8SZiZ4oubTDRAuv6
0NwdAIieorOF767T0QCPJL+um9timylrnEkSeyqLVkDIAX26OtHJChUHXcmLsr6S
CBmp1M0ObDFltQ6XNVrU
=peMD
-----END PGP SIGNATURE-----

--qvqe4mReYAfpWQmG--
