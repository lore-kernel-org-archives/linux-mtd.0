Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ai3Rn-0002S8-Te
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2016 17:16:56 +0000
Subject: Re: [PATCH 1/1] mtd: spi-nor: add an alternative method to support
 memory >16MiB
To: Brian Norris <computersforpeace@gmail.com>
References: <1458556429-11741-1-git-send-email-cyrille.pitchen@atmel.com>
 <20160321170107.GG2545@google.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: <linux-mtd@lists.infradead.org>, <nicolas.ferre@atmel.com>,
 <boris.brezillon@free-electrons.com>, <marex@denx.de>,
 <linux-kernel@vger.kernel.org>
Message-ID: <56F02C70.6050106@atmel.com>
Date: Mon, 21 Mar 2016 18:16:32 +0100
MIME-Version: 1.0
In-Reply-To: <20160321170107.GG2545@google.com>
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

Hi Brian,

Le 21/03/2016 18:01, Brian Norris a écrit :
> On Mon, Mar 21, 2016 at 11:33:49AM +0100, Cyrille Pitchen wrote:
>> This patch provides an alternative mean to support memory above 16MiB
>> (128Mib) by replacing 3byte address op codes by their associated 4byte
>> address versions.
>>
>> Using the dedicated 4byte address op codes doesn't change the internal
>> state of the SPI NOR memory as opposed to using other means such as
>> updating a Base Address Register (BAR) and sending command to enter/leave
>> the 4byte mode.
>>
>> Hence when a CPU reset occurs, early bootloaders don't need to be aware
>> of BAR value or 4byte mode being enabled: they can still access the first
>> 16MiB of the SPI NOR memory using the regular 3byte address op codes.
>>
>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> 
> I understand this reasoning, and that's all well and good. I'd like to
> see this happen for all flash that support it, since the stateful 4-byte
> modes just seem to break things a lot. But one question below.
> 
>> ---
>>
>> Hi all,
>>
>> This patch was tested on a sama5d2 xplained board + Macronix mx25l25635e.
>>
>> Best regards,
>>
>> Cyrille
>>
>>  drivers/mtd/spi-nor/Kconfig   |  12 +++++
>>  drivers/mtd/spi-nor/spi-nor.c | 105 +++++++++++++++++++++++++++++++++---------
>>  include/linux/mtd/spi-nor.h   |  23 ++++++---
>>  3 files changed, 113 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
>> index d42c98e1f581..7fae36fc8526 100644
>> --- a/drivers/mtd/spi-nor/Kconfig
>> +++ b/drivers/mtd/spi-nor/Kconfig
>> @@ -29,6 +29,18 @@ config MTD_SPI_NOR_USE_4K_SECTORS
>>  	  Please note that some tools/drivers/filesystems may not work with
>>  	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
>>  
>> +config MTD_SPI_NOR_USE_4B_OPCODES
>> +	bool "Use 4-byte address op codes"
>> +	default n
>> +	help
>> +	  This is an alternative to the "Enter/Exit 4-byte mode" commands and
>> +	  Base Address Register (BAR) updates to support flash size above 16MiB.
>> +	  Using dedicated 4-byte address op codes for (Fast) Read, Page Program
>> +	  and Sector Erase operations avoids changing the internal state of the
>> +	  SPI NOR memory. Hence if a CPU reset occurs, early bootloaders can
>> +	  still use regular 3-byte address op codes and read from the very first
>> +	  16MiB of the flash memory.
>> +
> 
> Why does this need to be a Kconfig option? Can't it just as well be
> supported by keeping entries in the ID table, to show which flash
> support these opcodes and which don't? Kconfig is really a bad mechanism
> for trying to configure your flash.
> 
>>  config SPI_FSL_QUADSPI
>>  	tristate "Freescale Quad SPI controller"
>>  	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
> 
> [snip the rest for now, since I don't think it's relevant]
> 
> Brian
> 

Well, the only reason why I've chosen a Kconfig option is to be as safe as
possible, if for some reason someone still wants to use the former
implementation. Honestly I don't know why one would do so but I'm cautious
so I also set "default n". This way no regression is introduced.

If you think it's better to use a dedicated flag like SECT_4K or
SPI_NOR_QUAD_READ in the spi_nor_ids[] table, I'm perfectly fine with it as
well.

Just let me know your choice then I'll update my patch accordingly if needed.

Best regards,

Cyrille
