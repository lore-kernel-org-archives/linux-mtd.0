Received: from f225.mail.ru ([194.186.55.103])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqr6i-0007EM-Pt
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 15:19:17 +0000
From: Alexander Belyakov <abelyako@mail.ru>
To: David Woodhouse <dwmw2@infradead.org>,
	=?windows-1251?Q?linux-mtd=40lists.infradead.org?=
	<linux-mtd@lists.infradead.org>
Subject: [PATCH][JFFS2] Write buffer offset adjustment for NOR-ECC (Sibley)
	flash
Mime-Version: 1.0
Date: Fri, 17 Oct 2008 19:19:13 +0400
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 8bit
Message-Id: <E1Kqr6f-0005ZX-00.abelyako-mail-ru@f225.mail.ru>
Cc: Alexander Belyakov <abelyako@gmail.com>
Reply-To: Alexander Belyakov <abelyako@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After choosing new c->nextblock, don't leave the wbuf offset field
occasionally pointing at the start of the next physical eraseblock.
This was causing a BUG() on NOR-ECC (Sibley) flash, where we start
writing after the cleanmarker.

Among other this fix should cover write buffer offset adjustment
after flushing the last page of an eraseblock.


Signed-off-by: Alexander Belyakov <abelyako@googlemail.com>

---

diff -uNrp a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
--- a/fs/jffs2/nodemgmt.c	2008-08-20 22:11:37.000000000 +0400
+++ b/fs/jffs2/nodemgmt.c	2008-10-17 12:46:53.000000000 +0400
@@ -261,6 +261,10 @@ static int jffs2_find_nextblock(struct j
 
 	jffs2_sum_reset_collected(c->summary); /* reset collected summary */
 
+	/* adjust write buffer offset, else we get a non contiguous write bug */
+	if (!(c->wbuf_ofs % c->sector_size) && !c->wbuf_len)
+		c->wbuf_ofs = 0xffffffff;
+
 	D1(printk(KERN_DEBUG "jffs2_find_nextblock(): new nextblock = 0x%08x\n", c->nextblock->offset));
 
 	return 0;
diff -uNrp a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
--- a/fs/jffs2/wbuf.c	2008-08-20 22:11:37.000000000 +0400
+++ b/fs/jffs2/wbuf.c	2008-10-17 12:35:45.000000000 +0400
@@ -679,10 +679,7 @@ static int __jffs2_flush_wbuf(struct jff
 
 	memset(c->wbuf,0xff,c->wbuf_pagesize);
 	/* adjust write buffer offset, else we get a non contiguous write bug */
-	if (SECTOR_ADDR(c->wbuf_ofs) == SECTOR_ADDR(c->wbuf_ofs+c->wbuf_pagesize))
-		c->wbuf_ofs += c->wbuf_pagesize;
-	else
-		c->wbuf_ofs = 0xffffffff;
+	c->wbuf_ofs += c->wbuf_pagesize;
 	c->wbuf_len = 0;
 	return 0;
 }
