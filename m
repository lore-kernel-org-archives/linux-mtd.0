Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1ChAFx-0002r6-PM
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 12:26:40 -0500
Date: Wed, 22 Dec 2004 18:26:37 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20041222172637.GE9783@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 December 2004 16:17:00 +0000, Artem B. Bityuckiy wrote:
> On Wed, 22 Dec 2004, [iso-8859-1] Jörn Engel wrote:
> > On Wed, 22 December 2004 15:56:23 +0000, Artem B. Bityuckiy wrote:
> > > 
> > > Preliminarily I'm planning:
> > > 1. Use adler32 on headers
> > > 2. Leave crc32 on data
> > 
> > Why keep crc32?
> This is just my IMHO: headers are small and the probability that serious 
> error appear there is lower that the probability of error on data. So it 
> seems we may reduce crc strength for them.
> 
> In case of data - I just not sure if it is correct to use weaker 
> algorithm... 
> If somebody compitent may soundly explain why we may reduce CRC strength 
> there...

Let me try, despite my questionable competence.

adler32 is strong agains 1bit errors:
If any single bit flips, 2^n with 0<=n<8 will be added/substracted to
the "sum" checksum.  After modulo 65521, there will always be a change
in at least one bit of the checksum.

adler32 is relatively strong against 2bit erros:
If any two bits flip, it would only go unnoticed by the "sum" checksum
if they are both at the same position within a byte, but in different
bytes, one bit flipping to 1, the other to 0.
This again would cause n*1 to be added to the "product" checksum and
m*1 to be substracted, with n and m being the positions of both bytes.
After modulo 65521, such an even would go unnoticed only if n-m is a
multiple of 65521.  Unlikely in general and impossible with 4k nodes
of jffs2.

For higher level errors, adler32 should have the usual a-priori
chances of catching them.  Even for very short messages, the chances
are 1/2^16 or better (both checksums have 8 bits or more).  For full
4k block with an average character value of 128, the "sum" checksum
will have 12+7 bits and the "product" checksum 11+12+7, both folded to
16 bits after the modulo.  So full nodes have the expected 1/2^32
a-priori chanced.


Overall, it is not as good as crc32, but pretty close, esp. for long
data.  I would entrust my personal data to it, provided that the
device in general is good enough and the first adler32 checksum
failure (ignoring power-failure during writes) results in a message to
discard the broken flash chips or something similar.

Jörn

-- 
To recognize individual spam features you have to try to get into the
mind of the spammer, and frankly I want to spend as little time inside
the minds of spammers as possible.
-- Paul Graham
