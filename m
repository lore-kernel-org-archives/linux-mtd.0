Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Crfnk-0006fo-6f
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 12:08:58 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050120164153.GM20639@wohnheim.fh-wedel.de>
References: <20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<20050120143525.GA18170@wohnheim.fh-wedel.de>
	<1106233518.2903.15.camel@sauron.oktetlabs.ru>
	<20050120152736.GA20639@wohnheim.fh-wedel.de>
	<1106235461.2903.25.camel@sauron.oktetlabs.ru>
	<20050120161306.GG20639@wohnheim.fh-wedel.de>
	<1106238673.7940.0.camel@sauron.oktetlabs.ru>
	<20050120164153.GM20639@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Thu, 20 Jan 2005 20:08:23 +0300
Message-Id: <1106240903.7940.12.camel@sauron.oktetlabs.ru>
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

Jörn Engel wrote:
> Ah, yes.  Makes sense.
> 
> Well, the original proposal was about _filesystem_ flags.  Right now,
> we have none, but I'd like to have the "something smells fishy,
> replace your flash ASAP" flage.
We still may do this with per-inode flags.

By the way, I'm not sure having times in our "inode flags node" is
reasonable. In this case we will need to update it very often and
possibly, will waste even more space (flag nodes have headers). If we
put only rarely changed data there, like UID and GID, we may save some
flash space... 

One more by the way, compression mode and whatever people implement in
xattr flags may go to that inode flags node.

And I still do not think that if we found bad block on NAND we should
print large warning every mount. For NOR, no doubts.

Hmm, how about this:
If we found checksum error related so some inode X, we set correspondent
flag in "inode flag node" of inode X. Then we reject any work with this
file we do not allow user read or write it (but it is possible to remove
it). But this inode may be just partially corrupted, and user still
wants to edit/read it, it should explicitly call the correspondent xattr
(I thin think xattr should be assumed to be implemented in JFFS3) and
clear that "corrupted" flag.

Yes, on mount we print large warning for NOR.

> Ouch!  Ok, looks like this one could stay.
> 
> Although...we do have the offset already.  So for the 4k case, it's
> pretty simple to build the fragtree as well, as there is just one node
> that could possibly be in the 4k range for it.
> 
> The remaining cases get quite a bit messier.  They remain the rare
> case, so it may still be worth the effort, if anyone cares enough to
> write the code.
> 

Anyway, nodes are not sorted on media. So to find the node with 
next offset we will need to do some search. This is time consuming. Or
we will need to keep nodes in offset-sorted list, which I consider not
reasonable at least if thinking in the context of the current JFFS2
design (I imagine JFFS3 as JFFS2 generation, go JFFS3 will inherit lots
from JFFS2, again, if JFFS3 will ever happen). :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
