Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aq2qp-00067i-5Z
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2016 18:15:48 +0000
Date: Tue, 12 Apr 2016 20:15:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: <linux-mtd@lists.infradead.org>, <linux-leds@vger.kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, Jacek Anaszewski
 <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/2] mtd: Uninline mtd_write_oob and move it to mtdcore.c
Message-ID: <20160412201524.1549b844@bbrezillon>
In-Reply-To: <1460478395-25925-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460478395-25925-2-git-send-email-ezequiel@vanguardiasur.com.ar>
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

On Tue, 12 Apr 2016 13:26:34 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> There's no reason for having mtd_write_oob inlined in mtd.h header.
> Move it to mtdcore.c where it belongs.

I guess the real motivation here is to avoid including leds.h in
mtd.h :).

> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/mtdcore.c   | 12 ++++++++++++
>  include/linux/mtd/mtd.h | 12 +-----------
>  2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 309625130b21..99d83f3331b0 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -997,6 +997,18 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
>  }
>  EXPORT_SYMBOL_GPL(mtd_read_oob);
>  
> +int mtd_write_oob(struct mtd_info *mtd, loff_t to,
> +				struct mtd_oob_ops *ops)
> +{
> +	ops->retlen = ops->oobretlen = 0;
> +	if (!mtd->_write_oob)
> +		return -EOPNOTSUPP;
> +	if (!(mtd->flags & MTD_WRITEABLE))
> +		return -EROFS;
> +	return mtd->_write_oob(mtd, to, ops);
> +}
> +EXPORT_SYMBOL_GPL(mtd_write_oob);
> +
>  /*
>   * Method to access the protection register area, present in some flash
>   * devices. The user data is one time programmable but the factory data is read
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 771272187316..ef9fea4fc400 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -283,17 +283,7 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
>  		    const u_char *buf);
>  
>  int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops);
> -
> -static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
> -				struct mtd_oob_ops *ops)
> -{
> -	ops->retlen = ops->oobretlen = 0;
> -	if (!mtd->_write_oob)
> -		return -EOPNOTSUPP;
> -	if (!(mtd->flags & MTD_WRITEABLE))
> -		return -EROFS;
> -	return mtd->_write_oob(mtd, to, ops);
> -}
> +int mtd_write_oob(struct mtd_info *mtd, loff_t to, struct mtd_oob_ops *ops);
>  
>  int mtd_get_fact_prot_info(struct mtd_info *mtd, size_t len, size_t *retlen,
>  			   struct otp_info *buf);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
