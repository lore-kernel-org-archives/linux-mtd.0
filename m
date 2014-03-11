Received: from [143.182.124.37] (helo=mga14.intel.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNHXh-0002qj-2a
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 07:56:06 +0000
Message-ID: <1394524540.2399.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: add missing znode freeing in tcn_insert()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 11 Mar 2014 09:55:40 +0200
In-Reply-To: <CAGVrzcZzt+Jii5D8zNTECn92L2-ASoxd4Bcz5WvSNq3rsd754g@mail.gmail.com>
References: <1394237487-2728-1-git-send-email-f.fainelli@gmail.com>
 <CAFLxGvyyD4YOdprkVNYacf1_1pZdzEBjTOU56FWZB0vcjrij6Q@mail.gmail.com>
 <CAGVrzcZzt+Jii5D8zNTECn92L2-ASoxd4Bcz5WvSNq3rsd754g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-03-10 at 11:44 -0700, Florian Fainelli wrote:
> 2014-03-08 2:46 GMT-08:00 Richard Weinberger <richard.weinberger@gmail.com>:
> > On Sat, Mar 8, 2014 at 1:11 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> >> In case the zi allocation fails in the do_split label, we will fail
> >> freeing zn that we allocated before, add a missing kfree.
> >>
> >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> >> ---
> >>  fs/ubifs/tnc.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
> >> index 9083bc7ed4ae..9b84d91ea530 100644
> >> --- a/fs/ubifs/tnc.c
> >> +++ b/fs/ubifs/tnc.c
> >> @@ -2105,8 +2105,10 @@ do_split:
> >>         dbg_tnc("creating new zroot at level %d", znode->level + 1);
> >>
> >>         zi = kzalloc(c->max_znode_sz, GFP_NOFS);
> >> -       if (!zi)
> >> +       if (!zi) {
> >> +               kfree(zn);
> >>                 return -ENOMEM;
> >> +       }
> >>
> >
> > I'm not sure whether this is correct.
> >
> > Around line 2050 we have:
> > ... else {
> >                 /* Insert into new znode */
> >                 zi = zn; <---------
> >                 n -= keep;
> >                 /* Re-parent */
> >                 if (zn->level != 0)
> >                         zbr->znode->parent = zn;
> >         }
> >
> > And later:
> > insert_zbranch(zi, zbr, n);
> >
> > By freeing zn you may introduce a use after free bug.
> 
> Yes, you are right, I cannot find a good way to make sure this is not
> the case,

I think you do not need to free it. It was allocated and inserted to
TNC. TNC is a global data structure. It gets destroyed (all elements get
freed) when the FS is unmounted. Or if mount fails, it gets freed on the
error path.

So no need to worry about that element.

>  variables re-use in this function makes it particularly hard
> to read BTW.

Yes, it could be better, I guess. But this kind of "algorithmic" code is
rarely very readable, it is just not very easy. More comments could help
too.

-- 
Best Regards,
Artem Bityutskiy
