Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch926-00017D-Qw
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 11:08:16 -0500
Date: Wed, 22 Dec 2004 17:08:10 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20041222160810.GB9783@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEIEHDCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412171119290.8020@phoenix.infradead.org>
	<Pine.LNX.4.58.0412221328430.23254@phoenix.infradead.org>
	<20041222140331.GG31282@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221442510.30556@phoenix.infradead.org>
	<20041222151403.GA8943@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221522400.30689@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0412221522400.30689@phoenix.infradead.org>
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

On Wed, 22 December 2004 15:25:23 +0000, Artem B. Bityuckiy wrote:
> 
> Jorn, Could you please provide adler32r?

I tried.  Hope this is correct.

#define BASE 65521L		/* largest prime smaller than 65536 */
#define NMAX 5552
/* NMAX is the largest n such that 255n(n+1)/2 + (n+1)(BASE-1) <= 2^32-1 */

#define DO1(buf,i)  {s1 += buf[i]; s2 += s1;}
#define DO2(buf,i)  DO1(buf,i); DO1(buf,i+1);
#define DO4(buf,i)  DO2(buf,i); DO2(buf,i+2);
#define DO8(buf,i)  DO4(buf,i); DO4(buf,i+4);
#define DO16(buf)   DO8(buf,0); DO8(buf,8);

/* ========================================================================= */
uint32_t adler32r(uint32_t adler, const char *buf, size_t len)
{
	unsigned long s1 = adler & 0xffff;
	unsigned long s2 = (adler >> 16) & 0xffff;
	int k;

	if (!buf)
		return 1L;

	buf += len;
	while (len > 0) {
		k = len < NMAX ? len : NMAX;
		len -= k;
		while (k >= 16) {
			buf -= 16;
			DO16(buf);
			k -= 16;
		}
		if (k != 0)
			do {
				s1 += *--buf;
				s2 += s1;
			} while (--k);
		s1 %= BASE;
		s2 %= BASE;
	}
	return (s2 << 16) | s1;
}


Jörn

-- 
Don't patch bad code, rewrite it.
-- Kernigham and Pike, according to Rusty
