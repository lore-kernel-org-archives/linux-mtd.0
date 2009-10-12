Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MxHaP-0001UD-HN
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 09:53:09 +0000
From: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v5 3/3] MTD: OneNAND: fix double printing of function name
Date: Mon, 12 Oct 2009 12:52:45 +0300
Message-Id: <1255341165-1972-4-git-send-email-ext-mika.2.korhonen@nokia.com>
In-Reply-To: <1255341165-1972-3-git-send-email-ext-mika.2.korhonen@nokia.com>
References: <1255341165-1972-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-2-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1255341165-1972-3-git-send-email-ext-mika.2.korhonen@nokia.com>
Cc: amul.saha@samsung.com, artem.bityutskiy@nokia.com,
	kyungmin.park@samsung.com, Mika Korhonen <ext-mika.2.korhonen@nokia.com>,
	adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 7355f62..e812552 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -3468,8 +3468,8 @@ int flexonenand_set_boundary(struct mtd_info *mtd, int die,
 	this->command(mtd, ONENAND_CMD_ERASE, addr, 0);
 	ret = this->wait(mtd, FL_ERASING);
 	if (ret) {
-		printk(KERN_ERR "%s: flexonenand_set_boundary: "
-				"Failed PI erase for Die %d\n", __func__, die);
+		printk(KERN_ERR "%s: Failed PI erase for Die %d\n",
+		       __func__, die);
 		goto out;
 	}
 
-- 
1.6.0.4
