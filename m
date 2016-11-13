Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62EZ-0004vQ-Oo
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 10/29] ubifs: Massage ubifs_listxattr() for encryption context
Date: Sun, 13 Nov 2016 22:20:53 +0100
Message-Id: <1479072072-6844-11-git-send-email-richard@nod.at>
In-Reply-To: <1479072072-6844-1-git-send-email-richard@nod.at>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
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
