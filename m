Received: from ti-out-0910.google.com ([209.85.142.184])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KuSAn-0007yA-3v
	for linux-mtd@lists.infradead.org; Mon, 27 Oct 2008 13:30:21 +0000
Received: by ti-out-0910.google.com with SMTP id a21so1240704tia.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Oct 2008 06:30:18 -0700 (PDT)
Message-ID: <ea11fea30810270630x2740ceb3m58df4d0093a86fee@mail.gmail.com>
Date: Mon, 27 Oct 2008 19:00:17 +0530
From: "Manish Katiyar" <mkatiyar@gmail.com>
To: dwmw2@infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH} : Fix compilation warnings in fs/jffs2/nodemgmt.c
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Below patch fixes the following compilation warnings :
fs/jffs2/nodemgmt.c: In function 'jffs2_find_nextblock':
fs/jffs2/nodemgmt.c:265: error: 'struct jffs2_sb_info' has no member
named 'wbuf_ofs'
fs/jffs2/nodemgmt.c:265: error: 'struct jffs2_sb_info' has no member
named 'wbuf_len'
fs/jffs2/nodemgmt.c:266: error: 'struct jffs2_sb_info' has no member
named 'wbuf_ofs'
make[2]: *** [fs/jffs2/nodemgmt.o] Error 1


Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
---
 fs/jffs2/nodemgmt.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index 0875b60..21a0529 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -261,9 +261,11 @@ static int jffs2_find_nextblock(struct jffs2_sb_info *c)

 	jffs2_sum_reset_collected(c->summary); /* reset collected summary */

+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	/* adjust write buffer offset, else we get a non contiguous write bug */
 	if (!(c->wbuf_ofs % c->sector_size) && !c->wbuf_len)
 		c->wbuf_ofs = 0xffffffff;
+#endif

 	D1(printk(KERN_DEBUG "jffs2_find_nextblock(): new nextblock =
0x%08x\n", c->nextblock->offset));

-- 
1.5.4.3


Thanks -
Manish
