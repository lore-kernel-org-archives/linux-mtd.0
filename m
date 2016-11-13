Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62EZ-0004v7-Om
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:41 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 08/29] ubifs: Define UBIFS crypto context xattr
Date: Sun, 13 Nov 2016 22:20:51 +0100
Message-Id: <1479072072-6844-9-git-send-email-richard@nod.at>
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
