Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PAGrt-0001xq-GD
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 06:49:18 +0000
In-Reply-To: <1287965485.5674.25.camel@macbook.infradead.org>
References: <1286468986-24627-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1287965485.5674.25.camel@macbook.infradead.org>
Subject: Re: [PATCH] jffs2: Do not assume erase will fail
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OFC10FE113.61700EC9-ONC12577C7.002267AD-C12577C7.002576D4@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 25 Oct 2010 08:49:12 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> wrote on 2010/10/25 02:11:25:
>
> On Thu, 2010-10-07 at 18:29 +0200, Joakim Tjernlund wrote:
> >
> > Test if it did and then abort.
> >
> > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > ---
> >  fs/jffs2/nodemgmt.c |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
> > index 694aa5b..49ee5de 100644
> > --- a/fs/jffs2/nodemgmt.c
> > +++ b/fs/jffs2/nodemgmt.c
> > @@ -260,9 +260,9 @@ static int jffs2_find_nextblock(struct jffs2_sb_info *c)
> >                 spin_lock(&c->erase_completion_lock);
> >
> >                 /* An erase may have failed, decreasing the
> > -                  amount of free space available. So we must
> > -                  restart from the beginning */
> > -               return -EAGAIN;
> > +                  amount of free space available. */
> > +               if (list_empty(&c->free_list))
> > +                       return -EAGAIN; /* restart from the beginning */
>
> Hm, but there could have been more than one erase pending (or in
> progress). And if one fails and another succeeds then you could have a
> non-empty free_list but you could *also* now have run short of
> free/freeable space so that a userspace write should now receive
> -ENOSPC.

I don't see how my patch changes that, if !list_empty(&c->free_list)
then you have at least one free block so you should not run into -ENOSPC

>
> Is this really a performance issue? It should just come straight back if
> the conditions are still met, surely?

Not a perf issue. It is something I noticed while looking for the
 jffs2: Fix serious write stall due to erase


>
> And if we're hitting this code path that often, we should look at
> erasing more aggressively so that we *don't* have to erase stuff on
> demand.
>
