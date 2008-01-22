Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHKmu-0006fA-69
	for linux-mtd@lists.infradead.org; Tue, 22 Jan 2008 15:11:50 +0000
Date: Tue, 22 Jan 2008 16:05:15 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080122150514.GD18884@lazybastard.org>
References: <4790D11E.6060201@parrot.com>
	<20080118115531.2deef9fb@zod.rchland.ibm.com>
	<20080118181744.GA15039@lazybastard.org>
	<4794C107.7070600@parrot.com>
	<20080121212555.GA14472@lazybastard.org>
	<20080121161612.3ca2f093@zod.rchland.ibm.com>
	<20080121222952.GC14472@lazybastard.org> <4795AFE3.506@parrot.com>
	<20080122120300.GA18884@lazybastard.org>
	<Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 January 2008 14:24:56 +0100, Ricard Wanderlof wrote:
> >On Tue, 22 Jan 2008, Jörn Engel wrote:
> >
> >Used to be there and was removed.  mtd->erase() does the same as
> >mtd->block_isbad().
> 
> How do you mean? mtd->erase() will not erase a bad block, that is true.

Exactly.  The only use logfs has for block_isbad() is to skip bad blocks
in the beginning when looking for the superblock.

> However, while it seems that mtd->erase() can mark a block bad if it 
> fails, the fact that a block is eraseble without errors does not imply 
> that it is good. I've seen NAND flash blocks which have way passed their 
> specified number of max write/erase cycles still be successfully erased 
> and subsequently written without errors, but the data retention was lousy 
> (blocks started to show bit flips after a few thousand reads).

I think we are being silly[1].  The question is not whether logfs
handles bad block (it does), but which particular failure case it
doesn't handle well enough.

- Easy: blocks are initially marked bad, erase returns an error.
  Mklogfs erases the complete device once, any bad blocks get stored in
  the bad segment table.  Segments can span multiple eraseblocks, one
  bad block will spoil the complete segment.

- Impossible: data rots without early warning.
  If the device is that bad, you can either have a RAID or replace the
  device.  Nothing the filesystem could or should do about it.

- Moderate: one block continuously spews -EUCLEAN, then becomes
  terminally bad.
  If those are just random bitflips, garbage collection will move the
  data sooner or later.  Logfs does not force GC to happen soon when
  encountering -EUCLEAN, which it should.  Are correctable errors an
  indication of block going bad in the near future?  If yes, I should do
  something about it.

The list probably goes on and on.  And I am sure that I would miss at
least half the interesting cases if I had to create it on my own.  But
if Matthieu or you or anyone else is willing to compose an extensive
list of such failure cases, I will walk through it and try to handle
them one by one.


[1] Silly in the way politicians are talking about freedom and security.
Everyone agrees that both are valuable goals and any policy can be
justified in the name of one or the other.  Ensures heated talkshow
discussions, but otherwise useless.

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
