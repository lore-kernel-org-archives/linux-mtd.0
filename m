Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cw1Ia-00084c-BI
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 11:54:45 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501311804550.17207@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106865326.783.146.camel@baythorne.infradead.org>
	<1106871577.21196.155.camel@tglx.tec.linutronix.de>
	<1106872400.6480.201.camel@localhost.localdomain>
	<1106873065.21196.168.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0501280817330.11160@phoenix.infradead.org>
	<1106903029.21196.216.camel@tglx.tec.linutronix.de>
	<Pine.LNX.4.58.0501280914580.11160@phoenix.infradead.org>
	<Pine.LNX.4.58.0501281855370.11160@phoenix.infradead.org>
	<1107111514.18794.37.camel@sauron.oktetlabs.ru>
	<6934efce05013108463a4d42e4@mail.gmail.com>
	<Pine.LNX.4.58.0501311804550.17207@phoenix.infradead.org>
Content-Type: text/plain
Date: Tue, 01 Feb 2005 17:49:21 +0100
Message-Id: <1107276561.21196.457.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 memory consumption
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-31 at 18:05 +0000, Artem B. Bityuckiy wrote:
> Will try to express what I think.
> 
> If the inode's nodes are scattered over many blocks, this will quite slow;
> 
> But we may do the following optimizations:
> 
> A. Have special GC strategy to put (or try to put) nodes belonging to the 
> same inode to the same blocks. Thus we may keep the number of blocks where 
> the inode's nodes are scattered relatively small.

This might turn out to be a GC nightmare. Every update to a file might
result in shuffling tons of nodes around or at least trying to do so.

Keep it simple.

> 2. ICP... The alternative is using ICP. ICP contains the ICP entries in 
> its body. These entries describe all the nodes of our inode. Thus, for 
> each inode, we may keep in-core only the inode's ICP offset. And when we 
> need to build the inode in the iget() call, we need just to read the 
> corresponding ICP, and that's all.
> 
> The problem here is that ICP contains the physical offsets of nodes. But 
> the GC works and moves nodes brom one block to another, changing their 
> offsets. And we need to often update ICPs - even for static RO files.

Not only GC makes this necessary, every write to a file too. 

> Thoughts?

I'm not sure which of the mechanisms will provide us more horror. My
guess is ICP. The summary method is definitely less performant, but I
think therefor less complicated to handle. So we trade performance for
simplicity, which makes more sense for me than the other way round.

tglx
