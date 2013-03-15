Received: from mail-pb0-f43.google.com ([209.85.160.43])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGYgs-0007Av-Rh
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2013 17:45:15 +0000
Received: by mail-pb0-f43.google.com with SMTP id md12so4123986pbc.2
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2013 10:45:13 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: omap2: fix IOERR
Date: Fri, 15 Mar 2013 10:44:59 -0700
Message-Id: <1363369499-29459-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <CAGNmLEPEkre4SwbVgBYhDPhqC+tkn-aLp9-bTjh8dv90Yo6_tw@mail.gmail.com>
References: <CAGNmLEPEkre4SwbVgBYhDPhqC+tkn-aLp9-bTjh8dv90Yo6_tw@mail.gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Toan Pham <tpham3783@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Toan Pham <tpham3783@gmail.com>

Fix mtd-utils from returning -EIO.
Formatting jffs2 filesystem was impossible when CONFIG_HZ was set to a low
value.

Signed-off-by: Toan Pham <tpham3783@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Toan: it looks like your mailer uses MIME/HTML formatting, whereas the mailing
list expects plain text. It also seems your tabs were replaced with spaces. I
am resubmitting your patch for you, as it is simple and is not worth a lot more
email struggles. Thanks for the fix!

 drivers/mtd/nand/omap2.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index b97ef3b..81b80af 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1023,9 +1023,9 @@ static int omap_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	int status, state = this->state;
 
 	if (state == FL_ERASING)
-		timeo += (HZ * 400) / 1000;
+		timeo += msecs_to_jiffies(400);
 	else
-		timeo += (HZ * 20) / 1000;
+		timeo += msecs_to_jiffies(20);
 
 	writeb(NAND_CMD_STATUS & 0xFF, info->reg.gpmc_nand_command);
 	while (time_before(jiffies, timeo)) {
-- 
1.7.9.5
