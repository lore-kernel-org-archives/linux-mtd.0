Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CrfNZ-0006KF-FG
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 11:41:55 -0500
Date: Thu, 20 Jan 2005 17:41:53 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050120164153.GM20639@wohnheim.fh-wedel.de>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1106238673.7940.0.camel@sauron.oktetlabs.ru>
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

On Thu, 20 January 2005 19:31:13 +0300, Artem B. Bityuckiy wrote:
> Jörn Engel wrote:
> > Doesn't work.  Those are per inode, unless you want all files to have
> > the same owner.
> Surely. I thought you suggested to introduce new type of nodes which are
> per-inode and contain inode flags and other information which we do not
> want to copy to each inode node, like PID, GID and time stuff.

Ah, yes.  Makes sense.

Well, the original proposal was about _filesystem_ flags.  Right now,
we have none, but I'd like to have the "something smells fishy,
replace your flash ASAP" flage.

> > What would work, on the other hand, is to seperate inodes and data
> > nodes.  PID, GID and all the other inode fields are needed only once,
> > not for every chunk of data belonging to that inode.
> > 
> > 
> > And while we're at it, some other fields from the inodes should be
> > removed.
> > 
> > 	jint32_t atime;      /* Last access time.  */
> > 	jint32_t mtime;      /* Last modification time.  */
> > 	jint32_t ctime;      /* Change time.  */
> Absolutely correct :-)
> 
> > 	jint32_t dsize;	     /* Size of the node's data. (after
> decompression) */
> > 
> > In most cases, dsize will be 4k.  So we can just uncompress into the
> > page and ignore the flag.  For the last page of a file, we can do the
> > same, even though the dsize is different.
> > In the remaining cases, we'd have to uncompress to a buffer of 4k (or
> > more, if we go for 64k nodes someday) and memcpy.
> Hmm. I assume you offer to remove this field at all? Not sure it is good
> Idea.
> When we build fragtree we should know how many bytes in nodes. We do not
> want to
> uncompress data to calculate this...

Ouch!  Ok, looks like this one could stay.

Although...we do have the offset already.  So for the 4k case, it's
pretty simple to build the fragtree as well, as there is just one node
that could possibly be in the 4k range for it.

The remaining cases get quite a bit messier.  They remain the rare
case, so it may still be worth the effort, if anyone cares enough to
write the code.

> > 	uint8_t usercompr;   /* Compression algorithm requested by the user
> */
> AFIK, this is uncompleted Ferenc Havsi's stuff. He was going to add
> smart compressioning. This is just ignored now.

Ok, will ignore it then.

Jörn

-- 
There are two ways of constructing a software design: one way is to make
it so simple that there are obviously no deficiencies, and the other is
to make it so complicated that there are no obvious deficiencies.
-- C. A. R. Hoare
