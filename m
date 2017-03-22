Received: from conuserg-07.nifty.com ([210.131.2.74])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqmZx-0008Li-S7
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 20:10:04 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: laurent.monat@idquantique.com, thorsten.christiansson@idquantique.com,
 Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [RESEND PATCH v2 23/53] mtd: nand: denali: set DEVICES_CONNECTED 1 if
 not set
Date: Thu, 23 Mar 2017 05:07:22 +0900
Message-Id: <1490213273-8571-24-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, the driver expects DEVICE_CONNECTED is automatically set
by the hardware, but this feature is disabled in some cases.
In such cases, it is the software's responsibility to set up the
DEVICES_CONNECTED register.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/mtd/nand/denali.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index abf8997..3da0a0e 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1472,6 +1472,15 @@ static int denali_multidev_fixup(struct denali_nand_info *denali)
 	 */
 	denali->devnum = ioread32(denali->flash_reg + DEVICES_CONNECTED);
 
+	/*
+	 * On some SoCs, DEVICES_CONNECTED is not auto-detected.
+	 * For those, DEVICES_CONNECTED is left to 0.  Set 1 if it is the case.
+	 */
+	if (denali->devnum == 0) {
+		denali->devnum = 1;
+		iowrite32(1, denali->flash_reg + DEVICES_CONNECTED);
+	}
+
 	if (denali->devnum == 1)
 		return 0;
 
-- 
2.7.4
