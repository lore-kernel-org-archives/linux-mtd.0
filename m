Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fwkUl-0006mn-2Z
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2018 08:46:06 +0000
Received: by mail-wm0-x242.google.com with SMTP id s12-v6so301768wmc.0
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2018 01:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180902154443.4776-1-cgxu519@gmx.com>
In-Reply-To: <20180902154443.4776-1-cgxu519@gmx.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 3 Sep 2018 10:45:38 +0200
Message-ID: <CAFLxGvyVmdDk8RqK5y8Q2eDxx4kLPhOJJ8e6TUpx=_E7_u+d-w@mail.gmail.com>
Subject: Re: [PATCH] jffs2: add additinal sanity check for
 jffs2_acl_from_medium()
To: cgxu519@gmx.com
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 2, 2018 at 5:45 PM Chengguang Xu <cgxu519@gmx.com> wrote:
>
> In the case ACL_USER and ACL_GROUP we check if value has exceeded end,
> add same check in the case ACL_OTHER as well.

Did you hit a problem in that area or was this found by review?
>From looking at the code I'd say it is fine as is.
In the ACL_MASK/_OTHER case we don't look into the entry object like
ACL_USER/_GROUP
do, we immediately break the switch and run another round in the for loop.
And here we do:
                entry = value;
                if (value + sizeof(struct jffs2_acl_entry_short) > end)
                        goto fail;

Which is what your additional check does. So, we'd check twice.
What do I miss?

> Signed-off-by: Chengguang Xu <cgxu519@gmx.com>
> ---
>  fs/jffs2/acl.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/jffs2/acl.c b/fs/jffs2/acl.c
> index 093ffbd82395..fce32de3a18f 100644
> --- a/fs/jffs2/acl.c
> +++ b/fs/jffs2/acl.c
> @@ -94,6 +94,8 @@ static struct posix_acl *jffs2_acl_from_medium(void *value, size_t size)
>                         case ACL_MASK:
>                         case ACL_OTHER:
>                                 value += sizeof(struct jffs2_acl_entry_short);
> +                               if (value > end)
> +                                       goto fail;
>                                 break;
>
>                         case ACL_USER:
> --
> 2.17.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard
