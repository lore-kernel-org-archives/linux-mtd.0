Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bz93J-0001G3-Dr
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 21:14:34 +0000
Subject: Re: UBIFS LEB properties tree with odd addresses
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Christoph Hellwig <hch@infradead.org>
References: <DA6901612C71B84D91459DE817C418AE26E0016D@XAP-PVEXMBX01.xlnx.xilinx.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <e7f63f72-0dc1-54f4-b94c-2efef3e7af6b@nod.at>
Date: Tue, 25 Oct 2016 23:14:07 +0200
MIME-Version: 1.0
In-Reply-To: <DA6901612C71B84D91459DE817C418AE26E0016D@XAP-PVEXMBX01.xlnx.xilinx.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Naga Sureshkumar Relli,

On 25.10.2016 08:05, Naga Sureshkumar Relli wrote:
> Hi,
> 
> We are testing UBIFS (NOR) on Zynq Ultrascale+ MPSoC GQSPI controller driver.
> Apart from my previous mail thread about UBIFS, i.e along with dma issue I am facing one more
> Problem related to offsets.
> 
> Info about GQSPI Controller:
> This controller can access the flash device in the following modes.
> 1. Single flash mode
> 2. Two spi flash memories with separate buses (dual parallel)
> 
> Single flash mode: it is normal configuration, one controller and one flash memory
> 
> In dual parallel mode following are the functionalities:
> 1) Supporting two SPI flash memories operating in parallel. 8 I/O lines.
> 2) Chip selects and clock are shared to both the flash devices
> 3) This mode is targeted for faster read/write speed and also doubles the size
> 4) Commands/data can be transmitted/received from both the devices(mirror), or only upper or only lower flash memory devices.
> 5) Data arrangement:
>     With stripe (controller configuration) enabled,
>     Even bytes i.e. 0, 2, 4,... are transmitted on Lower Data Bus
>     Odd bytes i.e. 1, 3, 5,.. are transmitted on Upper Data Bus.

But these details are hidden from UBI?

> Kernel version : 4.4.0
> Controller limitation: ZynqMP gqspi controller supports only even addresses when two flash devices are connected (dual parallel mode).
> 
> Issue I am facing:
> -> Since our controller supports even addresses in dual parallel mode
> We are seeing issues with ubifs in dual parallel mode and jffs2 is working fine and we observed the following:
> 
> IN dual parallel mode, the Erase block size was 128KiB whereas single flash mode the Erase block size was 64KiB.
> In single flash mode, we are getting pnode_sz value as 16 and for dual parallel mode we are getting an odd value 17
> And ltab_sz value in single mode as 12 and in dual parallel mode as 11.
> Because of these odd values, check_lpt_type  offset argument is odd address and hence lpt_type error.
> 
> When I ran the mnt command, I am getting the following error
> "UBIFS error (ubi0:0 pid 1882): check_lpt_type: invalid type (4) in LPT node type 2"
> Ran the below commands:
> a)ubiformat /dev/mtd0 -e 0 -y
> b)ubiattach -p /dev/mtd0
> c)ubimkvol -N data -m /dev/ubi0
> d)mount -t ubifs ubi0:data /mnt
> 
> So for temporary hack we did the following change
> In fs/ubifs/lpt.c
> In do_calc_lpt_geom(), added the following
> +       if (c->pnode_sz % 2)
> +               c->pnode_sz += 1; 
> +       if (c->ltab_sz % 2)
> +               c->ltab_sz += 1;
> 
> Please kindly suggest, I need your inputs, changing the pnode_sz and ltab_sz to even in lpt.c, will it impact on any others?

Hmm, the calculations in lpt.c use basic properties of the MTD (number of blocks, etc...).
Can you please double check which property causes the failure and also verify whether the MTD driver
provides correct properties. i.e. page sizes, block size, number of blocks, ...

Thanks,
//richard
