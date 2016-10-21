Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxYS8-0002RI-L3
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 11:57:38 +0000
Subject: Re: UBIFS with dma on 4.6 kernel is not working
To: Richard Weinberger <richard@nod.at>, Naga Sureshkumar Relli
 <naga.sureshkumar.relli@xilinx.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "Punnaiah Choudary
 Kalluri" <punnaia@xilinx.com>
References: <DA6901612C71B84D91459DE817C418AE26DF0F2B@XAP-PVEXMBX01.xlnx.xilinx.com>
 <519a83bf-1244-5151-b873-bb8e1f2db3c6@nod.at>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <9a25ff8c-d988-4954-0141-eea08a01258e@atmel.com>
Date: Fri, 21 Oct 2016 13:57:12 +0200
MIME-Version: 1.0
In-Reply-To: <519a83bf-1244-5151-b873-bb8e1f2db3c6@nod.at>
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

Hi all,

Le 21/10/2016 à 11:29, Richard Weinberger a écrit :
> Hi!
> 
> On 21.10.2016 11:21, Naga Sureshkumar Relli wrote:
>> Hi,
>>
>> This is regarding UBIFS on 4.6 kernel.
>> We have tested UBIFS on our ZynqMP SOC QSPI Controller, the UBIFS is not working with dma on this kernel.
>> Controller driver: https://github.com/torvalds/linux/commits/master/drivers/spi/spi-zynqmp-gqspi.c
>> If I replace all vmalloc allocations in fs/ubifs/ to kmalloc then UBIFS with dma is working fine.
> 
> No, it will sooner or later OOM. Both UBI and UBIFS need rather large buffers, that's why we have to use
> vmalloc().
> 
>> But whereas kernel before 4.6 without changing vmalloc to kmalloc, UBIFS is working fine with dma.
>> So is there any change in UBIFS in 4.6 kernel that to dma related?
> 
> I'm not aware of such one.
> Do you see this with vanilla kernels? Maybe some other internal stuff has changed.
> git bisect can help.
> 
> DMA to vmalloced memory not good, it may work by chance if you transfer less than PAGE_SIZE.
> Especially on ARM.
> 

Indeed we have the very same issue with Atmel SPI (not QSPI) controller driver
(drivers/spi/spi-atmel.c). Both the Atmel and Zynq drivers call dma_map_single()
on an address pointing inside the rx_buf or tx_buf members of the struct
spi_transfer.

dma_map_single() can only map *physically* contiguous memory pages. Memory
returned by kmalloc() is guaranteed to be physically contiguous so that's why
it worked when the memory was allocated with kmalloc() but since the memory
is allocated with vmalloc(), crashes have occurred: with vmalloc() there is no
guarantee that memory pages are physically contiguous.

I've have started to fix the Atmel SPI controller driver to get rid of the
dma_map_single() calls. To avoid the use a bounce buffer and the resulting
performance drop, I've tried to rely on the spi_map_msg() function from the SPI
framework. I've just implemented the master->can_dma() handler. Then the SPI
framework calls spi_map_msg() just before master->transfer_one() in
__spi_pump_messages(). spi_map_msg() calls __spi_map_msg(), which in turn calls
master->can_dma() and eventually spi_map_buf() to build a scatter-gather list
in xfer->tx_sg or xfer->rx_sg and map it with dma_map_sg().

For the few tests I ran till now, it works with a sama5d2. However I warn you
that there is a theoretical risk/limitation mapping vmalloc'ed memory for DMA
purpose. I've read that the DMA API doesn't handle cache aliases for memory
areas other than the DMA capable areas. vmalloc'ed memory falls into one
of those non DMA capable areas.
Hence, depending on the cache model (PIPT, VIPT or VIVT) you might expect cache
coherency issues if the same physical memory page is mapped to two or more
different virtual memory addresses. It is safe with a Physically Indexed
Physically Tagged cache model but unsafe with Virtually Indexed cache models.
As the name says, the cache line is indexed by the virtual address, so even
if the physical page is the same, each virtual address may have its own
cache line. Then when you call dma_map_sg() on the first virtual address, the
function is likely not to be aware of the second virtual address so would
not clean/invalidate the cache line associated with this second virtual
address.

This is theoretical, honestly I don't know whether there is a good reason to map
the same physical page twice in the virtual memory...
Anyway I'm not an expert in DMA and cache aliases so if anyone has a real
knowledge of the actual issues we may face using spi_map_msg(), it would be
nice to share with us! :)

Best regards,

Cyrille

>> May I know some info regarding this?
>> Why UBIFS on kernels before 4.6 is working with dma but not with 4.6?
>> Now a days, most of QSPI controllers have internal dmas.
>>
>> Could you please provide some info regrading this dma issue?
>> We can change our controller driver to operate in IO mode (doesn't use dma) but performance wise it's not a preferred one.
> 
> Most MTD drivers use a bounce buffer.
> How much does your performance degrade?
> 
> Thanks,
> //richard
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
