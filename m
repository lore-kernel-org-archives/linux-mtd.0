Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYK1a-0001AG-PY
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 18:16:19 +0000
Received: by mail-ie0-f169.google.com with SMTP id ar20so12520383iec.28
 for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2013 11:15:57 -0700 (PDT)
Date: Mon, 21 Oct 2013 11:15:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: hack ONFI for non-power-of-2 dimensions
Message-ID: <20131021181553.GJ23337@ld-irv-0074.broadcom.com>
References: <1377656358-7053-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1377656358-7053-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 stable@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 27, 2013 at 07:19:18PM -0700, Brian Norris wrote:
> Some bright specification writers decided to write this in the ONFI spec
> (from ONFI 3.0, Section 3.1):
> 
>   "The number of blocks and number of pages per block is not required to
>   be a power of two. In the case where one of these values is not a
>   power of two, the corresponding address shall be rounded to an
>   integral number of bits such that it addresses a range up to the
>   subsequent power of two value. The host shall not access upper
>   addresses in a range that is shown as not supported."
> 
> This breaks every assumption MTD makes about NAND block/chip-size
> dimensions -- they *must* be a power of two!
> 
> And of course, an enterprising manufacturer has made use of this lovely
> freedom. Exhibit A: Micron MT29F32G08CBADAWP
> 
>   "- Plane size: 2 planes x 1064 blocks per plane
>    - Device size: 32Gb: 2128 blockss [sic]"
> 
> This quickly hits a BUG() in nand_base.c, since the extra dimensions
> overflow so we think it's a second chip (on my single-chip setup):
> 
>     ONFI param page 0 valid
>     ONFI flash detected
>     NAND device: Manufacturer ID: 0x2c, Chip ID: 0x44 (Micron MT29F32G08CBADAWP), 4256MiB, page size: 8192, OOB size: 744
>     ------------[ cut here ]------------
>     kernel BUG at drivers/mtd/nand/nand_base.c:203!
>     Internal error: Oops - BUG: 0 [#1] SMP ARM
>     [... trim ...]
>     [<c02cf3e4>] (nand_select_chip+0x18/0x2c) from [<c02d25c0>] (nand_do_read_ops+0x90/0x424)
>     [<c02d25c0>] (nand_do_read_ops+0x90/0x424) from [<c02d2dd8>] (nand_read+0x54/0x78)
>     [<c02d2dd8>] (nand_read+0x54/0x78) from [<c02ad2c8>] (mtd_read+0x84/0xbc)
>     [<c02ad2c8>] (mtd_read+0x84/0xbc) from [<c02d4b28>] (scan_read.clone.4+0x4c/0x64)
>     [<c02d4b28>] (scan_read.clone.4+0x4c/0x64) from [<c02d4c88>] (search_bbt+0x148/0x290)
>     [<c02d4c88>] (search_bbt+0x148/0x290) from [<c02d4ea4>] (nand_scan_bbt+0xd4/0x5c0)
>     [... trim ...]
>     ---[ end trace 0c9363860d865ff2 ]---
> 
> So to fix this, just truncate these dimensions down to the greatest
> power-of-2 dimension that is less than or equal to the specified
> dimension.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: <stable@vger.kernel.org>

I've not heard any comments about this, but I've been using this patch
for a few months on most of my kernels, and I just ran into another
(unpatched) kernel/board that trips over this same problem. Unless
someone screams...

... applied to l2-mtd.git, with CC -stable. Although it is a bugfix, I
think it should wait until next merge window so it can sit in -next for
a while.

Brian
