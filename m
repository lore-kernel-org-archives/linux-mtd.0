Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxW95-0006XI-E1
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 09:29:49 +0000
Subject: Re: UBIFS with dma on 4.6 kernel is not working
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>
References: <DA6901612C71B84D91459DE817C418AE26DF0F2B@XAP-PVEXMBX01.xlnx.xilinx.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <519a83bf-1244-5151-b873-bb8e1f2db3c6@nod.at>
Date: Fri, 21 Oct 2016 11:29:16 +0200
MIME-Version: 1.0
In-Reply-To: <DA6901612C71B84D91459DE817C418AE26DF0F2B@XAP-PVEXMBX01.xlnx.xilinx.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On 21.10.2016 11:21, Naga Sureshkumar Relli wrote:
> Hi,
> 
> This is regarding UBIFS on 4.6 kernel.
> We have tested UBIFS on our ZynqMP SOC QSPI Controller, the UBIFS is not working with dma on this kernel.
> Controller driver: https://github.com/torvalds/linux/commits/master/drivers/spi/spi-zynqmp-gqspi.c
> If I replace all vmalloc allocations in fs/ubifs/ to kmalloc then UBIFS with dma is working fine.

No, it will sooner or later OOM. Both UBI and UBIFS need rather large buffers, that's why we have to use
vmalloc().

> But whereas kernel before 4.6 without changing vmalloc to kmalloc, UBIFS is working fine with dma.
> So is there any change in UBIFS in 4.6 kernel that to dma related?

I'm not aware of such one.
Do you see this with vanilla kernels? Maybe some other internal stuff has changed.
git bisect can help.

DMA to vmalloced memory not good, it may work by chance if you transfer less than PAGE_SIZE.
Especially on ARM.

> May I know some info regarding this?
> Why UBIFS on kernels before 4.6 is working with dma but not with 4.6?
> Now a days, most of QSPI controllers have internal dmas.
> 
> Could you please provide some info regrading this dma issue?
> We can change our controller driver to operate in IO mode (doesn't use dma) but performance wise it's not a preferred one.

Most MTD drivers use a bounce buffer.
How much does your performance degrade?

Thanks,
//richard
