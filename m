Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1flEhO-0005Z4-L1
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2018 14:35:32 +0000
Date: Thu, 2 Aug 2018 15:35:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Frieder Schrempf <frieder.schrempf@exceet.de>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 cyrille.pitchen@wedev4u.fr, pp@emlix.com, Zhiqiang.Hou@nxp.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] spi: spi-mem: Fix a typo in the documentation of
 struct spi_mem
Message-ID: <20180802143513.GN9117@sirena.org.uk>
References: <1533214434-28761-1-git-send-email-frieder.schrempf@exceet.de>
 <1533214434-28761-2-git-send-email-frieder.schrempf@exceet.de>
 <20180802150945.44cc8328@bbrezillon>
 <8a365fb9-ab9b-b8f1-6dbe-587c6b9b8ad2@exceet.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="e8/wErwm0bqugfcz"
Content-Disposition: inline
In-Reply-To: <8a365fb9-ab9b-b8f1-6dbe-587c6b9b8ad2@exceet.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--e8/wErwm0bqugfcz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 02, 2018 at 03:39:18PM +0200, Frieder Schrempf wrote:

> Mark, can you add it when you apply the patch or should I send a new
> version?

I'd applied before I saw this subthread, Boris is right that it is
better but for something this obvious I'm not sufficiently bothered by
the missing log.

--e8/wErwm0bqugfcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltjFqAACgkQJNaLcl1U
h9Cucwf9Eq5W07YgIQUThfSaDto17fsDHLSKM9QyVkpuSkt21YRWHm9/q+T3Uou3
2+uQNFUu7Or2Zoebzr5CcYcKhxfZYPIbFt+sEaGynkHcGBI5GZTdNbBpboAuakpT
m3mokR3t6Of1TjfjF+i3CmAev1u/mTDoEMMz4hcyRQXRhF53EseX/rqgFUJ4YdwE
IfyV5VNJpzhuogmvN+Pv5WspM+yEg8y7ay6gDfWns0SzCrgkU+H7HjdHerwwzTRP
5psB9f3QVNZb6Zu5r538bsyT65UbJ1ZwnA/UwYz8JOC+c1v1xVRQFtEhpI6WJSVL
sb5PoaH6D64uC3Gt18zYmhMqHHhV/Q==
=vm3O
-----END PGP SIGNATURE-----

--e8/wErwm0bqugfcz--
