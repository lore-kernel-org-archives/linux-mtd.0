Received: from mail-vn0-x22e.google.com ([2607:f8b0:400c:c0f::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yvh1k-0005LL-7C
 for linux-mtd@lists.infradead.org; Fri, 22 May 2015 07:05:52 +0000
Received: by vnbg190 with SMTP id g190so710618vnb.4
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2015 00:05:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <555E78D2.9020307@codeaurora.org>
References: <555E78D2.9020307@codeaurora.org>
Date: Fri, 22 May 2015 09:05:30 +0200
Message-ID: <CAFLxGvxwVL8U=TESJJaWuKMD=_Kvr6rgoJtZ251HGOFbSiVvVA@mail.gmail.com>
Subject: Re: ubi_assert(list_empty(&used)) in ubi_attach_fastmap
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Nikhilesh Reddy <reddyn@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On Fri, May 22, 2015 at 2:31 AM, Nikhilesh Reddy <reddyn@codeaurora.org> wrote:
> Hi
>
> I am running kernel 3.10.
>
> I recently saw an issue where ubi_assert(list_empty(&used)) in
> ubi_attach_fastmap always hits on a partition.
>
> Searching this issue I found
> http://git.infradead.org/linux-ubifs.git/commitdiff/a83832a7c8d023f446ec865926190951bd18a4b1?hp=36a87e44f642966442fd0d23f2ec536851e00236
> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
> index 600c4f9..9858bfb 100644 (file)
> --- a/drivers/mtd/ubi/fastmap.c
> +++ b/drivers/mtd/ubi/fastmap.c
> @@ -814,7 +814,9 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
>         list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list)
>                 list_move_tail(&tmp_aeb->u.list, &ai->free);
>
> -       ubi_assert(list_empty(&used));
> +       list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &used, u.list)
> +               list_move_tail(&tmp_aeb->u.list, &ai->erase);
> +
>         ubi_assert(list_empty(&eba_orphans));
>         ubi_assert(list_empty(&free));
>
>
> Can you please give me a background on this patch.
> Is this safe to apply without any of patches in the list
>
> http://lwn.net/Articles/618410/

This is a tricky question but I tend to say "no".
In my last fastmap series I've fixed a *lot* of issues.
You need all fixes and they depend on each other.

My plan was to backport them to stable but as I'm horrible
backlogged this plan hasn't materialized yet. ;-(

> Can this occur when trying to attach an empty partition?
> i.e. one that doesn't contain a UBI image.

s/image/volume?

As the commit message says, it can happen in the powercut case.
I don't think this is true for your case.
So, please backport all fixes to your custom kernel first.

-- 
Thanks,
//richard
