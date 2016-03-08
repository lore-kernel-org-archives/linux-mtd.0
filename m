From: Yao Yuan <yao.yuan@nxp.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "han.xu@freescale.com"
 <han.xu@freescale.com>, "robh@kernel.org" <robh@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 4/7] Documentation: fsl-quadspi: Add fsl,ls2080a-dspi
 compatible string
Date: Tue, 8 Mar 2016 02:03:21 +0000
Message-ID: <AM2PR04MB0722F2CC1847AA5E9FDD96F289B20@AM2PR04MB0722.eurprd04.prod.outlook.com>
References: <1453793041-35868-1-git-send-email-yao.yuan@freescale.com>
 <1453793041-35868-4-git-send-email-yao.yuan@freescale.com>
 <20160307203200.GW55664@google.com>
In-Reply-To: <20160307203200.GW55664@google.com>
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

On Tue, Mar 08, 2016 at 4:32AM, Brian Norris wrote:
> On Tue, Jan 26, 2016 at 03:23:58PM +0800, Yuan Yao wrote:
> > new compatible string: "fsl,ls2080a-qspi".
>=20
> ^^ This line doesn't match the subject or the content of the patch.
>=20
> > Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> > Changed in v4:
> > No changes.
> >
> > Changed in v3:
> > Add the modifier for new compatible string like:
> > "fsl,ls2080a-dspi" followed by "fsl,ls2085a-dspi"
> >
> > Changed in v2:
> > Update my email to <yao.yuan@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt | 5 ++++-
>=20
> ^^ What is this change doing in this series anyway? You're touching MTD s=
tuff,
> not SPI stuff, and this string doesn't get used in any driver. Is this co=
ntroller
> somehow related, or is it a separate IP block that happens to be on some =
of the
> same SoCs?
>=20

Sorry for the wrong subject, this patch is used for add the SPI(DSPI) bingi=
ng document.
It should be some mistake that I make the wrong subject and the commit mess=
age.

> Anyway, you should send this kind of stuff to the SPI list, not the MTD o=
ne.

I will resend it to SPI list, thanks for your review.

> Regards,
> Brian
>=20
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> > b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> > index fa77f87..1ad0fe3 100644
> > --- a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> > +++ b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> > @@ -1,7 +1,10 @@
> >  ARM Freescale DSPI controller
> >
> >  Required properties:
> > -- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi", "fsl,ls2085a=
-dspi"
> > +- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi",
> > +		"fsl,ls2085a-dspi"
> > +		or
> > +		"fsl,ls2080a-dspi" followed by "fsl,ls2085a-dspi"
> >  - reg : Offset and length of the register set for the device
> >  - interrupts : Should contain SPI controller interrupt
> >  - clocks: from common clock binding: handle to dspi clock.
> > --
> > 2.1.0.27.g96db324
> >
