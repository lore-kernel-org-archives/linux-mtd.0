Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CooYW-0000h3-9e
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 14:53:25 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050112194451.GA7038@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
	<1105554479.17853.287.camel@tglx.tec.linutronix.de>
	<20050112184059.GL25638@wohnheim.fh-wedel.de>
	<1105557401.17853.293.camel@tglx.tec.linutronix.de>
	<20050112194451.GA7038@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Wed, 12 Jan 2005 20:53:21 +0100
Message-Id: <1105559601.17853.300.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-12 at 20:44 +0100, Jörn Engel wrote:
> On Wed, 12 January 2005 20:16:41 +0100, Thomas Gleixner wrote:
> > On Wed, 2005-01-12 at 19:40 +0100, Jörn Engel wrote:
> > > 
> > > Wouldn't that also require a DMZ of some size between static and
> > > dynamic data?  For example, 4MB static, 1MB unused, rest dynamic?
> > 
> > No it does not propagate over blocks of blocks. e.g. inside of 0-255,
> > 256-511, ... you have the trouble, but not between those regions.
> 
> Ah, ok.  So they simply decided to pack the blocks inside those groups
> tighter.  Another way to handle it would be to treat those block
> groups as jffs2 eraseblocks.  Should be quite similar to NOR blocks
> sizes then.

Yes, but then we need the already discussed change in block handling and
accounting, which allows us to handle blocks which consist of multiple
subblocks, where one or more of the subblocks can be bad.

The current code treats blocks with multiple subblocks in a way, that
when one of the subblocks is or becomes bad, the whole block is treated
as bad.

So you mark e.g. 128MB bad, because one 16K sub block is bad. This is
extra annoying on AG-AND where the bad block rate can be quite high.

tglx
