Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZH7-0004js-OO
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:50:19 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 18/26] ubifs: Constify struct inode pointer in
 ubifs_crypt_is_encrypted()
Date: Fri, 21 Oct 2016 14:48:33 +0200
Message-Id: <1477054121-10198-19-git-send-email-richard@nod.at>
In-Reply-To: <1477054121-10198-1-git-send-email-richard@nod.at>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
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
 fs/ubifs/ubifs.h  | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 160c31479e0c..d19a097435f0 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -38,7 +38,7 @@ static int ubifs_key_prefix(struct inode *inode, u8 **key)
 struct fscrypt_operations ubifs_crypt_operations = {
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
-	.is_encrypted		= ubifs_crypt_is_encrypted,
+	.is_encrypted		= __ubifs_crypt_is_encrypted,
 	.empty_dir		= ubifs_crypt_empty_dir,
 	.max_namelen		= ubifs_crypt_max_namelen,
 	.key_prefix		= ubifs_key_prefix,
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 6c56a08afcd7..456f22aed35c 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1816,13 +1816,18 @@ extern struct fscrypt_operations ubifs_crypt_operations;
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
