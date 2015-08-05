From: Ranjit Abhimanyu Waghmode <ranjit.waghmode@xilinx.com>
To: Mark Brown <broonie@kernel.org>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, Michal Simek <michals@xilinx.com>, "Soren
 Brinkmann" <sorenb@xilinx.com>, "zajec5@gmail.com" <zajec5@gmail.com>,
 "ben@decadent.org.uk" <ben@decadent.org.uk>, "marex@denx.de" <marex@denx.de>,
 "knut.wohlrab@de.bosch.com" <knut.wohlrab@de.bosch.com>, "juhosg@openwrt.org"
 <juhosg@openwrt.org>, "beanhuo@micron.com" <beanhuo@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Harini Katakam <harinik@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>, "ran27jit@gmail.com"
 <ran27jit@gmail.com>
Subject: RE: [LINUX RFC 1/2] mtd: spi-nor: add dual parallel mode support
Date: Wed, 5 Aug 2015 05:01:15 +0000
Message-ID: <7CFCFE83B8145347A1D424EC939F1C3C01492420@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1438592707-30713-1-git-send-email-ranjit.waghmode@xilinx.com>
 <1438592707-30713-2-git-send-email-ranjit.waghmode@xilinx.com>
 <20150803160829.GX20873@sirena.org.uk>
In-Reply-To: <20150803160829.GX20873@sirena.org.uk>
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

> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Monday, August 03, 2015 9:38 PM
> To: Ranjit Abhimanyu Waghmode
> Cc: dwmw2@infradead.org; computersforpeace@gmail.com; Michal Simek;
> Soren Brinkmann; zajec5@gmail.com; ben@decadent.org.uk; marex@denx.de;
> b32955@freescale.com; knut.wohlrab@de.bosch.com; juhosg@openwrt.org;
> beanhuo@micron.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-spi@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; Harini Katakam; Punnaiah Choudary Kalluri; Ra=
njit
> Abhimanyu Waghmode; ran27jit@gmail.com
> Subject: Re: [LINUX RFC 1/2] mtd: spi-nor: add dual parallel mode support
>=20
> On Mon, Aug 03, 2015 at 02:35:06PM +0530, Ranjit Waghmode wrote:
>=20
> >  drivers/mtd/devices/m25p80.c  |  1 +
> >  drivers/mtd/spi-nor/spi-nor.c | 92 ++++++++++++++++++++++++++++++++++-=
-
> -------
> >  include/linux/mtd/spi-nor.h   |  3 ++
> >  include/linux/spi/spi.h       |  2 +
> >  4 files changed, 79 insertions(+), 19 deletions(-)
>=20
> You need to at least split this into two patches, one adding a new SPI in=
terface
> and another using it in MTD.  Probably the MTD core and driver changes ne=
ed
> splitting too.  Please see SubmittingPatches for discussion of splitting =
things.
>=20

I will split and resend the same.

> > diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h index
> > d673072..8dec349 100644
> > --- a/include/linux/spi/spi.h
> > +++ b/include/linux/spi/spi.h
> > @@ -355,6 +355,8 @@ struct spi_master {
> >  #define SPI_MASTER_NO_TX	BIT(2)		/* can't do buffer write */
> >  #define SPI_MASTER_MUST_RX      BIT(3)		/* requires rx */
> >  #define SPI_MASTER_MUST_TX      BIT(4)		/* requires tx */
> > +#define SPI_MASTER_DATA_STRIPE		BIT(7)		/* support
> data stripe */
> > +#define SPI_MASTER_BOTH_CS		BIT(8)		/* enable both
> chips */
>=20
> This is really not adequate description for a new API, I can't tell what =
"data
> stripe" is supposed to mean at all and I've got at best a vague idea what=
 "both
> chips" really means.  This means other developers won't be able to tell h=
ow to
> use or implement these flags either, and it means I can't really review t=
his.  You
> need to provide more information here, both in the code and in the commit
> message.
>=20

I'm sorry about that. I have added description in cover letter, but will ad=
d more information about the same here too.

> I'd also expect some handling in the core for these, for example error ha=
ndling if
> they can't be supported.

Will update and send you the updated version.

Thanks,
Ranjit
