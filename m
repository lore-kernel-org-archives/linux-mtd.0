Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62EZ-0004vc-Oj
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 14/29] ubifs: Preload crypto context in ->lookup()
Date: Sun, 13 Nov 2016 22:20:57 +0100
Message-Id: <1479072072-6844-15-git-send-email-richard@nod.at>
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

...and mark the dentry as encrypted.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index bd0af4e9ca0b..9976a709b875 100644
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
