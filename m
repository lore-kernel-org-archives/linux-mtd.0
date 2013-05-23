Received: from mail.microbit.se ([194.117.163.232])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UfUYu-00034X-Dq
 for linux-mtd@lists.infradead.org; Thu, 23 May 2013 12:24:04 +0000
From: Jonas Andersson <jonas@microbit.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Correct 4-byte address mode enable
Date: Thu, 23 May 2013 14:23:33 +0200
Message-Id: <1369311813-31606-1-git-send-email-jonas@microbit.se>
Cc: Jonas Andersson <jonas@microbit.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Micron SPI flashes uses command B7/E9 to enter/exit 4-byte mode. Write enable must be issued before command.

Signed-off-by: Jonas Andersson <jonas@microbit.se>
---
 drivers/mtd/devices/m25p80.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 2f3d2a5..c296cb7
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -160,6 +160,8 @@ static inline int write_disable(struct m25p *flash)
 static inline int set_4byte(struct m25p *flash, u32 jedec_id, int enable)
 {
 	switch (JEDEC_MFR(jedec_id)) {
+	case 0x20:
+		write_enable(flash);
 	case CFI_MFR_MACRONIX:
 	case 0xEF /* winbond */:
 		flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
-- 
1.8.1.4
