Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch8Bh-0007yE-60
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 10:14:07 -0500
Date: Wed, 22 Dec 2004 16:14:03 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20041222151403.GA8943@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEIEHDCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171119290.8020@phoenix.infradead.org>
	<Pine.LNX.4.58.0412221328430.23254@phoenix.infradead.org>
	<20041222140331.GG31282@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221442510.30556@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0412221442510.30556@phoenix.infradead.org>
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

On Wed, 22 December 2004 14:44:35 +0000, Artem B. Bityuckiy wrote:
> 
> > How about adding adler32 and possibly this algorithm?  Engel32
> > (missing a better name) is basically adler32, but instead of a
> > modula-operation, it mirrors one of the two checksums (last bit
> > becomes first, etc.) and XORs both.
> Adler32 was added. Engel32 too.
> 
> Did yiu investigate theoretically these algorithms? Why engel32 is weaker?

Yup, engel32 should be roughly the same.  Here are the details:

o Both algorithms calculate two checksum.  One is the sum of all input
  characters, the other is the sum of (input character x position),
  where the position is counted backwards.
  From here on, they are called "sum" and "product".

o Either sum or product is a weak checksum.

o The combination of sum and product is a strong checksum.

Differences show up in how sum and product are combined:

o Adler32 splits the 32bit checksum in 16 bits for sum and 16 bits for
  product.  Both are calculated seperately in 32bit variables.  In the
  end, a modulo 65521 operation folds the higher bits of each checksum
  to the lower 16 bits and both parts are concatenated.

o Engel32 mirrors the sum and xors sum and product.

Problems of adler32:
o The product checksum grows faster than the sum checksum.  For some
  input data, the product holds more than 16 bits of relevant
  information, while the sum holds less.  After combining both, only
  16 bits of the product are used, so the result has less than 32 bits
  of relevant information.

Problems of engel32:
o When creating sum and product, high bits can never influence low
  bits, while low bits influence high bits.  Using modulo in adler32
  causes high bits to influence low bits as well.  For engel32, the
  high bits of product never influence low bit again.


In the end, I guess that neither of the two problems matter and
adler32 has the advantage of being well-known and proven.

> Would somebody like to add backward CRCs to the test?

Here is backward engel32.  It runs about 1.5% faster than forward
engel32 in my hash test.  Other backward algorithms should be in the
same order (depending on hardware).

uint32_t engel32r(uint32_t engel, const void *_s, size_t len)
{
	const char *s = _s;
	uint32_t sum=engel, prod=engel;
	for (; len>=4; len-=4, s+=4) {
		sum += s[len-1];
		prod += sum;
		sum += s[len-2];
		prod += sum;
		sum += s[len-3];
		prod += sum;
		sum += s[len-4];
		prod += sum;
	}
	for (; len; len--, s++) {
		sum += s[len];
		prod += sum;
	}
	sum = (sum&0x0000ffff)<<16^ (sum&0xffff0000)>>16;
	sum = (sum&0x00ff00ff)<<8 ^ (sum&0xff00ff00)>>8;
	sum = (sum&0x0f0f0f0f)<<4 ^ (sum&0xf0f0f0f0)>>4;
	sum = (sum&0x33333333)<<2 ^ (sum&0xcccccccc)>>2;
	sum = (sum&0x55555555)<<1 ^ (sum&0xaaaaaaaa)>>1;
	prod ^= sum;
	return prod;
}


> I ran test on i686 (just to see it is compiled and works). Results are:
> 
> [crctst] 16-bit CRC CCITT 32 bytes: ts1 14352216056936, ts2 
> 14352216057276, delta 340
> [crctst] 16-bit CRC CCITT 4096 bytes: ts1 14352237257556, ts2 
> 14352237286332, delta 28776
> [crctst] 16-bit CRC CCITT 65536 bytes: ts1 14352259870036, ts2 
> 14352260333528, delta 463492
> [crctst] crc32 32 bytes: ts1 14352282934664, ts2 14352282934980, delta 316
> [crctst] crc32 4096 bytes: ts1 14352301401184, ts2 14352301429996, delta 
> 28812
> [crctst] crc32 65536 bytes: ts1 14352321296456, ts2 14352321726112, delta 
> 429656
> [crctst] crc32c 32 bytes: ts1 14352341677716, ts2 14352341678048, delta 
> 332
> [crctst] crc32c 4096 bytes: ts1 14352360411764, ts2 14352360436508, delta 
> 24744
> [crctst] crc32c 65536 bytes: ts1 14352380586256, ts2 14352381043780, delta 
> 457524
> [crctst] adler32 32 bytes: ts1 14352401248340, ts2 14352401248540, delta 
> 200
> [crctst] adler32 4096 bytes: ts1 14352420251940, ts2 14352420256744, delta 
> 4804
> [crctst] adler32 65536 bytes: ts1 14352439968500, ts2 14352440043460, 
> delta 74960
> [crctst] engel32 32 bytes: ts1 14352460224760, ts2 14352460224960, delta 
> 200
> [crctst] engel32 4096 bytes: ts1 14352479232376, ts2 14352479240700, delta 
> 8324
> [crctst] engel32 65536 bytes: ts1 14352499089344, ts2 14352499228820, 
> delta 139476

Adler32 beats the hell out of every other algorithm.  Except for the
backwards part, it appears to be a clear winner.

Jörn

-- 
Rules of Optimization:
Rule 1: Don't do it.
Rule 2 (for experts only): Don't do it yet.
-- M.A. Jackson 
