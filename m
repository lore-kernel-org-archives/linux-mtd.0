Received: from mail-ea0-x22d.google.com ([2a00:1450:4013:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYMCr-0003GA-OL
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2013 20:36:06 +0000
Received: by mail-ea0-f173.google.com with SMTP id g10so3764320eak.4
 for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2013 13:35:42 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [RESEND][PATCH] mtd: bcm47xxpart: detect "factory" partition
Date: Mon, 21 Oct 2013 22:35:34 +0200
Message-Id: <1382387734-22049-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A new type of partition with magic FCTY was found on Huawei E970:
46 43 54 59 4b 51 37 4e  41 42 31 38 41 32 39 30  |FCTYKQ7NAB18A290|

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 61213f9..20ef301 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -27,6 +27,7 @@
 
 /* Magics */
 #define BOARD_DATA_MAGIC		0x5246504D	/* MPFR */
+#define FACTORY_MAGIC			0x59544346	/* FCTY */
 #define POT_MAGIC1			0x54544f50	/* POTT */
 #define POT_MAGIC2			0x504f		/* OP */
 #define ML_MAGIC1			0x39685a42
@@ -111,6 +112,13 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 			continue;
 		}
 
+		/* Found on Huawei E970 */
+		if (buf[0x000 / 4] == FACTORY_MAGIC) {
+			bcm47xxpart_add_part(&parts[curr_part++], "factory",
+					     offset, MTD_WRITEABLE);
+			continue;
+		}
+
 		/* POT(TOP) */
 		if (buf[0x000 / 4] == POT_MAGIC1 &&
 		    (buf[0x004 / 4] & 0xFFFF) == POT_MAGIC2) {
-- 
1.7.10.4
