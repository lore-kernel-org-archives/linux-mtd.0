Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Crdsf-0004w3-DL
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 10:05:55 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050120143525.GA18170@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<20050120143525.GA18170@wohnheim.fh-wedel.de>
Content-Type: text/plain
Date: Thu, 20 Jan 2005 18:05:17 +0300
Message-Id: <1106233518.2903.15.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I dislike this.  Imo, we should handle NOR and NAND the same way.
> There are two strategies, that make some sense:
> 
> a) Never generate checksums.
> b) Always generate checksums, but never check them.
> 
> Strategy b) sounds pretty stupid, but it optimizes the 90% case - read
> - and allows the user to remount the filesystem to switch to PARANOID
> mode.  So, we could go as you proposed, we could settle for either a)
> or b) or we could allow both.  In that case I'd call a) the SLOPPY
> case and b) the RELAXED, just to distinguish things.
Fully agree. Thanks for noting.

> 
> Which one makes most sense?
Possybly B is better...

> > 5. Data recovery
> >    ~~~~~~~~~~~~~
> > If JFFS3 failed to write data it reads all valid data from this block and 
> > writes it to another (good) block. Then block is marked bad.
> 
> We shouldn't read the data back.  Make sure it still exists in the
> wbuf and use that instead.  After all the block just turned bad, so it
> would be better if we don't depend on it.
I mean the situation:
1. we write to the middle of block to, say, page 10 and have detected
error.
2. We then move pages 1-9 to another, good block. Write our 10th page
(from buffer) to that good block. Brk bogus block bad.

I'm not sure this is reasonale. May be JFFS2's behaviour is better - it
just skips page 10 and writes data to page 11. Then GC will move data,
and error will be detected during erase. But my argument it is not very
reliable. But is more workable if we have few space...

Another thing is JFFS2 recovery function, I didn't speak about it. Seems
you dislike that JFFS2 tries to read data from bad bage first instead of
just writing data from wbuf.

> 
> > 6. Checksum algorithm
> >    ~~~~~~~~~~~~~~~~~~
> > Pending issue. It is wanted to have something faster then CRC32.
> > 
> > Appendix
> > ~~~~~~~
> > 
> > JFFS2 uses CRC to detect errors and in any error it just reject node. This 
> > is not the best behavior and we may fix this in JFFS3 (if it ever will be 
> > created).
> 
> Jffs3 flags design draft:
> o We create a new node-type for flags.  It just contains the 12 bytes
>   header plus a 4-byte flags field.
Hmm, having distinct node-type for flags souns good. Do you mean that we
could store there information like GIGs PIGs either? (instead of having
it in each inode node, this, saving space)?
> o If possible, the flags node is the first node for all erase blocks.
>   It effectively replaces the erase marker.
Not sure this is good Idea, need thinking... 
> o Flags can only be set within the lifetime of a filesystem.
> 
> Optional:
> o Flags can also be cleared.  For this, the flags node needs an
>   additional versions field.
> 
> With this in place, we can set a flag when detecting a checksum error
> due to flash corruption.  Reading this flag on mount should print out
> a big warning.  In PARANOID mode, we could also refuse to mount, after
> detecting this flag.
> Main point is that as soon as we get the first flash corruption, the
> flash cannot be trusted anymore.  People may wish to ignore this,
> that's fine.  But others may wish to disable the complete device,
> generate a call home, blink some red LEDs on the case or whatever.
How amout to have slightly relaxed requiremants for NAND?
