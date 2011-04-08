Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DEE-0001GR-Tj
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:04:08 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd-utils: improve simple_strtoX usage commentary
Date: Fri,  8 Apr 2011 18:07:28 +0300
Message-Id: <1302275249-11962-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/common.h |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/include/common.h b/include/common.h
index 2e5c2a0..0e3526a 100644
--- a/include/common.h
+++ b/include/common.h
@@ -93,6 +93,17 @@ static inline int is_power_of_2(unsigned long long n)
  * simple_strtoX - convert a hex/dec/oct string into a number
  * @snum: buffer to convert
  * @error: set to 1 when buffer isn't fully consumed
+ *
+ * These functions are similar to the standard strtoX() functions, but they are
+ * a little bit easier to use if you want to convert full string of digits into
+ * the binary form. The typical usage:
+ *
+ * int error = 0;
+ * unsigned long num;
+ *
+ * num = simple_strtoul(str, &error);
+ * if (error || !is_valid_number(num))
+ * 	error_happened();
  */
 #define simple_strtoX(func, type) \
 static inline type simple_##func(const char *snum, int *error) \
-- 
1.7.2.3
