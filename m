Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62Eb-0004v7-Qr
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:46 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 15/29] ubifs: Massage assert in ubifs_xattr_set() wrt. fscrypto
Date: Sun, 13 Nov 2016 22:20:58 +0100
Message-Id: <1479072072-6844-16-git-send-email-richard@nod.at>
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
