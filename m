Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYna-0002zs-2A
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:21:47 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 03/24] ubifs: Define UBIFS crypto context xattr
Date: Thu,  1 Dec 2016 22:20:50 +0100
Message-Id: <1480627271-10441-4-git-send-email-richard@nod.at>
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

Like ext4 UBIFS will store the crypto context in a xattr
attribute.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/ubifs-media.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index e24380cf46ed..d47e9569b3de 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -301,6 +301,13 @@ enum {
 #define UBIFS_MAX_NODE_SZ UBIFS_MAX_INO_NODE_SZ
 
 /*
+ * xattr name of UBIFS encryption context, we don't use a prefix
+ * nor a long name to not waste space on the flash.
+ */
+#define UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT "c"
+
+
+/*
  * On-flash inode flags.
  *
  * UBIFS_COMPR_FL: use compression for this inode
-- 
2.7.3
