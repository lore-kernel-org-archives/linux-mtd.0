Received: from mail-yb0-x243.google.com ([2607:f8b0:4002:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fa1FU-00054i-5h
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 16:00:23 +0000
Received: by mail-yb0-x243.google.com with SMTP id y11-v6so1770408ybm.7
 for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2018 09:00:07 -0700 (PDT)
MIME-Version: 1.0
Sender: keescook@google.com
In-Reply-To: <20180701212051.29486-1-richard@nod.at>
References: <20180701212051.29486-1-richard@nod.at>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 2 Jul 2018 09:00:05 -0700
Message-ID: <CAGXu5jJyeoKdqo86+tWoq1n34sELSAXQu8LSBpEbiu2oFg2JPQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "UBIFS: Fix potential integer overflow in
 allocation"
To: Richard Weinberger <richard@nod.at>
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Silvio Cesare <silvio.cesare@gmail.com>, "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jul 1, 2018 at 2:20 PM, Richard Weinberger <richard@nod.at> wrote:
> This reverts commit 353748a359f1821ee934afc579cf04572406b420.
> It bypassed the linux-mtd review process and fixes the issue not as it
> should.

Ah, sorry, I thought you were CCed on the original report.

> Cc: Kees Cook <keescook@chromium.org>
> Cc: Silvio Cesare <silvio.cesare@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/ubifs/journal.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index 07b4956e0425..da8afdfccaa6 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -1282,11 +1282,10 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
>                               int *new_len)
>  {
>         void *buf;
> -       int err, compr_type;
> -       u32 dlen, out_len, old_dlen;
> +       int err, dlen, compr_type, out_len, old_dlen;

What's wrong with making these unsigned?

>
>         out_len = le32_to_cpu(dn->size);
> -       buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
> +       buf = kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
>         if (!buf)
>                 return -ENOMEM;

Please leave the kmalloc() -> kmalloc_array() change, as that has
happened treewide already. We don't want to have any multiplications
in the size argument for the allocators (i.e. they should use 2-factor
arg version like here, or use array_size() for things like vmalloc()).

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
