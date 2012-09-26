Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGnYY-0003MX-Le
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 09:05:23 +0000
Received: by bkwj4 with SMTP id j4so154630bkw.36
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2012 02:05:21 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd: sh_flctl: Add sh7372 device tree config
Date: Wed, 26 Sep 2012 11:05:06 +0200
Message-Id: <1348650306-15492-3-git-send-email-hechtb@gmail.com>
In-Reply-To: <1348650306-15492-1-git-send-email-hechtb@gmail.com>
References: <1348650306-15492-1-git-send-email-hechtb@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Include the configuration data to set up FLCTL via device tree probing
for the SoC sh7372.

Signed-off-by: Bastian Hecht <hechtb@gmail.com>
---
 drivers/mtd/nand/sh_flctl.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 472c27e..b8b1d52 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -1030,7 +1030,15 @@ struct flctl_soc_config {
 	unsigned use_holden:1;
 };
 
+static struct flctl_soc_config flctl_sh7372_config = {
+	.flcmncr_val = CLK_16B_12L_4H | TYPESEL_SET | SHBUSSEL,
+	.has_hwecc = 1,
+	.use_holden = 1,
+};
+
 static const struct of_device_id of_flctl_match[] = {
+	{ .compatible = "renesas,shmobile-flctl-sh7372",
+				.data = &flctl_sh7372_config },
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_flctl_match);
-- 
1.7.5.4
