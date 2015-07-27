Date: Mon, 27 Jul 2015 15:23:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjit Abhimanyu Waghmode <ranjit.waghmode@xilinx.com>
Cc: Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>,
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
 "ran27jit@gmail.com" <ran27jit@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Message-ID: <20150727142322.GA11162@sirena.org.uk>
References: <1436445895-25504-1-git-send-email-ranjit.waghmode@xilinx.com>
 <20150714164005.GE11162@sirena.org.uk>
 <7CFCFE83B8145347A1D424EC939F1C3CA7E53D@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20150715160146.GS11162@sirena.org.uk>
 <7CFCFE83B8145347A1D424EC939F1C3CA7E758@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20150716085739.GT11162@sirena.org.uk>
 <7CFCFE83B8145347A1D424EC939F1C3CA81D12@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20150724105209.GI11162@sirena.org.uk>
 <7CFCFE83B8145347A1D424EC939F1C3C0148C95C@XAP-PVEXMBX01.xlnx.xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xjbxwvxc0BPBk24+"
Content-Disposition: inline
In-Reply-To: <7CFCFE83B8145347A1D424EC939F1C3C0148C95C@XAP-PVEXMBX01.xlnx.xilinx.com>
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


--Xjbxwvxc0BPBk24+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 27, 2015 at 01:55:56PM +0000, Ranjit Abhimanyu Waghmode wrote:

> > As I think you've been asked before please fix your mail client to word wrap
> > within paragraphs so your mails are more legible.

> Sorry about this, I did some changes but it's kind of broken. Will fix this.

Still not working...

> > I'm not entirely sure what you're asking here from the point of view of SPI, sorry
> > - what exactly are you requesting?  If you want to add support for new SPI bus
> > modes please go ahead and do that, you need to clearly document what any
> > new modes you're adding are so that other people can understand them.

> Ok, my description was too short to get it completely.

> For adding dual parallel mode support to current driver:
> Are following points enough? Or do you want to suggest something better on top of it?

> Driver:
> 1) Controller needs to know in which mode it is working.
> 2) As there are more than one chip selects, may need to add code for handling that as well.

That's probably about right.

--Xjbxwvxc0BPBk24+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVtj7ZAAoJECTWi3JdVIfQ18AH/3nM+nWN9G43RXdb7xghWjAV
Zja6A3McrXlbaEbhwnIEuGCLWexk5goq8uGy42+DWMWyJJo7NNkZ0v2tyKxEym6N
7uRk70J5Uz1G0fw3ejzf9N77qitNkVON1O7np0VIOZsDKJDFdrH9Qr9/Aj7UIKyz
g2ypGFmuOgeZtom/Uy+OeTsjbUm5Tu0Lal9bvv0pkJDcYw4Wz0pvzcrdgrE+T4eZ
ANwVeAE1ieDMAEMmhLagnPw8dtUS44gaTobEUgFmxIwniquapcFdtzFB1eue7GHO
Y2hYqLUr3ny+DWYkxMvKRYFPutpUIDBq6o0MZ7f/vF2NxDAxPxRGyONf4V7L0ys=
=Kw4O
-----END PGP SIGNATURE-----

--Xjbxwvxc0BPBk24+--
