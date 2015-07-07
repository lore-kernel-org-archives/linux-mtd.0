Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCZA4-0000bp-Oq
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 20:08:13 +0000
Received: by pacws9 with SMTP id ws9so119765868pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jul 2015 13:07:51 -0700 (PDT)
Date: Tue, 7 Jul 2015 13:07:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH] mtd: nand: Fix NAND_USE_BOUNCE_BUFFER flag conflict
Message-ID: <20150707200744.GG18370@brian-ubuntu>
References: <1435365838-10940-1-git-send-email-scottwood@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435365838-10940-1-git-send-email-scottwood@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 26, 2015 at 07:43:58PM -0500, Scott Wood wrote:
> Commit 66507c7bc8895f0da6b ("mtd: nand: Add support to use nand_base
> poi databuf as bounce buffer") added a flag NAND_USE_BOUNCE_BUFFER
> using the same bit value as the existing NAND_BUSWIDTH_AUTO.

Good catch. It'd probably be easier to catch these things if we didn't
just manually type these in hex. Perhaps BIT() would make this more
obvious?

Anyway, looks good. Pushed to linux-mtd.git.

Brian

> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Fixes: 66507c7bc8895f0da6b ("mtd: nand: Add support to use nand_base
> 	poi databuf as bounce buffer")
> Signed-off-by: Scott Wood <scottwood@freescale.com>
> ---
>  include/linux/mtd/nand.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 3d4ea7e..12b75f3 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -176,17 +176,17 @@ typedef enum {
>  /* Chip may not exist, so silence any errors in scan */
>  #define NAND_SCAN_SILENT_NODEV	0x00040000
>  /*
> - * This option could be defined by controller drivers to protect against
> - * kmap'ed, vmalloc'ed highmem buffers being passed from upper layers
> - */
> -#define NAND_USE_BOUNCE_BUFFER	0x00080000
> -/*
>   * Autodetect nand buswidth with readid/onfi.
>   * This suppose the driver will configure the hardware in 8 bits mode
>   * when calling nand_scan_ident, and update its configuration
>   * before calling nand_scan_tail.
>   */
>  #define NAND_BUSWIDTH_AUTO      0x00080000
> +/*
> + * This option could be defined by controller drivers to protect against
> + * kmap'ed, vmalloc'ed highmem buffers being passed from upper layers
> + */
> +#define NAND_USE_BOUNCE_BUFFER	0x00100000
>  
>  /* Options set by nand scan */
>  /* Nand scan has allocated controller struct */
> -- 
> 2.1.4
> 
