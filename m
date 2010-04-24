Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O5hol-0006DY-5C
	for linux-mtd@lists.infradead.org; Sat, 24 Apr 2010 16:02:56 +0000
Subject: [PATCH v5 3/9] mtd: cfi_probe: add support for SST 0x0701 vendorname
To: linux-mtd <linux-mtd@lists.infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 24 Apr 2010 17:58:02 +0200
Message-ID: <20100424155802.14723.83366.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
References: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Wolfram Sang <w.sang@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>,
	Chris Moore <moore@free.fr>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SST 39VF160x and 39VF320x chips use vendorname id 0x0701 and alternative
unlock addresses. Add support for them in cfi_probe.c.

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
Reviewed-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/chips/cfi_probe.c |    8 ++++++++
 include/linux/mtd/cfi.h       |    1 +
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index 045dc10..b2acd32 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -206,6 +206,11 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 #endif
 	}
 
+	if (cfi->cfiq->P_ID == P_ID_SST_OLD) {
+		addr_unlock1 = 0x5555;
+		addr_unlock2 = 0x2AAA;
+	}
+
 	/*
 	 * Note we put the device back into Read Mode BEFORE going into Auto
 	 * Select Mode, as some devices support nesting of modes, others
@@ -271,6 +276,9 @@ static char *vendorname(__u16 vendor)
 	case P_ID_SST_PAGE:
 		return "SST Page Write";
 
+	case P_ID_SST_OLD:
+		return "SST 39VF160x/39VF320x";
+
 	case P_ID_INTEL_PERFORMANCE:
 		return "Intel Performance Code";
 
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index cee05b1..5716fc7 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -253,6 +253,7 @@ struct cfi_bri_query {
 #define P_ID_MITSUBISHI_STD     0x0100
 #define P_ID_MITSUBISHI_EXT     0x0101
 #define P_ID_SST_PAGE           0x0102
+#define P_ID_SST_OLD            0x0701
 #define P_ID_INTEL_PERFORMANCE  0x0200
 #define P_ID_INTEL_DATA         0x0210
 #define P_ID_RESERVED           0xffff
