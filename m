Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fvvsv-0005qj-KF
	for linux-mtd@lists.infradead.org; Thu, 29 Jun 2006 08:44:50 -0400
Date: Thu, 29 Jun 2006 14:44:33 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alexander Belyakov <abelyako@googlemail.com>
Subject: Re: JFFS2 wbuf non-contiguous write bug
Message-ID: <20060629124433.GA19237@wohnheim.fh-wedel.de>
References: <fe810cf0606290500h54295e34jbb018a5346dceb6a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe810cf0606290500h54295e34jbb018a5346dceb6a@mail.gmail.com>
Cc: Josh Boyer <jwboyer@gmail.com>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 June 2006 16:00:05 +0400, Alexander Belyakov wrote:
> 
> "Non-contiguous write" bug appears in jffs2_flash_writev() function
> (JFFS2 mounted on Sibley). It seems the reason is "wbuf fixup" code
> removed from wbuf.c with this commit
> 
> "[MTD] Merge STMicro NOR_ECC code with Intel Sibley code"
> http://kernel.org/git/?p=linux/kernel/git/dwmw2/mtd-2.6.git;a=commit;h=c8b229de2b05c2b3e8d282ce260935a88ac030ca
> 
> The following lines were removed there
> 
> 		if (((c->wbuf_ofs % c->sector_size) == 0) && !c->wbuf_len) {
> 			c->wbuf_ofs = PAGE_DIV(to);
> 			c->wbuf_len = PAGE_MOD(to);
> 			memset(c->wbuf,0xff,c->wbuf_pagesize);
> 		}
> 
> Getting that code back fixes the problem.

How can that be?  The removed code was:
-	if (jffs2_nor_ecc(c)) {
-		if (((c->wbuf_ofs % c->sector_size) == 0) && !c->wbuf_len) {
-			c->wbuf_ofs = PAGE_DIV(to);
-			c->wbuf_len = PAGE_MOD(to);
-			memset(c->wbuf,0xff,c->wbuf_pagesize);
-		}
-	}

And jffs2_nor_ecc(c) would have been false for Sibley (true for
STMicro, though).  So if we have a bug for Sibley and adding this code
solves the problem _now_, how could it have solved the problem
_before_?

I'm not opposed to adding this code back, but would like to get a
better picture of things first.

> One may notice that there is another "new eraseblock" check left in
> jffs2_flash_writev()
> 
> 	if (SECTOR_ADDR(to) != SECTOR_ADDR(c->wbuf_ofs)) { ...
> 
> But it is not enough since SECTOR_ADDR(to) and
> SECTOR_ADDR(c->wbuf_ofs) could be the same here even in case of moving
> to a new eraseblock.

Hmm.  If that check is supposed to be
	if (we moved to a new eraseblock)
then the actual check is wrong.  What is it supposed to mean, though?

> Am I missing something or "wbuf fixup" code should be indeed restored?

You must be missing something, but I don't know what.  Maybe Josh has
some insight into this problem - he did a thorough review and asked
many probing questions about this particular part of the patch.

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
