Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cookx-0001FC-My
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 15:06:17 -0500
Date: Wed, 12 Jan 2005 21:06:08 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20050112200608.GC7038@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
	<1105554479.17853.287.camel@tglx.tec.linutronix.de>
	<20050112184059.GL25638@wohnheim.fh-wedel.de>
	<1105557401.17853.293.camel@tglx.tec.linutronix.de>
	<20050112194451.GA7038@wohnheim.fh-wedel.de>
	<1105559601.17853.300.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1105559601.17853.300.camel@tglx.tec.linutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 12 January 2005 20:53:21 +0100, Thomas Gleixner wrote:
> 
> Yes, but then we need the already discussed change in block handling and
> accounting, which allows us to handle blocks which consist of multiple
> subblocks, where one or more of the subblocks can be bad.
> 
> The current code treats blocks with multiple subblocks in a way, that
> when one of the subblocks is or becomes bad, the whole block is treated
> as bad.
> 
> So you mark e.g. 128MB bad, because one 16K sub block is bad. This is
> extra annoying on AG-AND where the bad block rate can be quite high.

Ouch!  Well, combining blocks to groups makes sense in other scenarios
as well.  With huge flashes, the number of blocks can also grow quite
large.  And I wouldn't want to introduce rb_tree structures for the
blocks.

Hard problem, though.

Jörn

-- 
When I am working on a problem I never think about beauty.  I think
only how to solve the problem.  But when I have finished, if the
solution is not beautiful, I know it is wrong.
-- R. Buckminster Fuller
