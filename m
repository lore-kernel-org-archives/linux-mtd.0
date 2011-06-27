Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbGY0-0003Dh-V2
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 18:28:38 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 06/10] mtd-utils: add common version printing function
Date: Mon, 27 Jun 2011 11:27:23 -0700
Message-ID: <1309199247-19248-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/common.h |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/include/common.h b/include/common.h
index 65ec086..b285bc0 100644
--- a/include/common.h
+++ b/include/common.h
@@ -129,6 +129,12 @@ simple_strtoX(strtoll, long long int)
 simple_strtoX(strtoul, unsigned long int)
 simple_strtoX(strtoull, unsigned long long int)
 
+/* Simple version-printing for utils */
+#define common_print_version() \
+do { \
+	fprintf(stderr, PROGRAM_NAME " " VERSION "\n"); \
+} while (0)
+
 #include "xalloc.h"
 
 #ifdef __cplusplus
-- 
1.7.0.4
