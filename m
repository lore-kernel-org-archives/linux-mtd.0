Received: from mail-we0-f176.google.com ([74.125.82.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wr7EP-0004F9-Cy
 for linux-mtd@lists.infradead.org; Sun, 01 Jun 2014 14:59:30 +0000
Received: by mail-we0-f176.google.com with SMTP id q59so4071231wes.35
 for <linux-mtd@lists.infradead.org>; Sun, 01 Jun 2014 07:59:06 -0700 (PDT)
From: Simon Boulay <simon.boulay@alkeona.net>
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Subject: [PATCH] staging/mt29f_spinand: coding style fixes
Date: Sun,  1 Jun 2014 16:57:44 +0200
Message-Id: <d3452f78c071d7bc1906af76e08ef5595035c472.1401633743.git.simon.boulay@alkeona.net>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd@lists.infradead.org, Mona Anonuevo <manonuevo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes coding style errors reported by checkpatch.pl.
It adds new lines after declarations in two places.

Signed-off-by: Simon Boulay <simon.boulay@alkeona.net>
---
 drivers/staging/mt29f_spinand/mt29f_spinand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/staging/mt29f_spinand/mt29f_spinand.c
index 5a40925..3464e0c 100644
--- a/drivers/staging/mt29f_spinand/mt29f_spinand.c
+++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c
@@ -699,6 +699,7 @@ static void spinand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 {

 	struct spinand_state *state = mtd_to_state(mtd);
+
 	memcpy(state->buf + state->buf_ptr, buf, len);
 	state->buf_ptr += len;
 }
@@ -706,6 +707,7 @@ static void spinand_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
 static void spinand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	struct spinand_state *state = mtd_to_state(mtd);
+
 	memcpy(buf, state->buf + state->buf_ptr, len);
 	state->buf_ptr += len;
 }
--
1.9.3
