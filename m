Received: from dedekind (helo=localhost)
	by phoenix.infradead.org with local-esmtp (Exim 4.43 #1 (Red Hat
	Linux)) id 1CrLxy-0002cs-8O
	for linux-mtd@lists.infradead.org; Wed, 19 Jan 2005 19:58:17 +0000
Date: Wed, 19 Jan 2005 19:58:10 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: MTD List <linux-mtd@lists.infradead.org>
In-Reply-To: <20050119153233.GD26711@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello guys, just want to summarize. Here is what I think JFFS3 should do  
in case of checksum errors.


1 Flash media errors overview
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

Both NOR and NAND flashes may have media errors. All errors may be divided 
on 2 classes:
1. Permanent errors - flash sector become bad.
2. Bit flips - data is corrupted in some sector. But sector may still be 
not bad.

1.1 NOR flash
    ~~~~~~~~~
NOR is supposed to be very reliable. Any error is considered as critical.

1.2 NAND flash
    ~~~~~~~~~~
NAND is not so reliable. NAND usually protects each NAND page by ECC 
codes. It is normal to NAND to have bad blocks.


2 Checksum errors and JFFS3 strategy
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The first requirement to JFFS3 is that it must distinguish between 
checksum errors due to unclean reboots and due to media errors. This is 
very helpful in lots of situations, see bellow. I do not discuss here how 
we can achieve it, it doesn't matter now - there are ways exist.

I consider 2 scenarios:
1. User does not care about detecting errors as soon as they appear. For 
example, user has multimedia data on the filesystem and it is OK if JFFS3 
report about errors not as soon as possible, may be on the next mount. 
Will refer this scenario as NOT_PARANOID.

2. User care about detecting errors on early stage. For example it makes 
sense if users cares about device may do something bad if some data is 
read corrupted (like libc.a is loaded corrupted and this cases some 
crucial data may be is erased). Will refer this scenario as PARANOID.

These 2 scenarious assume 2 JFFS3 working modes.

2.1 NOR Flash
    ~~~~~~~~~
Recall, I assume we have mechanism do detect partially written nodes (due 
to unclean reboots) *without* checking checksum.

2.1.1 NOT_PARANOID
      ~~~~~~~~~~~~
Checksums are neither generated nor checked.

2.1.2 PARANOID
      ~~~~~~~~
Checksums are always generated and checked.

2.2 NAND flash
    ~~~~~~~~~~

2.2.1 NOT_PARANOID
      ~~~~~~~~~~~~
Checkums are always generated, but checked only if there was ECC error 
during NAND page read.

2.2.2 PARANOID
      ~~~~~~~~
Checksums are always generated and always checked.

3. Read errors
   ~~~~~~~~~~~
If JFFS3 encounter read checksum error, JFFS3 rejects to read the 
corrupted file end reports -EIO to the caller.


4. Bad blocks
   ~~~~~~~~~~
NOR flash is not considered workable if there are bad blocks. So, this is 
NAND-only section. For NAND errors are assumed by the NAND technology.

Read errors (either ECC or CRC) do not mean the block become bad. This may 
be just occasional bit flips which will be repaired by the next erase.

Bad erase and write status (if we work in write-verify mode) mean block 
become bad.

5. Data recovery
   ~~~~~~~~~~~~~
If JFFS3 failed to write data it reads all valid data from this block and 
writes it to another (good) block. Then block is marked bad.

6. Checksum algorithm
   ~~~~~~~~~~~~~~~~~~
Pending issue. It is wanted to have something faster then CRC32.

Appendix
~~~~~~~

JFFS2 uses CRC to detect errors and in any error it just reject node. This 
is not the best behavior and we may fix this in JFFS3 (if it ever will be 
created).

Comments?


--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
