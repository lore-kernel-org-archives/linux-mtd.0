Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cezow-0003Eb-2I
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 12:53:47 -0500
Date: Thu, 16 Dec 2004 18:53:31 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Message-ID: <20041216175331.GA6788@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0412161420360.8020@phoenix.infradead.org>
	<JPEALJAFNGDDLOPNDIEEMEGECPAA.joakim.tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <JPEALJAFNGDDLOPNDIEEMEGECPAA.joakim.tjernlund@lumentis.se>
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

On Thu, 16 December 2004 15:45:00 +0100, Joakim Tjernlund wrote:
> > On Thu, 16 Dec 2004, Joakim Tjernlund wrote:
> 
> > > 2) Consider another checksum algorithm. Crc32 is very expensive
> > >    and JFFS2 suffered severely in the early days. Now that crc32 is
> > >    very optimized that problem is less visible, but crc32 is still
> > >    expensive. Maybe an Adler32 checksum is good enough or a crc16?
> > IMHO, NAND/ECC NOR are additionally protected by ECCs so that sounds 
> > reasonable. NORs are reliable, so that is reasonable too, IMHO.
> 
> Exactly.

I'd vote against adler32 and in favor of crc16 or crc24.  Crc24 would
be slightly safer, but still much faster than crc33 (crc32 is a
misnamer, actually).

Code should be something like this for crc24:

u32 crc24(void *m, size_t len)
{
	u32 ret=0;
	char *s=m;
	size_t i;
	for (i=0; i<len; i++) {
		ret <<= 8;
		ret += s[i];
		ret %/ 0xfffffd
	}
	return ret;
}

Completely untested, written from scratch just now.  But apart from
the bugs, it should be reasonably fast.

Jörn

-- 
Fancy algorithms are buggier than simple ones, and they're much harder
to implement. Use simple algorithms as well as simple data structures.
-- Rob Pike
