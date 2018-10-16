Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCJ2k-0001wC-9B
 for linux-mtd@lists.infradead.org; Tue, 16 Oct 2018 06:41:27 +0000
Received: by mail-wr1-x443.google.com with SMTP id 63-v6so23978744wra.11
 for <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2018 23:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181006090935.41714-1-houtao1@huawei.com>
 <6401cb90-a1fe-afd5-c302-ddae40876736@huawei.com>
In-Reply-To: <6401cb90-a1fe-afd5-c302-ddae40876736@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 16 Oct 2018 08:41:02 +0200
Message-ID: <CAFLxGvw+=gfrm3SH4Hu9bt0sa6s+X=3cCjkDLvWusqhHH10yEQ@mail.gmail.com>
Subject: Re: [PATCH] jffs2: free jffs2_sb_info through jffs2_kill_sb()
To: houtao1@huawei.com
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, stable@kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 16, 2018 at 7:53 AM Hou Tao <houtao1@huawei.com> wrote:
>
> ping ?
>
> On 2018/10/6 17:09, Hou Tao wrote:
> > When an invalid mount option is passed to jffs2, jffs2_parse_options()
> > will fail and jffs2_sb_info will be freed, but then jffs2_sb_info will
> > be used (use-after-free) and freeed (double-free) in jffs2_kill_sb().
> >
> > Fix it by removing the buggy invocation of kfree() when getting invalid
> > mount options.
> >
> > Cc: stable@kernel.org
> > Signed-off-by: Hou Tao <houtao1@huawei.com>
> > ---
> >  fs/jffs2/super.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> > index 87bdf0f4cba1..902a7dd10e5c 100644
> > --- a/fs/jffs2/super.c
> > +++ b/fs/jffs2/super.c
> > @@ -285,10 +285,8 @@ static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
> >       sb->s_fs_info = c;
> >
> >       ret = jffs2_parse_options(c, data);
> > -     if (ret) {
> > -             kfree(c);
> > +     if (ret)
> >               return -EINVAL;
> > -     }

Reviewed-by: Richard Weinberger <richard@nod.at>

We can carry this via the MTD tree.

-- 
Thanks,
//richard
