Received: from mail-ob0-x22b.google.com ([2607:f8b0:4003:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZO0Bj-0002KY-8Z
 for linux-mtd@lists.infradead.org; Sat, 08 Aug 2015 09:13:11 +0000
Received: by obnw1 with SMTP id w1so94450859obn.3
 for <linux-mtd@lists.infradead.org>; Sat, 08 Aug 2015 02:12:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1438934377-4922-26-git-send-email-a.hajda@samsung.com>
References: <1438934377-4922-1-git-send-email-a.hajda@samsung.com>
 <1438934377-4922-26-git-send-email-a.hajda@samsung.com>
Date: Sat, 8 Aug 2015 11:12:49 +0200
Message-ID: <CAFLxGvyEmeNz0jk8dswsS0Cc-yenagaKDJeyTxn4j4KPnAOv2w@mail.gmail.com>
Subject: Re: [PATCH 25/31] fs/ubifs: use kmemdup rather than duplicating its
 implementation
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 7, 2015 at 9:59 AM, Andrzej Hajda <a.hajda@samsung.com> wrote:
> The patch was generated using fixed coccinelle semantic patch
> scripts/coccinelle/api/memdup.cocci [1].
>
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2014320
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  fs/ubifs/lpt.c | 6 ++----
>  fs/ubifs/tnc.c | 3 +--
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
> index dc9f27e..9a51710 100644
> --- a/fs/ubifs/lpt.c
> +++ b/fs/ubifs/lpt.c
> @@ -1498,11 +1498,10 @@ static struct ubifs_nnode *dirty_cow_nnode(struct ubifs_info *c,
>         }
>
>         /* nnode is being committed, so copy it */
> -       n = kmalloc(sizeof(struct ubifs_nnode), GFP_NOFS);
> +       n = kmemdup(nnode, sizeof(struct ubifs_nnode), GFP_NOFS);
>         if (unlikely(!n))
>                 return ERR_PTR(-ENOMEM);
>
> -       memcpy(n, nnode, sizeof(struct ubifs_nnode));
>         n->cnext = NULL;
>         __set_bit(DIRTY_CNODE, &n->flags);
>         __clear_bit(COW_CNODE, &n->flags);
> @@ -1549,11 +1548,10 @@ static struct ubifs_pnode *dirty_cow_pnode(struct ubifs_info *c,
>         }
>
>         /* pnode is being committed, so copy it */
> -       p = kmalloc(sizeof(struct ubifs_pnode), GFP_NOFS);
> +       p = kmemdup(pnode, sizeof(struct ubifs_pnode), GFP_NOFS);
>         if (unlikely(!p))
>                 return ERR_PTR(-ENOMEM);
>
> -       memcpy(p, pnode, sizeof(struct ubifs_pnode));
>         p->cnext = NULL;
>         __set_bit(DIRTY_CNODE, &p->flags);
>         __clear_bit(COW_CNODE, &p->flags);
> diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
> index 957f575..fa9a20c 100644
> --- a/fs/ubifs/tnc.c
> +++ b/fs/ubifs/tnc.c
> @@ -198,11 +198,10 @@ static struct ubifs_znode *copy_znode(struct ubifs_info *c,
>  {
>         struct ubifs_znode *zn;
>
> -       zn = kmalloc(c->max_znode_sz, GFP_NOFS);
> +       zn = kmemdup(znode, c->max_znode_sz, GFP_NOFS);
>         if (unlikely(!zn))
>                 return ERR_PTR(-ENOMEM);
>
> -       memcpy(zn, znode, c->max_znode_sz);
>         zn->cnext = NULL;
>         __set_bit(DIRTY_ZNODE, &zn->flags);
>         __clear_bit(COW_ZNODE, &zn->flags);

Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
