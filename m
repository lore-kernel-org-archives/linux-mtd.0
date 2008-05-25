Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K0JCQ-0004qG-7y
	for linux-mtd@lists.infradead.org; Sun, 25 May 2008 16:35:59 +0000
Date: Sun, 25 May 2008 17:35:56 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080525163555.GA7112@shareable.org>
References: <20080524175647.GA7366@logfs.org>
	<346401.5675.qm@web36705.mail.mud.yahoo.com>
	<20080525072501.GA13140@logfs.org>
	<20080525133029.GA3599@shareable.org>
	<20080525162426.GA14741@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080525162426.GA14741@logfs.org>
Cc: linux-mtd@lists.infradead.org, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> > That seems like it would cause uneven wear-levelling in some
> > situations.  Specifically, each time you need to erase a block which
> > has not been completely written, because you need to write a
> > contiguous record larger than the remaining space.
> > 
> > I don't know it was a physical requirement of some chips, thanks for
> > clarifying.
> 
> The "progressive" limitation only concerns writes _within_ eraseblocks.
> It has no impact on wear leveling.

I understood that.

I mean that progressive writing may cause more wear towards the
beginning of _each_ eraseblock, because you'll write more often at the
start of each eraseblock than the end.  That's if wear is at all a
function of writes, and not solely erase operations.

There's another curious thought: do individual flash bit cells wear
out more quickly when written to "0" or left at "1"?  I doubt it, but
if it did make a difference, it would make a case for xoring data with
predictable pseudo-random bits.

-- Jamie
