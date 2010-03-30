Received: from smtp6-g21.free.fr ([212.27.42.6])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NwbcB-0004de-MA
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2010 13:36:24 +0000
Subject: [PATCH v2 3/7] mtd: cfi_probe: add support for SST 0x0701 vendorname
To: linux-mtd <linux-mtd@lists.infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Tue, 30 Mar 2010 15:34:58 +0200
Message-ID: <20100330133458.20107.48734.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
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
---
 drivers/mtd/chips/cfi_probe.c |    9 +++++++++
 include/linux/mtd/cfi.h       |    1 +
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index a28659d..f931e94 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -214,6 +214,12 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	 * back into Read Mode, which is a nop in this case).
 	 */
 	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
+
+	if (cfi->cfiq->P_ID == P_ID_SST_OLD) {
+		addr_unlock1 = 0x5555;
+		addr_unlock2 = 0x2AAA;
+	}
+
 	cfi_send_gen_cmd(0xaa, addr_unlock1, base, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, addr_unlock2, base, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x90, addr_unlock1, base, map, cfi, cfi->device_type, NULL);
@@ -270,6 +276,9 @@ static char *vendorname(__u16 vendor)
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
