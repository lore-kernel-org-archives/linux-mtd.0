Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1ComwY-0005Zb-3q
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 13:10:08 -0500
Date: Wed, 12 Jan 2005 19:10:06 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050112181006.GI25638@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
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

On Wed, 12 January 2005 09:15:42 +0000, Artem B. Bityuckiy wrote:
> 
> please, read the paper 
> http://www.semicon.toshiba.co.jp/eng/prd/memory/doc/pdf/nand_applicationguide_e.pdf
> I like this paper.

Your ability to come up with excellent papers is astounding!

> I've just reread it and now I have no doubts that CRCs 
> are required on NAND. :-)
> 
> Shortly: errors are normal phenomena on NAND devices. Errors are mostly 
> handled by NAND ECCs, but
> JFFS[23] MUST take care about failures and handle them properly. There 
> are permanent and occasional
> errors exist. Blocks with permanent errors must be marked bad and it is 
> good to recover data...

Ok, let me distinguish between the different problems:


  Bad blocks
We definitely need to handle those, no doubt.  Problem is not that
some blocks _are_ bad, it's that they _become_ bad.  So, when and how
does this happen?


  Initial bad blocks
Should be simple to handle.  No crucial data was ever written to those
blocks, so we don't have a problem.


  Blocks that fail during use
Quote: "Therefore, blocks should be marked as bad and no longer
accessed if there is either a block erase failure or a page program
failure."

During erase, by definition those blocks don't hold crucial data.  Not
a problem.  Page program is slightly worse, but it only means that we
have to program a different block instead.  Make sure you don't use
the partial programming thing they hinted at and no crucial data is
lost.  Again, harmless.


  Permanent Failure
Those can be noticed during either erase or program, so the above
applies.  Harmless.


  Soft errors
They occur at a rate of 10^-10 or 2^-30 for 1-bit errors.  Those are
corrected by the ECC, so no data is lost.  Assuming two such incidents
are completely independent, 2-bit errors occur at a rate of 10^-20 or
2^-60.  Let's do some math.

Flash sizes today are in the 2^30 bit (128MiB) range.  Erase cycles
are about 1 Million or 2^20, so total bit writes per medium are about
2^50.  That means there is a 2^-10 remaining chance to experience a
2-bit error during the lifetime of the flash.

In other words, one out of 1000 flashes will have a non-recoverable
error sometime during it's life cycle.  Doesn't exactly make me happy,
but it's not horrible either.  In cases where little data is written
to flash or other components (cpu, power regulators) die before the
flash does, this is even less of an issue.

For 3-bit errors, those that are not detected by ECC logic anymore,
the chances are 2^-40 or practically non-existant.

Well, mostly harmless.



What does that mean for this discussion?  On Toshiba's NAND flashes,
according to their claims, jffs2 checksums won't catch any errors that
wouldn't already be caught either by ECC or during write/erase.

Am I wrong?

Jörn

-- 
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
