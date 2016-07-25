Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRcU4-0003AM-Ok
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 09:47:37 +0000
From: Rajeev Kumar <rajeev_kumar@mentor.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <dedekind1@gmail.com>, <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <stable@vger.kernel.org>, <rajeev_kumar@mentor.com>
Subject: [PATCH 2/2] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
Date: Mon, 25 Jul 2016 15:16:59 +0530
Message-ID: <1469440019-29358-2-git-send-email-rajeev_kumar@mentor.com>
In-Reply-To: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
References: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the master mtd does not have any slave mtd partitions,
and its numeraseregions is one(only has one erease block), and
we attach the master mtd with : ubiattach -m 0 -d 0

We will meet the error:
-------------------------------------------------------
root ~$ ubiattach /dev/ubi_ctrl -m 0 -d 0
UBI: attaching mtd0 to ubi0
UBI error: io_init: multiple regions, not implemented
ubiattach: error!: cannot attach mtd0
           error 22 (Invalid argument)
-------------------------------------------------------

In fact, if there is only one "erase block", we should not
prevent the attach.

This patch is tested against 3.14 kernel and only build test is
performed against current upstream master branch.

Signed-off-by: Rajeev Kumar <rajeev_kumar@mentor.com>
---
 drivers/mtd/ubi/build.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 59229c4..562421b 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -628,7 +628,7 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 	dbg_gen("sizeof(struct ubi_ainf_peb) %zu", sizeof(struct ubi_ainf_peb));
 	dbg_gen("sizeof(struct ubi_wl_entry) %zu", sizeof(struct ubi_wl_entry));
 
-	if (ubi->mtd->numeraseregions != 0) {
+	if (ubi->mtd->numeraseregions > 1) {
 		/*
 		 * Some flashes have several erase regions. Different regions
 		 * may have different eraseblock size and other
-- 
1.7.9.5
