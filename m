Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CyWzz-00071r-Ci
	for linux-mtd@lists.infradead.org; Tue, 08 Feb 2005 10:09:56 -0500
Date: Tue, 8 Feb 2005 16:09:53 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Message-ID: <20050208150953.GA23906@wohnheim.fh-wedel.de>
References: <54CC136E5398384485619BC34B3A0F0B055D0DB0@ma00exh02.atitech.com>
	<20050207195209.GC25504@wohnheim.fh-wedel.de>
	<cu8n22$acu$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cu8n22$acu$1@sea.gmane.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Follow-up to wearing / caching question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 February 2005 22:36:45 +0100, Martin Egholm Nielsen wrote:
>
> >Another way to look at it is an imaginary 1MiB flash.  You can write
> >it 100k times, for a total of 100GiB written to it.  With 600M seconds
> >in your expected 20 years, that gives you ~160 Bytes/s average write
> >speed.  Not very much.
> Then what about the pagesize and corresponding writebuffer - this may 
> have an effect, as well, when talking that slow write rates, right?!

For NOR, you don't need a write buffer.  For NAND you do, but then
again, 1MiB is rather small for NAND.  With 128MiB, you'd already have
a write rate of 20k/s, so the write buffer overhead is just a small
fraction of it.

Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982
