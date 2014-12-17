Received: from mail-qc0-f180.google.com ([209.85.216.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1FZL-00006k-8o
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 14:27:15 +0000
Received: by mail-qc0-f180.google.com with SMTP id i8so12239502qcq.11
 for <linux-mtd@lists.infradead.org>; Wed, 17 Dec 2014 06:26:53 -0800 (PST)
Date: Wed, 17 Dec 2014 11:26:44 -0300
From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 3/6] UBI: Fastmap: Ensure that all fastmap work is done
 upon WL shutdown
Message-ID: <20141217142644.GB19525@fox>
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <1416835236-25185-4-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1416835236-25185-4-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 24, 2014 at 02:20:33PM +0100, Richard Weinberger wrote:
> ...otherwise the deferred work might run after datastructures
> got freed and corrupt memory.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

After moving it to shutdown_work():

Reviewed-by: Guido Martínez <guido@vanguardiasur.com.ar>

> ---
>  drivers/mtd/ubi/wl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 7f135df..cb2e571 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -2041,6 +2041,9 @@ static void protection_queue_destroy(struct ubi_device *ubi)
>  void ubi_wl_close(struct ubi_device *ubi)
>  {
>  	dbg_wl("close the WL sub-system");
> +#ifdef CONFIG_MTD_UBI_FASTMAP
> +	flush_work(&ubi->fm_work);
> +#endif
>  	shutdown_work(ubi);
>  	protection_queue_destroy(ubi);
>  	tree_destroy(&ubi->used);
> -- 
> 1.8.4.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
Guido Martínez, VanguardiaSur
www.vanguardiasur.com.ar
