Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CreDm-0005HP-FM
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 10:27:46 -0500
Date: Thu, 20 Jan 2005 16:27:36 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050120152736.GA20639@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<20050120143525.GA18170@wohnheim.fh-wedel.de>
	<1106233518.2903.15.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1106233518.2903.15.camel@sauron.oktetlabs.ru>
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

On Thu, 20 January 2005 18:05:17 +0300, Artem B. Bityuckiy wrote:
> 
> > > 5. Data recovery
> > >    ~~~~~~~~~~~~~
> > > If JFFS3 failed to write data it reads all valid data from this block and 
> > > writes it to another (good) block. Then block is marked bad.
> > 
> > We shouldn't read the data back.  Make sure it still exists in the
> > wbuf and use that instead.  After all the block just turned bad, so it
> > would be better if we don't depend on it.
> I mean the situation:
> 1. we write to the middle of block to, say, page 10 and have detected
> error.
> 2. We then move pages 1-9 to another, good block. Write our 10th page
> (from buffer) to that good block. Brk bogus block bad.

Sounds reasonable.

> I'm not sure this is reasonale. May be JFFS2's behaviour is better - it
> just skips page 10 and writes data to page 11. Then GC will move data,
> and error will be detected during erase. But my argument it is not very
> reliable. But is more workable if we have few space...

Could also be reasonable.  Someone with deeper NAND knowledge (tglx?)
might know more.

> Another thing is JFFS2 recovery function, I didn't speak about it. Seems
> you dislike that JFFS2 tries to read data from bad bage first instead of
> just writing data from wbuf.

I don't trust the page that caused the write error.  Trusting the
other pages in the same block is fine with me.

> > Jffs3 flags design draft:
> > o We create a new node-type for flags.  It just contains the 12 bytes
> >   header plus a 4-byte flags field.
> Hmm, having distinct node-type for flags souns good. Do you mean that we
> could store there information like GIGs PIGs either? (instead of having
> it in each inode node, this, saving space)?

Not sure.  What are GIGs and PIGs?

> > o If possible, the flags node is the first node for all erase blocks.
> >   It effectively replaces the erase marker.
> Not sure this is good Idea, need thinking... 

You may be right.  Flags could also be part of the summary nodes.  But
then, they should also be independent node, in case we don't have a
summary node.  And in that case, we may as well replace the erase
marker.

Hmm.  More thinking...

> > o Flags can only be set within the lifetime of a filesystem.
> > 
> > Optional:
> > o Flags can also be cleared.  For this, the flags node needs an
> >   additional versions field.
> > 
> > With this in place, we can set a flag when detecting a checksum error
> > due to flash corruption.  Reading this flag on mount should print out
> > a big warning.  In PARANOID mode, we could also refuse to mount, after
> > detecting this flag.
> > Main point is that as soon as we get the first flash corruption, the
> > flash cannot be trusted anymore.  People may wish to ignore this,
> > that's fine.  But others may wish to disable the complete device,
> > generate a call home, blink some red LEDs on the case or whatever.
> How amout to have slightly relaxed requiremants for NAND?

Nope, no way!  If Samsung aims to replace hard drives, sporadic data
corruption is not acceptable.

If flashes were merely floppy disk replacements, maybe.  But that's
not a very sexy goal.

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
