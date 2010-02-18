Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ni6Ek-0007oU-VV
	for linux-mtd@lists.infradead.org; Thu, 18 Feb 2010 13:16:15 +0000
In-Reply-To: <1266495764.16891.37.camel@localhost>
References: <1266394581-32450-1-git-send-email-Joakim.Tjernlund@transmode.se>	
	<1266394581-32450-2-git-send-email-Joakim.Tjernlund@transmode.se>
	<1266491166.16891.18.camel@localhost>	
	<OF2CF0C293.92055005-ONC12576CE.0042F59D-C12576CE.00438990@transmode.se>
	<1266495764.16891.37.camel@localhost>
Subject: Re: [PATCH 1/2] jffs2: Move erasing from write_super to GC.
To: dedekind1@gmail.com,
	David Woodhouse <dwmw2@infradead.org>
Message-ID: <OF8BB2F92E.CCBFCD4D-ONC12576CE.0047E7D6-C12576CE.004890A3@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 18 Feb 2010 14:12:36 +0100
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

Artem Bityutskiy <dedekind1@gmail.com> wrote on 2010/02/18 13:22:44:
>
> On Thu, 2010-02-18 at 13:17 +0100, Joakim Tjernlund wrote:
> > Artem Bityutskiy <dedekind1@gmail.com> wrote on 2010/02/18 12:06:06:
> > >
> > > On Wed, 2010-02-17 at 09:16 +0100, Joakim Tjernlund wrote:
> > > > diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> > > > index b47679b..1ca2559 100644
> > > > --- a/fs/jffs2/erase.c
> > > > +++ b/fs/jffs2/erase.c
> > > > @@ -114,6 +114,11 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info
> > > *c, int count)
> > > >     while (!list_empty(&c->erase_complete_list) ||
> > > >            !list_empty(&c->erase_pending_list)) {
> > > >
> > > > +      if (signal_pending(current)) {
> > > > +         spin_unlock(&c->erase_completion_lock);
> > > > +         mutex_unlock(&c->erase_free_sem);
> > > > +         goto done;
> > > > +      }
> > >
> > > Err, I thought you would remove signal checking from this function? It
> > > really does not belong here.
> >
> > Slight misunderstanding, it needs to be there otherwise my patches won't do any good.
> > Removing signal from this function basically means that we should remove count
> > and only erase one block per invocation. Basically the while !empty loop needs to move
> > into the GC task instead. This is a somewhat bigger surgery but doable.
>
> Right. You can move the signal check to the BGT, and do 1-3 erases at a
> time by passing cnt = 1-3. I think it is cleaner.

Doing this warrants a return value from jffs2_erase_pending_blocks() as
testing for empty lists will be clumsy in both GC and erase.c
All in all this will bring some more churn in the code so I really
don't won't to do all that for nothing, that is, David are you happy
with this too?

Question, is it really necessary to take erase_free_sem lock before
testing for list_empty?

 Jocke
