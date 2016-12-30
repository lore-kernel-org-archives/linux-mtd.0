Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cN0lq-0007AD-0g
 for linux-mtd@lists.infradead.org; Fri, 30 Dec 2016 17:15:11 +0000
Received: by mail-lf0-x241.google.com with SMTP id x140so20668614lfa.2
 for <linux-mtd@lists.infradead.org>; Fri, 30 Dec 2016 09:14:48 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH RFC 1/2] ubi: add flags1 field to the EC header
Date: Fri, 30 Dec 2016 18:11:50 +0100
Message-Id: <20161230171151.13448-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

It allows storing extra information about header or a whole PEB.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/ubi/ubi-media.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 22ed3f6..58065ef 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -125,6 +125,7 @@ enum {
  * @magic: erase counter header magic number (%UBI_EC_HDR_MAGIC)
  * @version: version of UBI implementation which is supposed to accept this
  *           UBI image
+ * @flags1: flags describing header/block
  * @padding1: reserved for future, zeroes
  * @ec: the erase counter
  * @vid_hdr_offset: where the VID header starts
@@ -157,7 +158,8 @@ enum {
 struct ubi_ec_hdr {
 	__be32  magic;
 	__u8    version;
-	__u8    padding1[3];
+	__u8	flags1;
+	__u8    padding1[2];
 	__be64  ec; /* Warning: the current limit is 31-bit anyway! */
 	__be32  vid_hdr_offset;
 	__be32  data_offset;
-- 
2.10.1
