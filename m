Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OUQ7M-0005ma-9s
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2010 20:12:16 +0000
Received: by wyb32 with SMTP id 32so1797701wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 01 Jul 2010 13:12:14 -0700 (PDT)
Message-ID: <4C2D12C1.3000801@gmail.com>
Date: Fri, 02 Jul 2010 00:12:17 +0200
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: return -1 if verify failed
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It should return -1 if the verify failed.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
I think this needed, correct?

diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 6bc1b82..7414888 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -358,7 +358,7 @@ static int erasecrosstest(void)
 		printk(PRINT_PREF "verify failed!\n");
 		errcnt += 1;
 		ok = 0;
-		return err;
+		return -1;
 	}
 
 	printk(PRINT_PREF "erasing block %d\n", ebnum);
