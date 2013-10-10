Received: from mail-oa0-x232.google.com ([2607:f8b0:4003:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VU4QY-0006He-8E
 for linux-mtd@lists.infradead.org; Thu, 10 Oct 2013 00:48:31 +0000
Received: by mail-oa0-f50.google.com with SMTP id j1so941668oag.9
 for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2013 17:48:08 -0700 (PDT)
Date: Wed, 9 Oct 2013 17:48:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH/TRIVIAL] mtd: Use MTD_BLOCK_MAJOR instead of the magic
 number
Message-ID: <20131010004805.GE23337@ld-irv-0074.broadcom.com>
References: <1381276748-5426-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381276748-5426-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: trivial@kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 08, 2013 at 08:59:08PM -0300, Ezequiel Garcia wrote:
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  drivers/mtd/mtdblock.c    | 2 +-
>  drivers/mtd/mtdblock_ro.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
> index 2aef5dd..53884cc 100644
> --- a/drivers/mtd/mtdblock.c
> +++ b/drivers/mtd/mtdblock.c
> @@ -373,7 +373,7 @@ static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
>  
>  static struct mtd_blktrans_ops mtdblock_tr = {
>  	.name		= "mtdblock",
> -	.major		= 31,
> +	.major		= MTD_BLOCK_MAJOR,
>  	.part_bits	= 0,
>  	.blksize 	= 512,
>  	.open		= mtdblock_open,
> diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
> index 92759a9..70d27b4 100644
> --- a/drivers/mtd/mtdblock_ro.c
> +++ b/drivers/mtd/mtdblock_ro.c
> @@ -70,7 +70,7 @@ static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
>  
>  static struct mtd_blktrans_ops mtdblock_tr = {
>  	.name		= "mtdblock",
> -	.major		= 31,
> +	.major		= MTD_BLOCK_MAJOR,
>  	.part_bits	= 0,
>  	.blksize 	= 512,
>  	.readsect	= mtdblock_readsect,

Pushed to l2-mtd.git. Thanks!

Brian
