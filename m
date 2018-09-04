Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxB6s-0000G1-9b
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 13:11:13 +0000
Subject: Re: Query: spi-nor: dummy buswidth calculation
To: Boris Brezillon <boris.brezillon@bootlin.com>, Yogesh Narayan Gaur
 <yogeshnarayan.gaur@nxp.com>
CC: "juliensu@mxic.com.tw" <juliensu@mxic.com.tw>, "zhengxunli@mxic.com.tw"
 <zhengxunli@mxic.com.tw>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "masonccyang@mxic.com.tw"
 <masonccyang@mxic.com.tw>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>
References: <VI1PR04MB1038E10EBE458DD72A1070C499030@VI1PR04MB1038.eurprd04.prod.outlook.com>
 <20180904143028.4629fe10@bbrezillon>
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Message-ID: <be22e046-48dd-a599-b812-825abde9916d@microchip.com>
Date: Tue, 4 Sep 2018 15:10:44 +0200
MIME-Version: 1.0
In-Reply-To: <20180904143028.4629fe10@bbrezillon>
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

Hi all,

Le 04/09/2018 à 14:30, Boris Brezillon a écrit :
> +Macronix team
> 
> On Tue, 4 Sep 2018 09:28:11 +0000
> Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
> 
>> Hi Boris,
>>
>> I have query regarding dummy bus width calculation for the read commands, added in the patch series [1]
>>
>> In func m25p80_read(), dummy.buswidth is being assigned as
>> +       op.dummy.buswidth = op.addr.buswidth;
>>
>> Above, buswidth for dummy commands are being assigned and are marked equal to the buswidth of the address command.
>> This is true for case when we are doing operation in 1-4-4 or 1-2-2 protocol where data as well as address are running on same data lines and having same buswidth.
>>
>> I am adding support of octal commands in framework and for this needs to add support for 1-1-8 protocol for Micron flash MT35XU512ABA1G12.
>> For octal command, 7Ch, flash is sending data and the dummy on the 8 data lines and address on 1 data line.
> 
> Interesting. Macronix is also working on octo-mode support. I think we
> should sync instead of duplicating the work.
> 
>>
>> If I do below code change, then I am getting correct data else there is data corruption only in the first byte read.
>> -       op.dummy.buswidth = op.addr.buswidth;
>> +       op.dummy.buswidth = spi_nor_get_protocol_data_nbits(nor->read_proto);
> 
> Regarding this particular aspect, I just followed what was done before
> the conversion to spi_mem_exec_op(). Maybe it was not correct though.
>

Actually this is correct and changing that for the above proposal would
clearly break support of all existing memories in SPI 1-1-2 or SPI 1-1-4.

SPI x-y-z means:
- x I/O line(s) for the instruction op code cycles
- y I/O line(s) for the address/mode/dummy cycles
- z I/O line(s) for the data cycles

Till now, this is how all Dual or Quad SPI NOR flash memories work.
Besides, according to the recent JEDEC JESD126 rev C specification,
introducing support to Octo SPI protocols:

6.4.20 JEDEC Basic Flash Parameter Table: 17th DWORD
Bits   Description

23:21  (1-1-8) Fast Read Number of Mode Clocks

       This filed will be 000b if Mode Bits are not supported.
       NOTE This field should be counted in clocks not number of bits
       received by the serial flash. The master drivers the bus during
       "mode bits" cycles, the master tri-states the bus during
       "dummy" cycles.

       Example: If 4 mode bits are needed with a single input address
       phase command, this field would be 100b.

20:16  (1-1-8) Fast Read Number of Wait states (dummy clocks) needed
       before valid output

       This field will be 00000b if wait states/dummy clocks are not supported.
       (The number of dummy clocks should be > 0 to avoid contention on bi-
        directional pins.)

       Example: If 8 bits are needed with a single input address phase command,
       this field would be 01000b.

So it looks like SPI 1-1-8 follows the same logic as SPI 1-1-2 and SPI 1-1-4.
Then either there is an error about the actual number of dummy clock cycles to
use or Micron folks have decided to design things their own way.

I've tried to download the datasheet for MT35XU512ABA1G12 but its under NDA.

Best regards,

Cyrille

 
> Regards,
> 
> Boris
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
