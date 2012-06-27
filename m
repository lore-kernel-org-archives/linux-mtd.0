MIME-Version: 1.0
In-Reply-To: <20120627191542.GC25319@n2100.arm.linux.org.uk>
References: <1340812275-1197-1-git-send-email-stigge@antcom.de>
 <20120627191542.GC25319@n2100.arm.linux.org.uk>
Date: Wed, 27 Jun 2012 16:26:18 -0300
Message-ID: <CAAAP30Fdr2_tcgMYjCirVPCPTtrUgbeMb=7j=69wGtvJeiLsOA@mail.gmail.com>
Subject: Re: [PATCH 1/4] mtd: lpc32xx_slc: Select AMBA_PL08X in Kconfig
From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Roland Stigge <stigge@antcom.de>, srinivas.bakki@nxp.com, lars@metafoo.de,
 linux-doc@vger.kernel.org, leiwen@marvell.com,
 devicetree-discuss@lists.ozlabs.org, dedekind1@gmail.com,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, hechtb@googlemail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 27, 2012 at 4:15 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Wed, Jun 27, 2012 at 05:51:12PM +0200, Roland Stigge wrote:
>> From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
>>
>> Since this driver depends on the amba pl08x dma driver, select it in Kco=
nfig.
>>
>> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
>> Signed-off-by: Roland Stigge <stigge@antcom.de>
>> ---
>> =A0drivers/mtd/nand/Kconfig | =A0 =A01 +
>> =A01 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index de69978..a9e8b73 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -417,6 +417,7 @@ config MTD_NAND_PXA3xx
>> =A0config MTD_NAND_SLC_LPC32XX
>> =A0 =A0 =A0 tristate "NXP LPC32xx SLC Controller"
>> =A0 =A0 =A0 depends on ARCH_LPC32XX
>> + =A0 =A0 select AMBA_PL08X
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Enables support for NXP's LPC32XX SLC (i.e. for Single L=
evel Cell
>> =A0 =A0 =A0 =A0 chips) NAND controller. This is the default for the PHYT=
EC 3250
>
> Surely not? =A0Drivers using DMA engine really should not depend on any
> particular DMA engine implementation.

Should the DMA code in this driver be ifdef'd like in spi-pl022.c?

Or just depend on DMA_ENGINE instead?
