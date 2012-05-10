Received: from sncsmrelay2.nai.com ([67.97.80.206])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSNMy-0007Ye-Fz
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 07:01:03 +0000
From: <gerg@snapgear.com>
To: <linux-mtd@lists.infradead.org>, <uclinux-dev@uclinux.org>
Subject: [PATCH 2/2] mtd: allow uclinux map driver to be used on any ColdFire
 CPU platform
Date: Thu, 10 May 2012 16:55:29 +1000
Message-ID: <1336632929-26100-2-git-send-email-gerg@snapgear.com>
In-Reply-To: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
References: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Greg Ungerer <gerg@uclinux.org>

The uclinux.c map driver has traditionally been used only on non-MMU based
systems. But there is no fundamental reason it can't be used on systems
running with virtual memory.

Some ColdFire CPU based systems now have full paged MMU hardware and can use
the uclinux.c mapping driver, so making the uclinux.c driver configuration
depend on !CONFIG_MMU doesn't make sense now. Allow the CONFIG_MTD_UCLINUX
option to be enabled if CONFIG_COLDFIRE is enabled. (I have chosen not to
just more generally allow uclinux.c for any MMU type to keep this option
hidden for most systems that are not interested in setting it).

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 drivers/mtd/maps/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 8af67cf..a5ac6b9 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -443,7 +443,7 @@ config MTD_GPIO_ADDR
 
 config MTD_UCLINUX
 	bool "Generic uClinux RAM/ROM filesystem support"
-	depends on MTD_RAM=y && !MMU
+	depends on MTD_RAM=y && (!MMU || COLDFIRE)
 	help
 	  Map driver to support image based filesystems for uClinux.
 
-- 
1.7.0.4
