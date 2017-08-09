Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfRZf-0005Pw-JD
 for linux-mtd@lists.infradead.org; Wed, 09 Aug 2017 14:03:06 +0000
From: "Langer, Thomas" <thomas.langer@intel.com>
To: Mark Brown <broonie@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>
CC: "ralf@linux-mips.org" <ralf@linux-mips.org>, "linux-mips@linux-mips.org"
 <linux-mips@linux-mips.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-watchdog@vger.kernel.org"
 <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "martin.blumenstingl@googlemail.com"
 <martin.blumenstingl@googlemail.com>, "john@phrozen.org" <john@phrozen.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "Mehrtens, Hauke"
 <hauke.mehrtens@intel.com>, "robh@kernel.org" <robh@kernel.org>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "kishon@ti.com"
 <kishon@ti.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Subject: RE: [PATCH v9 03/16] mtd: spi-falcon: drop check of boot select
Date: Wed, 9 Aug 2017 14:02:16 +0000
Message-ID: <0DAF21CFE1B20740AE23D6AF6E54843F1EA0A385@IRSMSX101.ger.corp.intel.com>
References: <20170808225247.32266-1-hauke@hauke-m.de>
 <20170808225247.32266-4-hauke@hauke-m.de>
 <20170809114421.oo2bunardgw3p4tk@sirena.org.uk>
In-Reply-To: <20170809114421.oo2bunardgw3p4tk@sirena.org.uk>
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



> -----Original Message-----
> From: linux-spi-owner@vger.kernel.org [mailto:linux-spi-
> owner@vger.kernel.org] On Behalf Of Mark Brown
> Sent: Wednesday, August 9, 2017 1:44 PM
> To: Hauke Mehrtens <hauke@hauke-m.de>
> Cc: ralf@linux-mips.org; linux-mips@linux-mips.org; linux-
> mtd@lists.infradead.org; linux-watchdog@vger.kernel.org;
> devicetree@vger.kernel.org; martin.blumenstingl@googlemail.com;
> john@phrozen.org; linux-spi@vger.kernel.org; Mehrtens, Hauke
> <hauke.mehrtens@intel.com>; robh@kernel.org; andy.shevchenko@gmail.com;
> p.zabel@pengutronix.de; kishon@ti.com; mark.rutland@arm.com
> Subject: Re: [PATCH v9 03/16] mtd: spi-falcon: drop check of boot select
>=20
> On Wed, Aug 09, 2017 at 12:52:34AM +0200, Hauke Mehrtens wrote:
>=20
> > Do not check which flash type the SoC was booted from before
> > using this driver. Assume that the device tree is correct and use this
> > driver when it was added to device tree. This also removes a build
> > dependency to the SoC code.
>=20
> Why?  Is this assumption reliably true?

Yes. We only have one type of flash interface in the device tree, as they=20
are connected to the shared EBU (External Bus Unit).
