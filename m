Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cry8u-0006tO-UL
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2005 07:44:02 -0500
Date: Fri, 21 Jan 2005 13:44:03 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050121124403.GA9931@wohnheim.fh-wedel.de>
References: <20050120143525.GA18170@wohnheim.fh-wedel.de>
	<1106233518.2903.15.camel@sauron.oktetlabs.ru>
	<20050120152736.GA20639@wohnheim.fh-wedel.de>
	<1106235461.2903.25.camel@sauron.oktetlabs.ru>
	<20050120161306.GG20639@wohnheim.fh-wedel.de>
	<1106238673.7940.0.camel@sauron.oktetlabs.ru>
	<20050120164153.GM20639@wohnheim.fh-wedel.de>
	<1106240903.7940.12.camel@sauron.oktetlabs.ru>
	<20050120173341.GA24657@wohnheim.fh-wedel.de>
	<1106243853.7940.15.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1106243853.7940.15.camel@sauron.oktetlabs.ru>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 January 2005 20:57:33 +0300, Artem B. Bityuckiy wrote:
> 
> > > One more by the way, compression mode and whatever people
> > > implement in xattr flags may go to that inode flags node.
> >
> > Extended attributes can be arbitrary, so they should go somewhere
> > else.  Basically, have a pseudo-directory for each inode and treat the
> > inodes inside that pseudo-directory as extended attributes.  Similar
> > to reiser4.  Didn't Josh plan to work in this area?
> Frankly speaking, do not really understand you. But do not care much,
> did not think about xattr. This is another topic. And agree that xattrs
> may be different, and what I proposed is not generic solution.

Basically, there are two kinds of file attributes.  First the old,
well-known and well-defined ones from original unix, see stat(2).
Those are part of the inode for any unix-style filesystem.  Plus any
arbitraty other attributes, that people may wish for.  Since those are
neither well-known nor well-defined, we shouldn't statically allocate
space for them in the inode.

But I fear that you were talking about something completely different.
In that case, the "xattr" put me on the wrong track.

> We may print it for NAND too. If we provide method to clear our flag,
> user may disable this.

Sure.  I'm ok to confine this to PARANOID mode or make it otherwise
user-controllable.  Not everyone will want it, so it has to be a
tunable.

> > How about an rb_tree, sorted by the offset?  Just like the one in
> > fs/jffs2/nodelist.h, hm? ;)
> Yes, it is. But before you create fragtree:
> 1. You need dsize to create fragtree.
> 2. You have no structures which are sorted by offsets, so it is not easy
> to obtain dsize.
> 
> That's problem. So, let us keep dsize alive :-)

Still not convinced, but I'm too lazy to argue over four bytes.

Jörn

-- 
"Translations are and will always be problematic. They inflict violence 
upon two languages." (translation from German)
