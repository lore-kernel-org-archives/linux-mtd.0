Date: Fri, 28 Jan 2005 08:45:25 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
In-Reply-To: <1106873065.21196.168.camel@tglx.tec.linutronix.de>
Message-ID: <Pine.LNX.4.58.0501280817330.11160@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501271719470.11160@phoenix.infradead.org>
	<1106857409.21196.58.camel@tglx.tec.linutronix.de>
	<1106865326.783.146.camel@baythorne.infradead.org>
	<1106871577.21196.155.camel@tglx.tec.linutronix.de>
	<1106872400.6480.201.camel@localhost.localdomain>
	<1106873065.21196.168.camel@tglx.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> If it is JFFS3 it can have the default O_NOSYNC, but the option O_SYNC
> still requires to solve the underlaying problem.

Ok guys, seems we have agreed with:
1. Wrtite-back cache is good idea
2. For files opened with O_SYNC and if the file system was mounted with
-o sync option, we have to do write through caching.

But my original proposal assumed we agree with that and was about a bit 
another thing. The question was: do we really want to distinguish between 
pritine nodes and non-pristine nodes.

Recall for those who do not remeber JFFS2 internals: pristine node is that 
node which contains PAGE_SIZE (4K) bytes of data. These nodes may quicly 
satisfy read request - just unpack the node's data to the page provided by 
upper layer. Non-pristine nodes are those nodes which contain fewer then 
PAGE_SIZE bytes of data or they may contain 4K of data, but be partially 
overlapped by newer node with more actual data.

My Idea is that having write-back cache a lot of writes will first go to 
the cache, and we may just always write by 4K fractions. No more 
not-pristine nodes. All nodes are now 4K or multiple of 4K.

Adwantages:
Simpler GC. Now we not need to merge non-pristine nodes. When Garbage 
Collect one block, do not produce dirt in another block (because of 
merging). GC is much faster. We do not need to iget() anymore when we meet 
non-pristine node in GC.

Drawbacks:
Yes, if we are forced to do synchronose IO, we well waste more space. For 
example, user does 1 byte transactions, we write 4K instead every time. 
But is this so bad?

Comments?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
