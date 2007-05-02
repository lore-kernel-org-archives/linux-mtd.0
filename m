Subject: Re: [PATCH] [JFFS2] Non-contiguous write bug fix (Sibley)
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0705020753k22193b4eqa8a177aaae10f040@mail.gmail.com>
References: <fe810cf0704170414r59900903rc8ed2e52d22eb833@mail.gmail.com>
	<1176908804.21611.37.camel@shinybook.infradead.org>
	<fe810cf0705020649t730abfb6t6da54e1b0701785c@mail.gmail.com>
	<1178114314.11120.12.camel@pmac.infradead.org>
	<fe810cf0705020753k22193b4eqa8a177aaae10f040@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 02 May 2007 18:10:04 +0100
Message-Id: <1178125804.11120.67.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-05-02 at 18:53 +0400, Alexander Belyakov wrote:
> 'wbuf_ofs' is set to the first page in block quite often in
> __jffs2_flush_wbuf(), but this doesn't always lead to
> jffs2_flash_writev() failure. If 'to' is pointing to the different
> block, condition (SECTOR_ADDR(to) != SECTOR_ADDR(wbuf_ofs)) works fine
> and we don't hit BUG() despite 'wbuf_ofs' points to the first page in
> block.
> 
> Probably we should put additional 'wbuf_ofs' adjustment to the
> __jffs2_flush_wbuf() checking if we're moving to the new erseblock. 

Ah, I understand. So this should fix it?

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index c556e85..91d1d0f 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -637,7 +637,10 @@ static int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad)
 
 	memset(c->wbuf,0xff,c->wbuf_pagesize);
 	/* adjust write buffer offset, else we get a non contiguous write bug */
-	c->wbuf_ofs += c->wbuf_pagesize;
+	if (SECTOR_ADDR(c->wbuf_ofs) == SECTOR_ADDR(c->wbuf_ofs+c->wbuf_pagesize))
+		c->wbuf_ofs += c->wbuf_pagesize;
+	else
+		c->wbuf_ofs = 0xffffffff;
 	c->wbuf_len = 0;
 	return 0;
 }

-- 
dwmw2                       09 F9 11 02 9D 74 E3 5B D8 41 56 C5 63 56 88 C0
