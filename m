Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1YLG2w-0008KC-1H
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 19:00:33 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 6/6] [RFC] mtd: mxc-nand: Warn on unimplemented commands
Date: Tue, 10 Feb 2015 20:00:00 +0100
Message-Id: <1423594800-24214-7-git-send-email-u.kleine-koenig@pengutronix.de>
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

The PARAM command was long unimplemented and it probably wasn't
noticed because chip probing using only the few bytes returned by the
READID command are good enough in most cases to determine the chip in
use.

Still to notice such a shortcoming earlier in the future would be nice
in case it's something more vital.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 0083b4ee4f33..372e0e38f59b 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1160,6 +1160,10 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 		memcpy32_fromio(host->data_buf, host->main_area0, 512);
 		host->buf_start = 0;
 		break;
+	default:
+		WARN_ONCE(1, "Unimplemented command (cmd=%u)\n",
+			  command);
+		break;
 	}
 }
 
-- 
2.1.4
