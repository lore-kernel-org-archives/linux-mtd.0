Date: Mon, 18 Apr 2005 11:53:01 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050418105301.GA21878@infradead.org>
References: <1113814031.31595.3.camel@sauron.oktetlabs.ru>
	<20050418085121.GA19091@infradead.org>
	<1113814730.31595.6.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1113814730.31595.6.camel@sauron.oktetlabs.ru>
Cc: dwmw2@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATC] small VFS change for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 18, 2005 at 12:58:50PM +0400, Artem B. Bityuckiy wrote:
> On Mon, 2005-04-18 at 09:51 +0100, Christoph Hellwig wrote:
> > No, exporting locks is a really bad idea.  Please try to find a better
> > method to fix your problem that doesn't export random kernel symbols.
> > 
> In general it must be true. But this specific case I believe is
> reasonable enough to export the mutext (as an exception).

Umm, no.  It's absolutely not a good reason.  What jffs2 is doing right
now is to poke into VFS internals it shouldn't, and exporting more internals
to prevent it from doing so isn't making the situation any better.

The VFS already has a method for freeing an struct inode pointer, and that
is ->destroy_inode.  You're probably better off updating your GC state from
that place.
