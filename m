Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CoTv0-0003Gx-R7
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2005 16:51:17 -0500
Date: Tue, 11 Jan 2005 22:51:02 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050111215102.GA6289@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
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

On Tue, 11 January 2005 12:29:33 +0000, Artem B. Bityuckiy wrote:
> Ferenc Havasi:
> >If I am right CRCs are not only against the effect of unclean reboots 
> >but also to handle flash errors. On NAND flashes the ECC handles this
> >problem but NOR doesn't have any error detection system. 
> 
> Joern Engel wrote:
> >So either we can make sure this case never happens, or we can't.  It
> >depends on the type of flash, for sure, and it may be pretty hard with
> >some types.  But if it doesn't work at all, the flash is broken,
> >period.
> 
> Hi, that is really interesting, *why* do we need CRCs in JFFS2?
> 
> Do we need CRC *only* to handle unclean reboots? If so, we may possibly 
> handle it another way, just putting some magic word at the end of node. 
> Possibly, no need for CRC at all.
> 
> Joern stands that if Flash got rotten, we *do not need* to do something 
> special trying to recover data. Am I right?

Pretty much.  Detecting the breakage is still a good thing, so we can
report an error.  There are non-embedded devices with flash and users
want to see the problem and replace their flash.  But apart from that,
don't try too hard to fix something that cannot be fixed.

> I still think we need to do recovery in case of NAND, mark the rotten 
> block bad and keep working, so we still need CRC. In case of NOR, we 
> possibly should just report error and do nothing (we can't mark block bad 
> there). Do not know about ECC NOR.
> 
> Comments?

Ok, here is my approach.

Claim: No mtd has problems with lost data due to bad blocks.  This is
a complete non-issue and jffs[23] doesn't care.

"No" means that less than .001% (add or remove some digits, depending
on your needs) of all devices have this problem.  In those cases, the
system just won't work and will be replaced.  Business as usual.

Now, if any particular flash doesn't match this requirement, the mtd
driver is supposed to mirror all blocks.  If either copy rots away,
the data can still be read back from the other block.  After GC, the
block can be marked as bad and everyone lives on happily ever after.

Capacity is half the original, but that's better than losing
/sbin/init now and then, right?  And maybe the flash is cheap enough
that noone cares.

Sane?

> P.S. By the way, we could put CRCs at the end of blocks (*after* data) - 
> in this case CRC well be extremely strong detecting unclean reboots, isn't 
> it?

Interesting idea.  Will make the code slightly messy, but it should be
worth it.

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
