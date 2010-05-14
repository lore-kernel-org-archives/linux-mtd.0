Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCsnq-0007MV-Hx
	for linux-mtd@lists.infradead.org; Fri, 14 May 2010 11:11:39 +0000
In-Reply-To: <1273833304.9999.1994.camel@macbook.infradead.org>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>	
	<1273771018.12840.7077.camel@macbook.infradead.org>
	<OFA2F265F6.2B404027-ONC1257723.003646C0-C1257723.0037EF5F@transmode.se>
	<1273833304.9999.1994.camel@macbook.infradead.org>
Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OF1C1D0F53.C35CA5E4-ONC1257723.003B9D61-C1257723.003D1321@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 14 May 2010 13:07:05 +0200
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




David Woodhouse <dwmw2@infradead.org> wrote on 2010/05/14 12:35:04:
>
> On Fri, 2010-05-14 at 12:10 +0200, Joakim Tjernlund wrote:
> >  The only callers of jffs2_erase_pending_blocks() now call it with a
> > > 'count' argument of 1. So perhaps it's now misnamed and the 's' and the
> > > extra argument should be dropped?
> >
> > I didn't want to change to much and who knows, maybe someone wants
> > to erase more than one block in the future. Removing the
> > count could be an add on patch once this patch has proven itself.
>
> Yeah, that makes some sense.
>
> > > I don't much like the calculation you've added to the end of that
> > > function either, which really ought to be under locks (even though right
> > > now I suspect it doesn't hurt). Why recalculate that at all, though --
> >
> > Why does a simple list test need locks?
>
> Because it's not just about the test itself. It's also about the memory
> barriers. Some other CPU could have changed the list (under locks) but
> unless you have the memory barrier which is implicit in the spinlock,
> you might see old data.

old data doesn't matter here I think.

>
> > > why not keep a 'ret' variable which defaults to 0 but is set to 1 just
> > > before the 'goto done' which is the only way out of the function where
> > > the return value should be non-zero anyway?
> >
> > That would not be the same, would it? One wants to know if the lists
> > are empty AFTER erasing count blocks.
>
> Hm, does one? There's precisely one place we use this return value, in
> the GC thread. Can you explain the logic of what you were doing there?

Sure, return 1 if there are more blocks left in the list after
erasing count. That way the caller knows if there are any block left
to erase.

> It looks like you really wanted it to return a flag saying whether it
> actually _did_ anything or not. And if it did, that's your work for this
> GC wakeup and you don't call jffs2_garbage_collect_pass(). Why are you
> returning a value which tells whether there's more work to do?

hmm, I guess the simpler method like you suggested would work too.
Details are a bit fuzzy now.

>
> >  I guess I could move the list empty
> > check before goto done, but that would not really change anything.
>
> Ah, yes. Instead of setting ret=1 at the 'goto done', you'd actually do
> the test somewhere there too, before dropping the locks. Assuming that
> this really is the return value you need to return, rather than a simple
> 'work_done' flag.
