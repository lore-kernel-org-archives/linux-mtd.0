Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MsPcx-0002Su-B7
	for linux-mtd@lists.infradead.org; Mon, 28 Sep 2009 23:27:37 +0000
Date: Mon, 28 Sep 2009 16:27:20 -0700
From: "Leo (Hao) Chen" <leochen@broadcom.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD] bcmring: mtd nand driver
Message-ID: <20090928232720.GI30661@broadcom.com>
References: <20090928222451.GF30661@broadcom.com>
	<1254177430.3034.790.camel@macbook.infradead.org>
MIME-Version: 1.0
In-Reply-To: <1254177430.3034.790.camel@macbook.infradead.org>
Content-Type: text/plain;
 charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 28, 2009 at 03:37:10PM -0700, David Woodhouse wrote:
> On Mon, 2009-09-28 at 15:24 -0700, Leo (Hao) Chen wrote:
> > 
> > I've updated the patch of mtd nand driver support for bcmring arch.
> > It's now applicable to the latest kernel git tree (Linux 2.6.32-rc1).
> > 
> > Please merge this patch into upstream.
> > If further modification needed, let me know.
> 
> Thank you. On closer inspection, this patch is actually a whole lot
> saner than it appears at first glance. The amount of superfluous
> commenting made it look bad, when I first looked. 
> 
> For example, a function called 'nand_dma_write' does _not_ need a
> five-line comment block explaining that it 'Performs a write via DMA'.
> 
> Other comments, on a brief re-reading...
I'll remove those superfluous comments.

> 
> You're using a platform device, but you still hard-code the I/O address
> you ioremap for bcm_imi_io_base -- is it possible for you to fix that,
> and encode it in the platform device instead?
I'll look into it to see what I can do with the platform device.

> 
> Also, do you need the USE_DMA and USE_HWECC macros? If they're always
> enabled, can we lose some ifdefs?
USE_DMA is useful for us to debug DMA. USE_HWECC may be removed.

> 
> Finally, can you convince me that this isn't an "additional restriction"
> as prohibited by the GPL? :
> 
> +* Notwithstanding the above, under no circumstances may you combine this
> +* software in any way with any other Broadcom software provided under a
> +* license other than the GPL, without Broadcom's express prior written
> +* consent.
> 


This is what our lawyer's are making us place on
all our GPL code indicating we are releasing it as GPL.
There is no "additional restriction" -
it is being released to the kernel community under GPL.
This information is just informing our customers they can not combine
this code with Broadcom proprietary licensed code that has not been released
under an open-source/GPL license to them.


Thanks,

-- 

Leo Hao Chen

------------------------
Life is short, run long.
