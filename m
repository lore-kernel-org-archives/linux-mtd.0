Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cp7bA-0006OK-Jc
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 11:13:25 -0500
Date: Thu, 13 Jan 2005 17:13:03 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050113161302.GD18864@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131435510.17331@phoenix.infradead.org>
	<Pine.LNX.4.58.0501131503160.17331@phoenix.infradead.org>
	<20050113151724.GB18864@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501131521470.17331@phoenix.infradead.org>
	<20050113154037.GC18864@wohnheim.fh-wedel.de>
	<1105631350.26551.204.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1105631350.26551.204.camel@hades.cambridge.redhat.com>
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

On Thu, 13 January 2005 15:49:09 +0000, David Woodhouse wrote:
> On Thu, 2005-01-13 at 16:40 +0100, Jörn Engel wrote:
> > 
> > 2) Last node per erase block is a special endmarker node, similar to
> >    cleanmarkers.
> > 
> > 3) During unmount, an endmarker is written to the end of all
> >    partially-filled erase blocks.
> 
> This ties in quite nicely with the checkpointing where such a per-block
> 'endmarker' would contain a summary of what the mount code would glean
> by reading through that eraseblock.

Sounds like "design makes sense, please send patches". :)

Would this also allow us to use adler32/adler32r as checksum
algorithm?

Jörn

-- 
Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface. 
-- Doug MacIlroy
