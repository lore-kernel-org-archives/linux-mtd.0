Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfiFp-00053T-NC
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 12:20:30 -0500
Date: Sat, 18 Dec 2004 18:19:57 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Message-ID: <20041218171957.GC2654@wohnheim.fh-wedel.de>
References: <20041218161437.GC1083@wohnheim.fh-wedel.de>
	<BCEFJBPJCGFCNMMMIDBHEEMPCJAA.Joakim.Tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BCEFJBPJCGFCNMMMIDBHEEMPCJAA.Joakim.Tjernlund@lumentis.se>
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

On Sat, 18 December 2004 18:10:42 +0100, Joakim Tjernlund wrote:
> 
> hmm, what about the kernel version of crc32. I think that one should
> be classified as 32 bits at a time. Is that the version you use in your tests?

I use the zlib version on my machine, zlib 1.2.2.  It should have
about the same performance.  At least that's what I thought when I
last looked at the code.

Jörn

-- 
He that composes himself is wiser than he that composes a book.
-- B. Franklin
