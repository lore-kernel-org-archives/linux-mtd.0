Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CtOIY-0000kG-Iu
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2005 05:51:52 -0500
Date: Tue, 25 Jan 2005 11:51:40 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050125105140.GC29797@wohnheim.fh-wedel.de>
References: <20050120161306.GG20639@wohnheim.fh-wedel.de>
	<1106238673.7940.0.camel@sauron.oktetlabs.ru>
	<20050120164153.GM20639@wohnheim.fh-wedel.de>
	<1106240903.7940.12.camel@sauron.oktetlabs.ru>
	<20050120173341.GA24657@wohnheim.fh-wedel.de>
	<1106243853.7940.15.camel@sauron.oktetlabs.ru>
	<20050121124403.GA9931@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501211312570.20298@phoenix.infradead.org>
	<20050121134221.GB9931@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501211354110.20298@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501211354110.20298@phoenix.infradead.org>
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

On Fri, 21 January 2005 14:04:31 +0000, Artem B. Bityuckiy wrote:
> > 
> > none
> > 	c->alloc_sem
> > 		f->sem
> RULE: Can not have any f->sem locked if gonna lock f->alloc_sem.

Or c->erase_completion_lock if you want to lock either of the above.
Or c->inocache_lock if you want to lock either of the above.

As a very simple statical deadlock checker, you can draw a graph of
all locks, like I did.  If the graph has cycles, deadlock situations
are possible.

> > 			c->erase_completion_lock
> > 				c->inocache_lock
> > 	c->erase_free_sem
> > 	c->gc_thread_start
> > 
> > 
> > 
> > Protected data structures:
> > 
> > f->sem
> > 	everything inside f?
> Yes. Also if you have f->sem seems you may change f->inocache fields 
> without having c->inocachelock.

That could be a problem.  Will take a while before I can check it.

> > c->alloc_sem
> > 	everything in c but the below?
> No. In essence f->alloc_sem protects flash space. Believe this mutex is 
> misnamed. And tends to lock code, not data.

Since that code writes to flash, it does protect data.  Makes sense,
although one could possibly move the lock down to individual erase
blocks.

> > c->erase_completion_lock
> Misnamed either. David said this is historical. Protects 
> node_ref list.

Ok.

> > 	c->free_list
> > 	c->erasing_list
> > 
> > c->inocache_lock
> > 	c->inocache_list
> Protects inodcache list. Also protects objects in it. Protects ic->state.

Ok.

> > c->erase_free_sem
> > 	???
> David hates this. This is to protect node_refs - they are protected by 
> both c->erase_complition lock and by c->erase_free_sem. Most time you use 
> c->erase_completion lock. But if you need sleep, you use mutex.

Sounds like a good candidate for a patch.

Jörn

-- 
Das Aufregende am Schreiben ist es, eine Ordnung zu schaffen, wo
vorher keine existiert hat.
-- Doris Lessing
