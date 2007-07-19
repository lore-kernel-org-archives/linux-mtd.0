Received: from wr-out-0506.google.com ([64.233.184.228])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IBbaU-0008AU-T6
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 15:23:00 -0400
Received: by wr-out-0506.google.com with SMTP id 58so883951wri
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Jul 2007 12:22:55 -0700 (PDT)
Message-ID: <469FBA01.80107@gmail.com>
Date: Thu, 19 Jul 2007 15:22:41 -0400
From: Florin Malita <fmalita@gmail.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: [PATCH] UBI: potential leak in ubi_scan_erase_peb
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Coverity (1769) found the following problem: if the erase counter 
overflow check triggers, ec_hdr is leaked.

Moving the allocation after the overflow check should take care of it.


Signed-off-by: Florin Malita <fmalita@gmail.com>
---

 drivers/mtd/ubi/scan.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 94ee549..80c73d8 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -673,10 +673,6 @@ int ubi_scan_erase_peb(const struct ubi_device *ubi,
 	int err;
 	struct ubi_ec_hdr *ec_hdr;
 
-	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
-	if (!ec_hdr)
-		return -ENOMEM;
-
 	if ((long long)ec >= UBI_MAX_ERASECOUNTER) {
 		/*
 		 * Erase counter overflow. Upgrade UBI and use 64-bit
@@ -686,6 +682,10 @@ int ubi_scan_erase_peb(const struct ubi_device *ubi,
 		return -EINVAL;
 	}
 
+	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
+	if (!ec_hdr)
+		return -ENOMEM;
+
 	ec_hdr->ec = cpu_to_be64(ec);
 
 	err = ubi_io_sync_erase(ubi, pnum, 0);
