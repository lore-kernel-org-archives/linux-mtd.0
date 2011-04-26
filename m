Received: from newsmtp5.atmel.com ([204.2.163.5] helo=sjogate2.atmel.com)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QEgMY-0000E7-F4
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 11:23:27 +0000
Subject: Re: [PATCH 2/2] mtd: add switch to support NAND flash on big
	endian bus
From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1104131609410.30071@lnxricardw.se.axis.com>
References: <1302702918-6050-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1302702918-6050-2-git-send-email-hans-christian.egtvedt@atmel.com>
	<Pine.LNX.4.64.1104131609410.30071@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Apr 2011 13:23:08 +0200
Message-ID: <1303816988.3125.7.camel@hcegtvedt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-13 at 16:11 +0200, Ricard Wanderlof wrote:
> On Wed, 13 Apr 2011, Hans-Christian Egtvedt wrote:
> 
> > This patch adds a new kconfig symbol to the MTD NAND system, MTD_NAND_BE_BUS.
> > This symbol is used by the nand base to properly convert the data read from the
> > bus into the format the CPU expects.
> >
> > The patch fixes 16-bit NAND flash support on big endian architectures (at least
> > AVR32) with NAND flash hooked up to a big endian external bus.
> >
> > Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
> > ---
> > drivers/mtd/nand/Kconfig     |    8 ++++++++
> > drivers/mtd/nand/nand_base.c |    8 ++++++++
> > 2 files changed, 16 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> > index edec457..bb3a54a 100644
> > --- a/drivers/mtd/nand/Kconfig
> > +++ b/drivers/mtd/nand/Kconfig
> > @@ -22,6 +22,14 @@ menuconfig MTD_NAND
> >
> > if MTD_NAND
> >
> > +config MTD_NAND_BE_BUS
> > +	bool "NAND device on big endian bus"
> > +	default n
> > +	help
> > +	  This option will assume data read from the bus is in big endian
> > +	  format. This is vital when reading command values from the bus, as
> > +	  only the lower 8 bit are in use then.
> > +
> > config MTD_NAND_VERIFY_WRITE
> > 	bool "Verify NAND page writes"
> > 	help
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index c54a4cb..bbb0c1d 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -180,7 +180,11 @@ static uint8_t nand_read_byte(struct mtd_info *mtd)
> > static uint8_t nand_read_byte16(struct mtd_info *mtd)
> > {
> > 	struct nand_chip *chip = mtd->priv;
> > +#if CONFIG_MTD_NAND_BE_BUS
> > +	return (uint8_t) be16_to_cpu(readw(chip->IO_ADDR_R));
> > +#else
> > 	return (uint8_t) cpu_to_le16(readw(chip->IO_ADDR_R));
> > +#endif }
> 
> Wouldn't one expect a certain symmetry here, i.e. if one function is
> cpu_to_le16, the other one would be called cpu_to_be16 ? I guess in most 
> cases cpu_to_le16 would be the same as le16_to_cpu, etc, but it still 
> looks as if someone made a mistake.

My other option for this patch is to remove the endianness conversion
all together, it looks a bit weird, and AFAICT it indicates that the
external NAND device is wired in a certain way to the bus interface.

Perhaps someone with knowledge about this specific piece of code can
shed some light on this?

-- 
Hans-Christian Egtvedt
