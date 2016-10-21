Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZYd-0003Pk-WB
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 13:08:25 +0000
Subject: Re: UBIFS with dma on 4.6 kernel is not working
To: Christoph Hellwig <hch@infradead.org>
References: <DA6901612C71B84D91459DE817C418AE26DF0F2B@XAP-PVEXMBX01.xlnx.xilinx.com>
 <519a83bf-1244-5151-b873-bb8e1f2db3c6@nod.at>
 <20161021125313.GA16754@infradead.org>
Cc: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <c0b0098d-3a68-3a4a-0b7e-a1d95dd4aafc@nod.at>
Date: Fri, 21 Oct 2016 15:07:57 +0200
MIME-Version: 1.0
In-Reply-To: <20161021125313.GA16754@infradead.org>
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

Christoph,

On 21.10.2016 14:53, Christoph Hellwig wrote:
> On Fri, Oct 21, 2016 at 11:29:16AM +0200, Richard Weinberger wrote:
>> DMA to vmalloced memory not good, it may work by chance if you transfer
>> less than PAGE_SIZE.
>> Especially on ARM.
> 
> DMA to vmalloc'ed or vmap memory is perfectly fine, you just have to be
> very careful.
> 
> I would suggest to not expose the vmalloc address to the lower layers
> that do DMA, but instead expose the pages, either as an array or
> scatterlist.  Either allocate the pages using the normal page allocator
> and then use vm_map_ram to generate a virtual address for them (that
> is what XFS does for it's large metadata objects for example).  Or if
> you can't do that iterate over the vmalloc address in page size chunks
> and use vmalloc_to_page (we still also do that for one piece of legacy
> cruft in XFS, but I'd rather avoid that for new designs).
> 

Hmm, thought this is still problematic on VIVT architectures.
Boris tried to provide a solution for that some time ago:
http://www.spinics.net/lists/arm-kernel/msg494025.html

Thanks,
//richard
