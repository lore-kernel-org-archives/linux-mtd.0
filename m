Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKVxK-0005Iw-5D
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 16:43:06 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/3] UBI: block: Add CONFIG_BLOCK dependency
Date: Mon,  3 Mar 2014 13:42:40 -0300
Message-Id: <1393864960-20825-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1393864960-20825-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393864960-20825-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The UBI block driver depends on the block infrastructure. Add the
proper dependency and fix a build error when CONFIG_BLOCK is not selected.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/ubi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 783fb18..f0855ce 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -90,6 +90,7 @@ config MTD_UBI_GLUEBI
 config MTD_UBI_BLOCK
 	bool "Read-only block devices on top of UBI volumes"
 	default n
+	depends on BLOCK
 	help
 	   This option enables read-only UBI block devices support. UBI block
 	   devices will be layered on top of UBI volumes, which means that the
-- 
1.8.1.5
