Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1ChTOF-0001M6-OU
	for linux-mtd@lists.infradead.org; Thu, 23 Dec 2004 08:52:29 -0500
Date: Thu, 23 Dec 2004 14:52:31 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: xemc <xemcnet@gmail.com>
Message-ID: <20041223135231.GB24503@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEEEKJCPAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0412221552240.30689@phoenix.infradead.org>
	<20041222160942.GC9783@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0412221610230.30689@phoenix.infradead.org>
	<20041222172637.GE9783@wohnheim.fh-wedel.de>
	<1f9886eb0412221014256b83e6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f9886eb0412221014256b83e6@mail.gmail.com>
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

On Wed, 22 December 2004 12:14:18 -0600, xemc wrote:
> 
> Please forgive me if this is a naive question, but isn't this data
> also protected by ECC in the first place?  (or is that just for NAND?)

Just for NAND.  NOR is pretty reliable anyway, so we could just go
without a checksum.  Hard drive based filesystems usually do the same
and few people complain.
But as long as it's cheap enough, extra confidence doesn't hurt.

>  How strong is this ECC compared to CRC32 or Adler32?

No idea.

> If the ECC can handle a few bit errors, then wouldn't a simple
> checksum handle the case where the file was completely corrupt or
> partially written?

Correct.  Simple parity might be a nice reference as well.  It is
really bad at catching even-bit errors (2,4,6,...), but it's fast.

Jörn

-- 
"Translations are and will always be problematic. They inflict violence 
upon two languages." (translation from German)
