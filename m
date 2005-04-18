From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1113827466.2125.47.camel@sauron.oktetlabs.ru>
References: <1113814031.31595.3.camel@sauron.oktetlabs.ru>
	<20050418085121.GA19091@infradead.org>
	<1113814730.31595.6.camel@sauron.oktetlabs.ru>
	<20050418105301.GA21878@infradead.org>
	<1113824781.2125.12.camel@sauron.oktetlabs.ru>
	<20050418115220.GA22750@infradead.org>
	<1113827466.2125.47.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Mon, 18 Apr 2005 22:46:44 +1000
Message-Id: <1113828405.5286.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
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

On Mon, 2005-04-18 at 16:31 +0400, Artem B. Bityuckiy wrote:
> Yes, exactly. VFS developers may always say "it is your problem -
> redesign JFFS2", but I think it is too late to redesign it.

Bear in mind that the reason I added the state tracking to the internal
jffs2_inode_cache state was specifically to deal with the fact that the
VFS can call read_inode() for an inode which was previously in core and
for which it hasn't yet called clear_inode().

I suspect that there's a way we could work around this problem in JFFS2,
and if not hch is probably right -- exporting the lock isn't good
enough; if we're going to change the VFS we should fix the actual
problem.

I'm confused by this though -- I thought we'd already _fixed_ this in
the VFS. What you describe shouldn't happen because I believe you're
missing a step:

> JFFS2 writer: looks at the inode state, realizes it is in state PRESENT,
> i.e. it is in the inode cache (which is wrong).
> JFFS2 writer: runs iget() to acquire a pointer to the struct inode of
> the inode 15601.

wait_for_freeing_inode() waits for the existing inode in state I_FREEING
to finish being cleared...

> JFFS2 writer: iget() calls ->read_inode(), i.e., jffs2_read_inode().
> JFFS2 writed: JFFS2 is surprised why read_inode() is called for the
> already built inode 15601.

... and this shouldn't happen.

-- 
dwmw2
