Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PAJrv-00069m-2k
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 10:01:38 +0000
In-Reply-To: <1288000201.26820.38.camel@i7.infradead.org>
References: <1286468986-24627-1-git-send-email-Joakim.Tjernlund@transmode.se>	
	<1287965485.5674.25.camel@macbook.infradead.org>
	<OFC10FE113.61700EC9-ONC12577C7.002267AD-C12577C7.002576D4@transmode.se>
	<1288000201.26820.38.camel@i7.infradead.org>
Subject: Re: [PATCH] jffs2: Do not assume erase will fail
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OFEC5B9F23.EE0D161D-ONC12577C7.0036D8F4-C12577C7.00370F7B@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 25 Oct 2010 12:01:24 +0200
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

David Woodhouse <dwmw2@infradead.org> wrote on 2010/10/25 11:50:01:
>
> On Mon, 2010-10-25 at 08:49 +0200, Joakim Tjernlund wrote:
> > David Woodhouse <dwmw2@infradead.org> wrote on 2010/10/25 02:11:25:
> > >
> > > On Thu, 2010-10-07 at 18:29 +0200, Joakim Tjernlund wrote:
> > > >
> > > > Test if it did and then abort.
> > > >
> > > > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > > > ---
> > > >  fs/jffs2/nodemgmt.c |    6 +++---
> > > >  1 files changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
> > > > index 694aa5b..49ee5de 100644
> > > > --- a/fs/jffs2/nodemgmt.c
> > > > +++ b/fs/jffs2/nodemgmt.c
> > > > @@ -260,9 +260,9 @@ static int jffs2_find_nextblock(struct jffs2_sb_info *c)
> > > >                 spin_lock(&c->erase_completion_lock);
> > > >
> > > >                 /* An erase may have failed, decreasing the
> > > > -                  amount of free space available. So we must
> > > > -                  restart from the beginning */
> > > > -               return -EAGAIN;
> > > > +                  amount of free space available. */
> > > > +               if (list_empty(&c->free_list))
> > > > +                       return -EAGAIN; /* restart from the beginning */
> > >
> > > Hm, but there could have been more than one erase pending (or in
> > > progress). And if one fails and another succeeds then you could have a
> > > non-empty free_list but you could *also* now have run short of
> > > free/freeable space so that a userspace write should now receive
> > > -ENOSPC.
> >
> > I don't see how my patch changes that, if !list_empty(&c->free_list)
> > then you have at least one free block so you should not run into -ENOSPC
>
> Not for jffs2_reserve_space_gc(), you're right. But for non-GC
> allocations it's different -- jffs2_reserve_space() will only allow an
> allocation if you have more than a certain amount of freeable space,
> according to the type of operation. And that amount of freeable space
> can be reduced if an erase fails.

But jffs2_find_nextblock is only about finding ONE block, isn't it?

     Jocke
