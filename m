Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfirG-0005bS-Lb
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 12:59:12 -0500
Date: Sat, 18 Dec 2004 18:59:09 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Message-ID: <20041218175909.GC4147@wohnheim.fh-wedel.de>
References: <20041218171957.GC2654@wohnheim.fh-wedel.de>
	<BCEFJBPJCGFCNMMMIDBHCENACJAA.Joakim.Tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BCEFJBPJCGFCNMMMIDBHCENACJAA.Joakim.Tjernlund@lumentis.se>
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

On Sat, 18 December 2004 18:51:08 +0100, Joakim Tjernlund wrote:
> 
> BTW, have you tested your crc16 for correctness?
> It doesn't give the same result as mine or Thomas versions. 

Nope.  I completely ignored the remainding byte if len is uneven and
didn't bother much about the usual corner-cases.  Xor with ~0, off by
one, all that.  It's not performance relevant, so that can be done
later.

> uint32_t crc16(uint32_t crc, const void *_s, size_t len)
> {
> 	const uint16_t *s = _s;
> 	uint32_t ret = crc;
> 	for (; len>1; len-=2,s++) {
> 		ret <<= 16;
> 		ret += *s;
> 		ret %= 65521;
> 	}
> 	return ret;
> }

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens
