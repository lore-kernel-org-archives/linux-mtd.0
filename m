Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62Ew-00054a-62
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:23:03 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 16/29] ubifs: Enforce crypto policy in mmap
Date: Sun, 13 Nov 2016 22:20:59 +0100
Message-Id: <1479072072-6844-17-git-send-email-richard@nod.at>
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

We need this extra check in mmap because a process could
gain an already opened fd.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/file.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index a9c5cc6c0bc5..60e789a9cac8 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1594,6 +1594,15 @@ static const struct vm_operations_struct ubifs_file_vm_ops = {
 static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	int err;
+	struct inode *inode = file->f_mapping->host;
+
+	if (ubifs_crypt_is_encrypted(inode)) {
+		err = fscrypt_get_encryption_info(inode);
+		if (err)
+			return -EACCES;
+		if (!fscrypt_has_encryption_key(inode))
+			return -ENOKEY;
+	}
 
 	err = generic_file_mmap(file, vma);
 	if (err)
-- 
2.7.3
