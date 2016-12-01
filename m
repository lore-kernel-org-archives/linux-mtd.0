Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYnw-00036c-CQ
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 11/24] ubifs: Enforce crypto policy in mmap
Date: Thu,  1 Dec 2016 22:20:58 +0100
Message-Id: <1480627271-10441-12-git-send-email-richard@nod.at>
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
