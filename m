Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZGk-0004X6-Rw
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:49:56 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 11/26] ubifs: Preload crypto context in ->lookup()
Date: Fri, 21 Oct 2016 14:48:26 +0200
Message-Id: <1477054121-10198-12-git-send-email-richard@nod.at>
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

...and mark the dentry as encrypted.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index a77edc5ca5c9..7ee32768ba19 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -218,6 +218,21 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 
 	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
 
+	if (ubifs_crypt_is_encrypted(dir)) {
+		err = fscrypt_get_encryption_info(dir);
+
+		/*
+		 * DCACHE_ENCRYPTED_WITH_KEY is set if the dentry is
+		 * created while the directory was encrypted and we
+		 * have access to the key.
+		 */
+		if (fscrypt_has_encryption_key(dir))
+			fscrypt_set_encrypted_dentry(dentry);
+		fscrypt_set_d_op(dentry);
+		if (err && err != -ENOKEY)
+			return ERR_PTR(err);
+	}
+
 	if (dentry->d_name.len > UBIFS_MAX_NLEN)
 		return ERR_PTR(-ENAMETOOLONG);
 
-- 
2.7.3
