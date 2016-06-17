Received: from arroyo.ext.ti.com ([198.47.19.12])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDldo-0007Mk-3K
 for linux-mtd@lists.infradead.org; Fri, 17 Jun 2016 04:44:24 +0000
Subject: Re: [PATCH V12 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller
To: Marek Vasut <marex@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <1465000774-7762-1-git-send-email-marex@denx.de>
 <1465000774-7762-2-git-send-email-marex@denx.de> <575F91B2.7010304@ti.com>
 <575FFF97.7040104@denx.de> <57624A98.4060308@ti.com>
 <5762A7E6.8000109@denx.de>
CC: Graham Moore <grmoore@opensource.altera.com>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <57637FF1.9030802@ti.com>
Date: Fri, 17 Jun 2016 10:13:29 +0530
MIME-Version: 1.0
In-Reply-To: <5762A7E6.8000109@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Thursday 16 June 2016 06:51 PM, Marek Vasut wrote:
> On 06/16/2016 08:43 AM, Vignesh R wrote:
[...]
>>> - I didn't find any way to find when all the data in the current 1 MiB
>>>   block were written and you can remap another 1 MiB block in place.
>>
>> I believe this constraint only applies if enahbremap bit is set in cfg
>> register, if not, then the entire memory map can be accessed.
> 
> And where is that memory window accessible then, at which address ?
> The SoCFPGA peripherals are stuffed in some 12 MiB of the address
> space, the rest is bootrom/sram/ram and the FPGA bridges, so I find
> it hard to believe you can place ie. 128 MiB SPI NOR mapping somewhere
> in there.
> 
> My impression is that in direct mode, the qspi will always overlay the
> address 0x0 on socfpga , but that might be configurable , I'm not sure.
> 

Ah, socfgpa provides just 1MB window to access QSPI_DATA area. So direct
mode may not be practical as it will require remapping.
But, on TI EVM, QSPI_DATA area is 64MB in size, so looks like direct
mode(when added) needs to be tied to TI specific compatible.

-- 
Regards
Vignesh
