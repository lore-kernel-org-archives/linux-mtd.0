Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fX4X0-0007Oj-7j
 for linux-mtd@lists.infradead.org; Sun, 24 Jun 2018 12:54:15 +0000
Date: Sun, 24 Jun 2018 14:53:50 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/14] ubi: fastmap: Add UBI_FM_SB_PRESEEDED_FLG flag
Message-ID: <20180624145350.11231190@bbrezillon>
In-Reply-To: <20180613212344.11608-5-richard@nod.at>
References: <20180613212344.11608-1-richard@nod.at>
 <20180613212344.11608-5-richard@nod.at>
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

On Wed, 13 Jun 2018 23:23:34 +0200
Richard Weinberger <richard@nod.at> wrote:

> This flag indicates that the fastmap was preseeded, which means
> it was created offline by a tool such as ubinize which cannot know
> the whole MTD state such as real size and bad blocks.
> As consequence UBI has to take special care to use that fastmap.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/ubi-media.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
> index 6136a97f4844..be339fb924af 100644
> --- a/drivers/mtd/ubi/ubi-media.h
> +++ b/drivers/mtd/ubi/ubi-media.h
> @@ -390,7 +390,11 @@ struct ubi_vtbl_record {
>  #define UBI_FM_MIN_POOL_SIZE	8
>  #define UBI_FM_MAX_POOL_SIZE	256
>  
> -#define UBI_FM_SB_FLG_MASK	0
> +enum {
> +	UBI_FM_SB_PRESEEDED_FLG	= 0x1,
> +};
> +
> +#define UBI_FM_SB_FLG_MASK (UBI_FM_SB_PRESEEDED_FLG)

You update the def that you use to check when a flag is supported,
still, you do not support this feature yet. Better move this line after
the support is really functional, don't you think?
