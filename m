Received: from mail-vc0-x22d.google.com ([2607:f8b0:400c:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX9C0-00064s-9z
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 13:02:29 +0000
Received: by mail-vc0-f173.google.com with SMTP id il7so5167961vcb.4
 for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2014 06:02:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1396339305-16005-1-git-send-email-tlinder@codeaurora.org>
References: <1396339305-16005-1-git-send-email-tlinder@codeaurora.org>
Date: Mon, 7 Apr 2014 15:02:04 +0200
Message-ID: <CAFLxGvyUsLZsi3iiape6BivaduvfqZh8kXXwYOFuExUJho09kg@mail.gmail.com>
Subject: Re: [RFC/PATCH] mtd: ubi: Free peb's synchronously for fastmap
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 1, 2014 at 10:01 AM, Tanya Brokhman <tlinder@codeaurora.org> wrote:
> At first mount it's possible that there are not enough free PEBs since
> there are PEB's pending to be erased. In such scenario, fm_pool (which is
> the pool from which user required PEBs are allocated) will be empty.
> Try fixing the above described situation by synchronously performing
> pending erase work, thus produce another free PEB.
>
> Signed-off-by: Tatyana Brokhman <tlinder@codeaurora.org>
>
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 457ead3..9a36f78 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -595,10 +595,29 @@ static void refill_wl_pool(struct ubi_device *ubi)
>  static void refill_wl_user_pool(struct ubi_device *ubi)
>  {
>         struct ubi_fm_pool *pool = &ubi->fm_pool;
> +       int err;
>
>         return_unused_pool_pebs(ubi, pool);
>
>         for (pool->size = 0; pool->size < pool->max_size; pool->size++) {
> +retry:
> +               if (!ubi->free.rb_node ||
> +                  (ubi->free_count - ubi->beb_rsvd_pebs < 1)) {
> +                       /*
> +                        * There are no available PEBs. Try to free
> +                        * PEB by means of synchronous execution of
> +                        * pending works.
> +                        */
> +                       if (ubi->works_count == 0)
> +                               break;
> +                       spin_unlock(&ubi->wl_lock);
> +                       err = do_work(ubi);
> +                       spin_lock(&ubi->wl_lock);

This is basically what produce_free_peb() does.

> +                       if (err < 0)
> +                               break;
> +                       goto retry;
> +               }
> +
>                 pool->pebs[pool->size] = __wl_get_peb(ubi);

__wl_get_peb() already calls produce_free_peb() when we run out of free PEBs.

Does your patch really fix a problem you encounter or did you find the
issue by reviewing
the code?

-- 
Thanks,
//richard
