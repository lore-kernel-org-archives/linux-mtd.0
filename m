Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byZN8-00087a-JL
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 07:08:39 +0000
Subject: Re: UBIFS with dma on 4.6 kernel is not working
To: Christoph Hellwig <hch@infradead.org>
References: <DA6901612C71B84D91459DE817C418AE26DF0F2B@XAP-PVEXMBX01.xlnx.xilinx.com>
 <519a83bf-1244-5151-b873-bb8e1f2db3c6@nod.at>
 <20161021125313.GA16754@infradead.org>
 <c0b0098d-3a68-3a4a-0b7e-a1d95dd4aafc@nod.at>
 <20161021131505.GA25942@infradead.org>
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
Message-ID: <3de2ca29-120b-b7a6-da55-47fe5e056f73@nod.at>
Date: Mon, 24 Oct 2016 09:08:13 +0200
MIME-Version: 1.0
In-Reply-To: <20161021131505.GA25942@infradead.org>
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

Christoph,

On 21.10.2016 15:15, Christoph Hellwig wrote:
> On Fri, Oct 21, 2016 at 03:07:57PM +0200, Richard Weinberger wrote:
>> Hmm, thought this is still problematic on VIVT architectures.
>> Boris tried to provide a solution for that some time ago:
>> http://www.spinics.net/lists/arm-kernel/msg494025.html
> 
> Things have been working fine for approx 10 years when using
> flush_kernel_vmap_range before doing I/O using the physical addresses and
> then invalidate_kernel_vmap_range when completing the I/O and going back
> to using the virtual mapping for XFS.
> 
> Of course all this assumes at least the higher level that did the
> vm_map_ram operation knows about this dance between virtually mapped and
> physiscal addresses. 

Good to know, I was clearly wrong.

Let's see whether the costs of flush_kernel_vmap_range and invalidate_kernel_vmap_range
are smaller than the speedup by DMA on embedded platforms.
We'll have to test it.

Thanks,
//richard
