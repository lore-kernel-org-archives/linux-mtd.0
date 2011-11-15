Received: from xes-mad.com ([216.165.139.218])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RQ78q-000323-2w
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2011 00:44:49 +0000
Received: from zimbra.xes-mad.com (cal [10.52.0.127])
 by xes-mad.com (8.13.8/8.13.8) with ESMTP id pAF0iZLK003256
 for <linux-mtd@lists.infradead.org>; Mon, 14 Nov 2011 18:44:35 -0600
Date: Mon, 14 Nov 2011 18:44:34 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: cfi: Allow per-mapping CFI device endianness
Message-ID: <43e9f17b-665e-489d-a987-495c847c44f1@zimbra>
In-Reply-To: <32718f73-44ba-4dd0-90a7-8c15cc3ffc54@zimbra>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch allows each CFI device map to use its own endianness. The
globally defined CFI endianness (CONFIG_MTD_CFI_NOSWAP,
CONFIG_MTD_CFI_BE_BYTE_SWAP or CONFIG_MTD_CFI_LE_BYTE_SWAP) becomes the
default value which can be overridden by a driver for a particular device.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/mtd/chips/cfi_cmdset_0020.c |    5 +-
 include/linux/mtd/cfi.h             |   16 ++++----
 include/linux/mtd/cfi_endian.h      |   76 +++++++++++++---------------------
 include/linux/mtd/map.h             |    1 +
 4 files changed, 41 insertions(+), 57 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 179814a..666c52f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -139,8 +139,9 @@ struct mtd_info *cfi_cmdset_0020(struct map_info *map, int primary)
 		}
 
 		/* Do some byteswapping if necessary */
-		extp->FeatureSupport = cfi32_to_cpu(extp->FeatureSupport);
-		extp->BlkStatusRegMask = cfi32_to_cpu(extp->BlkStatusRegMask);
+		extp->FeatureSupport = cfi32_to_cpu(map, extp->FeatureSupport);
+		extp->BlkStatusRegMask = cfi32_to_cpu(map,
+						extp->BlkStatusRegMask);
 
 #ifdef DEBUG_CFI_FEATURES
 		/* Tell the user about it in lots of lovely detail */
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index d249254..d5d2ec6 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -354,10 +354,10 @@ static inline map_word cfi_build_cmd(u_long cmd, struct map_info *map, struct cf
 		onecmd = cmd;
 		break;
 	case 2:
-		onecmd = cpu_to_cfi16(cmd);
+		onecmd = cpu_to_cfi16(map, cmd);
 		break;
 	case 4:
-		onecmd = cpu_to_cfi32(cmd);
+		onecmd = cpu_to_cfi32(map, cmd);
 		break;
 	}
 
@@ -437,10 +437,10 @@ static inline unsigned long cfi_merge_status(map_word val, struct map_info *map,
 	case 1:
 		break;
 	case 2:
-		res = cfi16_to_cpu(res);
+		res = cfi16_to_cpu(map, res);
 		break;
 	case 4:
-		res = cfi32_to_cpu(res);
+		res = cfi32_to_cpu(map, res);
 		break;
 	default: BUG();
 	}
@@ -480,12 +480,12 @@ static inline uint8_t cfi_read_query(struct map_info *map, uint32_t addr)
 	if (map_bankwidth_is_1(map)) {
 		return val.x[0];
 	} else if (map_bankwidth_is_2(map)) {
-		return cfi16_to_cpu(val.x[0]);
+		return cfi16_to_cpu(map, val.x[0]);
 	} else {
 		/* No point in a 64-bit byteswap since that would just be
 		   swapping the responses from different chips, and we are
 		   only interested in one chip (a representative sample) */
-		return cfi32_to_cpu(val.x[0]);
+		return cfi32_to_cpu(map, val.x[0]);
 	}
 }
 
@@ -496,12 +496,12 @@ static inline uint16_t cfi_read_query16(struct map_info *map, uint32_t addr)
 	if (map_bankwidth_is_1(map)) {
 		return val.x[0] & 0xff;
 	} else if (map_bankwidth_is_2(map)) {
-		return cfi16_to_cpu(val.x[0]);
+		return cfi16_to_cpu(map, val.x[0]);
 	} else {
 		/* No point in a 64-bit byteswap since that would just be
 		   swapping the responses from different chips, and we are
 		   only interested in one chip (a representative sample) */
-		return cfi32_to_cpu(val.x[0]);
+		return cfi32_to_cpu(map, val.x[0]);
 	}
 }
 
diff --git a/include/linux/mtd/cfi_endian.h b/include/linux/mtd/cfi_endian.h
index 51cc3f5..b97a625 100644
--- a/include/linux/mtd/cfi_endian.h
+++ b/include/linux/mtd/cfi_endian.h
@@ -19,53 +19,35 @@
 
 #include <asm/byteorder.h>
 
-#ifndef CONFIG_MTD_CFI_ADV_OPTIONS
-
-#define CFI_HOST_ENDIAN
-
-#else
-
-#ifdef CONFIG_MTD_CFI_NOSWAP
-#define CFI_HOST_ENDIAN
-#endif
-
-#ifdef CONFIG_MTD_CFI_LE_BYTE_SWAP
-#define CFI_LITTLE_ENDIAN
-#endif
-
-#ifdef CONFIG_MTD_CFI_BE_BYTE_SWAP
-#define CFI_BIG_ENDIAN
-#endif
-
-#endif
-
-#if defined(CFI_LITTLE_ENDIAN)
-#define cpu_to_cfi8(x) (x)
-#define cfi8_to_cpu(x) (x)
-#define cpu_to_cfi16(x) cpu_to_le16(x)
-#define cpu_to_cfi32(x) cpu_to_le32(x)
-#define cpu_to_cfi64(x) cpu_to_le64(x)
-#define cfi16_to_cpu(x) le16_to_cpu(x)
-#define cfi32_to_cpu(x) le32_to_cpu(x)
-#define cfi64_to_cpu(x) le64_to_cpu(x)
-#elif defined (CFI_BIG_ENDIAN)
-#define cpu_to_cfi8(x) (x)
-#define cfi8_to_cpu(x) (x)
-#define cpu_to_cfi16(x) cpu_to_be16(x)
-#define cpu_to_cfi32(x) cpu_to_be32(x)
-#define cpu_to_cfi64(x) cpu_to_be64(x)
-#define cfi16_to_cpu(x) be16_to_cpu(x)
-#define cfi32_to_cpu(x) be32_to_cpu(x)
-#define cfi64_to_cpu(x) be64_to_cpu(x)
-#elif defined (CFI_HOST_ENDIAN)
-#define cpu_to_cfi8(x) (x)
-#define cfi8_to_cpu(x) (x)
-#define cpu_to_cfi16(x) (x)
-#define cpu_to_cfi32(x) (x)
-#define cpu_to_cfi64(x) (x)
-#define cfi16_to_cpu(x) (x)
-#define cfi32_to_cpu(x) (x)
-#define cfi64_to_cpu(x) (x)
+#define CFI_HOST_ENDIAN 1
+#define CFI_LITTLE_ENDIAN 2
+#define CFI_BIG_ENDIAN 3
+
+#if !defined(CONFIG_MTD_CFI_ADV_OPTIONS) || defined(CONFIG_MTD_CFI_NOSWAP)
+#define CFI_DEFAULT_ENDIAN CFI_HOST_ENDIAN
+#elif defined(CONFIG_MTD_CFI_LE_BYTE_SWAP)
+#define CFI_DEFAULT_ENDIAN CFI_LITTLE_ENDIAN
+#elif defined(CONFIG_MTD_CFI_BE_BYTE_SWAP)
+#define CFI_DEFAULT_ENDIAN CFI_BIG_ENDIAN
 #else
 #error No CFI endianness defined
 #endif
+
+#define cfi_default(s) ((s)?:CFI_DEFAULT_ENDIAN)
+#define cfi_be(s) (cfi_default(s) == CFI_BIG_ENDIAN)
+#define cfi_le(s) (cfi_default(s) == CFI_LITTLE_ENDIAN)
+#define cfi_host(s) (cfi_default(s) == CFI_HOST_ENDIAN)
+
+#define cpu_to_cfi8(map, x) (x)
+#define cfi8_to_cpu(map, x) (x)
+#define cpu_to_cfi16(map, x) _cpu_to_cfi(16, (map)->swap, (x))
+#define cpu_to_cfi32(map, x) _cpu_to_cfi(32, (map)->swap, (x))
+#define cpu_to_cfi64(map, x) _cpu_to_cfi(64, (map)->swap, (x))
+#define cfi16_to_cpu(map, x) _cfi_to_cpu(16, (map)->swap, (x))
+#define cfi32_to_cpu(map, x) _cfi_to_cpu(32, (map)->swap, (x))
+#define cfi64_to_cpu(map, x) _cfi_to_cpu(64, (map)->swap, (x))
+
+#define _cpu_to_cfi(w, s, x) (cfi_host(s)?(x):_swap_to_cfi(w, s, x))
+#define _cfi_to_cpu(w, s, x) (cfi_host(s)?(x):_swap_to_cpu(w, s, x))
+#define _swap_to_cfi(w, s, x) (cfi_be(s)?cpu_to_be##w(x):cpu_to_le##w(x))
+#define _swap_to_cpu(w, s, x) (cfi_be(s)?be##w##_to_cpu(x):le##w##_to_cpu(x))
diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index a9e6ba4..1132410 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -214,6 +214,7 @@ struct map_info {
 	void __iomem *virt;
 	void *cached;
 
+	int swap; /* this mapping's byte-swapping requirement */
 	int bankwidth; /* in octets. This isn't necessarily the width
 		       of actual bus cycles -- it's the repeat interval
 		      in bytes, before you are talking to the first chip again.
-- 
1.7.0.4
