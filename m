From: Marek Vasut <marex@denx.de>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH linux-next v4 5/5] mtd: atmel-quadspi: add driver for
 Atmel QSPI controller
Date: Tue, 25 Aug 2015 12:22:10 +0200
Cc: nicolas.ferre@atmel.com, broonie@kernel.org, linux-spi@vger.kernel.org,
 dwmw2@infradead.org, computersforpeace@gmail.com, zajec5@gmail.com,
 beanhuo@micron.com, juhosg@openwrt.org, shijie.huang@intel.com,
 ben@decadent.org.uk, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 linux-mtd@lists.infradead.org
References: <cover.1440410236.git.cyrille.pitchen@atmel.com>
 <201508241303.52066.marex@denx.de> <55DC40C1.3050405@atmel.com>
In-Reply-To: <55DC40C1.3050405@atmel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201508251222.10813.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, August 25, 2015 at 12:17:37 PM, Cyrille Pitchen wrote:
> Hi Marek,

Hi!

> Le 24/08/2015 13:03, Marek Vasut a =E9crit :
> > On Monday, August 24, 2015 at 12:14:00 PM, Cyrille Pitchen wrote:
> >> This driver add support to the new Atmel QSPI controller embedded into
> >> sama5d2x SoCs. It expects a NOR memory to be connected to the QSPI
> >> controller.
> >>=20
> >> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> >> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> >=20
> > Hi,
> >=20
> > [...]
> >=20
> >> +/* Register access macros */
> >=20
> > These are functions, not macros :)
> >=20
> > btw is there any reason for these ? I'd say, just put the read*() and
> > write*() functions directly into the code and be done with it, it is
> > much less confusing.
>=20
> If you don't mind, I'd rather keep some of these inline functions. I have
> no strong justification, it's more a personal taste: it makes lines
> shorter as it avoids the need to add "->regs + ".
> Also it makes the code consistent with other Atmel drivers which already
> use such wrappers.
>=20
> However I'll fix the comment and remove the byte and word versions, which
> are not used. So only qspi_readl() and qspi_writel() are left.
>=20
> Does it sound good to you?

In my mind, seeing explicit readl_relaxed() somewhere is much easier to
digest than seeing some wrapper, which I have to look up. But please do
wait for others to voice their concern too, I might not be the best person
to tell you what to do when it comes to wrapping IO accessors ;-)

Best regards,
Marek Vasut
