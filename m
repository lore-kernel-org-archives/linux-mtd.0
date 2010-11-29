Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PMygw-0004m0-V0
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 08:02:34 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/8] mtd-utils: common.h: Add MAX() macro, fix MIN()
Date: Mon, 29 Nov 2010 00:01:56 -0800
Message-ID: <1291017722-23985-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
References: <1291017722-23985-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add MAX() macro to common.h, to be used in future patches.

Also a style change in comma location on MIN().

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/common.h |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/include/common.h b/include/common.h
index 25abc0c..eb8d5fc 100644
--- a/include/common.h
+++ b/include/common.h
@@ -34,7 +34,10 @@ extern "C" {
 #endif
 
 #ifndef MIN	/* some C lib headers define this for us */
-#define MIN(a ,b) ((a) < (b) ? (a) : (b))
+#define MIN(a, b) ((a) < (b) ? (a) : (b))
+#endif
+#ifndef MAX
+#define MAX(a, b) ((a) > (b) ? (a) : (b))
 #endif
 #define min(a, b) MIN(a, b) /* glue for linux kernel source */
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
-- 
1.7.0.4
