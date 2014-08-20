Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJtzr-0005GZ-Ob
 for linux-mtd@lists.infradead.org; Wed, 20 Aug 2014 00:43:28 +0000
Date: Tue, 19 Aug 2014 21:41:58 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] UBI: block: fix dereference on uninitialized dev
Message-ID: <20140820004158.GA4650@arch.cereza>
References: <1408207793-11536-1-git-send-email-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1408207793-11536-1-git-send-email-colin.king@canonical.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Colin,

Thanks for the fix.

On 16 Aug 05:49 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> commit 4df38926f337 ("UBI: block: Avoid disk size integer overflow")
> introduced a dereference on dev (which is not initialized at that
> point) when printing a warning message.  Remove the reference to
> the dev's disk_name.
> 
> Found by cppcheck:
>  [drivers/mtd/ubi/block.c:509]: (error) Uninitialized variable: dev
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/ubi/block.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index 33c6495..944bdbd 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -505,8 +505,8 @@ static int ubiblock_resize(struct ubi_volume_info *vi)
>  	u64 disk_capacity = ((u64)vi->size * vi->usable_leb_size) >> 9;
>  
>  	if ((sector_t)disk_capacity != disk_capacity) {
> -		ubi_warn("%s: the volume is too big, cannot resize (%d LEBs)",
> -			 dev->gd->disk_name, vi->size);
> +		ubi_warn("block: the volume is too big, cannot resize (%d LEBs)",
> +			vi->size);

Do you think you can resend this adding the name of the volume to the warning?

>  		return -EFBIG;
>  	}

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
