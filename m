Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CnMzB-0004Rb-9Y
	for linux-mtd@lists.infradead.org; Sat, 08 Jan 2005 15:14:59 -0500
Date: Sat, 8 Jan 2005 21:14:42 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050108201442.GA11728@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<1f9886eb0412221014256b83e6@mail.gmail.com>
	<20041223135231.GB24503@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501060954230.5460@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501060954230.5460@phoenix.infradead.org>
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

On Thu, 6 January 2005 10:08:16 +0000, Artem B. Bityuckiy wrote:
> On Thu, 23 Dec 2004, [iso-8859-1] Jörn Engel wrote:
>
> > NOR is pretty reliable anyway, so we could just go
> > without a checksum.
> 
> Can not agree with you. Checksums are requred even for very reliable NOR 
> flashes to be able to detect broken nodes which can appear after unclean 
> reboots.
> My understanding is that this is the most important thing why CRCs are 
> needed. The media corruption is of lesser priority. From this perspective 
> we may easilly use any weaker (then CRC32) checksum, but this checksum 
> must be good in detecting partially written nodes.

You win.  So I'll go and recheck adler32 wrt. detecting partially
written nodes.  There's always the a-priori chance of missing a
change, so we should try to cut that down as far as possible.  Since
adler32 has a bit less than 32 bits of non-redundant information, we
might want to cheat a little:

static uint32_t adler32_tailcheck(const void *buf, size_t len)
{
	uint32_t end = *(uint32_t*) (buf + len - 4); /* last word */
	return adler32(end, buf, len);
}

By using the last word of data as initial value, we put extra emphasis
on it.  For long data (full data nodes), this shouldn't make a
difference.  On the 12-Byte header, it might make a big one.

> > Correct.  Simple parity might be a nice reference as well.  It is
> > really bad at catching even-bit errors (2,4,6,...), but it's fast.
> 
> And please, bear in mind that if we encounter ECC error, this means error 
> somwhere in the page. But this page may contain several JFFS3 nodes and we 
> may recover some of them. So, having per-node CRC is good idea even if 
> there is ECC (ECC is per-page).
> For example, the board may have been rebooted uncleanly during writing ECC 
> (the data was already written, ECC is written after data). In this case we 
> may have correct data but just wrong ECC. Having CRCs, we might recover 
> all JFFS3 nodes.

Correct, although I don't care too much.  If you pull the power while
writing, you'll lose data.  Yes, with some care you lose less data,
but some extra milliseconds of power would have done the same.

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
