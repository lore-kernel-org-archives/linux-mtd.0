Received: from mailrelay002.isp.belgacom.be ([195.238.6.175])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xe5Dq-000715-UF
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 16:45:20 +0000
From: Fabian Frederick <fabf@skynet.be>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1 linux-next] fs/jffs2/nodelist.h: remove unnecessary
 __constant_ prefix
Date: Tue, 14 Oct 2014 18:44:45 +0200
Message-Id: <1413305085-7318-1-git-send-email-fabf@skynet.be>
Cc: Fabian Frederick <fabf@skynet.be>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

See commit fbdb8138cf0c
("checkpatch: warn on uses of __constant_<foo> functions")

Cc: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/jffs2/nodelist.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index fa35ff7..9f0d547 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -48,8 +48,8 @@
 #define cpu_to_je32(x) ((jint32_t){cpu_to_be32(x)})
 #define cpu_to_jemode(x) ((jmode_t){cpu_to_be32(os_to_jffs2_mode(x))})
 
-#define constant_cpu_to_je16(x) ((jint16_t){__constant_cpu_to_be16(x)})
-#define constant_cpu_to_je32(x) ((jint32_t){__constant_cpu_to_be32(x)})
+#define constant_cpu_to_je16(x) ((jint16_t){cpu_to_be16(x)})
+#define constant_cpu_to_je32(x) ((jint32_t){cpu_to_be32(x)})
 
 #define je16_to_cpu(x) (be16_to_cpu(x.v16))
 #define je32_to_cpu(x) (be32_to_cpu(x.v32))
@@ -59,8 +59,8 @@
 #define cpu_to_je32(x) ((jint32_t){cpu_to_le32(x)})
 #define cpu_to_jemode(x) ((jmode_t){cpu_to_le32(os_to_jffs2_mode(x))})
 
-#define constant_cpu_to_je16(x) ((jint16_t){__constant_cpu_to_le16(x)})
-#define constant_cpu_to_je32(x) ((jint32_t){__constant_cpu_to_le32(x)})
+#define constant_cpu_to_je16(x) ((jint16_t){cpu_to_le16(x)})
+#define constant_cpu_to_je32(x) ((jint32_t){cpu_to_le32(x)})
 
 #define je16_to_cpu(x) (le16_to_cpu(x.v16))
 #define je32_to_cpu(x) (le32_to_cpu(x.v32))
-- 
1.9.3
