From: Jason Liu <jason.hui@linaro.org>
To: <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] mtd: mxc_nand: Add mx53 NFC driver support
Date: Mon, 22 Aug 2011 14:13:17 +0800
Message-ID: <1313993597-25189-1-git-send-email-jason.hui@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
Cc: dedekind1@gmail.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, patches@linaro.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This has already been tested with Samsung NAND: K9LAG08U0M
on MX53EVK board, ubi/ubifs has already been tested OK too.

Signed-off-by: Jason Liu <jason.hui@linaro.org>
---
No change. Just resend this patch per Artem request.
---
 drivers/mtd/nand/mxc_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 90df34c..a3f1b50 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -41,7 +41,7 @@
 
 #define nfc_is_v21()		(cpu_is_mx25() || cpu_is_mx35())
 #define nfc_is_v1()		(cpu_is_mx31() || cpu_is_mx27() || cpu_is_mx21())
-#define nfc_is_v3_2()		cpu_is_mx51()
+#define nfc_is_v3_2()		(cpu_is_mx51() || cpu_is_mx53())
 #define nfc_is_v3()		nfc_is_v3_2()
 
 /* Addresses for NFC registers */
-- 
1.7.4.1
