Date: Tue, 9 Feb 2016 19:36:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: Tony Lindgren <tony@atomide.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@arm.linux.org.uk>, hramrach@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Message-ID: <20160209193616.GN13270@sirena.org.uk>
References: <1449807000-6457-1-git-send-email-vigneshr@ti.com>
 <1449807000-6457-4-git-send-email-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ie5iOtK4e9kgqh2F"
Content-Disposition: inline
In-Reply-To: <1449807000-6457-4-git-send-email-vigneshr@ti.com>
Subject: Re: [PATCH v5 3/5] mtd: devices: m25p80: add support for mmap read
 request
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Ie5iOtK4e9kgqh2F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 11, 2015 at 09:39:58AM +0530, Vignesh R wrote:

> +	if (spi_flash_read_supported(spi)) {
> +		struct spi_flash_read_message msg;
> +		int ret;
> +
> +		msg.buf = buf;
> +		msg.from = from;
> +		msg.len = len;
> +		msg.read_opcode = nor->read_opcode;
> +		msg.addr_width = nor->addr_width;
> +		msg.dummy_bytes = dummy;
> +		/* TODO: Support other combinations */
> +		msg.opcode_nbits = SPI_NBITS_SINGLE;
> +		msg.addr_nbits = SPI_NBITS_SINGLE;
> +		msg.data_nbits = m25p80_rx_nbits(nor);
> +
> +		ret = spi_flash_read(spi, &msg);
> +		*retlen = msg.retlen;
> +		return ret;

Looking at this I can't help but think that spi_flash_read() ought to
have the stub in rather than the caller.  But given that we're pretty
much only ever expecting one user I'm not 100% sure it actually matters.
Anyway, I applied the first two patches.

--Ie5iOtK4e9kgqh2F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWuj+wAAoJECTWi3JdVIfQ1X8H/2RT2Qyt7866DsiogZkzSEDL
KBGCrfAapFj8N21nCesp/ap88F+iCqSCyRB8W8xAtNEawl23/71tY8G5aEqfJbCW
FWnJrddQk1wdJj93uxbZFIdj1Dgqn1savkFr+nuTVjLCLdPYlJWK+G4a2ZkSXdj5
qMJDvlPDUJgO6P7OYIh/DETPtwcPVVTe9DPMboZBetGLiVXfgBrWwHhyddkt3VTb
OmqoZ4W9m2AUwbZ5PVv1EWOzZlAXGh6vhNS57LlGAA/OcoQGEZKzq8Qmjp+G1whg
A4KmvHz8xzZJnv6hiDETBWWqivrRCUltZGB4k6HphFR2CJdhLMopj7+E1xHY0lY=
=DJI7
-----END PGP SIGNATURE-----

--Ie5iOtK4e9kgqh2F--
