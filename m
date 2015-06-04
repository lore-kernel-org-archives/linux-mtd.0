Date: Thu, 4 Jun 2015 11:56:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Suchanek <hramrach@gmail.com>
Message-ID: <20150604105653.GD14071@sirena.org.uk>
References: <cover.1433364398.git.hramrach@gmail.com>
 <305830ebf9c0ae98c4f6e0ebbdec7414d6762b36.1433364398.git.hramrach@gmail.com>
 <20150604091634.GY14071@sirena.org.uk>
 <CAOMqctQxn6UY2DJ9Syp6Ay9SYKLgdU+8EjiTK_48-R3dZ8PcvA@mail.gmail.com>
 <20150604102621.GB14071@sirena.org.uk>
 <CAOMqctRFXWT3m8H4YBH0tzQAL3Y2NUs6XCo2LiF1R0Xz+iWUzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jNp2UUAAd0DeWbgM"
Content-Disposition: inline
In-Reply-To: <CAOMqctRFXWT3m8H4YBH0tzQAL3Y2NUs6XCo2LiF1R0Xz+iWUzw@mail.gmail.com>
Subject: Re: [PATCH 10/11] spi: add more debug prints in s3c64xx
Cc: Mark Rutland <mark.rutland@arm.com>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 Marek Vasut <marex@denx.de>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Russell King <linux@arm.linux.org.uk>, Vinod Koul <vinod.koul@intel.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 devicetree <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 Han Xu <han.xu@freescale.com>, Knut Wohlrab <knut.wohlrab@de.bosch.com>,
 dmaengine <dmaengine@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--jNp2UUAAd0DeWbgM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 04, 2015 at 12:52:19PM +0200, Michal Suchanek wrote:

> There is no code interdependency with the other patches so if it's
> preferred I can send patches like this separately.

Yes, that's better practice.

--jNp2UUAAd0DeWbgM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVcC71AAoJECTWi3JdVIfQBj8H/2IDwTMKds4nyc0wJHt1b/zn
r2Xjn1gr2EEPJL71yeJewRKgUFS3df/m3czmwxQ1bLcweAhoDVnHjDQ/DMB0Aqmh
UYbI1tuqCf83hxyDqlNcKsxkZ4hvvtDHxNKQtsVU1LNGsVb+yHFMLDmtQktZtycF
BjLTw15SNHyixdXHrMej+qZt+NjozC7Y38ff9jdo4AAp3B65yokISIVatc93S6iy
wow+h4THuzm+DMrKCXaUwtkqx6kmTEZ1DaxXf8QcKkXyKTzXL1b1riP/0Q1vA+rT
SYgloqyo4pbXTmiyQkOwhARysxqNBpuQ/mesUvlqIS+f60HvJvrTaVgzEIbokVk=
=giwp
-----END PGP SIGNATURE-----

--jNp2UUAAd0DeWbgM--
