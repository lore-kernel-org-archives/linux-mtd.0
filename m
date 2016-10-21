Date: Fri, 21 Oct 2016 05:53:13 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: UBIFS with dma on 4.6 kernel is not working
Message-ID: <20161021125313.GA16754@infradead.org>
References: <DA6901612C71B84D91459DE817C418AE26DF0F2B@XAP-PVEXMBX01.xlnx.xilinx.com>
 <519a83bf-1244-5151-b873-bb8e1f2db3c6@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <519a83bf-1244-5151-b873-bb8e1f2db3c6@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 11:29:16AM +0200, Richard Weinberger wrote:
> DMA to vmalloced memory not good, it may work by chance if you transfer
> less than PAGE_SIZE.
> Especially on ARM.

DMA to vmalloc'ed or vmap memory is perfectly fine, you just have to be
very careful.

I would suggest to not expose the vmalloc address to the lower layers
that do DMA, but instead expose the pages, either as an array or
scatterlist.  Either allocate the pages using the normal page allocator
and then use vm_map_ram to generate a virtual address for them (that
is what XFS does for it's large metadata objects for example).  Or if
you can't do that iterate over the vmalloc address in page size chunks
and use vmalloc_to_page (we still also do that for one piece of legacy
cruft in XFS, but I'd rather avoid that for new designs).
