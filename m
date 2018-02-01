Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ehD5z-0008DM-8H
 for linux-mtd@lists.infradead.org; Thu, 01 Feb 2018 11:32:00 +0000
Subject: Re: [PATCH 1/3] spi-nor: intel-spi: Prefer WREN over other write
 enables
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 <linux-mtd@lists.infradead.org>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Bin Meng
 <bmeng.cn@gmail.com>, Richard Weinberger <richard@nod.at>, Anthony Wong
 <anthony.wong@canonical.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
References: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Message-ID: <fee495b4-b14a-b962-a6ce-3ab8639c9111@microchip.com>
Date: Thu, 1 Feb 2018 12:36:56 +0100
MIME-Version: 1.0
In-Reply-To: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mika,

Le 04/01/2018 à 10:07, Mika Westerberg a écrit :
> On many older systems using SW sequencer the PREOP_OPTYPE register
> contains two preopcodes as following:
> 
>   PREOP_OPTYPE=0xf2785006
> 
> The last two bytes are the opcodes decoded to:
> 
>   0x50 - Write enable for volatile status register
>   0x06 - Write enable
> 
> The former is used to modify volatile bits in the status register. For
> non-volatile bits the latter is needed. Preopcodes are used in SW
> sequencer to send one command "atomically" without anything else
> interfering the transfer. The sequence that gets executed is:
> 
>   - Send preopcode (write enable) from PREOP_OPTYPE register
>   - Send the actual SPI command
>   - Poll busy bit in the status register (0x05, RDSR)
> 
> Commit 8c473dd61bb5 ("spi-nor: intel-spi: Don't assume OPMENU0/1 to be
> programmed by BIOS") enabled atomic sequence handling but because both
> preopcodes are programmed, the following happens:
> 
>   if (preop >> 8)
>   	val |= SSFSTS_CTL_SPOP;
> 
> Since on these systems preop >> 8 == 0x50 we end up picking volatile
> write enable instead. Because of this the actual write command is pretty
> much NOP unless there is a WREN latched in the chip already.
> 
> Fix this by preferring WREN over other write enable preopcodes.
> 
> Fixes: 8c473dd61bb5 ("spi-nor: intel-spi: Don't assume OPMENU0/1 to be programmed by BIOS")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/mtd/spi-nor/intel-spi.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
> index ef034d898a23..bba762aa0c8d 100644
> --- a/drivers/mtd/spi-nor/intel-spi.c
> +++ b/drivers/mtd/spi-nor/intel-spi.c
> @@ -498,9 +498,17 @@ static int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, int len,
>  	val |= SSFSTS_CTL_SCGO;
>  	preop = readw(ispi->sregs + PREOP_OPTYPE);
>  	if (preop) {
> -		val |= SSFSTS_CTL_ACS;
> -		if (preop >> 8)
> -			val |= SSFSTS_CTL_SPOP;
> +		switch (optype) {
> +		case OPTYPE_WRITE_NO_ADDR:
> +		case OPTYPE_WRITE_WITH_ADDR:
> +			/*
> +			 * For writes prefer WREN over other write enable
> +			 * opcodes.
> +			 */
> +			val |= SSFSTS_CTL_ACS;
> +			if ((preop >> 8) == SPINOR_OP_WREN)
> +				val |= SSFSTS_CTL_SPOP;
> +		}
>  	}
>  	writel(val, ispi->sregs + SSFSTS_CTL);
>  
> 

I generally strongly discourage the use of SPINOR_OP_* macros in any
SPI (flash) controller driver, because when some of them does so it
often means that driver tries to guess what spi-nor.c expects it to do
and then tries to tweak the requested SPI command.
It may work at some point but when we do some legitimate changes
inside spi-nor.c, the SPI (flash) controller driver may no longer know
what to do with new and unexpected SPI commands.

Definitely, such SPI (flash) controller driver is broken and is a real
pain to maintain. SPI (flash) controller drivers should be "dummy" and
just execute the SPI command as requested by spi-nor.c, without
tuning, modifying it or whatever.

It seems that Yogesh is currently cleaning the fsl-quadspi.c driver to
remove reference to SPINOR_OP_* macros, which is a really good thing.
So I would like the same thing to be done for the intel-spi.c driver.

More precisely, for a first step, I would like intel_spi_write_reg()
to be updated so the "if (opcode == SPINOR_OP_WREN) { ... }" chunk is
replaced by something like this:

1/ The SPI flash controller is locked

compare the opcode argument with the supported opcodes read from the
registers of the Intel SPI controller (OPMENU0, OPMENU1 or
PREOP[_OPTYPE]). If the op code was found, good! then just use it,
otherwise return -EINVAL instead of pretending that the SPI command
has been handled. Indeed, with the current source code,
intel_spi_write_reg() pretends that the Write Enable command was sent
but actually is not.

When this driver was introduced first, I thought that the hardware was
comparing the op code then automatically preprended some Write Enable
command when needed but based on the lastest commits, it seems the
finally the hardware doesn't work this way.

Hence if the sending of the Write Enable command, or any other SPI
command, has to be triggered by the software in some way, please don't
try to mystify spi-nor.c if the requested operation has not been
handled as expected.

2/ The SPI flash controller has not been locked

Write the requested opcode in whatever register you want (OPMENU0,
OPMENU1 or PREOP) then execute the SPI command as requested.
Once again, I would like to avoid any special case, like
SPINOR_OP_WREN. So maybe PREOP should not be used at all to prepend
Write Enable before the next to come SPI command but simply just use
OPMENU0 in all cases.


If you still need to use PREOP_OPTYPE from intel_spi_sw_cycle(), then
the value of the SSFSTS_CTL_ACS and/or SSFSTS_CTL_SPOP flags should
have been chosen from the very same place where it has been decided
that we will use the PREOP_OPTYPE to prepend some op code before the
next SPI command. It's too late once in intel_spi_sw_cycle() to guess
what opcode may need to be inserted.

The source code should not rely on the following assumption:

(PREOP_OPTYPE != 0) => "We want to send a Write Enable command"


For what I understand, it might be almost enough to just remove the
"if (opcode == SPINOR_OP_WREN) { .. }" chunk from intel_spi_write_reg()
and add replace the "if (preop)" test in intel_spi_sw_cycle() by
"if (!ispi->locked && preop)".

Also, at some point the 16 least significant bits of PREOP_OPTYPE should
be reset to zero, otherwise all SPI commands to follow would keep on
inserting op codes from the PREOP_OPTYPE register...

Finally, if intel_spi_sw_cycle() could be used in any cases, then please
remove intel_spi_hw_cycle() and its references to SPINOR_OP_* macros.


Best regards,

Cyrille
