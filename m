Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqR69-0005pF-9P
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 20:09:21 +0000
Subject: Re: [PATCH v4 6/7] mtd: nand: omap2: Fix high memory dma prefetch
 transfer
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
 <1457654203-20856-7-git-send-email-fcooper@ti.com>
 <20160321160443.0a4165d1@bbrezillon>
CC: <nsekhar@ti.com>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <rogerq@ti.com>, <tony@atomide.com>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Franklin S Cooper Jr." <fcooper@ti.com>
Message-ID: <570EA72C.7000806@ti.com>
Date: Wed, 13 Apr 2016 15:08:12 -0500
MIME-Version: 1.0
In-Reply-To: <20160321160443.0a4165d1@bbrezillon>
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



On 03/21/2016 10:04 AM, Boris Brezillon wrote:
> Hi Franklin,
> 
> On Thu, 10 Mar 2016 17:56:42 -0600
> Franklin S Cooper Jr <fcooper@ti.com> wrote:
> 
>> Based on DMA documentation and testing using high memory buffer when
>> doing dma transfers can lead to various issues including kernel
>> panics.
> 
> I guess it all comes from the vmalloced buffer case, which are not
> guaranteed to be physically contiguous (one of the DMA requirement,
> unless you have an iommu).
> 
>>
>> To workaround this simply use cpu copy. The amount of high memory
>> buffers used are very uncommon so no noticeable performance hit should
>> be seen.
> 
> Hm, that's not necessarily true. UBI and UBIFS allocate their buffers
> using vmalloc (vmalloced buffers fall in the high_memory region), and
> those are likely to be dis-contiguous if you have NANDs with pages > 4k.
> 
> I recently posted patches to ease sg_table creation from any kind of
> virtual address [1][2]. Can you try them and let me know if it fixes
> your problem?

It looks like you won't be going forward with your patchset based on
this thread [1]. I can probably reword the patch description to avoid
implying that it is uncommon to run into high mem buffers. Also DMA with
NAND prefetch suffers from a reduction of performance compared to CPU
polling with prefetch. This is largely due to the significant over head
required to read such a small amount of data at a time. The
optimizations I've worked on all revolved around reducing the cycles
spent before executing the DMA request. Trying to make a high memory
buffer able to be used by the DMA adds significant amount of cycles and
your better off just using the cpu for performance reasons.

[1]https://lkml.org/lkml/2016/4/4/346
> 
> Thanks,
> 
> Boris
> 
> [1]https://lkml.org/lkml/2016/3/8/276
> [2]https://lkml.org/lkml/2016/3/8/277
> 
> 
