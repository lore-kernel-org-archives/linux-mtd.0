Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brlhT-00080F-Qr
 for linux-mtd@lists.infradead.org; Wed, 05 Oct 2016 12:53:32 +0000
Subject: Re: [PATCH 2/9] mtd: spi-nor: add an alternative method to support
 memory >16MiB
To: Vignesh R <vigneshr@ti.com>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
References: <cover.1475597385.git.cyrille.pitchen@atmel.com>
 <75db6c008249df8d0646ea5006648e57fea40706.1475597385.git.cyrille.pitchen@atmel.com>
 <d35f2b66-1915-8111-9187-cdc49417f787@ti.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: <marex@denx.de>, <boris.brezillon@free-electrons.com>,
 <nicolas.ferre@atmel.com>, <linux-kernel@vger.kernel.org>
Message-ID: <aabd37f7-b173-650c-aac4-4bc8fa7a0daa@atmel.com>
Date: Wed, 5 Oct 2016 14:53:07 +0200
MIME-Version: 1.0
In-Reply-To: <d35f2b66-1915-8111-9187-cdc49417f787@ti.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vignesh,

Le 05/10/2016 à 14:12, Vignesh R a écrit :
> Hi,
> 
> 
> On Tuesday 04 October 2016 10:07 PM, Cyrille Pitchen wrote:
> [...]
>>  static struct seq_rw_config stfsm_s25fl_write4_configs[] = {
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 5c87b2d99507..423448c1c7a8 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -75,6 +75,10 @@ struct flash_info {
>>  					 * bit. Must be used with
>>  					 * SPI_NOR_HAS_LOCK.
>>  					 */
>> +#define SPI_NOR_4B_OPCODES	BIT(10)	/*
>> +					 * Use dedicated 4byte address op codes
>> +					 * to support memory size above 128Mib.
>> +					 */
> 
> 
> I don't see this flag being added to any flash_info data for any m25p80
> compatible flashes? Is that part of a separate series?
> 

Indeed, this flag is not used yet by any entry in the spi_nor_ids[] array.
At first, I tested this patch with a Macronix mx25l25673g memory.
This memory shares the very same JEDEC ID as the older mx25l25635e, so
I added the SPI_NOR_4B_OPCODES flag in the mx25l25635e entry during my test.
However I didn't commit this change since the actual mx25l25635e memory
doesn't support The 4-byte address instruction test.

Also the mx25l25673g provides the optional 4-byte Address Instruction Table,
as described in the JESD216 rev B specification, so patches 6 and 7 allow
to use the 4-byte address op codes without setting the SPI_NOR_4B_OPCODES flag.

Hence the SPI_NOR_4B_OPCODES, will be useful for memories which don't
provide the JESD216B 4-byte Address Instruction Table but still support
the associated op code. It will have to be tested for each individual entry
in the spi_nor_ids[] array, which can be done later.

Anyway, the 4-byte address op codes introduced by this patch are also used
by patch 7 (parse SFDP 4-byte Address Instruction Table).

Best regards,

Cyrille
