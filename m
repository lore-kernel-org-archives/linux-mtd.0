Date: Sun, 9 Jan 2005 11:39:42 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050108201442.GA11728@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501091138240.19297@phoenix.infradead.org>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<1f9886eb0412221014256b83e6@mail.gmail.com>
	<20041223135231.GB24503@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501060954230.5460@phoenix.infradead.org>
	<20050108201442.GA11728@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Joern,

Joern Engel wrote:
> You win.  So I'll go and recheck adler32 wrt. detecting partially
> written nodes.  There's always the a-priori chance of missing a
> change, so we should try to cut that down as far as possible.  Since
> adler32 has a bit less than 32 bits of non-redundant information, we
> might want to cheat a little:
> 
> static uint32_t adler32_tailcheck(const void *buf, size_t len)
> {
> 	uint32_t end = *(uint32_t*) (buf + len - 4); /* last word */
> 	return adler32(end, buf, len);
> }
> 
> By using the last word of data as initial value, we put extra emphasis
> on it.  For long data (full data nodes), this shouldn't make a
> difference.  On the 12-Byte header, it might make a big one.
Looks like good idea!

We do not yet sure we're going to use adler32 CRC, may be engel32 or 
reverse version. I hope test I've written will clarify this if people run 
it on different platforms. But preliminary results show that 
adler32/adler32r is the winner. Will wait and see.

By the way, I added your name to test Copyright, as you asked :-) If you 
mention some inconsistency/bug there, fill free to change it yourself :-)

> Correct, although I don't care too much.  If you pull the power while
> writing, you'll lose data.  Yes, with some care you lose less data,
> but some extra milliseconds of power would have done the same.
I suppose you are right if we speak about errors due to unclean reboots.

But if we speak about errors due to Flash media corruptions? This is 
typical for NAND if bad blocks appear from time to time. I do not know 
exactly how does this happen. But if we suppose when it happens - just 
several bits on some page(es) become permanently bogus, there is big 
difference if we recover good data from these pages or not. If we do not, 
we loose much more. For example, we may loose direntry of some important 
file (and file will disappear).

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
