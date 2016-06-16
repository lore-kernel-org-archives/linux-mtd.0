Received: from arroyo.ext.ti.com ([198.47.19.12])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDR2b-0002wC-9p
 for linux-mtd@lists.infradead.org; Thu, 16 Jun 2016 06:44:38 +0000
Subject: Re: [PATCH V12 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller
To: Marek Vasut <marex@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <1465000774-7762-1-git-send-email-marex@denx.de>
 <1465000774-7762-2-git-send-email-marex@denx.de> <575F91B2.7010304@ti.com>
 <575FFF97.7040104@denx.de>
CC: Graham Moore <grmoore@opensource.altera.com>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <57624A98.4060308@ti.com>
Date: Thu, 16 Jun 2016 12:13:36 +0530
MIME-Version: 1.0
In-Reply-To: <575FFF97.7040104@denx.de>
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



On Tuesday 14 June 2016 06:29 PM, Marek Vasut wrote:

>> I was wondering if its better to use direct access mode[1].
> 
> The link leads to altera documentation front page, but I have an idea
> what you mean. You might want to refer to [2] instead.
> 
> [2] https://www.altera.com/en_US/pdfs/literature/hb/cyclone-v/cv_5v4.pdf
> 

My link was suppose to point to html edition of above document.

>> With this
>> mode there is no need to wait for IRQ or monitor sdram level. By setting
>> up QSPI in direct access mode, this entire function can be replaced by:
>> memcpy(buf, cqspi->ahb_base + from, n_rx)
> 
> The altera docs, page 993, show how to use the direct access mode. The
> idea is to map 1 MiB blocks of the flash in the address space, one at a
> time and then do IO into those. I don't like such solution:
> 
> - I didn't find any way to find when all the data in the current 1 MiB
>   block were written and you can remap another 1 MiB block in place.

I believe this constraint only applies if enahbremap bit is set in cfg
register, if not, then the entire memory map can be accessed.


> - Since the controller doesn't use the internal buffer in direct
>   operation mode, it will block the AHB bus during it's operation.

I agree, this is a disadvantage.

> - I didn't find how IO errors get handled in this case, but maybe I
>   didn't drill deep enough on this one.
> 
> Moreover, page 991 bottom of [2] states that the indirect mode is
> "high-performance". I am inclined to believe that as it uses the
> internal buffer of the QSPI controller, which is tightly coupled to the
> block,
> so the data are available immediately when the flash is ready instead
> of having to wait for the next AHB turn.
> 

Indirect mode may be the better option when using DMA. But, my thinking
was that, for CPU copy, the interrupt overhead and the fact that sdram
level needs to be monitored constantly might affect throughput badly
while using indirect mode.

> My impression is that the Direct mode is great when the system boots
> from the QSPI because it can "map" the flash and just execute code from
> it. But for normal operation, the indirect mode seems the better choice.
> 
>> IMO, this might give better throughput. Have tested this mode?
> 
> I haven't tested it, no.
> 

Anyways, direct mode support can be added (if required) at later point
of time. I have no objection for current approach as such.

Thanks for the reply!


-- 
Regards
Vignesh
