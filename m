Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cfj5I-00066o-UW
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 13:13:42 -0500
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Jörn Engel" <joern@wohnheim.fh-wedel.de>
Date: Sat, 18 Dec 2004 19:13:35 +0100
Message-ID: <BCEFJBPJCGFCNMMMIDBHGENBCJAA.Joakim.Tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041218175909.GC4147@wohnheim.fh-wedel.de>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: JFFS3 & performance
Reply-To: Joakim.Tjernlund@lumentis.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Sat, 18 December 2004 18:51:08 +0100, Joakim Tjernlund wrote:
> >
> > BTW, have you tested your crc16 for correctness?
> > It doesn't give the same result as mine or Thomas versions.
>
> Nope.  I completely ignored the remainding byte if len is uneven and
> didn't bother much about the usual corner-cases.  Xor with ~0, off by
> one, all that.  It's not performance relevant, so that can be done
> later.

Yes, I noticed that but crc16(~0, "abcd", 4) does
not yield the same result as mine.

>
> > uint32_t crc16(uint32_t crc, const void *_s, size_t len)
> > {
> > 	const uint16_t *s = _s;
> > 	uint32_t ret = crc;
> > 	for (; len>1; len-=2,s++) {
> > 		ret <<= 16;
> > 		ret += *s;
> > 		ret %= 65521;
> > 	}
> > 	return ret;
> > }
>
> Jörn
>
> --
> Mundie uses a textbook tactic of manipulation: start with some
> reasonable talk, and lead the audience to an unreasonable conclusion.
> -- Bruce Perens
