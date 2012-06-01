Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTbB-0001jo-ED
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:19 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 21/23] UBI: Fastmap: Fix error message
Date: Fri,  1 Jun 2012 17:16:42 +0200
Message-Id: <1338563804-85990-22-git-send-email-richard@nod.at>
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

Print the message in ubi_scan_fastmap().

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c  |   10 ----------
 drivers/mtd/ubi/fastmap.c |    3 +++
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 4d86621..44f3770 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1222,16 +1222,6 @@ int ubi_attach(struct ubi_device *ubi)
 
 	err = ubi_scan_fastmap(ubi, ai);
 	if (err > 0) {
-		/* TODO: in UBIFS we have a convention: every function prints
-		 * its own error messages. This makes things cleaner and easier
-		 * - the caller should not care about printing anything.
-		 * Please, move this error message to 'ubi_scan_fastmap()'. And
-		 * keep this in mind, and do similar thing globally for entire
-		 * fastmap code. */
-		if (err == UBI_BAD_FASTMAP)
-			ubi_err("Attach by fastmap failed! "
-				"Falling back to attach by scanning.");
-
 		err = scan_all(ubi, ai);
 		if (err)
 			return err;
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 78f196d..90bcaf0 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -936,6 +936,9 @@ free_hdr:
 free_raw:
 	vfree(fm_raw);
 out:
+	if (ret == UBI_BAD_FASTMAP)
+		ubi_err("Attach by fastmap failed, doing a full scan!");
+
 	return ret;
 }
 
-- 
1.7.6.5
