Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch75V-0007Pw-8B
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 09:03:38 -0500
Date: Wed, 22 Dec 2004 15:03:31 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20041222140331.GG31282@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEIEHDCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171119290.8020@phoenix.infradead.org>
	<Pine.LNX.4.58.0412221328430.23254@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0412221328430.23254@phoenix.infradead.org>
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

On Wed, 22 December 2004 13:36:47 +0000, Artem B. Bityuckiy wrote:
> 
> I decided to write a test to experimentally check the CRCs speed.

Looks good.  Thanks.

> For now I have added only CRCs which are in linux/lib. They do forward CRC 
> check of course.

How about adding adler32 and possibly this algorithm?  Engel32
(missing a better name) is basically adler32, but instead of a
modula-operation, it mirrors one of the two checksums (last bit
becomes first, etc.) and XORs both.

Doesn't have any measurable effect on i386.  Leaving out any of the
five mirror rounds makes the algorithm lightly worse than adler32 in
my hash-table test.  Maybe on some cpu either the modulo or the
mirroring is much slower.

uint32_t engel32(uint32_t engel, const void *_s, size_t len)
{
	const char *s = _s;
	uint32_t sum=engel, prod=engel;
	for (; len>=4; len-=4, s+=4) {
		sum += s[0];
		prod += sum;
		sum += s[1];
		prod += sum;
		sum += s[2];
		prod += sum;
		sum += s[3];
		prod += sum;
	}
	for (; len; len--, s++) {
		sum += *s;
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

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
