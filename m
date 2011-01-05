Received: from nbd.name ([46.4.11.11])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PaZzL-00036h-Dr
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2011 20:29:44 +0000
From: John Crispin <blogic@openwrt.org>
To: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 07/10] MIPS: lantiq: add NOR flash CFI address swizzle
Date: Wed,  5 Jan 2011 20:56:16 +0100
Message-Id: <1294257379-417-8-git-send-email-blogic@openwrt.org>
In-Reply-To: <1294257379-417-1-git-send-email-blogic@openwrt.org>
References: <1294257379-417-1-git-send-email-blogic@openwrt.org>
Cc: linux-mips@linux-mips.org, Ralph Hempel <ralph.hempel@lantiq.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the hack mentioned in the previous patch.

It is only a hack to make the map driver work until a better solution
is discussed.

Signed-off-by: John Crispin <blogic@openwrt.org>
Signed-off-by: Ralph Hempel <ralph.hempel@lantiq.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mips@linux-mips.org
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/Kconfig           |    9 +++++++++
 drivers/mtd/chips/cfi_cmdset_0002.c |    8 ++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index 35c6a23..9ecb5eb 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -39,6 +39,15 @@ config MTD_CFI_ADV_OPTIONS
 
 	  If unsure, say 'N'.
 
+config MTD_CFI_CMD_SWIZZLE
+	bool "Swizzle last bit of command address"
+	default y
+	depends on LANTIQ
+	help
+	  lantiq SoCs share the external bus unit with the pci interface
+	  for MTD to work at the the same time with PCI, we need to add
+	  this quirk
+
 choice
 	prompt "Flash cmd/query data swapping"
 	depends on MTD_CFI_ADV_OPTIONS
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 3b8e32d..e047af1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -39,7 +39,12 @@
 #include <linux/mtd/xip.h>
 
 #define AMD_BOOTLOC_BUG
+
+#ifdef CONFIG_MTD_CFI_CMD_SWIZZLE
+#define FORCE_WORD_WRITE 1
+#else
 #define FORCE_WORD_WRITE 0
+#endif
 
 #define MAX_WORD_RETRIES 3
 
@@ -1140,6 +1145,9 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	int retry_cnt = 0;
 
 	adr += chip->start;
+#ifdef CONFIG_MTD_CFI_CMD_SWIZZLE
+	adr ^= 2;
+#endif
 
 	mutex_lock(&chip->mutex);
 	ret = get_chip(map, chip, adr, FL_WRITING);
-- 
1.7.2.3
