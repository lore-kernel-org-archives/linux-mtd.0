Date: Mon, 18 Apr 2005 12:52:20 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050418115220.GA22750@infradead.org>
References: <1113814031.31595.3.camel@sauron.oktetlabs.ru>
	<20050418085121.GA19091@infradead.org>
	<1113814730.31595.6.camel@sauron.oktetlabs.ru>
	<20050418105301.GA21878@infradead.org>
	<1113824781.2125.12.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1113824781.2125.12.camel@sauron.oktetlabs.ru>
Cc: Christoph Hellwig <hch@infradead.org>, dwmw2@lists.infradead.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATC] small VFS change for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 18, 2005 at 03:46:21PM +0400, Artem B. Bityuckiy wrote:
> On Mon, 2005-04-18 at 11:53 +0100, Christoph Hellwig wrote: 
> > The VFS already has a method for freeing an struct inode pointer, and that
> > is ->destroy_inode.  You're probably better off updating your GC state from
> > that place.
> destroy_inode() does not help. JFFS2 already makes use of clear_inode()
> which is in fact called even earlier (inode.c from 2.6.11.5, line 298):

Oh, I thought the problem is that JFFS2 thought an inode was freed when
it still was in use.  So you're problem is actually that it's no in the
hash anymore but you don't know yet?

Anyway, please explain in detail why you need all this information, what
errors you see, etc so we can find a way to fix it properly.
