Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DfLeb-0002gU-S1
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2005 13:44:53 -0400
Date: Mon, 6 Jun 2005 19:44:43 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
Message-ID: <20050606174443.GA24857@wohnheim.fh-wedel.de>
References: <426F719A.2000903@ipi.ac.ru>
	<20050606133406.GD31739@wohnheim.fh-wedel.de>
	<42A4572C.8020107@ipi.ac.ru>
	<20050606141453.GF31739@wohnheim.fh-wedel.de>
	<42A460BB.50800@ipi.ac.ru>
	<20050606162648.GJ31739@wohnheim.fh-wedel.de>
	<42A47E7D.2060302@ipi.ac.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42A47E7D.2060302@ipi.ac.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: misaligned memory access in cmdlinepart.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 6 June 2005 20:49:01 +0400, Timofei V. Bondarenko wrote:
> Jörn Engel wrote:
> >
> >Hmm.  Well, I just don't care enough, let's keep it.
> >
> >Can you test the current patch and see if it works for you?  Once
> >you've confirmed that, I'll commit it.
> 
> Yes. I've tested it on the uclinux-bf533.

Doesn't apply with patch -p1.  Can you respin the patch against mtd
cvs and make sure it does?  If in doubt, read:
http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt

Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982
