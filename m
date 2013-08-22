Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCUpq-000891-82
 for linux-mtd@lists.infradead.org; Thu, 22 Aug 2013 13:22:01 +0000
Date: Thu, 22 Aug 2013 14:21:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20130822132122.GK26118@sirena.org.uk>
References: <1376216117-5864-1-git-send-email-wangyuhang2014@gmail.com>
 <5216057F.4010900@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="M9YpAf2t6OxtMGzg"
Content-Disposition: inline
In-Reply-To: <5216057F.4010900@ti.com>
Subject: Re: [PATCH v3 1/2]spi: DUAL and QUAD support
Cc: spi-devel-general@lists.sourceforge.net, tpiepho@gmail.com,
 linux-mtd@lists.infradead.org, wangyuhang <wangyuhang2014@gmail.com>,
 pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--M9YpAf2t6OxtMGzg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2013 at 06:05:11PM +0530, Sourav Poddar wrote:
> On Sunday 11 August 2013 03:45 PM, wangyuhang wrote:

> >+		/* check transfer tx/rx_nbits:
> >+		 * 1. keep the value is not out of single, dual and quad
> >+		 * 2. keep tx/rx_nbits is contained by mode in spi_device
> >+		 * 3. if SPI_3WIRE, tx/rx_nbits should be in single
> >+		 */

> Sorry for pitchin in a bit late on this.
> I was trying to use this for my use case today. I realise this check
> should be under...

Can you send a patch for this please?

--M9YpAf2t6OxtMGzg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSFhBPAAoJELSic+t+oim9bN8QAJgt6UCqMhttRR+GLj2aHBhW
aVYW9LDa5mPMEi3HVCa5Snd8EuUGPwBkCw6xgTK/TU855HOZ8R5mOsQp2k1wLgxs
ppM/w47opU2AaNGbjXO5aqcwMCQw90UqiFsCp+lkS5LPOhzG6CmQVwYaAfjYb6BO
vT7jRUcUFElhefccLMMLJ/6rDuFceVA5p3lP7JJsyyW81m9n7y/TLhc47wHViYmX
ZqfbsTmW0JF55AvdGXidz/aiJyUlZx8fLUQ6fF5xh4NBSWZvNIPcjABXnoswyALm
IYtLs4ii8xMigxIW+jr13UkZ/t5v1BDI78t+2tUtzMATcZY8gFiQQN/BnmM55S5b
41hde07h3npq9xlkJSxQrq5z6wAnGs7IANyqNtp+rintyYzQHtfsLcbQvrzjtPmF
K+zM59t31cYDmK0i28ZDPWAfk/6e/0gNRM3Ee53AcuzGJEdqfxscpIYjQuKqpG+Q
TfI7Zy0gTkImImt+odh7AHglMUvnO5821hZeNzBcDQ5S43uuNNhgzf/B1Ml7ru1G
zMNI0BFv0w5ItJw5tU30AbddwV8AA9G7uK2kecyTS0zseyNJ2Sepi6ams9mg3jK5
IbUklun4Ok+YE2JX/99oiQAD8+mxxa787PBchZtgMCB8feAGwPeEqYUKHIH+aO/C
UEsr0NwNCmmCfb8l1VAr
=v0k7
-----END PGP SIGNATURE-----

--M9YpAf2t6OxtMGzg--
