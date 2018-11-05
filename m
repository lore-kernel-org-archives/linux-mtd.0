Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJnq0-0000gc-41
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2018 22:59:17 +0000
Date: Mon, 5 Nov 2018 23:58:30 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mtd: nand: drop kernel-doc notation for a deleted
 function parameter
Message-ID: <20181105235830.6105ebdf@bbrezillon>
In-Reply-To: <88c00c96-cfd2-4ff1-e753-8875501895df@infradead.org>
References: <88c00c96-cfd2-4ff1-e753-8875501895df@infradead.org>
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

On Sun, 4 Nov 2018 18:38:35 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Remove kernel-doc notation for a deleted function parameter to prevent
> a kernel-doc warning:
> 
> ../drivers/mtd/nand/raw/nand_base.c:603: warning: Excess function parameter 'mtd' description in 'panic_nand_wait'
> 
> Fixes: f1d46942e823 ("mtd: rawnand: Pass a nand_chip object to chip->waitfunc()")
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>

Queued to the fixes branch.

Thanks,

Boris

> ---
> 
>  drivers/mtd/nand/raw/nand_base.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> --- lnx-420-rc1.orig/drivers/mtd/nand/raw/nand_base.c
> +++ lnx-420-rc1/drivers/mtd/nand/raw/nand_base.c
> @@ -590,7 +590,6 @@ retry:
>  
>  /**
>   * panic_nand_wait - [GENERIC] wait until the command is done
> - * @mtd: MTD device structure
>   * @chip: NAND chip structure
>   * @timeo: timeout
>   *
> 
> 
