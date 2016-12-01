Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYnw-00035R-Bc
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 05/24] ubifs: Massage ubifs_listxattr() for encryption context
Date: Thu,  1 Dec 2016 22:20:52 +0100
Message-Id: <1480627271-10441-6-git-send-email-richard@nod.at>
In-Reply-To: <1480627271-10441-1-git-send-email-richard@nod.at>
References: <1480627271-10441-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have to make sure that we don't expose our internal
crypto context to userspace.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/xattr.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 95a16028bbdb..77ffc9788f45 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -397,6 +397,20 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 	return err;
 }
 
+static bool xattr_visible(const char *name)
+{
+	/* File encryption related xattrs are for internal use only */
+	if (strcmp(name, UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT) == 0)
+		return false;
+
+	/* Show trusted namespace only for "power" users */
+	if (strncmp(name, XATTR_TRUSTED_PREFIX,
+		    XATTR_TRUSTED_PREFIX_LEN) == 0 && !capable(CAP_SYS_ADMIN))
+		return false;
+
+	return true;
+}
+
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 {
 	union ubifs_key key;
@@ -432,10 +446,7 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 		nm.name = xent->name;
 		nm.len = le16_to_cpu(xent->nlen);
 
-		/* Show trusted namespace only for "power" users */
-		if (strncmp(xent->name, XATTR_TRUSTED_PREFIX,
-			    XATTR_TRUSTED_PREFIX_LEN) ||
-		    capable(CAP_SYS_ADMIN)) {
+		if (xattr_visible(xent->name)) {
 			memcpy(buffer + written, nm.name, nm.len + 1);
 			written += nm.len + 1;
 		}
-- 
2.7.3
