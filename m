Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlzAI-0000Gb-I0
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 10:49:47 +0000
Date: Thu, 28 Nov 2013 10:49:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131128104922.GK14725@sirena.org.uk>
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-13-git-send-email-sourav.poddar@ti.com>
 <20131126131138.GJ14725@sirena.org.uk> <5296D37C.2020003@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="uU2Tt3HF5Lkp2Lhz"
Content-Disposition: inline
In-Reply-To: <5296D37C.2020003@ti.com>
Subject: Re: [PATCH 12/17] spi/qspi: convert driver to enable/disable memory
 mapped.
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


--uU2Tt3HF5Lkp2Lhz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2013 at 10:54:12AM +0530, Sourav Poddar wrote:

> At the beginning of this api, I am doing a "disable memory mapped",
> as becuase of
> the code implemntation, if the control has reaches this api, memory
> mapped is not
> the desired operation. Then, at the end of this api after
> "spi_finalize_current_message(master)", which indicated the current
> transfer complete, I
> issue a end of transfer command. Only after which, I enable memory
> mapped mode again.

> So, will the condition you mention above will hit.? Please help me
> understand if i am
> missing something?

Removing the mapping isn't going to stop another context which has
obtained a handle on the map trying to look at the mapping.

--uU2Tt3HF5Lkp2Lhz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlx+uAAoJELSic+t+oim9zZYP/jH2FbRLSu51xDnNht2012dr
QDRaGRX/N1ggDa6zkHxfaW2uwc5599/pxICsZillw5pZH9bSFh0f0bFvhPLXAkYx
MUhw8SvSthOA5ScMZ08/BuvuXSL/0KyGDVFf8d4uztMbJraRxIoWszn8xjhs70n0
fSnGykY9pKNm27EbWnuSXQgjBXBvLk3xUJcGD0H9ezA0OCORdt6eufZ2MvEAyLxx
YoEmm5HWxpNhvOYG6opDq+/uuBWbC/k5jQLVsvvAEJ4vvQfbVU+JXWON4/qi9EKx
7OeH4f8EoR8unE2ZxBIorMWNRZ5C3NzcWmmexBJkEjyAqin6JhyOzCddZ6L9KXBy
89wFq3/grXkB3RwH32G9Oa4QzLGEhnF+SVYf2P2cPQ+qRZx3rGQCm/mU9igRDoBU
SCN5ptehThp5nkRU79Ef+2O1h3uB5+iU5aGmTaciDeOd8J6OAG+ss/LMDLYoqaEl
L3MxeQX/WRTEEgHg9RTHtwHKjHFq58MmRrvMZuOHbXsfim9AKt//j8VaRA/qVhpg
S6VVbQUjf9miKXyR3mpQgdTAF3vi7mE1S7OukmXk8GPmAA/Z+YYyBlbPpVXq+Bgq
LQCWlNfn3Vbu3HWNQ5P3W/HXxBSqaqzBcveDEvYtbgJNQUmOOd37MXx8Q0DaE5Bc
WtwtMa2wqOPmZ8t2DZ51
=T6bf
-----END PGP SIGNATURE-----

--uU2Tt3HF5Lkp2Lhz--
