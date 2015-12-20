Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAUkc-0005nm-OW
 for linux-mtd@lists.infradead.org; Sun, 20 Dec 2015 03:33:39 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <richard@nod.at>, <david@sigma-star.at>, Dongsheng
 Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH] UBIFS: add a comment in key.h for unused parameter
Date: Sun, 20 Dec 2015 11:25:20 +0800
Message-ID: <1450581920-21780-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a comment in key.h to explain why we keep an unused
parameter in key helpers.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/key.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
index 92a8491..dce72c4 100644
--- a/fs/ubifs/key.h
+++ b/fs/ubifs/key.h
@@ -34,6 +34,12 @@
  * node. We use "r5" hash borrowed from reiserfs.
  */
 
+/*
+ * Lot's of the key helpers require a struct ubifs_info *c as the first parameter.
+ * But we are not using it at all currently. That's designed for scalability for
+ * different c->key_format. But right now, there is only one key type, UBIFS_SIMPLE_KEY_FMT.
+ */
+
 #ifndef __UBIFS_KEY_H__
 #define __UBIFS_KEY_H__
 
-- 
1.8.4.2
