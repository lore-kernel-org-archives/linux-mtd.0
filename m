Received: from smtp23.services.sfr.fr ([93.17.128.21])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1ODwkz-00011T-27
	for linux-mtd@lists.infradead.org; Mon, 17 May 2010 09:37:05 +0000
Subject: [PATCH] mtd: gen_probe: use AMD standard command-set with Winbond
	flash chips
To: linux-mtd@lists.infradead.org
From: Guillaume LECERF <glecerf@gmail.com>
Date: Mon, 17 May 2010 11:39:42 +0200
Message-ID: <20100517093942.12147.98889.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested with W19L320SBT9C [1].

[1] http://www.datasheetarchive.com/pdf-datasheets/Datasheets-40/DSA-795343.pdf

Signed-off-by: Obinou <obconseil@gmail.com>
Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
---
 drivers/mtd/chips/gen_probe.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 75a8f9d..3b9a284 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -249,6 +249,7 @@ static struct mtd_info *check_cmd_set(struct map_info *map, int primary)
 #ifdef CONFIG_MTD_CFI_AMDSTD
 	case P_ID_AMD_STD:
 	case P_ID_SST_OLD:
+	case P_ID_WINBOND:
 		return cfi_cmdset_0002(map, primary);
 #endif
 #ifdef CONFIG_MTD_CFI_STAA
