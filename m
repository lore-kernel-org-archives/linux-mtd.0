Received: from mail-db8lp0187.outbound.messaging.microsoft.com
 ([213.199.154.187] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGKw4-0007Hm-C1
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2013 03:04:01 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v6 1/3] mtd: add new fields to nand_flash_dev{}
Date: Fri, 15 Mar 2013 11:00:59 +0800
Message-ID: <1363316461-10592-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1363316461-10592-1-git-send-email-b32955@freescale.com>
References: <1363316461-10592-1-git-send-email-b32955@freescale.com>
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

This patch adds some new fields to the nand_flash_dev{}:
  @id_len: the valid length of the id data. See the comments in
           nand_id_has_period()
  @oobsize: the oob size.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 33516eb..4b87815 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -584,6 +584,8 @@ struct nand_chip {
  * @chipsize: total chip size in MiB
  * @erasesize: eraseblock size in bytes (determined from the extended ID if 0)
  * @options: stores various chip bit options
+ * @id_len: The valid length of the @id.
+ * @oobsize: OOB size
  */
 struct nand_flash_dev {
 	char *name;
@@ -598,6 +600,8 @@ struct nand_flash_dev {
 	unsigned int chipsize;
 	unsigned int erasesize;
 	unsigned int options;
+	uint16_t id_len;
+	uint16_t oobsize;
 };
 
 /**
-- 
1.7.1
