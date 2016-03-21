Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ai1OQ-0000pw-Px
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2016 15:05:19 +0000
Date: Mon, 21 Mar 2016 16:04:43 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: nsekhar@ti.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 rogerq@ti.com, tony@atomide.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/7] mtd: nand: omap2: Fix high memory dma prefetch
 transfer
Message-ID: <20160321160443.0a4165d1@bbrezillon>
In-Reply-To: <1457654203-20856-7-git-send-email-fcooper@ti.com>
References: <1457654203-20856-1-git-send-email-fcooper@ti.com>
 <1457654203-20856-7-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Franklin,

On Thu, 10 Mar 2016 17:56:42 -0600
Franklin S Cooper Jr <fcooper@ti.com> wrote:

> Based on DMA documentation and testing using high memory buffer when
> doing dma transfers can lead to various issues including kernel
> panics.

I guess it all comes from the vmalloced buffer case, which are not
guaranteed to be physically contiguous (one of the DMA requirement,
unless you have an iommu).

> 
> To workaround this simply use cpu copy. The amount of high memory
> buffers used are very uncommon so no noticeable performance hit should
> be seen.

Hm, that's not necessarily true. UBI and UBIFS allocate their buffers
using vmalloc (vmalloced buffers fall in the high_memory region), and
those are likely to be dis-contiguous if you have NANDs with pages > 4k.

I recently posted patches to ease sg_table creation from any kind of
virtual address [1][2]. Can you try them and let me know if it fixes
your problem?

Thanks,

Boris

[1]https://lkml.org/lkml/2016/3/8/276
[2]https://lkml.org/lkml/2016/3/8/277


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
