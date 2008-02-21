Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JS9Lg-00037Y-UV
	for linux-mtd@lists.infradead.org; Thu, 21 Feb 2008 11:12:21 +0000
Date: Thu, 21 Feb 2008 12:11:48 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [PATCH] [JFFS2] Fix free space leaking
Message-ID: <20080221111148.GA10791@lazybastard.org>
References: <20071113102323.GA5933@damir.rnd.local>
	<1202293219.25864.45.camel@gentoo-jocke.transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1202293219.25864.45.camel@gentoo-jocke.transmode.se>
Cc: linux-mtd@lists.infradead.org, Damir Shayhutdinov <lost404@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 6 February 2008 11:20:19 +0100, Joakim Tjernlund wrote:
> On Tue, 2007-11-13 at 13:23 +0300, Damir Shayhutdinov wrote:
> > This patch is addressed to fix very-long-standing problem in JFFS2,
> > first described in 2004:
> > http://lists.infradead.org/pipermail/linux-mtd/2004-March/009456.html
> > 
> > jffs2_link_node_ref() decreases c->free_size by
> > c->cleanmarker_size but the clean marker space can't
> > be accounted as free space! So we just compensate
> > the difference.
> > 
> > Signed-off-by: Alexander Yurchenko <grange@tecon.ru>
> > Signed-off-by: Damir Shayhutdinov <damir@tecon.ru>
> > ---
> >  fs/jffs2/erase.c |   11 +++++++++++
> >  1 files changed, 11 insertions(+), 0 deletions(-)
> > 
> > diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> > index a1db918..c574fa3 100644
> > --- a/fs/jffs2/erase.c
> > +++ b/fs/jffs2/erase.c
> > @@ -454,6 +454,17 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
> >  		jeb->free_size = c->sector_size;
> >  		/* FIXME Special case for cleanmarker in empty block */
> >  		jffs2_link_node_ref(c, jeb, jeb->offset | REF_NORMAL, c->cleanmarker_size, NULL);
> > +		/*
> > +		 * XXX: I'm not sure this is correct but it prevents
> > +		 * c->free_size from slow leaking under a frequent file
> > +		 * overwriting.
> > +		 * jffs2_link_node_ref() decreases c->free_size by
> > +		 * c->cleanmarker_size but the clean marker space can't
> > +		 * be accounted as free space! So we just compensate
> > +		 * the difference.
> > +		 */
> > +		c->free_size += c->cleanmarker_size;
> > +		c->used_size -= c->cleanmarker_size;
> >  	}
> >  
> >  	down(&c->erase_free_sem);
> 
> What happened to this patch? Just forgotten or was it rejected?

No idea, but it might help to add dwmw2 to Cc:.

Jörn

-- 
Joern's library part 4:
http://www.paulgraham.com/spam.html
