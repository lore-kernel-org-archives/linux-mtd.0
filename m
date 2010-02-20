Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Niot6-0004Pg-5G
	for linux-mtd@lists.infradead.org; Sat, 20 Feb 2010 12:56:53 +0000
Subject: [PATCH 5/6] mtd: cfi_probe: use P_ID_* definitions instead of
	hardcoded values
To: David Woodhouse <dwmw2@infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 20 Feb 2010 13:58:09 +0100
Message-ID: <20100220125809.14843.16798.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100220125748.14843.70415.stgit@shiryu.yomgui.biz>
References: <20100220125748.14843.70415.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use P_ID_* definitions already in include/linux/mtd/cfi.h instead of the
hardcoded values. Make the code more readable.

Signed-off-by: Guillaume Lecerf <glecerf@gmail.com>
---
 drivers/mtd/chips/gen_probe.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index e2dc964..991c457 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -242,17 +242,17 @@ static struct mtd_info *check_cmd_set(struct map_info *map, int primary)
 		/* We need these for the !CONFIG_MODULES case,
 		   because symbol_get() doesn't work there */
 #ifdef CONFIG_MTD_CFI_INTELEXT
-	case 0x0001:
-	case 0x0003:
-	case 0x0200:
+	case P_ID_INTEL_EXT:
+	case P_ID_INTEL_STD:
+	case P_ID_INTEL_PERFORMANCE:
 		return cfi_cmdset_0001(map, primary);
 #endif
 #ifdef CONFIG_MTD_CFI_AMDSTD
-	case 0x0002:
+	case P_ID_AMD_STD:
 		return cfi_cmdset_0002(map, primary);
 #endif
 #ifdef CONFIG_MTD_CFI_STAA
-        case 0x0020:
+        case P_ID_ST_ADV:
 		return cfi_cmdset_0020(map, primary);
 #endif
 	default:
