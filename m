Received: from host29.root-name-server.net ([67.19.46.165])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FlYcS-0002W8-BQ
	for linux-mtd@lists.infradead.org; Wed, 31 May 2006 17:52:50 -0400
Received: from 66.239.3.2.ptr.us.xo.net ([66.239.3.2] helo=[10.100.10.124])
	by host29.root-name-server.net with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.52) id 1FlYbq-00068W-GG
	for linux-mtd@lists.infradead.org; Wed, 31 May 2006 17:52:10 -0400
Message-ID: <447E0FA4.7010201@realmsys.com>
Date: Wed, 31 May 2006 15:50:28 -0600
From: Kevin Vigor <kevin@realmsys.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [PATCH] avoid unnnecessary mtd read when read can be satisfied by
 write buffer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following small patch modifies wbuf.c::jffs2_flash_read to avoid a 
call to the mtd read layer in the case where all data returned by the 
read would be replaced by data from the write buffer anyway. This 
condition occurs relatively infrequently, but the cost of the test is 
low and the benefit of avoiding the mtd read is high.

Signed-off-by: Kevin Vigor <kevin@realmsys.com>


diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index a7f153f..01ef266 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -907,6 +907,20 @@ int jffs2_flash_read(struct jffs2_sb_inf

    /* Read flash */
    down_read(&c->wbuf_sem);
+
+    /* Check if the read can be completely satisfied from the write buffer;
+     * if so, we can avoid the mtd call entirely.
+     */
+    if (c->wbuf_pagesize &&
+        (SECTOR_ADDR(ofs) == SECTOR_ADDR(c->wbuf_ofs)) &&
+        (ofs >= c->wbuf_ofs) &&
+        (ofs + len) <= (c->wbuf_ofs + c->wbuf_len)) {
+        memcpy(buf, c->wbuf + (ofs - c->wbuf_ofs), len);
+        *retlen = len;
+        ret = 0;
+        goto exit;
+    }
+
    ret = c->mtd->read(c->mtd, ofs, len, retlen, buf);

    if ( (ret == -EBADMSG || ret == -EUCLEAN) && (*retlen == len) ) {
