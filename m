Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTbC-0001jz-7b
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:20 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 22/23] UBI: Fastmap: Address one of Artems TODOs
Date: Fri,  1 Jun 2012 17:16:43 +0200
Message-Id: <1338563804-85990-23-git-send-email-richard@nod.at>
In-Reply-To: <1338563804-85990-1-git-send-email-richard@nod.at>
References: <1338563804-85990-1-git-send-email-richard@nod.at>
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com,
 tglx@linutronix.de, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

/* TODO: If you support fastmap but it was not found, you need to check
 * here that ai does not contain fastmap volumes. If it was corrupted,
 * you need to delete fastmap volumes or possible leftovers of them.
 * And then you have to create _new_ fastmap */

If we support fastmap and it was not found or corrupted we fall back to
scanning mode. While scanning mode the corrupted/partial fastmap will be
deleted.
There is also no need to create a new fastmap here.
It will be created automatically.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 44f3770..acf7db3 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1241,10 +1241,6 @@ int ubi_attach(struct ubi_device *ubi)
 	ubi->mean_ec = ai->mean_ec;
 	ubi_msg("max. sequence number:       %llu", ai->max_sqnum);
 
-	/* TODO: If you support fastmap but it was not found, you need to check
-	 * here that ai does not contain fastmap volumes. If it was corrupted,
-	 * you need to delete fastmap volumes or possible leftovers of them.
-	 * And then you have to create _new_ fastmap */
 	err = ubi_read_volume_table(ubi, ai);
 	if (err)
 		goto out_ai;
-- 
1.7.6.5
