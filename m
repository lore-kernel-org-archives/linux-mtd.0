Date: Tue, 14 Jul 2015 17:40:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjit Waghmode <ranjit.waghmode@xilinx.com>
Cc: michal.simek@xilinx.com, soren.brinkmann@xilinx.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, zajec5@gmail.com,
 marex@denx.de, shijie.huang@intel.com, juhosg@openwrt.org,
 ben@decadent.org.uk, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, harinik@xilinx.com,
 punnaia@xilinx.com, ran27jit@gmail.com
Message-ID: <20150714164005.GE11162@sirena.org.uk>
References: <1436445895-25504-1-git-send-email-ranjit.waghmode@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BC0PqexbI+QDQ83Q"
Content-Disposition: inline
In-Reply-To: <1436445895-25504-1-git-send-email-ranjit.waghmode@xilinx.com>
Subject: Re: [RFC PATCH 0/2] spi: add dual parallel & stacked mode support in
 Zynq MPSoC GQSPI controller
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--BC0PqexbI+QDQ83Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2015 at 06:14:53PM +0530, Ranjit Waghmode wrote:


> What is dual parallel mode?
> ---------------------------
> ZynqMP GQSPI controller supports Dual Parallel mode with following functionalities:
> 1) Supporting two SPI flash memories operating in parallel. 8 I/O lines.
> 2) Chip selects and clock are shared to both the flash devices
> 3) This mode is targeted for faster read/write speed and also doubles the size
> 4) Commands/data can be transmitted/received from both the devices(mirror),
>    or only upper or only lower flash memory devices.
> 5) Data arrangement:
>    With stripe enabled,
>    Even bytes i.e. 0, 2, 4,... are transmitted on Lower Data Bus
>    Odd bytes i.e. 1, 3, 5,.. are transmitted on Upper Data Bus.

For the SPI code this just seems like SPI with an 8 bit data width.

> What is stacked mode?
> ---------------------
> ZynqMP GQSPI controller supports stacked mode with following functionalities:
> 1) The Generic Quad-SPI controller also supports two SPI flash memories
>    in a shared bus arrangement to reduce IO pin count.
> 2) Separate chip select lines
> 3) Shared I/O lines
> 4) This mode is targeted for increasing the flash memory and no performance
>    improvement when compared with single.

This is just a normal SPI controller from a SPI point of view.

--BC0PqexbI+QDQ83Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVpTtkAAoJECTWi3JdVIfQAWgH/2jTg94UlpB2zKtJL/FOWWzm
TLJv6Kx5gYzLvin6CWk8Ww8y0BJ6SKImSo/e9xGY4vK9lPHPYpkluGMZchap74gG
toVIkiAvXvhqhKHzeb5HnOPEXEIuJmod6U8eR6xLUkj3j2YDUx1hqp4GIDngRTU1
DF1pojb0u4oejEg4KafdByjkVrs49sjBX9YVg2c2b2CQTiLOojJXSqf90NZ7eWmp
6B0Gw0ikbpVELvnoEL/BK7xjDolTJXdO3Nb8HfTV8+bSysd24SOHgnwG+vuDpDoG
7ESsyXQ0P1thcoWkiPDJrYhuIPqrOiMiC5EkjOYkxSBBXSWe20k/y9Ww3AixsFQ=
=4RN1
-----END PGP SIGNATURE-----

--BC0PqexbI+QDQ83Q--
