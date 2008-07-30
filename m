Received: from smtp122.sbc.mail.sp1.yahoo.com ([69.147.64.95])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KO4Be-0006RS-QU
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 05:25:28 +0000
Date: Tue, 29 Jul 2008 22:28:12 -0700
From: David Brownell <david-b@pacbell.net>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	akpm@linux-foundation.org
Subject: [PATCH 2.6.26-git] MTD_DEBUG always does compile-time typechecks
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20080730052812.0D64C360E2D@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
Cc: cooloney@kernel.org, linux-kernel@vger.kernel.org,
	michael.hennerich@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Brownell <dbrownell@users.sourceforge.net>

The current style for debug messages is to ensure they're always
parsed by the compiler and then subjected to dead code removal.
That way builds won't break only when debug options get enabled,
which is common when they are stripped out early by CPP.

This patch makes CONFIG_MTD_DEBUG adopt that convention.

Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
---
 include/linux/mtd/mtd.h |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--- a/include/linux/mtd/mtd.h	2008-07-29 22:06:43.000000000 -0700
+++ b/include/linux/mtd/mtd.h	2008-07-29 22:19:21.000000000 -0700
@@ -272,7 +272,11 @@ static inline void mtd_erase_callback(st
 			printk(KERN_INFO args);		\
 	} while(0)
 #else /* CONFIG_MTD_DEBUG */
-#define DEBUG(n, args...) do { } while(0)
+#define DEBUG(n, args...)				\
+	do {						\
+		if (0)					\
+			printk(KERN_INFO args);		\
+	} while(0)
 
 #endif /* CONFIG_MTD_DEBUG */
 
