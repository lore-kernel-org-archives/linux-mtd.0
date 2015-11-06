Received: from mail-ob0-x241.google.com ([2607:f8b0:4003:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZupIY-0003jE-MJ
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 22:15:55 +0000
Received: by obbza9 with SMTP id za9so8948582obb.1
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2015 14:15:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <563A581B.7070708@users.sourceforge.net>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <563A581B.7070708@users.sourceforge.net>
Date: Fri, 6 Nov 2015 23:15:33 +0100
Message-ID: <CAFLxGvztEke+ncYoAtORcmCWjkQiD3dU1c69KZkRsLM+cMFobg@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: Delete unnecessary checks before the function call
 "iput"
From: Richard Weinberger <richard.weinberger@gmail.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Julia Lawall <julia.lawall@lip6.fr>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 4, 2015 at 8:10 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 4 Nov 2015 20:00:42 +0100
>
> The iput() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/ubifs/recovery.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
> index 2a1f0bc..586d593 100644
> --- a/fs/ubifs/recovery.c
> +++ b/fs/ubifs/recovery.c
> @@ -1331,8 +1331,7 @@ void ubifs_destroy_size_tree(struct ubifs_info *c)
>         struct size_entry *e, *n;
>
>         rbtree_postorder_for_each_entry_safe(e, n, &c->size_tree, rb) {
> -               if (e->inode)
> -                       iput(e->inode);
> +               iput(e->inode);
>                 kfree(e);
>         }
>
> @@ -1533,8 +1532,7 @@ int ubifs_recover_size(struct ubifs_info *c)
>                                 err = fix_size_in_place(c, e);
>                                 if (err)
>                                         return err;
> -                               if (e->inode)
> -                                       iput(e->inode);
> +                               iput(e->inode);
>                         }
>                 }

Applied!

-- 
Thanks,
//richard
