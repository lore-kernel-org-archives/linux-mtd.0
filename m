Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BphOY-0000H4-3Y
	for linux-mtd@lists.infradead.org; Wed, 28 Jul 2004 01:54:31 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Ben Gamsa <ben@somanetworks.com>
In-Reply-To: <41070C86.4060608@somanetworks.com>
References: <41070C86.4060608@somanetworks.com>
Content-Type: text/plain
Message-Id: <1090993694.20889.174.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Wed, 28 Jul 2004 07:48:14 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 deadlock on alloc_sem in jffs2_reserve_space
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-07-28 at 04:16, Ben Gamsa wrote:
>
> 	f = jffs2_gc_fetch_inode(c, inum, nlink);
> 	if (IS_ERR(f))
> 		return PTR_ERR(f);
> 	if (!f)
> 		return 0;
> 
> 	ret = jffs2_garbage_collect_live(c, jeb, raw, f);
> 
> 	jffs2_gc_release_inode(c, f);
> 
>   release_sem:
> 	up(&c->alloc_sem);
> 
Sure, it has to release the semaphore. It's fixed in current CVS
already.

tglx
