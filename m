Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgmTf-0005Fw-Qe
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 11:03:15 -0500
Date: Tue, 21 Dec 2004 17:03:10 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20041221160310.GA8917@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0412161420360.8020@phoenix.infradead.org>
	<JPEALJAFNGDDLOPNDIEEMEGECPAA.joakim.tjernlund@lumentis.se>
	<20041216175331.GA6788@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412211445240.23254@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0412211445240.23254@phoenix.infradead.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
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

On Tue, 21 December 2004 14:45:38 +0000, Artem B. Bityuckiy wrote:
>
> Hmm, is it really correct? CRC is ramainder, but in mod 2 arithmetic. I 
> consulted http://www.cs.waikato.ac.nz/~312/crc.txt
> 
> And if so, your algorithm
> [...]
> doesn't look like something which is called CRC...
> 
> Do I misunderstand something?

Nope, but you cleared my misunderstanding.  A very nice article.
Thanks!

PS: Still, adler32 or a variant is my current favorite.

Jörn

-- 
Premature optimization is the root of all evil.
-- Donald Knuth
