From: Ranjit Abhimanyu Waghmode <ranjit.waghmode@xilinx.com>
To: Mark Brown <broonie@kernel.org>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, Michal Simek <michals@xilinx.com>, "Soren
 Brinkmann" <sorenb@xilinx.com>, "zajec5@gmail.com" <zajec5@gmail.com>,
 "ben@decadent.org.uk" <ben@decadent.org.uk>, "marex@denx.de" <marex@denx.de>,
 "b32955@freescale.com" <b32955@freescale.com>, "knut.wohlrab@de.bosch.com"
 <knut.wohlrab@de.bosch.com>, "juhosg@openwrt.org" <juhosg@openwrt.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Harini Katakam <harinik@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>
Subject: RE: [LINUX RFC v2 1/4] spi: add support of two chip selects & data
 stripe
Date: Fri, 4 Sep 2015 12:02:21 +0000
Message-ID: <7CFCFE83B8145347A1D424EC939F1C3C014B0D67@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1440570367-22569-1-git-send-email-ranjit.waghmode@xilinx.com>
 <1440570367-22569-2-git-send-email-ranjit.waghmode@xilinx.com>
 <20150903121232.GW12027@sirena.org.uk>
In-Reply-To: <20150903121232.GW12027@sirena.org.uk>
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
> Sent: Thursday, September 03, 2015 5:43 PM
> To: Ranjit Abhimanyu Waghmode
> Cc: dwmw2@infradead.org; computersforpeace@gmail.com; Michal Simek;
> Soren Brinkmann; zajec5@gmail.com; ben@decadent.org.uk; marex@denx.de;
> b32955@freescale.com; knut.wohlrab@de.bosch.com; juhosg@openwrt.org;
> beanhuo@micron.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-spi@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; Harini Katakam; Punnaiah Choudary Kalluri
> Subject: Re: [LINUX RFC v2 1/4] spi: add support of two chip selects & da=
ta
> stripe
>=20
> On Wed, Aug 26, 2015 at 11:56:04AM +0530, Ranjit Waghmode wrote:
>=20
> > To support dual parallel mode operation of ZynqMP GQSPI controller
> > following API's are added inside the core:
>=20
> As covered in SubmittingPatches please try to make each patch a single ch=
ange
> rather than having multiple separate changes in one commit.
I will split the patch.
>=20
> > +	/* Controller may support more than one chip.
> > +	 * This flag will enable that feature.
> > +	 */
> > +#define SPI_MASTER_BOTH_CS		BIT(8)		/* enable both
> chips */
>=20
> This isn't saying that the controller supports more than one chip, it's s=
aying that
> the controller supports asserting more than one chip select at once which=
 isn't
> the same thing.  I'm also not entirely sure that this makes sense as a se=
parate
> feature to the data striping one - I'm struggling to think of a way to us=
e this
> sensibly separately to that.
If the SPI controller is having more than one chip select and the data line=
s are distributed equally.
And also there is requirement to activate all the chip selects in one go.

Now we can consider following use cases:

Suppose we need to send the same data to multiple slaves of same kind:
Here the application need not to do individual slave access for writing, in=
stead it can send data to all the devices in one go.

Let's take another case where application is trying to send data in such a =
way that first nibble of the byte will got to the one slave and the second =
nibble of the byte will go to the other slave:
Here data in slave devices can be organized by taking advantage of above to=
pology along with the support in hardware.

Regards,
Ranjit
