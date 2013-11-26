Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlIBL-0002kX-4d
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 12:56:00 +0000
Date: Tue, 26 Nov 2013 12:55:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131126125535.GF14725@sirena.org.uk>
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-5-git-send-email-sourav.poddar@ti.com>
 <20131126103104.GZ14725@sirena.org.uk> <529483A2.3080000@ti.com>
 <20131126122512.GD14725@sirena.org.uk> <5294964A.8020507@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="eqq5Le9VNi5o1NaU"
Content-Disposition: inline
In-Reply-To: <5294964A.8020507@ti.com>
Subject: Re: [PATCH 04/17] spi/qspi: parse control module register.
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


--eqq5Le9VNi5o1NaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2013 at 06:08:34PM +0530, Sourav Poddar wrote:
> On Tuesday 26 November 2013 05:55 PM, Mark Brown wrote:
> >On Tue, Nov 26, 2013 at 04:48:58PM +0530, Sourav Poddar wrote:

> >>I have added a "reg-name" property. Does we need to add individual
> >>reg-names also?

> >I don't understand what you mean by "individual reg-names"?

> I have added a binding named "reg-names" in my documentation
> patch.

OK, but I stil don't understand the above?

--eqq5Le9VNi5o1NaU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlJpEAAoJELSic+t+oim9+zQQAJgoe9sWpYgcxwFU3vpSrLH6
eZ8AsQWdUg8rAf88Zy+1esQLxMMvBE5RVN4BumQfTh/aoyR8Ttjb7OqqY6tIhR8C
owa1XP0sQXRbjod14IiLsb1GcuWdjMvurOB/j9jZSq4jYzYg7uSws6fgfZzIrRPr
9d+lpmuN1j0/YxH36+ai3I/wemAcQQpcTsLuwX2/jyb1/IdTfRf7rvM0ghs3MIpa
aX+WOnjruJ4/1dIMJ2zM4AfHbsTpaTOymTrKcWIzZuZvpfsUzBfK3dbE19gzpJAq
30dQ/4/9bwlUeSOCYfnsIclSNiZp8/jKbzvllYp+gLnSBj+oFHcKt7A+BlIBJmMS
KxxOpzkbDSTuNYMV2PkxQUnYri8gbxvLukbbNDSuUcT1u0Akjdhstxf0ebIwMDTa
YHQSvnqetTW04RktsabayEusxukAcoiRDS2oM5RHiUS1g/geNh8BDqSGhgg7BhBr
LtjES9DfEnd2yVREgUBFoUpE5pLSM+O7o7Ftu826itgeUvt1jOINxoZtMQHIkdc6
NxEmEionO6nKuhDpFRGMobUhG0xzUVs0pT7G9juGlo4Pn/GG5D3dBOVUV9g2sGRp
bAkL5+AK9CBNExiPDpfsN87zZY//f5DShvxpTmRnNS9j2XuU2HC6xlzKIs2H1xrF
Xdg/7XllazRBCmXAXl1h
=fTcw
-----END PGP SIGNATURE-----

--eqq5Le9VNi5o1NaU--
