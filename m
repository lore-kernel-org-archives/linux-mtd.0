Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cfijc-0005Hv-8K
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 12:51:17 -0500
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Jörn Engel" <joern@wohnheim.fh-wedel.de>
Date: Sat, 18 Dec 2004 18:51:08 +0100
Message-ID: <BCEFJBPJCGFCNMMMIDBHCENACJAA.Joakim.Tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20041218171957.GC2654@wohnheim.fh-wedel.de>
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

> On Sat, 18 December 2004 18:10:42 +0100, Joakim Tjernlund wrote:
> > 
> > hmm, what about the kernel version of crc32. I think that one should
> > be classified as 32 bits at a time. Is that the version you use in your tests?
> 
> I use the zlib version on my machine, zlib 1.2.2.  It should have
> about the same performance.  At least that's what I thought when I
> last looked at the code.

I will have a look.

BTW, have you tested your crc16 for correctness?
It doesn't give the same result as mine or Thomas versions. 

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
