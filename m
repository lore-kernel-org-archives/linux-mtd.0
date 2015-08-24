From: Marek Vasut <marex@denx.de>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 ben@decadent.org.uk
Subject: Re: [PATCH linux-next v4 5/5] mtd: atmel-quadspi: add driver for
 Atmel QSPI controller
Date: Mon, 24 Aug 2015 19:45:33 +0200
Cc: nicolas.ferre@atmel.com, broonie@kernel.org, linux-spi@vger.kernel.org,
 dwmw2@infradead.org, computersforpeace@gmail.com, zajec5@gmail.com,
 beanhuo@micron.com, juhosg@openwrt.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 linux-mtd@lists.infradead.org
References: <cover.1440410236.git.cyrille.pitchen@atmel.com>
 <201508241303.52066.marex@denx.de> <55DB4EA6.9090807@atmel.com>
In-Reply-To: <55DB4EA6.9090807@atmel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201508241945.33577.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, August 24, 2015 at 07:04:38 PM, Cyrille Pitchen wrote:
> Hi Marek,

Hi!

> Le 24/08/2015 13:03, Marek Vasut a =E9crit :
> > On Monday, August 24, 2015 at 12:14:00 PM, Cyrille Pitchen wrote:
> >> This driver add support to the new Atmel QSPI controller embedded into
> >> sama5d2x SoCs. It expects a NOR memory to be connected to the QSPI
> >> controller.

[...]

> >> +	/* Compute address parameters */
> >> +	switch (cmd->enable.bits.address) {
> >> +	case 4:
> >> +		ifr |=3D QSPI_IFR_ADDRL;
> >> +		/*break;*/ /* fallback to the 24bit address case */
> >=20
> > What's this commented out bit of code for ? :-)
>=20
> I just wanted to stress out there was no missing "break;".
> I've reworded the comment to:
> /* No "break" on purpose: fallback to the 24bit address case. */

Oh, the address is in bytes . I see, yes, it makes sense to be more
explicit here about the purpose of the fallback. I think this change
in the comment will make it easier for everyone who comes back in a
few years and reads this code.

> >> +	case 3:
> >> +		iar =3D (cmd->enable.bits.data) ? 0 : cmd->address;
> >> +		ifr |=3D QSPI_IFR_ADDREN;
> >> +		break;
> >> +	case 0:
> >> +		break;
> >> +	default:
> >> +		return -EINVAL;
> >> +	}
> >=20
> > [...]
> >=20
> >> +no_data:
> >> +	/* Poll INSTRuction End status */
> >> +	sr =3D qspi_readl(aq, QSPI_SR);
> >> +	if (sr & QSPI_SR_INSTRE)
> >> +		return err;
> >> +
> >> +	/* Wait for INSTRuction End interrupt */
> >> +	init_completion(&aq->completion);
> >=20
> > You should use reinit_completion() in the code. init_completion()
> > should be used only in the probe() function and nowhere else.
>=20
> Alright. In the next version I'll rename the "completion" member of
> struct atmel_qspi into "cmd_completion". Also I'll add another
> dma_completion member in this very same structure to replace the local
> "struct completion completion" in atmel_qspi_run_dma_transfer().
>=20
> Then I'll call init_completion() on both cmd_completion and dma_completion
> only from atmel_qspi_probe() and reinit_completion() elsewhere.
>=20
> >> +	aq->pending =3D 0;
> >> +	qspi_writel(aq, QSPI_IER, QSPI_SR_INSTRE);
> >> +	if (!wait_for_completion_timeout(&aq->completion,
> >> +					 msecs_to_jiffies(1000)))
> >> +		err =3D -ETIMEDOUT;
> >> +	qspi_writel(aq, QSPI_IDR, QSPI_SR_INSTRE);
> >> +
> >> +	return err;
> >> +}
> >=20
> > [...]
> >=20
> > Hope this helps :)
>=20
> Indeed, it does! I still work on the next version of this series to take
> all your comments into account.

Thanks :)
