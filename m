Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKC0W-000346-IV
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 14:34:45 +0000
Date: Mon, 14 Dec 2009 22:34:35 +0800
From: Daniel Mack <daniel@caiaq.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: New mtd-utils release?
Message-ID: <20091214143435.GD28375@buzzloop.caiaq.de>
References: <20091214121439.GC28375@buzzloop.caiaq.de>
	<1260795633.11112.49.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1260795633.11112.49.camel@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 14, 2009 at 03:00:33PM +0200, Artem Bityutskiy wrote:
> On Mon, 2009-12-14 at 20:14 +0800, Daniel Mack wrote:
> > we're building mtd-utils with buildroot, and as we need a recent version
> > of it to get the ubi features, we currently check out a git snapshot as
> > tarball. Last week, for some reason the SHA1 ID we used (e783e75e0)
> > disappeared from the repository. (Just out of curiosity: what happened?
> > Was the tree rebased or filtered?).
> 
> Dunno, but it must be me how made this crew-up, sorry. I cannot say
> exactly how it happened, but it was non-intentional. Probably pushed one
> patch version, then later amended it, and pushed it with --force. This
> should never be done, sorry.

No big thing, I was just wondering. Probably the commit was dead (ie,
not lined-up with an exposed head) for a longer time and just got
vacuumed last week, dunno.

> > However, this approach is somewhat hackish anyway, and we would much
> > more like to check out a version that is officially tagged.
> 
> OK, I can tag them at the beginning of the next year. I'm having
> holydays in 10 min.
> 
> >  Seeing the
> > last tag has been done ~17 month ago, I wonder whether there is any
> > change to get a new one soon?
> 
> We usually use the master branch. And there is simply no one who cares
> about tags. But I can do this. You'll get a new tag when I come back
> from holydays, unless someone else tag it earlier.

Great, thank you. The background of my question was also whether there
is a version which is reliable, in terms of representing a stable set
of features, defining a larger merge of new features and the like, so
it deserves the term 'release' :)

Not saying that any of the snapshops caused any trouble so far, it would
just feel better to check out something that has been tagged by the
maintainers.

Thanks,
Daniel
