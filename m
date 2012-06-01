Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb0-0001g8-Q7
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:01 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/23] UBI: Fastmap: Fix EC overflow calculation
Date: Fri,  1 Jun 2012 17:16:22 +0200
Message-Id: <1338563804-85990-2-git-send-email-richard@nod.at>
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

Checking for an overflow without a be64_to_cpu() make no sense...

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 2ba2a80..56479df 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1163,6 +1163,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		/* no fresh early PEB was found, reuse the old one */
 		if (new_fm->e[0]->pnum < 0) {
 			struct ubi_ec_hdr *ec_hdr;
+			long long ec;
 
 			ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 			if (!ec_hdr) {
@@ -1193,8 +1194,9 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				return ret;
 			}
 
-			ec_hdr->ec += ret;
-			if (ec_hdr->ec > UBI_MAX_ERASECOUNTER) {
+			ec = be64_to_cpu(ec_hdr->ec);
+			ec += ret;
+			if (ec > UBI_MAX_ERASECOUNTER) {
 				ubi_err("Erase counter overflow!");
 				kfree(new_fm);
 				kfree(ec_hdr);
-- 
1.7.6.5
