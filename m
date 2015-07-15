Date: Wed, 15 Jul 2015 17:01:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjit Abhimanyu Waghmode <ranjit.waghmode@xilinx.com>
Cc: Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "zajec5@gmail.com" <zajec5@gmail.com>, "marex@denx.de" <marex@denx.de>,
 "shijie.huang@intel.com" <shijie.huang@intel.com>,
 "juhosg@openwrt.org" <juhosg@openwrt.org>,
 "ben@decadent.org.uk" <ben@decadent.org.uk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Harini Katakam <harinik@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 "ran27jit@gmail.com" <ran27jit@gmail.com>
Message-ID: <20150715160146.GS11162@sirena.org.uk>
References: <1436445895-25504-1-git-send-email-ranjit.waghmode@xilinx.com>
 <20150714164005.GE11162@sirena.org.uk>
 <7CFCFE83B8145347A1D424EC939F1C3CA7E53D@XAP-PVEXMBX01.xlnx.xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Dp+ZBeMqOVN1dGc7"
Content-Disposition: inline
In-Reply-To: <7CFCFE83B8145347A1D424EC939F1C3CA7E53D@XAP-PVEXMBX01.xlnx.xilinx.com>
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


--Dp+ZBeMqOVN1dGc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2015 at 02:12:54PM +0000, Ranjit Abhimanyu Waghmode wrote:

> > > What is stacked mode?
> > > ---------------------
> > > ZynqMP GQSPI controller supports stacked mode with following
> > functionalities:
> > > 1) The Generic Quad-SPI controller also supports two SPI flash memories
> > >    in a shared bus arrangement to reduce IO pin count.
> > > 2) Separate chip select lines
> > > 3) Shared I/O lines
> > > 4) This mode is targeted for increasing the flash memory and no performance
> > >    improvement when compared with single.

> > This is just a normal SPI controller from a SPI point of view.

> How can we really represent the stacked mode in current configuration?

In the same way as any other controller with two chip selects...  there
are quite a few other drivers that provide examples of this, you should
look for one that has hardware control similar to yours.

--Dp+ZBeMqOVN1dGc7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVpoPqAAoJECTWi3JdVIfQmhcIAIN0uV/a25EOydSwYSr0zH4t
fVlPiwRtgwKXMV3HANEhQwRRKYuyxNGJcxs6Ne4YIgP+GV6AC26tFB2CEZSl6vA6
BtAvfTq+F1EB3a+zMM1ckuaaGYd3zd0YaAS03a4Kc1Fd2dldrUQJXoeYQPF5tBT3
Jcb1Dep0n71fiyY2ncV8qf3to6H2kJc9qroinlHFC8gfkdi/cw55TALJsS8mo4pT
uRUw0eOC0Dbvg7HVCQj+Vxm0MnWuKHvUS+gaXD2ZGUwdiWiiCgrwpNXW013+5SBY
sgGSMTvauG05NvIKjWok1nyWjFrX+3nDuMynZsTkBVak7+K4qThdZV7PREsL5UA=
=UAZc
-----END PGP SIGNATURE-----

--Dp+ZBeMqOVN1dGc7--
