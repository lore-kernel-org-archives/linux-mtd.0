Date: Fri, 1 Mar 2013 09:14:04 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 07/12] mtd: gpmi: move to use generic DMA helper
Message-ID: <20130301011401.GA30499@S2101-09.ap.freescale.net>
References: <1361978748-25281-1-git-send-email-shawn.guo@linaro.org>
 <1361978748-25281-8-git-send-email-shawn.guo@linaro.org>
 <512F17B0.5080705@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <512F17B0.5080705@freescale.com>
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>, Arnd Bergmann <arnd@arndb.de>,
 Artem Bityutskiy <dedekind1@gmail.com>, Vinod Koul <vinod.koul@intel.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 28, 2013 at 04:39:12PM +0800, Huang Shijie wrote:
> =E4=BA=8E 2013=E5=B9=B402=E6=9C=8827=E6=97=A5 23:25, Shawn Guo =E5=86=99=
=E9=81=93:
> > +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> > @@ -7,10 +7,12 @@ Required properties:
> >    - compatible : should be "fsl,<chip>-gpmi-nand"
> >    - reg : should contain registers location and length for gpmi and =
bch.
> >    - reg-names: Should contain the reg names "gpmi-nand" and "bch"
> > -  - interrupts : The first is the DMA interrupt number for GPMI.
> > -                 The second is the BCH interrupt number.
> > -  - interrupt-names : The interrupt names "gpmi-dma", "bch";
> > -  - fsl,gpmi-dma-channel : Should contain the dma channel it uses.
> > +  - interrupts : BCH interrupt number.
> > +  - interrupt-names : Should be "bch".
> why split out the bch interrupt? It seems no use to do it.
>=20
The real change here is to remove gpmi-dma interrupt, since we have all
dma interrupts defined in dma controller node.

Shawn
