Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cf15Y-0003vb-SS
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 14:15:03 -0500
Date: Thu, 16 Dec 2004 20:15:00 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20041216191500.GB6788@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0412161420360.8020@phoenix.infradead.org>
	<JPEALJAFNGDDLOPNDIEEMEGECPAA.joakim.tjernlund@lumentis.se>
	<20041216175331.GA6788@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412161827540.8020@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0412161827540.8020@phoenix.infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
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

On Thu, 16 December 2004 18:42:02 +0000, Artem B. Bityuckiy wrote:
> 
> And several other aspects:
>  For the nodes common header which is only 8 bytes long it is reasonable 
> to use very very simple CRC.
>  For the node headers (next after common header, see jffs[23].h) we may 
> possibly try to use crc16 since it is also not very long.
>  For direntry node data (name of direntry) which is not longer than 255 
> symbols (at least currently) we may also use crc16 I guess.
>  The inode data is <= PAGE_SIZE (mostly 4K) may be something more strong.
>  Other node's data, like summary or ICP (they not exist yet but I hope are 
> going to appear) may have longer length, but anyway, restricted by JFFS2 
> erasable block size. This may be protected by something more strong...
> 
> Frankly speaking, I'm not expert in the CRC issues. May be somebody may 
> concieder this issue more formal way, using some criterias, etc... May be 
> it is possible to evaluate the probability if CRC "misses" somehow for 
> typical NOR/NAND if we know data leghtes ... ?

Not being an expert either, I can at least leave my half-knowledge
here.  If someone knows things better than I do, please correct me.


Principle of crc:
A crc is nothing but the remainder of an integer division.  That
simple.


Example crc4:
crc4(data) = data%13;

The divisor was picked such that the remainder always fits into 4
bits.  Natural choice is a prime number, and 13 happens to be the
biggest prime that fits into 4 bits.  Non-prime numbers work as well,
but primes generally give you a better feeling.

Since most cpus don't support division of arbitrary-length data, the
division is implemented in a loop, just like my crc24 example:

> > u32 crc24(void *m, size_t len)
> > {
> > 	u32 ret=0;
> > 	char *s=m;
> > 	size_t i;
> > 	for (i=0; i<len; i++) {
> > 		ret <<= 8;
> > 		ret += s[i];
> > 		ret %/ 0xfffffd
> > 	}
> > 	return ret;
> > }

It is trivial to prove that crc4 detects any possible one-bit error.
It doesn't detect all possible two-bit or higher errors, though, so
crc4 should be considered pretty weak.


Example crc32:
Most people have learned many boring details about this algorithm,
esp. about highly optimized variants of it.  In principle, it works
just as above with a 32-bit prime number as divisor instead.  On
32-bit machines, you cannot even shift the remainder by a single bit
without losing precision, so the algorithm goes through lots of pain
just to make it work in software and even more pain to make it
somewhat fast.
Only hardware-designers can come up with something like that.

Like crc4, crc32 will obviously detect every possible 1-bit error.  It
appears as if it also detects all possible 2-bit and 3-bit errors, but
noone could show me a formal prove yet.  People simply rely on the
fact that many people tried for quite some time to find undetected
3-bit error and couldn't find any.  When dealing with ethernet, you
might find some relevant documentation.


Example crc24:
See above for the code.  Remainder fits into 24 bits, so you can shift
by 8 bits on 32-bit machines.  Process a full byte per loop cycle
without any complex code.  Nice.


Example crc16:
Similar, but remainder fits into 16 bits.  As a result, you can
process two bytes per loop cycle, so it should be about twice as fast.


I have no idea about how good either crc24 or crc16 are wrt. detecting
n-bit errors.  But even if they don't detect every single error, crc16
will only miss one out of about 2^16 (65521 is the largest prime)
n-bit errors and crc24 will miss one out of about 2^24 (0xfffffd)
n-bit errors.  Maybe they also catch _all_ 2-bit errors, I just don't
know.


Jörn

PS: Now you've done it.  I'll implement crc24 and crc16 and benchmark
them against adler32.  Darn you!

-- 
Fantasy is more important than knowledge. Knowledge is limited,
while fantasy embraces the whole world.
-- Albert Einstein
