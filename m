Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NhJcg-00008R-Ga
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 09:21:43 +0000
In-Reply-To: <1266310672.11659.197.camel@localhost>
References: <1266249781-27970-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1266310672.11659.197.camel@localhost>
Subject: Re: [PATCH 1/2] jffs:2 Move erasing from write_super to GC.
To: dedekind1@gmail.com
Message-ID: <OFAA60FE5A.4E16F45A-ONC12576CC.003285C2-C12576CC.0033188F@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 16 Feb 2010 10:18:06 +0100
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

Artem Bityutskiy <dedekind1@gmail.com> wrote on 2010/02/16 09:57:52:
>
> On Mon, 2010-02-15 at 17:03 +0100, Joakim Tjernlund wrote:
> > Erasing blocks is a form of GC and therefor it should live in the
> > GC task. By moving it there two problems will be solved:
> > 1) umounting will not hang until all pending blocks has
> >    been erased.
> > 2) Erasing can be paused by sending a SIGSTOP to the GC thread which
> >    allowes for time critical tasks work in peace.
> >
> > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > ---
> >  fs/jffs2/background.c |    1 +
> >  fs/jffs2/erase.c      |    5 +++++
> >  fs/jffs2/nodemgmt.c   |    4 ++++
> >  fs/jffs2/super.c      |    1 -
> >  4 files changed, 10 insertions(+), 1 deletions(-)
> >
> > diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
> > index 3ff50da..a8e0140 100644
> > --- a/fs/jffs2/background.c
> > +++ b/fs/jffs2/background.c
> > @@ -146,6 +146,7 @@ static int jffs2_garbage_collect_thread(void *_c)
> >        disallow_signal(SIGHUP);
> >
> >        D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread(): pass\n"));
> > +      jffs2_erase_pending_blocks(c, 0);
> >        if (jffs2_garbage_collect_pass(c) == -ENOSPC) {
> >           printk(KERN_NOTICE "No space for garbage collection. Aborting GC thread\n");
> >           goto die;
> > diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> > index b47679b..1ca2559 100644
> > --- a/fs/jffs2/erase.c
> > +++ b/fs/jffs2/erase.c
> > @@ -114,6 +114,11 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info
> *c, int count)
> >     while (!list_empty(&c->erase_complete_list) ||
> >            !list_empty(&c->erase_pending_list)) {
> >
> > +      if (signal_pending(current)) {
> > +         spin_unlock(&c->erase_completion_lock);
> > +         mutex_unlock(&c->erase_free_sem);
> > +         goto done;
> > +      }
>
> I think this is not very good split of functionality.
> 'jffs2_erase_pending_blocks()' should be stupid, it should just erase as
> many EBs as it was asked to. It should have zero knowledge about
> signals.

hmm, you have a point there.

>
> I think you should remove the signals checking from here and move that
> to the GC thread.
>
> Also, I think you should call it with count = 1, so that you would erase
> only one EB at one iteration. This way you will let the GC thread do
> other things with less latency as well.

If we reduce the count to 1 one might just as well remove count from
jffs2_erase_pending_blocks() and make it just erase one block on each invocation,
not sure I like that as it will be more overhead when erasing many blocks.

I figure erasing blocks is the most rewarding form of GC so there should
be no need to reduce latency for other things, can you think of a reason?

    Jocke
