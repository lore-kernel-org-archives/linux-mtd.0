Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CooQr-00007M-66
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 14:45:32 -0500
Date: Wed, 12 Jan 2005 20:44:51 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20050112194451.GA7038@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
	<1105554479.17853.287.camel@tglx.tec.linutronix.de>
	<20050112184059.GL25638@wohnheim.fh-wedel.de>
	<1105557401.17853.293.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1105557401.17853.293.camel@tglx.tec.linutronix.de>
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

On Wed, 12 January 2005 20:16:41 +0100, Thomas Gleixner wrote:
> On Wed, 2005-01-12 at 19:40 +0100, Jörn Engel wrote:
> > 
> > Wouldn't that also require a DMZ of some size between static and
> > dynamic data?  For example, 4MB static, 1MB unused, rest dynamic?
> 
> No it does not propagate over blocks of blocks. e.g. inside of 0-255,
> 256-511, ... you have the trouble, but not between those regions.

Ah, ok.  So they simply decided to pack the blocks inside those groups
tighter.  Another way to handle it would be to treat those block
groups as jffs2 eraseblocks.  Should be quite similar to NOR blocks
sizes then.

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
