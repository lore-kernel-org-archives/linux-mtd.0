Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYnw-00036R-CN
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 10/24] ubifs: Massage assert in ubifs_xattr_set() wrt. fscrypto
Date: Thu,  1 Dec 2016 22:20:57 +0100
Message-Id: <1480627271-10441-11-git-send-email-richard@nod.at>
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

When we're creating a new inode in UBIFS the inode is not
yet exposed and fscrypto calls ubifs_xattr_set() without
holding the inode mutex. This is okay but ubifs_xattr_set()
has to know about this.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/xattr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 77ffc9788f45..da59ea3b50c4 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -289,7 +289,13 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 	union ubifs_key key;
 	int err;
 
-	ubifs_assert(inode_is_locked(host));
+	/*
+	 * Creating an encryption context is done unlocked since we
+	 * operate on a new inode which is not visible to other users
+	 * at this point.
+	 */
+	if (strcmp(name, UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT) != 0)
+		ubifs_assert(inode_is_locked(host));
 
 	if (size > UBIFS_MAX_INO_DATA)
 		return -ERANGE;
-- 
2.7.3
