Received: from mail-yw0-x242.google.com ([2607:f8b0:4002:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eFG2e-0002U7-KN
 for linux-mtd@lists.infradead.org; Thu, 16 Nov 2017 09:01:06 +0000
Received: by mail-yw0-x242.google.com with SMTP id k3so18775662ywk.8
 for <linux-mtd@lists.infradead.org>; Thu, 16 Nov 2017 01:00:39 -0800 (PST)
MIME-Version: 1.0
From: Rock Lee <rockdotlee@gmail.com>
Date: Thu, 16 Nov 2017 17:00:37 +0800
Message-ID: <CAL-1w2upYyr=1C1c0t87AXo=m7ztYNvBoq4jxaSLWpxou_Omzg@mail.gmail.com>
Subject: [PATCH 2/2] libubigen: No need to calculate crc for each
 ubi_vtbl_record
To: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at
Cc: rli@sierrawireless.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When create empty volume table, no need to calculate crc for each
record.

Signed-off-by: Rock Lee <RLi@sierrawireless.com>
---
 lib/libubigen.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/libubigen.c b/lib/libubigen.c
index d2a949b..6ad8d5f 100644
--- a/lib/libubigen.c
+++ b/lib/libubigen.c
@@ -66,6 +66,7 @@ void ubigen_info_init(struct ubigen_info *ui, int
peb_size, int min_io_size,
 struct ubi_vtbl_record *ubigen_create_empty_vtbl(const struct ubigen_info *ui)
 {
  struct ubi_vtbl_record *vtbl;
+ uint32_t crc;
  int i;

  vtbl = calloc(1, ui->vtbl_size);
@@ -74,11 +75,9 @@ struct ubi_vtbl_record
*ubigen_create_empty_vtbl(const struct ubigen_info *ui)
  return NULL;
  }

- for (i = 0; i < ui->max_volumes; i++) {
- uint32_t crc = mtd_crc32(UBI_CRC32_INIT, &vtbl[i],
-     UBI_VTBL_RECORD_SIZE_CRC);
+ crc = mtd_crc32(UBI_CRC32_INIT, &vtbl[0], UBI_VTBL_RECORD_SIZE_CRC);
+ for (i = 0; i < ui->max_volumes; i++)
  vtbl[i].crc = cpu_to_be32(crc);
- }

  return vtbl;
 }
-- 
1.9.1
