Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cf1d6-0004Ie-TP
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 14:49:42 -0500
Date: Thu, 16 Dec 2004 20:49:31 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20041216194931.GA10285@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0412161420360.8020@phoenix.infradead.org>
	<JPEALJAFNGDDLOPNDIEEMEGECPAA.joakim.tjernlund@lumentis.se>
	<20041216175331.GA6788@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412161827540.8020@phoenix.infradead.org>
	<20041216191500.GB6788@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041216191500.GB6788@wohnheim.fh-wedel.de>
Cc: Joakim Tjernlund <joakim.tjernlund@lumentis.se>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 16 December 2004 20:15:00 +0100, Jörn Engel wrote:
> 
> PS: Now you've done it.  I'll implement crc24 and crc16 and benchmark
> them against adler32.  Darn you!

Testcase going through 45MB of data in chunks of 4k.  Machine is
PIII-1166 with warm caches.

Doing three runs and discarding the fastest and slowest ones:

crc32:
real    0m0.214s
user    0m0.133s
sys     0m0.076s

adler32:
real    0m0.128s
user    0m0.061s
sys     0m0.066s

crc24:
real    0m0.969s
user    0m0.882s
sys     0m0.073s

crc16:
real    0m0.382s
user    0m0.312s
sys     0m0.061s


Looks like those cold hard numbers beat the crap out of my previous
argument.  So unless someone can seriously optimize below functions,
just pick adler32.


uint32_t crc24(uint32_t crc, const void *_s, size_t len)
{
	const char *s = _s;
	uint32_t ret = crc;
	strlen(s);
	for (; len; len--,s++) {
		ret <<= 8;
		ret += *s;
		ret %= 0xfffffd;
	}
	return ret;
}

uint32_t crc16(uint32_t crc, const void *_s, size_t len)
{
	const uint16_t *s = _s;
	uint32_t ret = crc;
	for (; len>1; len-=2,s++) {
		ret <<= 16;
		ret += *s;
		ret %= 65521;
	}
	return ret;
}


Just in order to be complete, here is a variant of reiserfs' r5 hash.
Noone should seriously use it for error detection, but the results are
nice for comparison:
real    0m0.207s
user    0m0.134s
sys     0m0.067s


Jörn

-- 
"Translations are and will always be problematic. They inflict violence 
upon two languages." (translation from German)
