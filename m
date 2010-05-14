Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCrrj-0000DU-Oj
	for linux-mtd@lists.infradead.org; Fri, 14 May 2010 10:11:36 +0000
In-Reply-To: <1273771018.12840.7077.camel@macbook.infradead.org>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1273771018.12840.7077.camel@macbook.infradead.org>
Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OFA2F265F6.2B404027-ONC1257723.003646C0-C1257723.0037EF5F@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 14 May 2010 12:10:57 +0200
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

David Woodhouse <dwmw2@infradead.org> wrote on 2010/05/13 19:16:58:
>
> On Sat, 2010-03-20 at 11:03 +0100, Joakim Tjernlund wrote:
> > Erasing blocks is a form of GC and therefore it should live in the
> > GC task. By moving it there two problems will be solved:
> > 1) unmounting will not hang until all pending blocks has
> >    been erased.
> > 2) Erasing can be paused by sending a SIGSTOP to the GC thread which
> >    allowes for time critical tasks to work in peace.
> >
> > Since erasing now is in the GC thread, erases should trigger
> > the GC task instead.
> > wbuf.c still wants to flush its buffer via write_super so
> > invent jffs2_dirty_trigger() and use that in wbuf.
> > Remove surplus call to jffs2_erase_pending_trigger() in erase.c
> > and remove jffs2_garbage_collect_trigger() from write_super as
> > of now write_super() should only commit dirty data to disk.
> >
> > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > ---
>

uhh, I wrote this patch almost 2 months ago, can't remember the details
but I do my best.

> The only callers of jffs2_erase_pending_blocks() now call it with a
> 'count' argument of 1. So perhaps it's now misnamed and the 's' and the
> extra argument should be dropped?

I didn't want to change to much and who knows, maybe someone wants
to erase more than one block in the future. Removing the
count could be an add on patch once this patch has proven itself.

>
> I don't much like the calculation you've added to the end of that
> function either, which really ought to be under locks (even though right
> now I suspect it doesn't hurt). Why recalculate that at all, though --

Why does a simple list test need locks?

> why not keep a 'ret' variable which defaults to 0 but is set to 1 just
> before the 'goto done' which is the only way out of the function where
> the return value should be non-zero anyway?

That would not be the same, would it? One wants to know if the lists
are empty AFTER erasing count blocks. I guess I could move the list empty
check before goto done, but that would not really change anything.

>
> I've always been very careful to keep the GC thread as an
> _optimisation_. It looks like this will still work, because the actual
> erase will get done from jffs2_reserve_space()... but that'll only erase
> blocks immediately when we actually need them. Before, we were erasing
> them in advance. I suppose that's OK though.

yes, I think so too.
