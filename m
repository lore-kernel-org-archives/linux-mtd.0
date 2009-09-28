Subject: Re: [PATCH] [MTD] bcmring: mtd nand driver
From: David Woodhouse <dwmw2@infradead.org>
To: "Leo (Hao) Chen" <leochen@broadcom.com>
In-Reply-To: <20090928222451.GF30661@broadcom.com>
References: <20090928222451.GF30661@broadcom.com>
Content-Type: text/plain
Date: Mon, 28 Sep 2009 15:37:10 -0700
Message-Id: <1254177430.3034.790.camel@macbook.infradead.org>
Mime-Version: 1.0
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

On Mon, 2009-09-28 at 15:24 -0700, Leo (Hao) Chen wrote:
> 
> I've updated the patch of mtd nand driver support for bcmring arch.
> It's now applicable to the latest kernel git tree (Linux 2.6.32-rc1).
> 
> Please merge this patch into upstream.
> If further modification needed, let me know.

Thank you. On closer inspection, this patch is actually a whole lot
saner than it appears at first glance. The amount of superfluous
commenting made it look bad, when I first looked. 

For example, a function called 'nand_dma_write' does _not_ need a
five-line comment block explaining that it 'Performs a write via DMA'.

Other comments, on a brief re-reading...

You're using a platform device, but you still hard-code the I/O address
you ioremap for bcm_imi_io_base -- is it possible for you to fix that,
and encode it in the platform device instead?

Also, do you need the USE_DMA and USE_HWECC macros? If they're always
enabled, can we lose some ifdefs?

Finally, can you convince me that this isn't an "additional restriction"
as prohibited by the GPL? :

+* Notwithstanding the above, under no circumstances may you combine this
+* software in any way with any other Broadcom software provided under a
+* license other than the GPL, without Broadcom's express prior written
+* consent.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
