Received: from gateway24.websitewelcome.com ([192.185.50.71])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8LUX-0006Vo-SP
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2018 08:30:28 +0000
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway24.websitewelcome.com (Postfix) with ESMTP id 60F6D6D6B
 for <linux-mtd@lists.infradead.org>; Fri,  5 Oct 2018 03:29:34 -0500 (CDT)
Date: Fri, 5 Oct 2018 10:29:31 +0200
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] UBI: mark expected switch fall-throughs
Message-ID: <20181005082931.GA15474@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Addresses-Coverity-ID: 1373884 ("Missing break in switch")
Addresses-Coverity-ID: 114869 ("Missing break in switch")
Addresses-Coverity-ID: 114870 ("Missing break in switch")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/ubi/attach.c | 1 +
 drivers/mtd/ubi/build.c  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 93ceea4..e294d39 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1072,6 +1072,7 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			 * be a result of power cut during erasure.
 			 */
 			ai->maybe_bad_peb_count += 1;
+		/* fall through */
 	case UBI_IO_BAD_HDR:
 			/*
 			 * If we're facing a bad VID header we have to drop *all*
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index d2a7266..a4e3454 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1334,8 +1334,10 @@ static int bytes_str_to_int(const char *str)
 	switch (*endp) {
 	case 'G':
 		result *= 1024;
+		/* fall through */
 	case 'M':
 		result *= 1024;
+		/* fall through */
 	case 'K':
 		result *= 1024;
 		if (endp[1] == 'i' && endp[2] == 'B')
-- 
2.7.4
