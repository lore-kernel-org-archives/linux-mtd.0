Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Niot1-00046J-1G
	for linux-mtd@lists.infradead.org; Sat, 20 Feb 2010 12:56:47 +0000
Subject: [PATCH 4/6] mtd: cfi_probe: add support for SST 0x0701 vendorname
To: David Woodhouse <dwmw2@infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 20 Feb 2010 13:58:04 +0100
Message-ID: <20100220125804.14843.90313.stgit@shiryu.yomgui.biz>
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

SST 39VF160x and 39VF320x chips use vendorname id 0x0701. Add support for them
in cfi_probe.c.

Signed-off-by: Guillaume Lecerf <glecerf@gmail.com>
---
 drivers/mtd/chips/cfi_probe.c |    3 +++
 include/linux/mtd/cfi.h       |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index 05207f7..9015b86 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -288,6 +288,9 @@ static char *vendorname(__u16 vendor)
 	case P_ID_SST_PAGE:
 		return "SST Page Write";
 
+	case P_ID_SST_OLD:
+		return "SST 39VF160x/39VF320x";
+
 	case P_ID_INTEL_PERFORMANCE:
 		return "Intel Performance Code";
 
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index 6cb3e7b..70de0d7 100644
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
