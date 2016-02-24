Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYa2c-0006ll-FX
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2016 14:04:19 +0000
Date: Wed, 24 Feb 2016 15:03:14 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dedekind1@gmail.com
Subject: Re: [PATCH] ubi: Fix out of bounds write in volume update code
Message-ID: <20160224150314.3a35bdba@bbrezillon>
In-Reply-To: <1456048383-27344-1-git-send-email-richard@nod.at>
References: <1456048383-27344-1-git-send-email-richard@nod.at>
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

On Sun, 21 Feb 2016 10:53:03 +0100
Richard Weinberger <richard@nod.at> wrote:

> ubi_start_leb_change() alloctes too few bytes.
> ubi_more_leb_change_data() will write up to req->upd_bytes +
> ubi->min_io_size bytes.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Weinberger <richard@nod.at>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/ubi/upd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
> index cfeaf0f..b7901ce 100644
> --- a/drivers/mtd/ubi/upd.c
> +++ b/drivers/mtd/ubi/upd.c
> @@ -193,7 +193,7 @@ int ubi_start_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
>  	vol->changing_leb = 1;
>  	vol->ch_lnum = req->lnum;
>  
> -	vol->upd_buf = vmalloc(req->bytes);
> +	vol->upd_buf = vmalloc(ALIGN((int)req->bytes, ubi->min_io_size));
>  	if (!vol->upd_buf)
>  		return -ENOMEM;
>  



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
