Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MCC03-00087I-OY
	for linux-mtd@lists.infradead.org; Thu, 04 Jun 2009 12:24:58 +0000
Received: by ewy21 with SMTP id 21so242465ewy.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Jun 2009 05:24:50 -0700 (PDT)
Message-ID: <4A27D93B.9020906@gmail.com>
Date: Thu, 04 Jun 2009 16:24:59 +0200
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: [PATCH]  mtd/nand: max_retries off by one
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

with `while (max_retries-- > 0)' max_retries reaches -1 after the loop.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 40c2608..b9706ad 100644
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
