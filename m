Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgjqL-0002Rb-NL
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 01:36:34 +0000
Received: by pablk4 with SMTP id lk4so92853461pab.3
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 18:36:13 -0700 (PDT)
Date: Mon, 28 Sep 2015 18:36:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] UBI: Fix typo in comment
Message-ID: <20150929013610.GY31505@google.com>
References: <1435912576-27878-1-git-send-email-richard@nod.at>
 <1435912576-27878-2-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1435912576-27878-2-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 03, 2015 at 10:36:15AM +0200, Richard Weinberger wrote:
> While we are here fix a s/beween/between typo.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Acked-by: Brian Norris <computersforpeace@gmail.com>

> ---
>  drivers/mtd/ubi/ubi-media.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
> index d0d072e..22ed3f6 100644
> --- a/drivers/mtd/ubi/ubi-media.h
> +++ b/drivers/mtd/ubi/ubi-media.h
> @@ -500,7 +500,7 @@ struct ubi_fm_volhdr {
>  /* struct ubi_fm_volhdr is followed by one struct ubi_fm_eba records */
>  
>  /**
> - * struct ubi_fm_eba - denotes an association beween a PEB and LEB
> + * struct ubi_fm_eba - denotes an association between a PEB and LEB
>   * @magic: EBA table magic number
>   * @reserved_pebs: number of table entries
>   * @pnum: PEB number of LEB (LEB is the index)
> -- 
> 1.8.4.5
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
