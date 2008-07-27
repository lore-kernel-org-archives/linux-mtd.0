Received: from ti-out-0910.google.com ([209.85.142.191])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KMzl9-0006zj-JW
	for linux-mtd@lists.infradead.org; Sun, 27 Jul 2008 06:29:36 +0000
Received: by ti-out-0910.google.com with SMTP id a21so2000841tia.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Jul 2008 23:29:33 -0700 (PDT)
From: Bryan Wu <cooloney@kernel.org>
To: dwmw2@infradead.org,
	akpm@linux-foundation.org
Subject: [PATCH 5/7] [MTD] Blackfin NFC Driver: enable Blackfin nand HWECC
	support by default
Date: Sun, 27 Jul 2008 14:27:57 +0800
Message-Id: <1217140079-20014-6-git-send-email-cooloney@kernel.org>
In-Reply-To: <1217140079-20014-1-git-send-email-cooloney@kernel.org>
References: <1217140079-20014-1-git-send-email-cooloney@kernel.org>
Sender: Bryan Wu <cooloney.lkml@gmail.com>
Cc: Bryan Wu <cooloney@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/nand/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 6ca1ec0..582942d 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -105,6 +105,7 @@ config MTD_NAND_BF5XX
 
 config MTD_NAND_BF5XX_HWECC
 	bool "BF5XX NAND Hardware ECC"
+	default y
 	depends on MTD_NAND_BF5XX
 	help
 	  Enable the use of the BF5XX's internal ECC generator when
-- 
1.5.6
