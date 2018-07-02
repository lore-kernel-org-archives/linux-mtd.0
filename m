Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fa6g8-0006Mv-6O
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 21:48:13 +0000
Received: by mail-yw0-x241.google.com with SMTP id p129-v6so7187894ywg.7
 for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2018 14:48:01 -0700 (PDT)
MIME-Version: 1.0
Sender: keescook@google.com
In-Reply-To: <20180702214713.2769-1-richard@nod.at>
References: <20180702214713.2769-1-richard@nod.at>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 2 Jul 2018 14:48:00 -0700
Message-ID: <CAGXu5j+mJzhzXMg8F+stScfSqcquVofB_D8DHgpbUww8OOs05w@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Use kmalloc_array()
To: Richard Weinberger <richard@nod.at>
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 2, 2018 at 2:47 PM, Richard Weinberger <richard@nod.at> wrote:
> Since commit 6da2ec56059c ("treewide: kmalloc() -> kmalloc_array()")
> we use kmalloc_array() for kmalloc() that computes the length with
> a multiplication.
>
> Cc: Kees Cook <keescook@chromium.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!

-Kees

> ---
>  fs/ubifs/journal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index eea12d25a58b..95acc0c04bca 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -1285,7 +1285,7 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
>         int err, dlen, compr_type, out_len, old_dlen;
>
>         out_len = le32_to_cpu(dn->size);
> -       buf = kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
> +       buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
>         if (!buf)
>                 return -ENOMEM;
>
> --
> 2.18.0
>



-- 
Kees Cook
Pixel Security
