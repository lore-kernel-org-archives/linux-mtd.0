Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOOXA-00018R-OJ
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 06:22:33 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4N6MURi002377
	for <linux-mtd@lists.infradead.org>; Mon, 23 May 2011 09:22:31 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/3] UBI: improve checking in debugging prints
Date: Mon, 23 May 2011 09:26:27 +0300
Message-Id: <1306131989-5391-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When debugging is disabled, define debugging prints as if (0) printk() to make
sure that the compiler still the format string in debugging messages even if
debugging is disabled.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/debug.h |   33 +++++++++++++++++++++++++--------
 1 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 0b0c288..bdd2c73 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -184,14 +184,31 @@ static inline int ubi_dbg_is_erase_failure(void)
 
 #else
 
-#define ubi_assert(expr)                 ({})
-#define dbg_err(fmt, ...)                ({})
-#define dbg_msg(fmt, ...)                ({})
-#define dbg_gen(fmt, ...)                ({})
-#define dbg_eba(fmt, ...)                ({})
-#define dbg_wl(fmt, ...)                 ({})
-#define dbg_io(fmt, ...)                 ({})
-#define dbg_bld(fmt, ...)                ({})
+/* Use "if (0)" to make compiler check arguments even if debugging is off */
+#define ubi_assert(expr)  do {                                               \
+	if (0) {                                                             \
+		printk(KERN_CRIT "UBI assert failed in %s at %u (pid %d)\n", \
+		       __func__, __LINE__, current->pid);                    \
+	}                                                                    \
+} while (0)
+
+#define dbg_err(fmt, ...) do {                                               \
+	if (0)                                                               \
+		ubi_err(fmt, ##__VA_ARGS__);                                 \
+} while (0)
+
+#define dbg_msg(fmt, ...) do {                                               \
+	if (0)                                                               \
+		printk(KERN_DEBUG "UBI DBG (pid %d): %s: " fmt "\n",         \
+		       current->pid, __func__, ##__VA_ARGS__);               \
+} while (0)
+
+#define dbg_gen(fmt, ...)  dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_eba(fmt, ...)  dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_wl(fmt, ...)   dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_io(fmt, ...)   dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_bld(fmt, ...)  dbg_msg(fmt, ##__VA_ARGS__)
+
 #define ubi_dbg_dump_stack()             ({})
 #define ubi_dbg_dump_ec_hdr(ec_hdr)      ({})
 #define ubi_dbg_dump_vid_hdr(vid_hdr)    ({})
-- 
1.7.2.3
