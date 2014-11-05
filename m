Received: from mail-ig0-f178.google.com ([209.85.213.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm3ww-0002tR-O6
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 17:00:51 +0000
Received: by mail-ig0-f178.google.com with SMTP id a13so1715566igq.17
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 09:00:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/11] mtd: nand: WARN() if EEC Bytes per page is larger
 than the OOB
Date: Wed,  5 Nov 2014 16:59:48 +0000
Message-Id: <1415206793-25670-7-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1415206793-25670-1-git-send-email-lee.jones@linaro.org>
References: <1415206793-25670-1-git-send-email-lee.jones@linaro.org>
Cc: pekon@pek-sem.com, computersforpeace@gmail.com, lee.jones@linaro.org,
 kernel@stlinux.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

EEC information is held in the Out-Of-Bounds (OOB) area, so can not be
larger than the area it's stored in.  If the math is out, we issue a
warning to the user.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/nand_base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4f3e80c..d0ebb05 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4063,6 +4063,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 	}
 	ecc->total = ecc->steps * ecc->bytes;
 
+	WARN_ON(ecc->total > mtd->oobsize);
+
 	/* Allow subpage writes up to ecc.steps. Not possible for MLC flash */
 	if (!(chip->options & NAND_NO_SUBPAGE_WRITE) && nand_is_slc(chip)) {
 		switch (ecc->steps) {
-- 
1.9.1
