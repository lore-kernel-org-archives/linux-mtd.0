Received: from mail.shareable.org ([81.29.64.88])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IlDCk-0004x2-63
	for linux-mtd@lists.infradead.org; Fri, 26 Oct 2007 01:37:41 +0100
Date: Thu, 25 Oct 2007 23:15:53 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: jffs2: too few erase blocks
Message-ID: <20071025221553.GA29785@mail.shareable.org>
References: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
	<20071025092225.410ca383@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20071025092225.410ca383@weaponx.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org, Duke <ezbonites@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> > Hi All,
> > What's the deal with "too few erase blocks" message?
> > Is one block too few for a jffs2 partition?
> > My block size if 256K and I created a small jffs2 256K partition for
> > read/writing.
> > Is this really too small for jffs2? If so, is there anything I can do for this?
> 
> Yes, it's too small.  JFFS2 requires a certain percentage of blocks in
> the partition to be reserved for it's usage.  At one point, it was 5
> eraseblocks.

Fwiw, 5 blocks worth of free space is no guarantee that it'll be fine.
I have a 1MB JFFS2 partition with 64kB eraseblocks.  That's 320kB in 5
blocks.  But it can return disk full errors when reporting more than
320kB free with 'df' (somewhere between 5 and 6 blocks worth), and it
can also do strange things shortly before it returns disk full errors,
like spending lots of CPU on GC.

-- Jamie
