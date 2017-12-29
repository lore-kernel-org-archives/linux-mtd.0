Received: from lelnx194.ext.ti.com ([198.47.27.80])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUria-0007B0-FY
 for linux-mtd@lists.infradead.org; Fri, 29 Dec 2017 10:16:50 +0000
Subject: Re: [PATCH 1/3] mtd: spi-nor: add optional DMA-safe bounce buffer for
 data transfer
To: Trent Piepho <tpiepho@impinj.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "broonie@kernel.org" <broonie@kernel.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "radu.pirea@microchip.com" <radu.pirea@microchip.com>, "robh@kernel.org"
 <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <fc2440c6f52877f28286d89691049e5cba10e6a7.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <1514317385.26695.39.camel@impinj.com>
 <1a7dc424-1ce0-6c64-fc52-bb88ec7db8fa@wedev4u.fr>
 <1514487276.26695.94.camel@impinj.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <08be8b42-732a-bf28-40c4-f46bf9d71c80@ti.com>
Date: Fri, 29 Dec 2017 15:46:29 +0530
MIME-Version: 1.0
In-Reply-To: <1514487276.26695.94.camel@impinj.com>
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



On Friday 29 December 2017 12:24 AM, Trent Piepho wrote:
> On Thu, 2017-12-28 at 11:39 +0100, Cyrille Pitchen wrote:
>> Le 26/12/2017 à 20:43, Trent Piepho a écrit :
>> > On Sun, 2017-12-24 at 05:36 +0100, Cyrille Pitchen wrote:
>> > > 
>> > > Then the patch adds two hardware capabilities for SPI flash controllers,
>> > > SNOR_HWCAPS_WR_BOUNCE and SNOR_HWCAPS_RD_BOUNCE.
>> > 
>> > Are there any drivers for which a bounce buffer is NOT needed when the
>> > tx/rx buffer is not in DMA safe memory?  Maybe it would make more sense
>> > to invert the sense of these flags, so that they indicate the driver
>> > does not need DMA safe buffers, if that is the uncommon/non-existent
>> > case, so that fewer drivers need to be modified to to be fixed?
>> > 
>> 
>> It doesn't sound safe for a first step. I don't know if some of the
>> spi-flash controllers are embedded inside systems with small memory and
>> don't care about DMA transfers. Maybe they don't plan to use anything else
>> but PIO transfers. Then why taking the risk to exhaust the memory on systems
>> that would not use the bounce buffer anyway?
> 
> This would certainly be the case when the driver does not even support
> DMA in the first place.
> 
> This also makes me wonder, how inefficient does this become when it
> uses a bounce buffer for small transfer that would not use DMA anyway?
>  In the spi_flash_read() interface for spi masters, there is a master
> method spi_flash_can_dma() callback used by the spi core to tell if
> each transfer can be DMAed.
> 
> Should something like that be used here, to ask the master if it would
> use dma on the buffer?
> 
> This might also prevent allocation of the bounce buffer if the only DMA
> unsafe transfers are tiny control ops with stack variables that
> wouldn't use DMA, e.g. the stuff spi_nor_read_sfdp_dma_unsafe() does.
> 
> 
>> About the memory loss when forcing the SNOR_HWCAPS_*_BOUNCE in m25p80.c, I
>> justify it because the m25p80 has to be compliant with the SPI sub-system
>> requirements but currently is not. However I've taken care not to allocate
>> the bounce buffer as long as we use only DMA-safe buffers.
> 
> Another possibility to reduce memory usage: make the buffer smaller
> when first allocated by being just enough for the needed space.  Grow
> it (by powers of two?) until it reaches the max allowed size.  No
> reason to use a 256 kB buffer if DMA unsafe operations never get that
> big.
> 
> 
>> Here at the MTD side, the main (only ?) source of DMA-unsafe buffers is
>> the UBIFS (JFFS2 too ?) layer. Then I've assumed that systems using such a
>> file-system should already have enough system memory.
> 
> I saw a note in one of the existing DMA fixes that JFFS2 was the source
> of the unsafe buffers, so probably there too.
> 
> 
>> 
>> Vignesh has suggested to call virt_addr_valid() instead.
>> I think Boris has also told me about this function.
>> So it might be the right solution. What do you think about their proposal?
> 
> Not sure what exactly the differences are between these methods.  The
> fact that each of the many existing DMA fixes uses slightly different
> code to detect what is unsafe speaks to the difficulty of this problem!

My understanding based on Documentation/DMA-API-HOWTO.txt and
Documentation/arm/memory.txt is that
virt_addr_valid() will guarantee that address is in range of
PAGE_OFFSET to high_memory-1 (Kernel direct-mapped RAM region) which is
address range of buffers that are DMA'able.


>  virt_addr_valid() is already used by spi-ti-qspi.  spi core uses for
> the buffer map helper, but that code path is for buffers which are NOT
> vmalloc or highmem, but are still not virt_addr_valid() for some other
> reason.
> 

	if (vmalloced_buf || kmap_buf) {
		/* Handle vmalloc'd or kmap'd buffers */
		...
        } else if (virt_addr_valid(buf)) {
		/* Handle kmalloc'd and such buffers */
                ...
	} else {
		/* Error if none of the above */
		return -EINVAL;
	}



-- 
Regards
Vignesh
