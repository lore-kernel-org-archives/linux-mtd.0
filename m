Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgtH3-0004Bo-8Z
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 12:45:20 +0000
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
 [209.85.161.171]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id u85CiWls018416
 for <linux-mtd@lists.infradead.org>; Mon, 5 Sep 2016 21:44:32 +0900
Received: by mail-yw0-f171.google.com with SMTP id j1so17282267ywb.2
 for <linux-mtd@lists.infradead.org>; Mon, 05 Sep 2016 05:44:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1473058466-10831-1-git-send-email-hs@denx.de>
References: <1473058466-10831-1-git-send-email-hs@denx.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 5 Sep 2016 21:44:31 +0900
Message-ID: <CAK7LNARnJVjwDaLGpSUUwvMWSXdXvkaF0H5yV2Dtr=pgpZZwOw@mail.gmail.com>
Subject: Re: [PATCH v2] ubifs: compress lines for immediate return
To: Heiko Schocher <hs@denx.de>, Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Heiko, Richard,




2016-09-05 15:54 GMT+09:00 Heiko Schocher <hs@denx.de>:
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Cleanup the following code construct:
> ret = expression;
> if (ret)
>         return ret;
> return 0;
>
> into a simple form:
> return expression;
>
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
> posted on the U-Boot mailinglist.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Heiko Schocher <hs@denx.de>



I am the author of the original patch in the U-Boot ML.

Please notice it has not passed the review in U-Boot ML yet.
Actually, I got some feedback against this patch.

See
http://patchwork.ozlabs.org/patch/665199/

Stephan Warren suggested that
we should not break code uniformity.


After I considered it and took a closer look,
I decided that we should not do these changes.


This patch breaks the code uniformity.
See blow:




>  /**
> diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
> index 821b348..88cd61d 100644
> --- a/fs/ubifs/gc.c
> +++ b/fs/ubifs/gc.c
> @@ -297,10 +297,8 @@ static int sort_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
>         err = dbg_check_data_nodes_order(c, &sleb->nodes);
>         if (err)
>                 return err;
> -       err = dbg_check_nondata_nodes_order(c, nondata);
> -       if (err)
> -               return err;
> -       return 0;
> +
> +       return dbg_check_nondata_nodes_order(c, nondata);
>  }

Original code has uniformity here.


err = dbg_check_data_nodes_order(c, &sleb->nodes);
if (err)
       return err;
err = dbg_check_nondata_nodes_order(c, nondata);
if (err)
       return err;



>  /**
> diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
> index ce89bdc..79a8e96 100644
> --- a/fs/ubifs/lpt_commit.c
> +++ b/fs/ubifs/lpt_commit.c
> @@ -313,10 +313,7 @@ static int layout_cnodes(struct ubifs_info *c)
>         alen = ALIGN(offs, c->min_io_size);
>         upd_ltab(c, lnum, c->leb_size - alen, alen - offs);
>         dbg_chk_lpt_sz(c, 4, alen - offs);
> -       err = dbg_chk_lpt_sz(c, 3, alen);
> -       if (err)
> -               return err;
> -       return 0;
> +       return dbg_chk_lpt_sz(c, 3, alen);
>

We have dbg_chk_lpt_sz() call just above  (its return value is ignored)

So, returning the value of the last dbg_chk_lpt_sz() call
seems a bit weird.  So, I do not want to touch this.




Heiko,
If you want to post this patch, it is up to you.
But, in that case, could you drop my Author and Signed-off-by,
then send it as your patch, please?

I do not feel comfortable with my authorship
for what I decided to not do.


I will retract my original patch from the U-Boot ML, too.




-- 
Best Regards
Masahiro Yamada
