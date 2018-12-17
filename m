Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYtAN-0000Hl-Eo
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 13:42:40 +0000
Received: by mail-oi1-f194.google.com with SMTP id y23so10165717oia.4
 for <linux-mtd@lists.infradead.org>; Mon, 17 Dec 2018 05:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20181215101329.16246-1-richard@nod.at>
In-Reply-To: <20181215101329.16246-1-richard@nod.at>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 17 Dec 2018 14:42:16 +0100
Message-ID: <CAHc6FU73Cx=KengB8R=am_d0fGvQjaRrog9tqBC8TJaa+F296g@mail.gmail.com>
Subject: Re: [PATCH] jffs2: Fix retry handling jffs2_listxattr
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 dwmw2@infradead.org, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Sat, 15 Dec 2018 at 11:22, Richard Weinberger <richard@nod.at> wrote:
> When jffs2 has to retry reading xattrs we need to reset
> the buffer pointer. Otherwise we return old xattrs from the
> previous iteration which leads to a inconsistency between
> the number of bytes we return and the real list size.
>
> Cc: <stable@vger.kernel.org>
> Cc: Andreas Gruenbacher <agruenba@redhat.com>
> Fixes: 764a5c6b1fa4 ("xattr handlers: Simplify list operation")
> Signed-off-by: Richard Weinberger <richard@nod.at>

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

> ---
> Andreas,
>
> since you maintain the attr package too, I report it right here. :-)
> This jffs2 bug lead to a crash in attr_list().
>
> for() will loop to crash when there is no trailing \0 in the
> list of xattrs.
>
> for (l = lbuf; l != lbuf + length; l = strchr(l, '\0') + 1) {
>         if (api_unconvert(name, l, flags))
>                 continue;
>
> ...
> }
>
> I suggest changing the loop condition to something like l < lbuf + length.

With that change alone, strchr would still go beyond the buffer. Let's
just append a null character at the end instead.

Thanks,
Andreas

> Thanks,
> //richard
> ---
>  fs/jffs2/xattr.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
> index da3e18503c65..0cb322eb9516 100644
> --- a/fs/jffs2/xattr.c
> +++ b/fs/jffs2/xattr.c
> @@ -967,6 +967,7 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
>         struct jffs2_xattr_ref *ref, **pref;
>         struct jffs2_xattr_datum *xd;
>         const struct xattr_handler *xhandle;
> +       char *orig_buffer = buffer;
>         const char *prefix;
>         ssize_t prefix_len, len, rc;
>         int retry = 0;
> @@ -977,6 +978,7 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
>
>         down_read(&c->xattr_sem);
>   retry:
> +       buffer = orig_buffer;
>         len = 0;
>         for (ref=ic->xref, pref=&ic->xref; ref; pref=&ref->next, ref=ref->next) {
>                 BUG_ON(ref->ic != ic);
> --
> 2.20.0
>
