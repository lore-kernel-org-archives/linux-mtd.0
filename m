Received: from nwd2mail11.analog.com ([137.71.25.57])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NVgwp-0007W4-3P
	for linux-mtd@lists.infradead.org; Fri, 15 Jan 2010 07:50:27 +0000
From: Barry Song <21cnbao@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH 1/2] let MTD_XIP depend on XIP_KERNEL or ROMKERNEL
Date: Fri, 15 Jan 2010 15:50:13 +0800
Message-ID: <1263541814-6642-1-git-send-email-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org,
	Barry Song <21cnbao@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some architectures like blackfin,h8300,m68k use ROMKERNEL to describe
kernel XIP, not like arm which uses XIP_KERNEL

Signed-off-by: Barry Song <21cnbao@gmail.com>
---
 drivers/mtd/chips/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index 35c6a23..6c39451 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -233,7 +233,7 @@ config MTD_ABSENT
 config MTD_XIP
 	bool "XIP aware MTD support"
 	depends on !SMP && (MTD_CFI_INTELEXT || MTD_CFI_AMDSTD) && EXPERIMENTAL && ARCH_MTD_XIP
-	default y if XIP_KERNEL
+	default y if (XIP_KERNEL || ROMKERNEL)
 	help
 	  This allows MTD support to work with flash memory which is also
 	  used for XIP purposes.  If you're not sure what this is all about
-- 
1.5.6.3
