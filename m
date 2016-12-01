Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYnw-000374-CL
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:16 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 13/24] ubifs: Constify struct inode pointer in
 ubifs_crypt_is_encrypted()
Date: Thu,  1 Dec 2016 22:21:00 +0100
Message-Id: <1480627271-10441-14-git-send-email-richard@nod.at>
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

...and provide a non const variant for fscrypto

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/crypto.c | 2 +-
 fs/ubifs/super.c  | 2 +-
 fs/ubifs/ubifs.h  | 7 ++++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 12a0072bddd3..25bb2062b8a3 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -39,7 +39,7 @@ struct fscrypt_operations ubifs_crypt_operations = {
 	.flags			= FS_CFLG_INPLACE_ENCRYPTION,
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
-	.is_encrypted		= ubifs_crypt_is_encrypted,
+	.is_encrypted		= __ubifs_crypt_is_encrypted,
 	.empty_dir		= ubifs_crypt_empty_dir,
 	.max_namelen		= ubifs_crypt_max_namelen,
 	.key_prefix		= ubifs_key_prefix,
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index e85d5a47aeac..a31222947265 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -2000,7 +2000,7 @@ static struct ubifs_info *alloc_ubifs_info(struct ubi_volume_desc *ubi)
 
 #ifndef CONFIG_UBIFS_FS_ENCRYPTION
 struct fscrypt_operations ubifs_crypt_operations = {
-	.is_encrypted		= ubifs_crypt_is_encrypted,
+	.is_encrypted		= __ubifs_crypt_is_encrypted,
 };
 #endif
 
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 16484570e2a6..8d61b2fc3e82 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1814,13 +1814,18 @@ extern struct fscrypt_operations ubifs_crypt_operations;
 #define fscrypt_fname_usr_to_disk       fscrypt_notsupp_fname_usr_to_disk
 #endif
 
-static inline bool ubifs_crypt_is_encrypted(struct inode *inode)
+static inline bool __ubifs_crypt_is_encrypted(struct inode *inode)
 {
 	struct ubifs_inode *ui = ubifs_inode(inode);
 
 	return ui->flags & UBIFS_CRYPT_FL;
 }
 
+static inline bool ubifs_crypt_is_encrypted(const struct inode *inode)
+{
+	return __ubifs_crypt_is_encrypted((struct inode *)inode);
+}
+
 /* Normal UBIFS messages */
 __printf(2, 3)
 void ubifs_msg(const struct ubifs_info *c, const char *fmt, ...);
-- 
2.7.3
