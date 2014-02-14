Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEETm-0001mn-KE
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 08:50:39 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH resend] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
Date: Fri, 14 Feb 2014 16:08:15 +0800
Message-ID: <1392365295-19299-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
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

We will meet the error with (Micron M29W256GL7AN6):
-------------------------------------------------------
root@freescale ~$ ubiattach /dev/ubi_ctrl -m 0 -d 0
UBI: attaching mtd0 to ubi0
UBI error: io_init: multiple regions, not implemented
ubiattach: error!: cannot attach mtd0
           error 22 (Invalid argument)
-------------------------------------------------------

In fact, if there is only one "erase block", we should not
prevent the attach.

This patch fixes it.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/ubi/build.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 57deae9..a5edc64 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -640,7 +640,7 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 	dbg_gen("sizeof(struct ubi_ainf_peb) %zu", sizeof(struct ubi_ainf_peb));
 	dbg_gen("sizeof(struct ubi_wl_entry) %zu", sizeof(struct ubi_wl_entry));
 
-	if (ubi->mtd->numeraseregions != 0) {
+	if (ubi->mtd->numeraseregions > 1) {
 		/*
 		 * Some flashes have several erase regions. Different regions
 		 * may have different eraseblock size and other
-- 
1.7.2.rc3
