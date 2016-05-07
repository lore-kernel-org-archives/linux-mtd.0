Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1az4nk-0003xu-TI
 for linux-mtd@lists.infradead.org; Sat, 07 May 2016 16:09:57 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, dedekind1@gmail.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubi: Don't read back all data in ubi_eba_copy_leb()
Date: Sat,  7 May 2016 18:09:18 +0200
Message-Id: <1462637358-8151-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drop this paranoia check from the old days.
If our MTD driver or the flash is so bad that we even cannot
trust it to write data we have bigger problems.

If one really does not trust the flash and wants write-verify
she can enable UBI io checks using debugfs.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/eba.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index d628d45..3280387 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1298,32 +1298,6 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		}
 
 		cond_resched();
-
-		/*
-		 * We've written the data and are going to read it back to make
-		 * sure it was written correctly.
-		 */
-		memset(ubi->peb_buf, 0xFF, aldata_size);
-		err = ubi_io_read_data(ubi, ubi->peb_buf, to, 0, aldata_size);
-		if (err) {
-			if (err != UBI_IO_BITFLIPS) {
-				ubi_warn(ubi, "error %d while reading data back from PEB %d",
-					 err, to);
-				if (is_error_sane(err))
-					err = MOVE_TARGET_RD_ERR;
-			} else
-				err = MOVE_TARGET_BITFLIPS;
-			goto out_unlock_buf;
-		}
-
-		cond_resched();
-
-		if (crc != crc32(UBI_CRC32_INIT, ubi->peb_buf, data_size)) {
-			ubi_warn(ubi, "read data back from PEB %d and it is different",
-				 to);
-			err = -EINVAL;
-			goto out_unlock_buf;
-		}
 	}
 
 	ubi_assert(vol->eba_tbl[lnum] == from);
-- 
2.7.3
