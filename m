Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEYtt-0000sl-17
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 09:52:34 +0000
Date: Wed, 7 Dec 2016 09:51:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: marek.vasut@gmail.com, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Message-ID: <20161207095148.glwlxbd2tatr7axo@sirena.org.uk>
References: <cover.1481041702.git.cyrille.pitchen@atmel.com>
 <54697ac9604b8e769f92dd4fb392db952df9eae4.1481041702.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b7e2fgw57bhrpspr"
Content-Disposition: inline
In-Reply-To: <54697ac9604b8e769f92dd4fb392db952df9eae4.1481041702.git.cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: rename SPINOR_OP_* macros of the
 4-byte address op codes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--b7e2fgw57bhrpspr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 06, 2016 at 05:52:31PM +0100, Cyrille Pitchen wrote:
> This patch renames the SPINOR_OP_* macros of the 4-byte address
> instruction set so the new names all share a common pattern: the 4-byte
> address name is built from the 3-byte address name appending the "_4B"
> suffix.

Acked-by: Mark Brown <broonie@kernel.org>

--b7e2fgw57bhrpspr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhH27MACgkQJNaLcl1U
h9CeXQf/cxt7aSuHcfw2uLphnnyWPpXzLm+22Ydq2sFwdkq92IvWZnbFZMynJOZO
pSjee1ixvsChh1pWU0/PDXxBTow8rPJ4pyxYisPIV0HF2X+/lfKye6WiZ+6d8PTY
8rVRd2cNU2MPbx/Ko61ham1KQN7aEIYvFEfl7zdT85Bg9Z5yYMawFEGbKK++0DBD
ccaZHQ6gGQLG6TAg1O5NV7Hss9//SphAXT0DACGU8gKLl1KiuKa4900XRFxGyM1O
XODQKG/0rG8MZxWbCTmEdL+Y75kFCrtB5oXWrd1UA7vXSZXXpRdirl5BefiOkp4+
bt2jPtl4JMF5s0k0X53ySvtpMNs4WQ==
=RGts
-----END PGP SIGNATURE-----

--b7e2fgw57bhrpspr--
