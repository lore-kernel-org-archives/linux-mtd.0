Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfFIR-0002Gy-3s
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2004 05:25:18 -0500
Date: Fri, 17 Dec 2004 11:25:14 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Message-ID: <20041217102514.GA10621@wohnheim.fh-wedel.de>
References: <20041216212210.GA12833@wohnheim.fh-wedel.de>
	<BCEFJBPJCGFCNMMMIDBHIEMHCJAA.Joakim.Tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BCEFJBPJCGFCNMMMIDBHIEMHCJAA.Joakim.Tjernlund@lumentis.se>
Cc: Thomas Gleixner <tglx@linutronix.de>,
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

On Thu, 16 December 2004 23:06:41 +0100, Joakim Tjernlund wrote:
> > On Thu, 16 December 2004 22:06:21 +0100, Joakim Tjernlund wrote:
> > 
> > Istr reading something from one of the two authors that basically
> > states the adler32 weakness for short files.  But for long files, the
> > checksum is getting strong enough and much faster.  Too bad that our
> > "files" are short.
> 
> I too rember reading about that. So a new optimzed crc16 is probably the best bet.
> It should do better than crc32 once it is done.

Agreed.

> hmm, I rember that the networking code has some crc/checksum algorithm too.
> Maybe it is possible to use that?

include/linux/jhash.h

Looks rather complicated.  Iirc it was introduced to avoid DoS attacks
against the networking code.  With the old hashing algorithm
(include/linux/hash.h?), it was easy for an attacker to predict into
which hash bucket any given packet would go.  So it could just
generate tons of packets that would all hash to the same bucket.  End
result is that the hash table is pointless and performance is the same
as with a linked list.

Then there's ethernet checksumming, which is crc32.

TCP/IP should have some checksums as well, but I'm not familiar with
those right now.

Jörn

-- 
Schrödinger's cat is <BLINK>not</BLINK> dead.
-- Illiad
