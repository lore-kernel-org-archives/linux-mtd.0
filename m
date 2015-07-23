From: Marek Vasut <marex@denx.de>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v2 1/5] mtd: spi-nor: notify (Q)SPI controller about
 protocol change
Date: Thu, 23 Jul 2015 09:00:50 +0200
Cc: nicolas.ferre@atmel.com, broonie@kernel.org, linux-spi@vger.kernel.org,
 dwmw2@infradead.org, computersforpeace@gmail.com, zajec5@gmail.com,
 beanhuo@micron.com, juhosg@openwrt.org, shijie.huang@intel.com,
 ben@decadent.org.uk, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 linux-mtd@lists.infradead.org
References: <cover.1437569902.git.cyrille.pitchen@atmel.com>
 <201507221541.46135.marex@denx.de> <55AFC3F0.5050002@atmel.com>
In-Reply-To: <55AFC3F0.5050002@atmel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201507230900.50570.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, July 22, 2015 at 06:25:20 PM, Cyrille Pitchen wrote:
> Hi Marek,
>=20
> Le 22/07/2015 15:41, Marek Vasut a =E9crit :
> > On Wednesday, July 22, 2015 at 03:17:06 PM, Cyrille Pitchen wrote:
> >> Once the Quad SPI mode has been enabled on a Micron flash memory, this
> >> device expects ALL the following commands to use the SPI 4-4-4 protoco=
l.
> >> The (Q)SPI controller needs to be notified about the protocol change so
> >> it can adapt and keep on dialoging with the Micron memory.
> >>=20
> >> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> >> ---
> >>=20
> >>  drivers/mtd/spi-nor/spi-nor.c | 17 +++++++++++++++++
> >>  include/linux/mtd/spi-nor.h   | 13 +++++++++++++
> >>  2 files changed, 30 insertions(+)
> >>=20
> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c
> >> b/drivers/mtd/spi-nor/spi-nor.c index d78831b4422b..93627d4e6be8 100644
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -163,6 +163,18 @@ static inline int write_disable(struct spi_nor
> >> *nor)
> >>=20
> >>  	return nor->write_reg(nor, SPINOR_OP_WRDI, NULL, 0, 0);
> >> =20
> >>  }
> >>=20
> >> +/*
> >> + * Notify the (Q)SPI controller about the new protocol to be used.
> >=20
> > Hi!
> >=20
> > Can you please just reword this a little, so that it is absolutelly cle=
ar
> > even to the less bright of us (like me) that this is a notification
> > coming from the upper layers (ie. the spi-nor framework) toward the
> > hardware ?
>=20
> Sure, no problem! what about the following?
>=20
> /*
>  * Let the spi-nor framework notify lower layers, especially the driver of
> the * (Q)SPI controller, about the new protocol to be used. Indeed, once
> the * spi-nor framework has sent manufacturer specific commands to a
> memory to * enable its Quad SPI mode, it should immediately after tell the
> QSPI * controller to use the very same Quad SPI protocol as expected by
> the memory. */

Sure, excellent, thanks ! :-)
