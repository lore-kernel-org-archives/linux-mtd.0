Received: from ey-out-1920.google.com ([74.125.78.144])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LX1Jo-0006wy-2n
	for linux-mtd@lists.infradead.org; Tue, 10 Feb 2009 22:43:07 +0000
Received: by ey-out-1920.google.com with SMTP id 4so18204eyg.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Feb 2009 14:43:01 -0800 (PST)
Message-ID: <499202F4.3020408@gmail.com>
Date: Tue, 10 Feb 2009 23:43:00 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: s.hauer@pengutronix.de, David.Woodhouse@intel.com
Subject: [PATCH] max_retries reaches -1, not 0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With while (max_retries-- > 0) { ... } max_retries reaches -1, not 0,
so we shouldn't DEBUG() on a max_retries of 0.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 21fd4f1..5c34148 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -192,7 +192,7 @@ static void wait_op_done(struct mxc_nand_host *host, int max_retries,
 			}
 			udelay(1);
 		}
-		if (max_retries <= 0)
+		if (max_retries < 0)
 			DEBUG(MTD_DEBUG_LEVEL0, "%s(%d): INT not set\n",
 			      __func__, param);
 	}
