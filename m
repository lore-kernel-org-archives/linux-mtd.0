Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Crevi-0005qq-JY
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 11:13:07 -0500
Date: Thu, 20 Jan 2005 17:13:07 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050120161306.GG20639@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<20050120143525.GA18170@wohnheim.fh-wedel.de>
	<1106233518.2903.15.camel@sauron.oktetlabs.ru>
	<20050120152736.GA20639@wohnheim.fh-wedel.de>
	<1106235461.2903.25.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1106235461.2903.25.camel@sauron.oktetlabs.ru>
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

On Thu, 20 January 2005 18:37:41 +0300, Artem B. Bityuckiy wrote:
> 
> > Not sure.  What are GIGs and PIGs?
> Shit :-)

First pigs, now this.  You have a filthy language. ;)

> I meant PIDs and GIDs :-)

Doesn't work.  Those are per inode, unless you want all files to have
the same owner.
What would work, on the other hand, is to seperate inodes and data
nodes.  PID, GID and all the other inode fields are needed only once,
not for every chunk of data belonging to that inode.


And while we're at it, some other fields from the inodes should be
removed.

	jint32_t atime;      /* Last access time.  */
	jint32_t mtime;      /* Last modification time.  */
	jint32_t ctime;      /* Change time.  */

Who would want to mount jffs3 _without_ noatime?  In fact, look at
fs/jffs2/super.c:
        sb->s_flags = flags | MS_NOATIME;

For mtime and ctime, those could be collapsed into one.  Not sure if
that makes sense.

	jint32_t dsize;	     /* Size of the node's data. (after decompression) */

In most cases, dsize will be 4k.  So we can just uncompress into the
page and ignore the flag.  For the last page of a file, we can do the
same, even though the dsize is different.
In the remaining cases, we'd have to uncompress to a buffer of 4k (or
more, if we go for 64k nodes someday) and memcpy.

Might be worth the effort, even if it's just 4 bytes.

	uint8_t usercompr;   /* Compression algorithm requested by the user */

Not exactly sure how this is used.  The code appears to either ignore
it or to be buggy, if this is ever nonzero.  But I could be wrong.

Jörn

-- 
It does not matter how slowly you go, so long as you do not stop.
-- Confucius
