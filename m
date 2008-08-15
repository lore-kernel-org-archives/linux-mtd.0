Received: from nwd2mail11.analog.com ([137.71.25.57])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KTvWo-00005g-JS
	for linux-mtd@lists.infradead.org; Fri, 15 Aug 2008 09:23:26 +0000
From: Bryan Wu <cooloney@kernel.org>
To: dwmw2@infradead.org
Subject: [PATCH 1/1] MTD Maps: make uclinux mapping driver depend on MTD_RAM
	since it only probes that
Date: Fri, 15 Aug 2008 16:26:07 +0800
Message-Id: <1218788767-8916-1-git-send-email-cooloney@kernel.org>
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
 drivers/mtd/maps/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index df8e00b..50bb046 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -522,7 +522,7 @@ config MTD_BFIN_ASYNC
 
 config MTD_UCLINUX
 	tristate "Generic uClinux RAM/ROM filesystem support"
-	depends on MTD_PARTITIONS && !MMU
+	depends on MTD_PARTITIONS && MTD_RAM && !MMU
 	help
 	  Map driver to support image based filesystems for uClinux.
 
-- 
1.5.6
