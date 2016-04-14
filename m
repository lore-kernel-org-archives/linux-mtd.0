Date: Thu, 14 Apr 2016 09:57:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Lakshmi Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
 Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Stephen Warren <swarren@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Andrew F. Davis" <afd@ti.com>, Marek Vasut <marex@denx.de>,
 Jagan Teki <jteki@openedev.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Harini Katakam <harinik@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 Anirudha Sarangi <anirudh@xilinx.com>, "R, Vignesh" <vigneshr@ti.com>
Message-ID: <20160414085707.GE18024@sirena.org.uk>
References: <1460039969-9835-1-git-send-email-lakshmis@xilinx.com>
 <57067694.8030806@atmel.com>
 <4FF8F58FAA9D5D4193D4E554E4352C5902C720DE@XAP-PVEXMBX02.xlnx.xilinx.com>
 <570F4F9F.3090605@atmel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tMbDGjvJuJijemkf"
Content-Disposition: inline
In-Reply-To: <570F4F9F.3090605@atmel.com>
Subject: Re: [LINUX PATCH v2 1/3] spi: Added dummy_cycle entry in the
 spi_transfer structure.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 14, 2016 at 10:06:55AM +0200, Cyrille Pitchen wrote:

> I understand but you propose to patch both the SPI layer and the m25p80 driver
> to introduce some support which is already provided by the "spi_flash_read"
> hook: struct spi_flash_read_message has already a "dummy_bytes" field.
> IMHO, it looks redundant.

My understanding is that this is intended for dummy bits rather than
dummy bytes.

--tMbDGjvJuJijemkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXD1thAAoJECTWi3JdVIfQJLEH/1Ory7hYtXNRM/1zIu//pJ1W
lVNGpgHzgCgeNYk/k0HSdx3g75axhTV3XP2c+clxtieEa7cIf1hY6KqFg4E00xTh
BtIhJQFvg84dYi3X0ZRfg/0VwCpf2FcQU3OTYu8SlIY/dbW22sKg+enCMr3D5Swi
Vrqw/yIRPtzLpsJ8+RA9ShC5yHtGgMaOkaSj6ydQE3ggECKTu1k0tGCLQ/U9Yvzb
gmkYZW2+lDho43qBEAyGbU1XJfbQdymBBZ1o73oJazRVV4wPbNt1o/9BzcGXAA4k
+mtjEWJZIChEkIMwYV6eXa1xgGPaRnFLGcR8RyivHovubwQXtux/550bo7IaVd4=
=T88m
-----END PGP SIGNATURE-----

--tMbDGjvJuJijemkf--
