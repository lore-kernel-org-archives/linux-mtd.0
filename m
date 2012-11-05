Received: from blu0-omc1-s6.blu0.hotmail.com ([65.55.116.17])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TVRHy-0005fd-5r
 for linux-mtd@lists.infradead.org; Mon, 05 Nov 2012 18:20:47 +0000
Message-ID: <BLU0-SMTP90A53F512B3AC4BEA5374B8640@phx.gbl>
From: Bill Pringlemeir <bpringle@sympatico.ca>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] ubi-test/io_update: ubi_leb_change_start() no longer uses
 'dtype'.
Date: Mon, 5 Nov 2012 12:38:36 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This will not compile for me (due to bit rot?).  Maybe the program is
never used?

Signed-off-by: Bill Pringlemeir <bpringlemeir@nbsps.com>
---
 tests/ubi-tests/io_update.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/ubi-tests/io_update.c b/tests/ubi-tests/io_update.c
index e8f0986..ec109e0 100644
--- a/tests/ubi-tests/io_update.c
+++ b/tests/ubi-tests/io_update.c
@@ -102,8 +102,7 @@ static int test_update1(struct ubi_vol_info *vol_info, int leb_change)
 		test_len = total_len - (rand() % (total_len / 10));
 
 		if (leb_change) {
-			if (ubi_leb_change_start(libubi, fd, 0, test_len,
-						 UBI_SHORTTERM)) {
+			if (ubi_leb_change_start(libubi, fd, 0, test_len)) {
 				failed("ubi_update_start");
 				goto close;
 			}
-- 
1.7.10.4
