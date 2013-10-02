Received: from mail-vb0-x236.google.com ([2607:f8b0:400c:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRSaV-0005Et-Mn
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 20:00:02 +0000
Received: by mail-vb0-f54.google.com with SMTP id q14so915361vbe.41
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 12:59:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAPgLHd_=Y=YwCWSFjcacJ14yKUidmmJTHnKKibU6haoBUeNacA@mail.gmail.com>
References: <CAPgLHd_=Y=YwCWSFjcacJ14yKUidmmJTHnKKibU6haoBUeNacA@mail.gmail.com>
Date: Wed, 2 Oct 2013 12:59:38 -0700
Message-ID: <CAN8TOE96Ax_gyeG5fXHejHE6gCmxNchioy1BrE8a6B83kK7A8g@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: fix error return code in ubifs_remount_rw() and
 ubifs_fill_super()
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Wei Yongjun <weiyj.lk@gmail.com>, yongjun_wei@trendmicro.com.cn,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bump, Artem? I'm cleaning out my old email, and this patch looks
obviously correct.

On Thu, Jun 6, 2013 at 7:17 PM, Wei Yongjun <weiyj.lk@gmail.com> wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Fix to return -ENOMEM in the kmalloc() and d_make_root() error handling
> case instead of 0, as done elsewhere in those functions.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  fs/ubifs/super.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index f21acf0..673b4bc 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1629,8 +1629,10 @@ static int ubifs_remount_rw(struct ubifs_info *c)
>         }
>
>         c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ, GFP_KERNEL);
> -       if (!c->write_reserve_buf)
> +       if (!c->write_reserve_buf) {
> +               err = -ENOMEM;
>                 goto out;
> +       }
>
>         err = ubifs_lpt_init(c, 0, 1);
>         if (err)
> @@ -2063,8 +2065,10 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
>         }
>
>         sb->s_root = d_make_root(root);
> -       if (!sb->s_root)
> +       if (!sb->s_root) {
> +               err = -ENOMEM;
>                 goto out_umount;
> +       }
>
>         mutex_unlock(&c->umount_mutex);
>         return 0;
>
>
