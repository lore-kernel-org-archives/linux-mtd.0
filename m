Received: from mail-ve0-x22c.google.com ([2607:f8b0:400c:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WMEmA-0000qj-Bn
 for linux-mtd@lists.infradead.org; Sat, 08 Mar 2014 10:46:42 +0000
Received: by mail-ve0-f172.google.com with SMTP id jx11so5336290veb.31
 for <linux-mtd@lists.infradead.org>; Sat, 08 Mar 2014 02:46:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1394237487-2728-1-git-send-email-f.fainelli@gmail.com>
References: <1394237487-2728-1-git-send-email-f.fainelli@gmail.com>
Date: Sat, 8 Mar 2014 11:46:20 +0100
Message-ID: <CAFLxGvyyD4YOdprkVNYacf1_1pZdzEBjTOU56FWZB0vcjrij6Q@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: add missing znode freeing in tcn_insert()
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 8, 2014 at 1:11 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> In case the zi allocation fails in the do_split label, we will fail
> freeing zn that we allocated before, add a missing kfree.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  fs/ubifs/tnc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
> index 9083bc7ed4ae..9b84d91ea530 100644
> --- a/fs/ubifs/tnc.c
> +++ b/fs/ubifs/tnc.c
> @@ -2105,8 +2105,10 @@ do_split:
>         dbg_tnc("creating new zroot at level %d", znode->level + 1);
>
>         zi = kzalloc(c->max_znode_sz, GFP_NOFS);
> -       if (!zi)
> +       if (!zi) {
> +               kfree(zn);
>                 return -ENOMEM;
> +       }
>

I'm not sure whether this is correct.

Around line 2050 we have:
... else {
                /* Insert into new znode */
                zi = zn; <---------
                n -= keep;
                /* Re-parent */
                if (zn->level != 0)
                        zbr->znode->parent = zn;
        }

And later:
insert_zbranch(zi, zbr, n);

By freeing zn you may introduce a use after free bug.

-- 
Thanks,
//richard
