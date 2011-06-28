Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbLk1-00084M-Vv
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 00:01:22 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 06/10] mtd-utils: add common version printing
 function
Date: Mon, 27 Jun 2011 17:00:29 -0700
Message-ID: <1309219229-5604-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309219229-5604-1-git-send-email-computersforpeace@gmail.com>
References: <1309219229-5604-1-git-send-email-computersforpeace@gmail.com>
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
index 65ec086..88b67e5 100644
--- a/include/common.h
+++ b/include/common.h
@@ -129,6 +129,12 @@ simple_strtoX(strtoll, long long int)
 simple_strtoX(strtoul, unsigned long int)
 simple_strtoX(strtoull, unsigned long long int)
 
+/* Simple version-printing for utils */
+#define common_print_version() \
+do { \
+	printf("%s %s\n", PROGRAM_NAME, VERSION); \
+} while (0)
+
 #include "xalloc.h"
 
 #ifdef __cplusplus
-- 
1.7.0.4
