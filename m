Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9zbs-00086l-0e
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 18:50:48 +0000
Date: Mon, 6 Jun 2016 19:48:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marex@denx.de>, Han Xu <han.xu@nxp.com>,
 linux-spi@vger.kernel.org
Message-ID: <20160606184810.GL7510@sirena.org.uk>
References: <20160606184348.GA135086@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O8/n5iBOhiUtMkxf"
Content-Disposition: inline
In-Reply-To: <20160606184348.GA135086@google.com>
Subject: Re: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--O8/n5iBOhiUtMkxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 06, 2016 at 11:43:48AM -0700, Brian Norris wrote:

> message size / transfer size patterns for arbitrary users. I suppose we
> really just need to figure out what his actual problem is, so we can
> address it generically.

Yes, exactly.

--O8/n5iBOhiUtMkxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXVcVpAAoJECTWi3JdVIfQfWYH+wQBW1H5I5ugEk5EwY+hbXv/
dZmzNGNEV2bUlidmWpixHiRFe49rRmWq+gxQwRQfykLyWlboZl4B6LlbadCL6D0H
019jJPFcQuDj3AVMMpZvpn7gryoG2SQJfaTo0sUCxyyTdPISfce7VfQZ8pXqO3yt
7QQLHP+1ndTbjzRdWuo3rv1meKheGR1YzN4JRoADg3DAuuP1S+9dViNFGfLagYH6
bZgHuUnhxicAT2cx555omj/fBAQRssxh0L/49Wze9vuJgbkIDQNcUnzOTawrSjFJ
2l+deaV0Itdn7COII3ZL7IpgZRu3evwHrPBc8KQ5/p0jsfxHUVO7T/biTukPKVU=
=NvL8
-----END PGP SIGNATURE-----

--O8/n5iBOhiUtMkxf--
