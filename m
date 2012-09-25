Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGR5G-0003dY-Eo
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 09:05:39 +0000
Received: by eekd49 with SMTP id d49so1689126eek.36
 for <linux-mtd@lists.infradead.org>; Tue, 25 Sep 2012 02:05:36 -0700 (PDT)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
Subject: [PATCH] mtd: m25p80: add support for the windbond w25q256 chip
Date: Tue, 25 Sep 2012 11:05:27 +0200
Message-Id: <1348563927-9131-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
---
 drivers/mtd/devices/m25p80.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5257345..4eb99c6 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -168,6 +168,7 @@ static inline int set_4byte(struct m25p *flash, u32 jedec_id, int enable)
 {
 	switch (JEDEC_MFR(jedec_id)) {
 	case CFI_MFR_MACRONIX:
+	case 0xEF /* winbond */:
 		flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
 		return spi_write(flash->spi, flash->command, 1);
 	default:
@@ -739,6 +740,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
+	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
 
 	/* Catalyst / On Semiconductor -- non-JEDEC */
 	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1) },
-- 
1.7.10.4
