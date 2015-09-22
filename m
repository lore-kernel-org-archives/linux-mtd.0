Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeMfQ-0004yO-Pt
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2015 12:27:29 +0000
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 3/7] jffs2: Add missing capability check for listing
 trusted xattrs
Date: Tue, 22 Sep 2015 14:26:48 +0200
Message-Id: <1442924812-9384-4-git-send-email-agruenba@redhat.com>
In-Reply-To: <1442924812-9384-1-git-send-email-agruenba@redhat.com>
References: <1442924812-9384-1-git-send-email-agruenba@redhat.com>
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
2.4.3
