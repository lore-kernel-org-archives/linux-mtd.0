Date: Mon, 14 Sep 2015 19:27:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, hramrach@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Message-ID: <20150914182704.GD12027@sirena.org.uk>
References: <1441355402-6837-1-git-send-email-vigneshr@ti.com>
 <1441355402-6837-4-git-send-email-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AVLaZh4WnxHuffer"
Content-Disposition: inline
In-Reply-To: <1441355402-6837-4-git-send-email-vigneshr@ti.com>
Subject: Re: [PATCH 3/5] mtd: devices: m25p80: add support for mmap read
 request
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--AVLaZh4WnxHuffer
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2015 at 02:00:00PM +0530, Vignesh R wrote:

> +	if (spi->master->spi_mtd_mmap_read) {
> +		return  spi->master->spi_mtd_mmap_read(spi, from, len,
> +						       retlen, buf,
> +						       nor->read_opcode,
> +						       nor->addr_width,
> +						       dummy);
> +	}

We should be calling some API provided by the SPI core here, not peering
directly into the ops struture.

--AVLaZh4WnxHuffer
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV9xF3AAoJECTWi3JdVIfQ5M0H/3yU9921hxdGY3rVvxGA70tH
O5QKkifeOiPHlY07/JO+G0HoyjHft+Q1TIQAarTtUzi/srLSIi9EcjEr7NsPG6dY
FXkypuw9y5lG7wzCPGVwo5dT6NcjpL09azm7jPYzAcysL+cI9FBgWMQBHWAsJyzw
WcVa/BQUrdiLJbH02U+xtf/cgoyzxvPpGhDRSYMlUMppsLZsJ0w4sxT94YC5u8aG
/dnKVA6OteHl5+SkyP1ZMKWWgkk7ZgucRHaSXQdB6olx+R5hlvnELw4rMJnVflv1
1Qcgl0/c2Cp9hldvBUSITIhXr2eLgi/Q4F2xpsy61B9TODNrjyWuUg3XrvUjnkA=
=eeIx
-----END PGP SIGNATURE-----

--AVLaZh4WnxHuffer--
