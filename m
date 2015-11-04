Date: Wed, 4 Nov 2015 14:39:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Michal Suchanek <hramrach@gmail.com>,
 Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Message-ID: <20151104143915.GI1717@sirena.org.uk>
References: <1446545174-14193-1-git-send-email-vigneshr@ti.com>
 <1446545174-14193-2-git-send-email-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OfrWf2Fun5Ae4m0Y"
Content-Disposition: inline
In-Reply-To: <1446545174-14193-2-git-send-email-vigneshr@ti.com>
Subject: Re: [PATCH v2 1/5] spi: introduce mmap read support for spi flash
 devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--OfrWf2Fun5Ae4m0Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2015 at 03:36:10PM +0530, Vignesh R wrote:

> +	}
> +	mutex_lock(&master->mmap_lock_mutex);
> +	ret = master->spi_mtd_mmap_read(spi, from, len, retlen, buf,
> +					read_opcode, addr_width,
> +					dummy_bytes);
> +	mutex_unlock(&master->mmap_lock_mutex);
> +	if (master->auto_runtime_pm)
> +		pm_runtime_put(master->dev.parent);

It's a bit worrying that this doesn't sync with the message queue except
via the mutex: this means that we might be out of order with respect to
any asynchronous transfers that are happening on the device.  I'm not
sure that this is a practical problem, though there is some risk of
unfair scheduling that would have to be under extreme load and it might
make sense to prioritise reads anyway.

--OfrWf2Fun5Ae4m0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWOhiSAAoJECTWi3JdVIfQTRUH/1uWG9cTPuPv1CXknjCrEk6G
OVAeJ52giZk1ODMqpPShiAn/Juf3zrceIoBtTd76Avd75I0ez05D71T7KgRhLEOG
ZWnXnsgRnHDxOJ/47pKeqO3tYv5ftylQ93541fJ+RsJq6q5ICUnI1SpC6aNMkt/F
lEVgVhDW+6bXFU9bxej1O7GD2YNAAd9sqoWNBS0m118wMa/fyRkfmG0FuaUQTtJ+
2PQHn4T+uKxDzqQtNbRbC05vg8xMsALZx6r1o1Zbih8IKmJ4EzjEpTg0dsMtl96U
KKYMxXY14Xd0/ejdY7uEJovZyGk75HIe2I8v0bQD4ye9GJdId/ebtKqBIt4r+8g=
=l/Wm
-----END PGP SIGNATURE-----

--OfrWf2Fun5Ae4m0Y--
