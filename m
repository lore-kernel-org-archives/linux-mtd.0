Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZiyA-0002rx-0l
 for linux-mtd@lists.infradead.org; Tue, 16 Aug 2016 18:20:10 +0000
Date: Tue, 16 Aug 2016 19:19:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, vikram.prakash@broadcom.com,
 andy.fung@broadcom.com, jon.mason@broadcom.com, jchandra@broadcom.com
Message-ID: <20160816181944.GY9347@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-2-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5LZCLy8Sy7WgNZQM"
Content-Disposition: inline
In-Reply-To: <1469830393-13295-2-git-send-email-kdasu.kdev@gmail.com>
Subject: Re: [PATCH v5 1/8] Documentation: dt: spi: Add BRCMSTB SoC bindings
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--5LZCLy8Sy7WgNZQM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2016 at 06:13:06PM -0400, Kamal Dasu wrote:
> Added device tree bindings documentation for SoCs supported by the
> new spi-bcm-qspi, spi-brcmstb-qspi driver.

This doesn't document the clock-frequency property the driver
implements.  However I'd recommend just dropping that since it appears
to duplicate the existing facilities for setting the bus speed per slave
device.

--5LZCLy8Sy7WgNZQM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXs1k/AAoJECTWi3JdVIfQaAQH/j3RufX6A5hc6Ofy6ndc94qU
47mn1UL9z4Toal1hDgXrPTQ86suj3L2Rq19EIOEebhXkyGlf6sbN8SAzN+j/qRQA
lYA6qRoV4113d45Vk7J0UDOwuAIKHW8oLtfK632zP2I2PRVCtyAU63Sz9ZOVGdNu
evWjUlrdPGISwKqXFbfsSqXUArkzG58YSo91PKocUMU04gB8NcX13eGZ4kVNWZ7r
OEbwyoWg5KxJWxXCYixDJe688o8rlAqW5D+XWPwvFcP61liZaCXR4rznqZieTOmc
jgh6dSgQfv8OOLgt1/g1HXACW4bsj+6pZXdaCm2AVIrU/OIEClQR5wX2scGvw+Q=
=WWPh
-----END PGP SIGNATURE-----

--5LZCLy8Sy7WgNZQM--
