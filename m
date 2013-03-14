Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFyQZ-0003Gn-8V
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 03:01:59 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v5 1/3] mtd: add a new field for nand_flash_dev{}
Date: Thu, 14 Mar 2013 10:59:23 +0800
Message-ID: <1363229965-13128-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1363229965-13128-1-git-send-email-b32955@freescale.com>
References: <1363229965-13128-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As time goes on, we begin to meet the situation that we can not get enough
information from some nand chips's id data. Take some Toshiba's nand chips
for example. I have 4 Toshiba's nand chips in my hand:
	TC58NVG2S0F, TC58NVG3S0F, TC58NVG5D2, TC58NVG6D2

When we read these chips' datasheets, we will get the geometry of these chips:
	TC58NVG2S0F : 4096 + 224
	TC58NVG3S0F : 4096 + 232
	TC58NVG5D2  : 8192 + 640
	TC58NVG6D2  : 8192 + 640

But we can not parse out the correct oob size for these chips from the id data.

This patch adds @oobsize for the nand_flash_dev{} to store the oob size for
these nands.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index e2c7173..42862e9 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -581,6 +581,7 @@ struct nand_chip {
  * @chipsize: total chip size in MiB
  * @erasesize: eraseblock size in bytes (determined from the extended ID if 0)
  * @options: stores various chip bit options
+ * @oobsize: OOB size
  */
 struct nand_flash_dev {
 	char *name;
@@ -595,6 +596,7 @@ struct nand_flash_dev {
 	unsigned int chipsize;
 	unsigned int erasesize;
 	unsigned int options;
+	unsigned int oobsize;
 };
 
 /**
-- 
1.7.1
