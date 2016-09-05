Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgxuk-0001Zb-IA
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 17:42:35 +0000
Date: Mon, 5 Sep 2016 19:42:11 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] UBI: use vol->usable_leb_size instead of
 (ubi->leb_size - vol->data_pad)
Message-ID: <20160905194211.705d5162@bbrezillon>
In-Reply-To: <1473089487-29285-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1473089487-29285-1-git-send-email-boris.brezillon@free-electrons.com>
 <1473089487-29285-4-git-send-email-boris.brezillon@free-electrons.com>
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

On Mon,  5 Sep 2016 17:31:24 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> vol->usable_size is already set to ubi->leb_size - vol->data_pad. Use
> vol->usable_size instead of recalculating it.

This one should be part of the cleanup series.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/ubi/cdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> index 72ba84af6698..45c329694a5e 100644
> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
> @@ -416,7 +416,7 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
>  		}
>  
>  		rsvd_bytes = (long long)vol->reserved_pebs *
> -					ubi->leb_size-vol->data_pad;
> +					vol->usable_leb_size;
>  		if (bytes < 0 || bytes > rsvd_bytes) {
>  			err = -EINVAL;
>  			break;
