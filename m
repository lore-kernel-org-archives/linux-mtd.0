Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch9W7-000261-8b
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 11:39:16 -0500
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Jörn Engel" <joern@wohnheim.fh-wedel.de>
Date: Wed, 22 Dec 2004 17:39:08 +0100
Message-ID: <JPEALJAFNGDDLOPNDIEEAEKMCPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20041222155624.GA9783@wohnheim.fh-wedel.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Wed, 22 December 2004 16:30:20 +0100, Joakim Tjernlund wrote:
> > 
> > Can you do
> > 1) First run a forward and then a backward version on memory space >= 2*L1 cache
> > 2) Then do two forward runs on the same memory.
> > 
> > Compare the delta between 1) and 2)
> > That should give a clue if it is worth having a backward version.
> 
> In my private not-too-scientific hash-table test, I do a strlen()
> before calling engel32.  The reverse version is 1.5% faster, even
> though the strings are in the 80byte arena.  That's well over noise
> level.

OK, then there might be worth considering a reverse checksum.

> 
> > > Adler32 beats the hell out of every other algorithm.  Except for the
> > > backwards part, it appears to be a clear winner.
> > 
> > Have you look at the assembler Engler32 generates? Every instruction counts
> > in such small loops.
> 
> Not yet.  Might be worth a try, though.  Since it's losing in direct
> comparison, but equal in the hash test, it might be slightly stronger
> than adler32.

This generates a little better code on PPC.
Not tested.

uint32_t engel32r_new(uint32_t engel, const void *_s, size_t len)
{
	const char *s = _s + len;
	uint32_t sum=engel, prod=engel;
	size_t new_len = len >> 2; 
	len &=3;

	for ( ;new_len; --new_len) {
		sum += *--s;
		prod += sum;
		sum += *--s;
		prod += sum;
		sum += *--s;
		prod += sum;
		sum += *--s;
		prod += sum;
	}
	for (; len; len--) {
		sum += *--s;
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
> 
> BTW: I reject the name "Engler32".  Few names are worse than
> "engel32", but that one is. ;)

I am so sorry, I felt something was wrong when I wrote that but I didn't
check, my bad.

 Jocke
