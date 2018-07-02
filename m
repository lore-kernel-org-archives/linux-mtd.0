Received: from mail-yb0-x241.google.com ([2607:f8b0:4002:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fa1Fz-0006EI-8e
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 16:00:55 +0000
Received: by mail-yb0-x241.google.com with SMTP id r3-v6so5271333ybo.4
 for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2018 09:00:40 -0700 (PDT)
MIME-Version: 1.0
Sender: keescook@google.com
In-Reply-To: <20180701212051.29486-2-richard@nod.at>
References: <20180701212051.29486-1-richard@nod.at>
 <20180701212051.29486-2-richard@nod.at>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 2 Jul 2018 09:00:39 -0700
Message-ID: <CAGXu5jJcrNtM4HXX=YJJjgMAiYRtWAtsdMkMxhon9XmR7O_Htg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ubifs: Check data node size before truncate
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
> Check whether the size is within bounds before using it.
> If the size is not correct, abort and dump the bad data node.
>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Silvio Cesare <silvio.cesare@gmail.com>
> Cc: stable@vger.kernel.org
> Fixes: 1e51764a3c2ac ("UBIFS: add new flash file system")
> Reported-by: Silvio Cesare <silvio.cesare@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  fs/ubifs/journal.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index da8afdfccaa6..eea12d25a58b 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -1387,7 +1387,16 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
>                 else if (err)
>                         goto out_free;
>                 else {
> -                       if (le32_to_cpu(dn->size) <= dlen)
> +                       int dn_len = le32_to_cpu(dn->size);
> +
> +                       if (dn_len <= 0 || dn_len > UBIFS_BLOCK_SIZE) {
> +                               ubifs_err(c, "bad data node (block %u, inode %lu)",
> +                                         blk, inode->i_ino);
> +                               ubifs_dump_node(c, dn);
> +                               goto out_free;
> +                       }
> +
> +                       if (dn_len <= dlen)
>                                 dlen = 0; /* Nothing to do */
>                         else {
>                                 err = truncate_data_node(c, inode, blk, dn, &dlen);
> --
> 2.18.0
>



-- 
Kees Cook
Pixel Security
