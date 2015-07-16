From: Ranjit Abhimanyu Waghmode <ranjit.waghmode@xilinx.com>
To: Mark Brown <broonie@kernel.org>
CC: Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>,
 "zajec5@gmail.com" <zajec5@gmail.com>, "marex@denx.de" <marex@denx.de>,
 "shijie.huang@intel.com" <shijie.huang@intel.com>,
 "juhosg@openwrt.org" <juhosg@openwrt.org>,
 "ben@decadent.org.uk" <ben@decadent.org.uk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Harini Katakam <harinik@xilinx.com>,
 "Punnaiah Choudary Kalluri" <punnaia@xilinx.com>, "ran27jit@gmail.com"
 <ran27jit@gmail.com>
Subject: RE: [RFC PATCH 0/2] spi: add dual parallel & stacked mode support
 in Zynq MPSoC GQSPI controller
Date: Thu, 16 Jul 2015 07:27:34 +0000
Message-ID: <7CFCFE83B8145347A1D424EC939F1C3CA7E758@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1436445895-25504-1-git-send-email-ranjit.waghmode@xilinx.com>
 <20150714164005.GE11162@sirena.org.uk>
 <7CFCFE83B8145347A1D424EC939F1C3CA7E53D@XAP-PVEXMBX01.xlnx.xilinx.com>
 <20150715160146.GS11162@sirena.org.uk>
In-Reply-To: <20150715160146.GS11162@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

> > > > What is stacked mode?
> > > > ---------------------
> > > > ZynqMP GQSPI controller supports stacked mode with following
> > > functionalities:
> > > > 1) The Generic Quad-SPI controller also supports two SPI flash memo=
ries
> > > >    in a shared bus arrangement to reduce IO pin count.
> > > > 2) Separate chip select lines
> > > > 3) Shared I/O lines
> > > > 4) This mode is targeted for increasing the flash memory and no
> performance
> > > >    improvement when compared with single.
>=20
> > > This is just a normal SPI controller from a SPI point of view.
>=20
> > How can we really represent the stacked mode in current configuration?
>=20
> In the same way as any other controller with two chip selects...  there a=
re quite
> a few other drivers that provide examples of this, you should look for on=
e that
> has hardware control similar to yours.

Thanks Mark for your suggestion. But I have minor doubts.

For an example take two flashes connected in stacked mode.
For user it doesn't matter whether how many flashes are really connected.=20
There will be situation like, single partition is spread across two flashes=
 (partition staring at the end of one flash and continued to the second fla=
sh). But it has to be shown contiguous to user.
In this scenario, I am not clear how MTD layer will handle the case.
It would be great if you could just put some light on it.

Regards,
Ranjit
