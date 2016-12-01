Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYoJ-0003Le-Kf
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:35 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 24/24] ubifs: Raise write version to 5
Date: Thu,  1 Dec 2016 22:21:11 +0100
Message-Id: <1480627271-10441-25-git-send-email-richard@nod.at>
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

Starting with version 5 the following properties change:
 - UBIFS_FLG_DOUBLE_HASH is mandatory
 - UBIFS_FLG_ENCRYPTION is optional but depdens on UBIFS_FLG_DOUBLE_HASH
 - Filesystems with unknown super block flags will be rejected, this
   allows us in future to add new features without raising the UBIFS
   write version.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/sb.c          | 17 +++++++++++++++++
 fs/ubifs/ubifs-media.h |  4 +++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 54cef70ea16f..7f1ead29e727 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -466,6 +466,16 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 		goto failed;
 	}
 
+	if (!c->double_hash && c->fmt_version >= 5) {
+		err = 16;
+		goto failed;
+	}
+
+	if (c->encrypted && c->fmt_version < 5) {
+		err = 17;
+		goto failed;
+	}
+
 	return 0;
 
 failed:
@@ -624,6 +634,13 @@ int ubifs_read_superblock(struct ubifs_info *c)
 	c->double_hash = !!(sup_flags & UBIFS_FLG_DOUBLE_HASH);
 	c->encrypted = !!(sup_flags & UBIFS_FLG_ENCRYPTION);
 
+	if ((sup_flags & ~UBIFS_FLG_MASK) != 0) {
+		ubifs_err(c, "Unknown feature flags found: %#x",
+			  sup_flags & ~UBIFS_FLG_MASK);
+		err = -EINVAL;
+		goto out;
+	}
+
 #ifndef CONFIG_UBIFS_FS_ENCRYPTION
 	if (c->encrypted) {
 		ubifs_err(c, "file system contains encrypted files but UBIFS"
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index bdc7935a5e41..e8c23c9d4f4a 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -46,7 +46,7 @@
  * UBIFS went into mainline kernel with format version 4. The older formats
  * were development formats.
  */
-#define UBIFS_FORMAT_VERSION 4
+#define UBIFS_FORMAT_VERSION 5
 
 /*
  * Read-only compatibility version. If the UBIFS format is changed, older UBIFS
@@ -429,6 +429,8 @@ enum {
 	UBIFS_FLG_ENCRYPTION = 0x10,
 };
 
+#define UBIFS_FLG_MASK (UBIFS_FLG_BIGLPT|UBIFS_FLG_SPACE_FIXUP|UBIFS_FLG_DOUBLE_HASH|UBIFS_FLG_ENCRYPTION)
+
 /**
  * struct ubifs_ch - common header node.
  * @magic: UBIFS node magic number (%UBIFS_NODE_MAGIC)
-- 
2.7.3
