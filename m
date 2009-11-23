Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCYm7-0007zU-RR
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 13:16:20 +0000
Date: Mon, 23 Nov 2009 16:16:13 +0300
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] jffs2: Fix memory corruption in jffs2_read_inode_range()
Message-ID: <20091123131613.GA14619@oksana.dev.rtsoft.ru>
References: <20091120194532.GA9455@oksana.dev.rtsoft.ru>
	<1258885259.1127.80.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1258885259.1127.80.camel@macbook.infradead.org>
Cc: Neil Brown <neilb@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 22, 2009 at 10:20:59AM +0000, David Woodhouse wrote:
> On Fri, 2009-11-20 at 12:45 -0700, Anton Vorontsov wrote:
> > +       if (pg->index > ((i_size_read(inode) - 1) >> PAGE_CACHE_SHIFT)) {
> > +               ret = 0;
> > +               memset(pg_buf, 0, PAGE_CACHE_SIZE);
> > +       } else {
> > +               ret = jffs2_read_inode_range(c, f, pg_buf,
> > +                       pg->index << PAGE_CACHE_SHIFT, PAGE_CACHE_SIZE);
> > +       } 
> 
> Thank you for the excellent diagnosis and the patch. 
> 
> I think I'd prefer to fix it a little differently though -- I would be
> happier to make jffs2_read_inode_range() cope with out-of-file reads,
> rather than adding this special case where we don't call it.
> 
> That way we aren't at all susceptible to potential races between the
> VFS-maintained i_size and our own internal fragtree handling. And
> jffs2_read_inode_range() already handles the memset to zero for various
> other reasons anyway.
> 
> Does this patch look OK to you? It seems to work on the test cases I've
> tried.

Yep, it looks good (and works).

Thanks David!

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
