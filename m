Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esFj7-0000Ab-TQ
 for linux-mtd@lists.infradead.org; Sat, 03 Mar 2018 22:34:03 +0000
Received: by mail-lf0-x243.google.com with SMTP id q69so18118084lfi.10
 for <linux-mtd@lists.infradead.org>; Sat, 03 Mar 2018 14:33:51 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] mtd: jedec_probe: add Eon EN29LV400A IDs
Date: Sat,  3 Mar 2018 23:31:45 +0100
Message-Id: <20180303223145.27903-1-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds the JEDEC IDs for Eon EN29LV400A variants
EN29LV400AB and EN29LV400AT. This chip is found in the
D-Link DNS-313.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/chips/jedec_probe.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index b479bd81120b..6f7e7e1b3fe5 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -53,6 +53,8 @@
 #define AT49BV32XT	0x00C9
 
 /* Eon */
+#define EN29LV400AT	0x22B9
+#define EN29LV400AB	0x22BA
 #define EN29SL800BB	0x226B
 #define EN29SL800BT	0x22EA
 
@@ -641,6 +643,36 @@ static const struct amd_flash_info jedec_table[] = {
 			ERASEINFO(0x10000,63),
 			ERASEINFO(0x02000,8)
 		}
+	}, {
+		.mfr_id		= CFI_MFR_EON,
+		.dev_id		= EN29LV400AT,
+		.name		= "Eon EN29LV400AT",
+		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
+		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
+		.dev_size	= SIZE_512KiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 4,
+		.regions	= {
+			ERASEINFO(0x10000,7),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x04000,1),
+		}
+	}, {
+		.mfr_id		= CFI_MFR_EON,
+		.dev_id		= EN29LV400AB,
+		.name		= "Eon EN29LV400AB",
+		.devtypes	= CFI_DEVICETYPE_X16|CFI_DEVICETYPE_X8,
+		.uaddr		= MTD_UADDR_0x0AAA_0x0555,
+		.dev_size	= SIZE_512KiB,
+		.cmd_set	= P_ID_AMD_STD,
+		.nr_regions	= 4,
+		.regions	= {
+			ERASEINFO(0x04000,1),
+			ERASEINFO(0x02000,2),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x10000,7),
+		}
 	}, {
 		.mfr_id		= CFI_MFR_EON,
 		.dev_id		= EN29SL800BT,
-- 
2.14.3
