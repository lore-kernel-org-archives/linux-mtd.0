Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cf2W3-00056b-AP
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 15:46:28 -0500
Date: Thu, 16 Dec 2004 21:46:26 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Message-ID: <20041216204626.GB10285@wohnheim.fh-wedel.de>
References: <20041216194931.GA10285@wohnheim.fh-wedel.de>
	<BCEFJBPJCGFCNMMMIDBHKEMDCJAA.Joakim.Tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BCEFJBPJCGFCNMMMIDBHKEMDCJAA.Joakim.Tjernlund@lumentis.se>
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

On Thu, 16 December 2004 20:58:55 +0100, Joakim Tjernlund wrote:
> > crc24:
> > real    0m0.969s
> > user    0m0.882s
> > sys     0m0.073s
> >
> >
> > Looks like those cold hard numbers beat the crap out of my previous
> > argument.  So unless someone can seriously optimize below functions,
> > just pick adler32.
> 
> A table driven crc24/crc16 is faster, I think.

Sure.  I'm just too lazy to create one.  (hint, hint)

> > uint32_t crc24(uint32_t crc, const void *_s, size_t len)
> > {
> > 	const char *s = _s;
> > 	uint32_t ret = crc;
> > 	strlen(s);
> 
> Why strlen()?

Leftover from my quick'n'dirty hacking.  Numbers without the strlen:
real    0m0.952s
user    0m0.878s
sys     0m0.068s

Not a big difference.

> 
> > 	for (; len; len--,s++) {
> > 		ret <<= 8;
> > 		ret += *s;
> > 		ret %= 0xfffffd;
> > 	}
> > 	return ret;
> > }
> 
> This is probably faster(on PPC).
> Depens on gcc version as well.
>
> uint32_t crc24(uint32_t crc, const void *_s, size_t len)
> {
> 	const char *s = _s-1;
> 	uint32_t ret = crc;
> 	if (len)
> 		do {
> 			ret <<= 8;
> 			ret += *++s;
> 			ret %= 0xfffffd;
> 		} while (--len);
> 	return ret;
> }

Not in i386, though.  So unless the tables really make a difference,
just don't bother.
real    0m0.954s
user    0m0.880s
sys     0m0.064s

Jörn

-- 
People will accept your ideas much more readily if you tell them
that Benjamin Franklin said it first.
-- unknown
