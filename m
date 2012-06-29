Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkV9K-0005kh-S3
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 06:57:51 +0000
Received: by eaaf11 with SMTP id f11so1258748eaa.36
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2012 23:57:48 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBI: Change the default percentage of reserved PEB
Date: Fri, 29 Jun 2012 08:57:41 +0200
Message-Id: <1340953061-15728-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The actual value (1%) is too low for actual NAND devices, a huge
majority of device has 2% maximum bad blocks (SLC or MLC).
(Actually it's 20 blocks on a 1024 blocks device, 40/2048...)

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 drivers/mtd/ubi/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 738ee8d..ea4b95b 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -29,7 +29,7 @@ config MTD_UBI_WL_THRESHOLD
 
 config MTD_UBI_BEB_RESERVE
 	int "Percentage of reserved eraseblocks for bad eraseblocks handling"
-	default 1
+	default 2
 	range 0 25
 	help
 	  If the MTD device admits of bad eraseblocks (e.g. NAND flash), UBI
-- 
1.7.2.5
