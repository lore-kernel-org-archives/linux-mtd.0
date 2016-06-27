Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHVne-0007w9-38
 for linux-mtd@lists.infradead.org; Mon, 27 Jun 2016 12:38:03 +0000
Subject: Re: [PATCH 7/9] mtd: m25p80: add support of dual and quad spi
 protocols to all commands
To: Michal Suchanek <hramrach@gmail.com>
References: <cover.1466440540.git.cyrille.pitchen@atmel.com>
 <0a3b22ec3bc41c26536f3acc8acfd98f9b3207ed.1466440540.git.cyrille.pitchen@atmel.com>
 <CAOMqctSuP6E55mJ7QrqASRQUpxSy=ZR-b7VPF=0vcw45B6S+Yg@mail.gmail.com>
 <5770F762.30809@atmel.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: Brian Norris <computersforpeace@gmail.com>, MTD Maling List
 <linux-mtd@lists.infradead.org>, =?UTF-8?Q?Marek_Va=c5=a1ut?=
 <marex@denx.de>, Boris Brezillon <boris.brezillon@free-electrons.com>,
 <nicolas.ferre@atmel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, <marcin.krzeminski@nokia.com>
Message-ID: <57711E0A.4000006@atmel.com>
Date: Mon, 27 Jun 2016 14:37:30 +0200
MIME-Version: 1.0
In-Reply-To: <5770F762.30809@atmel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

+ Marcin,

According to Marcin's series of patches
"mtd: spi-nor: DUAL/QUAD I/O read modes implementation"
and the Spansion/Cypress S25FS512S datasheet, new Cypress QSPI memories
no longer supports Fast Read 1-1-2 or Fast Read 1-1-4 but only Fast Read x-2-2
and Fast Read x-4-4.

Hence one more example of the need to extend the spi-nor framework to support
QSPI memories correctly.

Also, looking at the datasheets of s25fL512s vs s25fS512s, the default
factory settings for the number of (mode + wait state) cycles has changed for
Fast Read 1-4-4 (EBh /ECh).

default 	mode 	wait state
L512s: 		2	4
S512s:		2	8

Those factory default settings are provided by the Basic Flash Parameter Table
from the Serial Flash Discoverable Parameters (JESD216). SFDP tables seem to
be supported by both families.

Hence this series of patches actually adds support to the new Spansion/Cypress
QSPI memories.

We will just have to care about setting a proper value in the mode cycles to
avoid entering the continuous read mode by mistake.
Looking at the JESD216 specification the 0xff value is likely to be a common
value for all manufacturers to tell the QSPI memory not to enter (or leave)
its continuous read/performance enhancement mode.

Entering the continuous read mode tells the QSPI memory that the op code value
will be implicit in the following command, which then will start from the
address cycles. The continuous mode is mainly (only ?) use for XIP application.

Adding support to the continuous read mode might be interesting but should be
discussed in a dedicated thread.

Best regards,

Cyrille

Le 27/06/2016 11:52, Cyrille Pitchen a écrit :
> Le 23/06/2016 22:35, Michal Suchanek a écrit :
>> Hello,
>>
>> this patch is kind of awesome.
>>
>> I have a few practical concerns however.
>>
>> On 20 June 2016 at 18:50, Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
>>> Before this patch, m25p80_read() supported few SPI protocols:
>>> - regular SPI 1-1-1
>>> - SPI Dual Output 1-1-2
>>> - SPI Quad Output 1-1-4
>>> On the other hand, all other m25p80_*() hooks only supported SPI 1-1-1.
>>
>> Under typical use my estimate is that huge majority of data is
>> transferred in _read() seconded by _write().
>>
>> As I understand it the n-n-n means how many bits you transfer in
>> parallel when sending command-address-data.
>>
>> In _read() the command and data overhead is negligible when you can
>> read kilobytes at once. So difference between 1-1-4 and 4-4-4 is not
>> meaningful performance-wise. Are there flash chips that support one
>> but not the other?
>>
>> For _write() the benefits are even harder to assess. You can
>> presumably write at n-n-4 or n-n-2 if your controller and flash
>> supports it transferring the page faster. And then spend possibly
>> large amount of time waiting for the flash to get ready again. If the
>> programming time is fixed transferring the page faster may or may not
>> have benefits. It may at least free the bus for other devices to use.
>>
> 
> This series of patches is not supposed to improve performances. Lets take
> a Macronix mx25l25673g as an example with a 512-byte read (3-byte address):
> 
> 1 - Fast Read 1-1-4 (0 mode cycle, 8 wait states)
> command: 8 cycles
> address/mode/dummy: (3 * 8) + 0 + 8 = 32 cycles
> data: (512 * 8) / 4 = 1024 cycles
> total: 8 + 32 + 1024 = 1064 cycles
> 
> 2 - Fast Read 1-4-4 (2 mode cycles, 4 wait states)
> command: 8 cycles
> address/mode/dummy: (3 * 8) / 4 + 2 + 4 = 12 cycles
> data: (512 * 8) / 4 = 1024 cycles
> total: 8 + 12 + 1024 = 1044 cycles
> 
> theoretical benefit: < 2%
> 
> 
> The real purpose of the whole series is to provide solutions to some known
> issues.
> 
> A - Currently the spi-nor force use the B7h op code to enter the 4-byte
> address mode of > 16MB memories. This mode is state-full; it changes the
> internal state of the SPI memory. Once in its 4-byte mode, the regular 3-byte
> Fast Read, Page Program and Sector Erase op codes are expected to be followed
> by a 4-byte address. Then if a spurious reset occurs, some bootloaders might
> be stuck as they still expect to use 3-byte addresses.
> 
> On the other hand, when available, the 4-byte address instruction set is
> stateless. So we'd rather use it whenever possible. It's the purpose of patch
> 2. However adding the SPI_NOR_4B_OPCODES on some memory entry is not always
> possible. Again, let's take the Macronix mx25l25673g memory as an example:
> it shares the very same JEDEC ID with the older mx25l25635e. The 73g supports
> the 4-byte address instruction set whereas the 35e doesn't. Hence we can't
> add the SPI_NOR_4B_OPCODES on the 35e entry without introducing a bug.
> 
> My first approach was to patch the spi-nor framework to allow two or more
> memory entries to share the same JEDEC ID and to select the right entry
> according to the compatible DT string. This solution was rejected.
> 
> Then my latest solution is to rely on the SFDP tables: the 73g supports the
> optional 4-byte Address Instruction Table whereas the 35e doesn't support SFDP
> table at all. Hence, when this table is successfully parsed on the 73g, we know
> we can safely use the 4-byte op codes. For the 35e case, we still enter the
> 4-byte address mode as before since there is no other solution...
> So with this series of patches, no regression with 35e memories but a solution
> to properly use 73g memories without changing their internal state: the
> bootloader is now happy.
> 
> 
> B - Setting the old 'mode' argument of spi_nor_read() to SPI_NOR_QUAD just told
> the SPI controller supports Fast Read 1-1-4 but nothing about whether it also
> supports Page Program x-y-4 commands. It is interesting to make the difference
> between read and write hardware capabilities. Indeed we cannot assume that if
> a controller can do Fast Read 1-1-4 operations then it can also perform
> Page Program 1-1-4. I'm pretty sure this statement is false. So let's the SPI
> controller explicitly declares its read and write hardware capabilities.
> 
> Once again, I'm not targeting performance improvement with Page Program.
> However, using other SPI protocols when available helps to deal with some
> memory quirks.
> 
> This time, let's take the case of Micron n25q512*. Those memory
> are > 16MB so we fall into the same issue as described in A.
> For those Micron memories, depending on the part number (telling us whether the
> Reset pin is available...) the 12h op code stands for two different operations:
> - either 3-byte address Page Program x-4-4 (the standard 38h op code for this
>   operation is not available and there is no op code for 4-byte Page Program
>   1-1-1)
> - either 4-byte address Page Program 1-1-1 (the standard command associated to
>   the 12h op code)
> 
> Since they are different part numbers of the same memory family, all those
> memories once again share the very same JEDEC ID and there no mean to 
> dynamically discover the actual part number (or I didn't find such a mean yet).
> Anyway, even knowing the part number, depending on the result, the 4-byte Page
> Program 1-1-1 operation is simply not supported.
> 
> Hopefully, for all part numbers, 4-byte Page Program 1-1-4 is always supported
> by the 34h op code, which is the standard hope code for this operation.
> 
> Then with SPI controllers which explicitly supports Page Program 1-1-4, we 
> could implement something to fix the Page Program operation on Micron memory
> above 16MB. Hence we have a solution!
> 
> There are just examples, I guess we could find others. My point is that
> currently we can't use some QPSI memories properly and its a blocking issue.
> The whole series should be see as a bug fixes enabler rather than a performance
> improvement.
> 
> 
>> The _reg_ stuff is probably negligible altogether,
>>
>> Lastly the faster transfers of address bytes seem to be achieved with
>> increasingly longer command codes given how much the maximum command
>> length increased. So even in a page write where the address is a few %
>> of the transfer the benefit of these extra modes is dubious.
> I'm not sure to understand this point but I guess you refer to:
> -#define	MAX_CMD_SIZE		6
> +#define	MAX_CMD_SIZE		16
> 
> If so, the actual command size doesn't change at all, the increase of this
> macro value is justified by another reason. Indeed, let's have a look into
> the m25p80_read_reg(): before the patch it was implemented using
> spi_write_then_read(). This later function uses an intermediate buffer,
> which might be kmalloc() allocated, to transfer data with spi_sync() and calls
> memcpy() to copy data from/to this imtermediate buffer to/from buffers
> provided as function parameters (txbuf and rxbuf).
> As the comment says, the purpose of this intermediate buffer is to be
> "DMA-safe".
> 
> Then, after the patch, spi_write_then_read() is no longer used but we still
> need a DMA-safe buffer to perform the data transfer with spi_sync(). This can
> be achieve with the flash->command[] buffer; we just need to increase its size
> some more since it is now also filled with the read data whereas it was only
> filled with the command/address/dummy data before.
> 
>>
>> Overall I wonder how much it is worthwhile to complicate the code to
>> get all these modes in every single function.
>>
>> Thanks
>>
>> Michal
>>
> 
> Best regards,
> 
> Cyrille
> 
