Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CrdPC-0004KL-FN
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 09:35:28 -0500
Date: Thu, 20 Jan 2005 15:35:26 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050120143525.GA18170@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
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

On Wed, 19 January 2005 19:58:10 +0000, Artem B. Bityuckiy wrote:
> 
> 1 Flash media errors overview
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Both NOR and NAND flashes may have media errors. All errors may be divided 
> on 2 classes:
> 1. Permanent errors - flash sector become bad.
> 2. Bit flips - data is corrupted in some sector. But sector may still be 
> not bad.
> 
> 1.1 NOR flash
>     ~~~~~~~~~
> NOR is supposed to be very reliable. Any error is considered as critical.
> 
> 1.2 NAND flash
>     ~~~~~~~~~~
> NAND is not so reliable. NAND usually protects each NAND page by ECC 
> codes. It is normal to NAND to have bad blocks.
> 
> 
> 2 Checksum errors and JFFS3 strategy
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The first requirement to JFFS3 is that it must distinguish between 
> checksum errors due to unclean reboots and due to media errors. This is 
> very helpful in lots of situations, see bellow. I do not discuss here how 
> we can achieve it, it doesn't matter now - there are ways exist.
> 
> I consider 2 scenarios:
> 1. User does not care about detecting errors as soon as they appear. For 
> example, user has multimedia data on the filesystem and it is OK if JFFS3 
> report about errors not as soon as possible, may be on the next mount. 
> Will refer this scenario as NOT_PARANOID.

RELAXED may be a better name.  Less likely to misread as PARANOID.

> 2. User care about detecting errors on early stage. For example it makes 
> sense if users cares about device may do something bad if some data is 
> read corrupted (like libc.a is loaded corrupted and this cases some 
> crucial data may be is erased). Will refer this scenario as PARANOID.
> 
> These 2 scenarious assume 2 JFFS3 working modes.
> 
> 2.1 NOR Flash
>     ~~~~~~~~~
> Recall, I assume we have mechanism do detect partially written nodes (due 
> to unclean reboots) *without* checking checksum.
> 
> 2.1.1 NOT_PARANOID
>       ~~~~~~~~~~~~
> Checksums are neither generated nor checked.
> 
> 2.1.2 PARANOID
>       ~~~~~~~~
> Checksums are always generated and checked.
> 
> 2.2 NAND flash
>     ~~~~~~~~~~
> 
> 2.2.1 NOT_PARANOID
>       ~~~~~~~~~~~~
> Checkums are always generated, but checked only if there was ECC error 
> during NAND page read.

I dislike this.  Imo, we should handle NOR and NAND the same way.
There are two strategies, that make some sense:

a) Never generate checksums.
b) Always generate checksums, but never check them.

Strategy b) sounds pretty stupid, but it optimizes the 90% case - read
- and allows the user to remount the filesystem to switch to PARANOID
mode.  So, we could go as you proposed, we could settle for either a)
or b) or we could allow both.  In that case I'd call a) the SLOPPY
case and b) the RELAXED, just to distinguish things.

Which one makes most sense?

> 2.2.2 PARANOID
>       ~~~~~~~~
> Checksums are always generated and always checked.
> 
> 3. Read errors
>    ~~~~~~~~~~~
> If JFFS3 encounter read checksum error, JFFS3 rejects to read the 
> corrupted file end reports -EIO to the caller.

Imo, jffs3 should also set the FS_IS_CORRUPTED flag.  More below.

> 4. Bad blocks
>    ~~~~~~~~~~
> NOR flash is not considered workable if there are bad blocks. So, this is 
> NAND-only section. For NAND errors are assumed by the NAND technology.
> 
> Read errors (either ECC or CRC) do not mean the block become bad. This may 
> be just occasional bit flips which will be repaired by the next erase.
> 
> Bad erase and write status (if we work in write-verify mode) mean block 
> become bad.
> 
> 5. Data recovery
>    ~~~~~~~~~~~~~
> If JFFS3 failed to write data it reads all valid data from this block and 
> writes it to another (good) block. Then block is marked bad.

We shouldn't read the data back.  Make sure it still exists in the
wbuf and use that instead.  After all the block just turned bad, so it
would be better if we don't depend on it.

> 6. Checksum algorithm
>    ~~~~~~~~~~~~~~~~~~
> Pending issue. It is wanted to have something faster then CRC32.
> 
> Appendix
> ~~~~~~~
> 
> JFFS2 uses CRC to detect errors and in any error it just reject node. This 
> is not the best behavior and we may fix this in JFFS3 (if it ever will be 
> created).

Jffs3 flags design draft:
o We create a new node-type for flags.  It just contains the 12 bytes
  header plus a 4-byte flags field.
o If possible, the flags node is the first node for all erase blocks.
  It effectively replaces the erase marker.
o Flags can only be set within the lifetime of a filesystem.

Optional:
o Flags can also be cleared.  For this, the flags node needs an
  additional versions field.

With this in place, we can set a flag when detecting a checksum error
due to flash corruption.  Reading this flag on mount should print out
a big warning.  In PARANOID mode, we could also refuse to mount, after
detecting this flag.
Main point is that as soon as we get the first flash corruption, the
flash cannot be trusted anymore.  People may wish to ignore this,
that's fine.  But others may wish to disable the complete device,
generate a call home, blink some red LEDs on the case or whatever.

Jörn

-- 
Sometimes, asking the right question is already the answer.
-- Unknown
