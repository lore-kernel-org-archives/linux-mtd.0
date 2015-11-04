Date: Wed, 4 Nov 2015 14:41:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Michal Suchanek <hramrach@gmail.com>,
 Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Message-ID: <20151104144112.GJ1717@sirena.org.uk>
References: <1446545174-14193-1-git-send-email-vigneshr@ti.com>
 <1446545174-14193-3-git-send-email-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J2uG6jHjFLimDtBY"
Content-Disposition: inline
In-Reply-To: <1446545174-14193-3-git-send-email-vigneshr@ti.com>
Subject: Re: [PATCH v2 2/5] spi: spi-ti-qspi: add mmap mode read support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--J2uG6jHjFLimDtBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2015 at 03:36:11PM +0530, Vignesh R wrote:

> +	ti_qspi_enable_memory_map(spi);
> +	ti_qspi_setup_mmap_read(spi, read_opcode, addr_width,
> +				dummy_bytes);
> +	memcpy_fromio(buf, qspi->mmap_base + from, len);
> +	*retlen = len;
> +	ti_qspi_disable_memory_map(spi);

We'll be constantly enabling and disabling memory mapping with this.
I'm not sure that's a meaningful cost given that it doesn't actually
remap anything but rather just switches hardware modes, we can always
optimise it later if it is.

--J2uG6jHjFLimDtBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWOhkHAAoJECTWi3JdVIfQrmcH/RSv12IrXq3lgkOLUxuYhAZj
YOjt8j86vy59wUu+5W/9xdgcAnrL3mOWhJowkBCgY6108OkKhlgxBgnvmqGbQu8V
Qu2sKe4sPQp/rnajAKPL8epEjegIkeE3mumUKN9tbKxraf8uVVS7thibwPPY0qwm
m/OFxiu6+9RLHJ+Q1iBXHDV7ePbJU+eRl6+BKaWYMjHfgW9gw8ktZFX6hjnTG0vC
6FcOCp1kdcgOn5GDwUthIyQOzHqtLv7qL+SkSLEeMdFG12FPyX5sN/k/c0WakBIw
qC2rWHcTTfRHy/o1XZ/oM6osCtkRBaglWeUpXXVg5KTMZHgONyume4GHLMIVAAc=
=vwZN
-----END PGP SIGNATURE-----

--J2uG6jHjFLimDtBY--
