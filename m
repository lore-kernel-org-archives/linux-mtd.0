Received: from mail-ve0-x229.google.com ([2607:f8b0:400c:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX9Ry-0006W6-Ma
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 13:19:00 +0000
Received: by mail-ve0-f169.google.com with SMTP id pa12so3623122veb.14
 for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2014 06:18:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1396339327-16090-1-git-send-email-tlinder@codeaurora.org>
References: <1396339327-16090-1-git-send-email-tlinder@codeaurora.org>
Date: Mon, 7 Apr 2014 15:18:37 +0200
Message-ID: <CAFLxGvyHL2Fjk3Zvqr5Y89R7vC8wjWwUi98UESdX-Ue9h6y3pA@mail.gmail.com>
Subject: Re: [RFC/PATCH] mtd: ubi: Fix ubi free PEBs count calculation
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

On Tue, Apr 1, 2014 at 10:02 AM, Tanya Brokhman <tlinder@codeaurora.org> wrote:
> The ubi->free_count should be updated with every insert/remove to/from
> the ubi->free list.
>
> Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>
>
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 9a36f78..ca74d19 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -690,6 +690,8 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
>
>         e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
>         self_check_in_wl_tree(ubi, e, &ubi->free);
> +       ubi->free_count--;
> +       ubi_assert(ubi->free_count >= 0);
>         rb_erase(&e->u.rb, &ubi->free);
>
>         return e;
> @@ -1090,6 +1092,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
>
>                         /* Give the unused PEB back */
>                         wl_tree_add(e2, &ubi->free);
> +                       ubi->free_count++;
>                         goto out_cancel;
>                 }
>                 self_check_in_wl_tree(ubi, e1, &ubi->used);
> --

Acked-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
