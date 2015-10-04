Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zimwf-0001qh-Mo
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2015 17:19:34 +0000
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: [PATCH v3 3/7] jffs2: Add missing capability check for listing
 trusted xattrs
Date: Sun,  4 Oct 2015 19:18:50 +0200
Message-Id: <1443979134-7279-4-git-send-email-agruenba@redhat.com>
In-Reply-To: <1443979134-7279-1-git-send-email-agruenba@redhat.com>
References: <1443979134-7279-1-git-send-email-agruenba@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The vfs checks if a task has the appropriate access for get and set
operations, but it cannot do that for the list operation; the file system
must check for that itself.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 fs/jffs2/xattr_trusted.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/jffs2/xattr_trusted.c b/fs/jffs2/xattr_trusted.c
index ceaf9c6..bbd20c1 100644
--- a/fs/jffs2/xattr_trusted.c
+++ b/fs/jffs2/xattr_trusted.c
@@ -39,6 +39,9 @@ static size_t jffs2_trusted_listxattr(struct dentry *dentry, char *list,
 {
 	size_t retlen = XATTR_TRUSTED_PREFIX_LEN + name_len + 1;
 
+	if (!capable(CAP_SYS_ADMIN))
+		return 0;
+
 	if (list && retlen<=list_size) {
 		strcpy(list, XATTR_TRUSTED_PREFIX);
 		strcpy(list + XATTR_TRUSTED_PREFIX_LEN, name);
-- 
2.5.0
