Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Crz3K-0007Us-7S
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2005 08:42:19 -0500
Date: Fri, 21 Jan 2005 14:42:21 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050121134221.GB9931@wohnheim.fh-wedel.de>
References: <20050120152736.GA20639@wohnheim.fh-wedel.de>
	<1106235461.2903.25.camel@sauron.oktetlabs.ru>
	<20050120161306.GG20639@wohnheim.fh-wedel.de>
	<1106238673.7940.0.camel@sauron.oktetlabs.ru>
	<20050120164153.GM20639@wohnheim.fh-wedel.de>
	<1106240903.7940.12.camel@sauron.oktetlabs.ru>
	<20050120173341.GA24657@wohnheim.fh-wedel.de>
	<1106243853.7940.15.camel@sauron.oktetlabs.ru>
	<20050121124403.GA9931@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501211312570.20298@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501211312570.20298@phoenix.infradead.org>
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

On Fri, 21 January 2005 13:13:14 +0000, Artem B. Bityuckiy wrote:
> 
> I would like create TeX file and put this "JFFS3 checkusm stuff" there. 
> This will be "JFFS3 design issues file". It will be accessible via CVS and 
> people may  edit it, contributing new ideas.

Sounds good.

> More questions which I would like to discuss are:
> 
> * JFFS3 memory consumption

Good idea.

> * JFFS3 & locking

I started a locking document for jffs2.  Below.

It doesn't follow any style.  As I didn't know a decent style for
locking documentation, I made up my own.  Feel free to improve it.

Jörn

-- 
When people work hard for you for a pat on the back, you've got
to give them that pat.
-- Robert Heinlein

Locking hierarchy:

Locks can belong to either an inode or a superblock.  "f" is used to
indicate an inode, "c" to indicate a superblock, as in most of the
code:
	struct jffs2_inode *f
	struct jffs2_sb *c

Each lock in the graph below is requested with all the locks above it
possibly held - as long as their indentation level is less.  So
c->inocache_lock can be requested with c->alloc_sem, f->sem and
c->erase_completion_lock held.  c->erase_free_sem is never requested
with any other locks held.

none
	c->alloc_sem
		f->sem
			c->erase_completion_lock
				c->inocache_lock
	c->erase_free_sem
	c->gc_thread_start



Protected data structures:

f->sem
	everything inside f?

c->alloc_sem
	everything in c but the below?

c->erase_completion_lock
	c->free_list
	c->erasing_list

c->inocache_lock
	c->inocache_list

c->erase_free_sem
	???

c->gc_thread_start
	nothing - just for synchronization
