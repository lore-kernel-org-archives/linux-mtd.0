Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CrfDn-00065h-H9
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 11:31:49 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050120161306.GG20639@wohnheim.fh-wedel.de>
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
	<20050120161306.GG20639@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Thu, 20 Jan 2005 19:31:13 +0300
Message-Id: <1106238673.7940.0.camel@sauron.oktetlabs.ru>
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
> Doesn't work.  Those are per inode, unless you want all files to have
> the same owner.
Surely. I thought you suggested to introduce new type of nodes which are
per-inode and contain inode flags and other information which we do not
want to copy to each inode node, like PID, GID and time stuff.

> What would work, on the other hand, is to seperate inodes and data
> nodes.  PID, GID and all the other inode fields are needed only once,
> not for every chunk of data belonging to that inode.
> 
> 
> And while we're at it, some other fields from the inodes should be
> removed.
> 
> 	jint32_t atime;      /* Last access time.  */
> 	jint32_t mtime;      /* Last modification time.  */
> 	jint32_t ctime;      /* Change time.  */
Absolutely correct :-)

> 	jint32_t dsize;	     /* Size of the node's data. (after
decompression) */
> 
> In most cases, dsize will be 4k.  So we can just uncompress into the
> page and ignore the flag.  For the last page of a file, we can do the
> same, even though the dsize is different.
> In the remaining cases, we'd have to uncompress to a buffer of 4k (or
> more, if we go for 64k nodes someday) and memcpy.
Hmm. I assume you offer to remove this field at all? Not sure it is good
Idea.
When we build fragtree we should know how many bytes in nodes. We do not
want to
uncompress data to calculate this...

> Might be worth the effort, even if it's just 4 bytes.
> 
> 	uint8_t usercompr;   /* Compression algorithm requested by the user
*/
AFIK, this is uncompleted Ferenc Havsi's stuff. He was going to add
smart compressioning. This is just ignored now.
