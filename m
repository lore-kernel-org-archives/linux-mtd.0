Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQYfj-0003wV-TG
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 08:17:40 +0000
Received: by mail-lb0-f170.google.com with SMTP id w7so4191545lbi.15
 for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2013 01:17:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1380376516-30144-8-git-send-email-richard@nod.at>
References: <1380376516-30144-1-git-send-email-richard@nod.at>
 <1380376516-30144-8-git-send-email-richard@nod.at>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 30 Sep 2013 10:16:57 +0200
Message-ID: <CACQ1gAiaSeF0EP9KubJ7SRrLFc=gKq+wEHenFFw-BxJoCx203Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] UBI: Add some asserts to ubi_attach_fastmap()
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
> Add more paranioa asserts to make it easier to detect
> implementation errors.
>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mtd/ubi/fastmap.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 4cfc8da..ead8613 100644
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -826,6 +826,10 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>         list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list)
>                 list_move_tail(&tmp_aeb->u.list, &ai->free);
>
> +       ubi_assert(list_empty(&used));
> +       ubi_assert(list_empty(&eba_orphans));
> +       ubi_assert(list_empty(&free));
> +
>         /*
>          * If fastmap is leaking PEBs (must not happen), raise a
>          * fat warning and fall back to scanning mode.
> --
> 1.8.3.1
>

Tested-by: Richard Genoud <richard.genoud@gmail.com>
