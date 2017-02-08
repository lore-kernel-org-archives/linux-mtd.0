Received: from mezzanine.sirena.org.uk ([106.187.55.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbYVM-0002vc-IT
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 20:06:18 +0000
Date: Wed, 8 Feb 2017 20:05:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <20170208200542.cnsyl2oasxfyifbh@sirena.org.uk>
References: <2f46eee5-35c1-291a-52e9-132ced5749a9@atmel.com>
 <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
 <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
 <c89577f7-2908-3a75-6be4-78455c5cffcb@atmel.com>
 <20170208190939.GA97840@google.com>
 <CAOMqctTGCWoD-DqKUR3u1cLrQZPy3i1dLKXwoMkLP+hYfEtTyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q4fhgwc34wd7hb7f"
Content-Disposition: inline
In-Reply-To: <CAOMqctTGCWoD-DqKUR3u1cLrQZPy3i1dLKXwoMkLP+hYfEtTyw@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.11
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--q4fhgwc34wd7hb7f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 08, 2017 at 08:40:17PM +0100, Michal Suchanek wrote:

> Yes, this is something repeatedly open-coded in SPI drivers, unfortunately.

> In this case limiting the transfer size to 64k rather than doing
> another clone of the manual CS handling actually looks reasonable.
> It's not like anything but mtd_debug normally triggers that limit.

Any driver that's open coding this is buggy and should be fixed, it
should mainly be legacy drivers - some of the older drivers have a lot
of problems.

--q4fhgwc34wd7hb7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlibehUACgkQJNaLcl1U
h9BPCAf/SM2TKWASXWmPjiiqi24ka8Z7Af4PzqCntet8w6Brr+RpCdnYGpO54sTe
WsvQ1QB1INOZa1r2DjuAYimuqwEK5GOKIXhpiz9a33GagXNLvOCGuEZqGaRzpnUs
XOkj89YW/BOUEbTE+OKijVQZ1JEFRahjD1PBLTbLK2IdjzxWK40jz3/TD5pRDJpg
8MbBPcVN91w5pLpZ+c4NUZhWbcMj0+d7ub6HEDxEIdEiF/cnFk4tiP71FlJ5CsVp
fXIdqmJkeG+gQ++kRWCJ9aV5nmy3Qq+m0ccHYI8Gz1YpP9vu6C9uXgoWtdR4oAZH
CnAjjuIJlVUwWZRnPqx59cjM/XrX+g==
=CnWw
-----END PGP SIGNATURE-----

--q4fhgwc34wd7hb7f--
