Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OEQmh-0002PU-GF
	for linux-mtd@lists.infradead.org; Tue, 18 May 2010 17:40:51 +0000
Received: by vws8 with SMTP id 8so2444004vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 May 2010 10:40:49 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 18 May 2010 23:10:49 +0530
Message-ID: <AANLkTimuYmRDCZCkoB9YHifngCwjp9_B2ucFQ1seaiM9@mail.gmail.com>
Subject: [PATCH] UBI: fix delete compatible internal volume scan
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch resolves a possible bug. Scan is adding delete compatible
blocks to both corr list and used list.
It should return after adding the block to corr list.

Signed-off-by: Brijesh Singh <brijesh.s.singh@gmail.com>
---
 drivers/mtd/ubi/scan.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 6b7c0c4..fde15f1 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -845,7 +845,7 @@ static int process_eb(struct ubi_device *ubi,
struct ubi_scan_info *si,
                        err = add_to_list(si, pnum, ec, &si->corr);
                        if (err)
                                return err;
-                       break;
+                       return 0;

                case UBI_COMPAT_RO:
                        ubi_msg("read-only compatible internal volume %d:%d"
--
