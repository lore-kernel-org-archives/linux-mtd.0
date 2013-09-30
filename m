Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQYcg-0003nM-Vg
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 08:14:32 +0000
Received: by mail-lb0-f177.google.com with SMTP id w7so4179138lbi.22
 for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2013 01:14:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1380376516-30144-7-git-send-email-richard@nod.at>
References: <1380376516-30144-1-git-send-email-richard@nod.at>
 <1380376516-30144-7-git-send-email-richard@nod.at>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 30 Sep 2013 10:13:46 +0200
Message-ID: <CACQ1gAiAO5JB0vEW1pS=qWrUUjfPkOhp_5RdNMK0bm3-A1Bwbg@mail.gmail.com>
Subject: Re: [PATCH 6/7] UBI: Fix memory leak in ubi_attach_fastmap() error
 path
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/9/28 Richard Weinberger <richard@nod.at>:
> On error we have to free all three temporary lists.
>
> Reported-by: Richard Genoud <richard.genoud@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/fastmap.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 05067f5..4cfc8da 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -841,6 +841,19 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>  fail_bad:
>         ret = UBI_BAD_FASTMAP;
>  fail:
> +       list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list) {
> +               kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
> +               list_del(&tmp_aeb->u.list);
> +       }
> +       list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &eba_orphans, u.list) {
> +               kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
> +               list_del(&tmp_aeb->u.list);
> +       }
> +       list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
> +               kmem_cache_free(ai->aeb_slab_cache, tmp_aeb);
> +               list_del(&tmp_aeb->u.list);
> +       }
> +
>         return ret;
>  }
>
> --
> 1.8.3.1
>

Works like a charm !
Tested-by: Richard Genoud <richard.genoud@gmail.com>


Thanks !
