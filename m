Subject: [2.6.25 PATCH] JFFS2 Fix of panics caused by wrong condition for
	hole frag creation in write_begin
From: David Woodhouse <dwmw2@infradead.org>
To: torvalds@infradead.org
Content-Type: text/plain
Date: Mon, 14 Apr 2008 20:40:02 +0100
Message-Id: <1208202002.3005.35.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, vailiy.leonenko@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alexey Korolev <akorolev@infradead.org>

This fixes a regression introduced in commit
205c109a7a96d9a3d8ffe64c4068b70811fef5e8 when switching to
write_begin/write_end operations in JFFS2. The page offset is
miscalculated, leading to corruption of the fragment lists and
subsequently to memory corruption and panics.

Signed-off-by: Alexey Korolev <akorolev@infradead.org>
Signed-off-by: Vasiliy Leonenko <vasiliy.leonenko@mail.ru>
Signed-off-by: David Woodhouse <dwmw2@infradead.org>

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index f9c5dd6..dcc2734 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -129,7 +129,7 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 	struct inode *inode = mapping->host;
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
 	pgoff_t index = pos >> PAGE_CACHE_SHIFT;
-	uint32_t pageofs = pos & (PAGE_CACHE_SIZE - 1);
+	uint32_t pageofs = index << PAGE_CACHE_SHIFT;
 	int ret = 0;
 
 	pg = __grab_cache_page(mapping, index);

-- 
dwmw2
