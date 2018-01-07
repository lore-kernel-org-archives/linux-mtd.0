Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYKOL-0002id-Er
 for linux-mtd@lists.infradead.org; Sun, 07 Jan 2018 23:30:16 +0000
Subject: Re: [PATCH 1/3] spi-nor: intel-spi: Prefer WREN over other write
 enables
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Bin Meng <bmeng.cn@gmail.com>, Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <e5406b68-c283-cedc-74bf-80e8a1f4da1c@wedev4u.fr>
Date: Mon, 8 Jan 2018 00:29:58 +0100
MIME-Version: 1.0
In-Reply-To: <20180104090744.67654-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
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

Le 04/01/2018 à 10:07, Mika Westerberg a écrit :
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

I agree with you but doesn't it mean that the Sector/Block Erase command that should
have been sent before the Page Program commands was discarded too?
If so, the BIOS should not have been corrupted at all.

Honestly, I don't really understand what is the real root cause of the BIOS corruption
reported by Ubuntu users. This is the issue your patch is trying to fix, isn't it?

Does the BIOS corruption occur just by probing the SPI controller and its SPI flash
memory during the boot or does some userspace program is involved too?

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

I guess I have figured out how the SPI controller works but just to be sure, what are
SSFSTS_CTL_SPOP and SSFSTS_CTL_ACS used for?

Why before commit 8c473dd61bb5 ("spi-nor: intel-spi: Don't assume OPMENU0/1 to be
programmed by BIOS") were they not used at all? Does it mean that before Bin's patch,
when the controller was locked (by the BIOS?), the Linux driver never sent any Write Enable
command as pre op code, hence the SPI flash memory was read-only?

Why is ispi->locked not tested inside intel_spi_sw_cycle() at the same time as the preop
value? Do you try now to allow Page Program and Sector/Block Erase operations also when
ispi->lock is true?

Best regards,

Cyrille
