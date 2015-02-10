Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLG37-0002cR-Em
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 19:00:43 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] mtd: mxc-nand: Implement support for PARAM command
Date: Tue, 10 Feb 2015 19:59:59 +0100
Message-Id: <1423594800-24214-6-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1423594800-24214-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1423594800-24214-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mxc-nand driver never supported the PARAM command to read out the
ONFI parameter page and so always relied on probing my manufacturer and
device id (as provided by the READID command).

This patch implements reading out the first parameter page copy at least
which should be good enough in practise.

This makes the boot log change from

	nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xb1
	nand: Micron NAND 128MiB 1,8V 16-bit

to
	nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xb1
	nand: Micron MT29F1G16ABBDAH4

on my machine.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 0afe5904a337..0083b4ee4f33 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1153,6 +1153,13 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 		mxc_do_addr_cycle(mtd, column, page_addr);
 
 		break;
+	case NAND_CMD_PARAM:
+		host->devtype_data->send_cmd(host, command, false);
+		mxc_do_addr_cycle(mtd, column, page_addr);
+		host->devtype_data->send_page(mtd, NFC_OUTPUT);
+		memcpy32_fromio(host->data_buf, host->main_area0, 512);
+		host->buf_start = 0;
+		break;
 	}
 }
 
-- 
2.1.4
