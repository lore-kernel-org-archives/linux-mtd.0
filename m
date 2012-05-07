Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRWiT-00071a-Q7
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 22:47:42 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: UBI: remove superfluous "!!" operation
Date: Tue,  8 May 2012 00:47:20 +0200
Message-Id: <1336430840-27232-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

!!(x < y) and (x < y) are identical expressions.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/scan.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 12c43b4..8d24435 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -337,7 +337,7 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_scan_leb *seb,
 	}
 
 	/* Obviously the LEB with lower sequence counter is older */
-	second_is_newer = !!(sqnum2 > seb->sqnum);
+	second_is_newer = (sqnum2 > seb->sqnum);
 
 	/*
 	 * Now we know which copy is newer. If the copy flag of the PEB with
-- 
1.7.7.3
