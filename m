Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CrgZL-0007O4-Ak
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 12:58:11 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050120173341.GA24657@wohnheim.fh-wedel.de>
References: <20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<20050120143525.GA18170@wohnheim.fh-wedel.de>
	<1106233518.2903.15.camel@sauron.oktetlabs.ru>
	<20050120152736.GA20639@wohnheim.fh-wedel.de>
	<1106235461.2903.25.camel@sauron.oktetlabs.ru>
	<20050120161306.GG20639@wohnheim.fh-wedel.de>
	<1106238673.7940.0.camel@sauron.oktetlabs.ru>
	<20050120164153.GM20639@wohnheim.fh-wedel.de>
	<1106240903.7940.12.camel@sauron.oktetlabs.ru>
	<20050120173341.GA24657@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Thu, 20 Jan 2005 20:57:33 +0300
Message-Id: <1106243853.7940.15.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Extended attributes can be arbitrary, so they should go somewhere
> else.  Basically, have a pseudo-directory for each inode and treat the
> inodes inside that pseudo-directory as extended attributes.  Similar
> to reiser4.  Didn't Josh plan to work in this area?
Frankly speaking, do not really understand you. But do not care much,
did not think about xattr. This is another topic. And agree that xattrs
may be different, and what I proposed is not generic solution.

> What's so very special about NAND?  Either it's a useful storage
> medium (with slightly different details), or it's not.  If it is, you
> will never see this message.  If it's not, you shouldn't put any
> serious data on it anyway.  In both cases, you should never see this
> message.
> 
> If you do see the message, it means that you *thought* it would be a
> useful storage medium, but you're *wrong*.  Telling you that your
> conception of reality doesn't match reality itself is a service.
Did not want return to this :-)
We may print it for NAND too. If we provide method to clear our flag,
user may disable this.

> How about an rb_tree, sorted by the offset?  Just like the one in
> fs/jffs2/nodelist.h, hm? ;)
Yes, it is. But before you create fragtree:
1. You need dsize to create fragtree.
2. You have no structures which are sorted by offsets, so it is not easy
to obtain dsize.

That's problem. So, let us keep dsize alive :-)


On Thu, 2005-01-20 at 18:33 +0100, Jörn Engel wrote:
> On Thu, 20 January 2005 20:08:23 +0300, Artem B. Bityuckiy wrote:
> >
> > By the way, I'm not sure having times in our "inode flags node" is
> > reasonable. In this case we will need to update it very often and
> > possibly, will waste even more space (flag nodes have headers). If we
> > put only rarely changed data there, like UID and GID, we may save some
> > flash space... 
> 
> Makes some sense.  Needs more thinking...
> 
> > One more by the way, compression mode and whatever people implement in
> > xattr flags may go to that inode flags node.
> 
> Extended attributes can be arbitrary, so they should go somewhere
> else.  Basically, have a pseudo-directory for each inode and treat the
> inodes inside that pseudo-directory as extended attributes.  Similar
> to reiser4.  Didn't Josh plan to work in this area?
> 
> > And I still do not think that if we found bad block on NAND we should
> > print large warning every mount. For NOR, no doubts.
> 
> What's so very special about NAND?  Either it's a useful storage
> medium (with slightly different details), or it's not.  If it is, you
> will never see this message.  If it's not, you shouldn't put any
> serious data on it anyway.  In both cases, you should never see this
> message.
> 
> If you do see the message, it means that you *thought* it would be a
> useful storage medium, but you're *wrong*.  Telling you that your
> conception of reality doesn't match reality itself is a service.
> 
> > > Ouch!  Ok, looks like this one could stay.
> > > 
> > > Although...we do have the offset already.  So for the 4k case, it's
> > > pretty simple to build the fragtree as well, as there is just one node
> > > that could possibly be in the 4k range for it.
> > > 
> > > The remaining cases get quite a bit messier.  They remain the rare
> > > case, so it may still be worth the effort, if anyone cares enough to
> > > write the code.
> > > 
> > 
> > Anyway, nodes are not sorted on media. So to find the node with 
> > next offset we will need to do some search. This is time consuming. Or
> > we will need to keep nodes in offset-sorted list,
> 
> How about an rb_tree, sorted by the offset?  Just like the one in
> fs/jffs2/nodelist.h, hm? ;)
> 
> You're right, it's not sure whether this is actually a useful
> optimization.  But it's not trivial to dismiss either.
> 
> Jörn
> 
