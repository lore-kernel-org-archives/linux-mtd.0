Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TSN9p-0001JA-O0
 for linux-mtd@lists.infradead.org; Sun, 28 Oct 2012 07:19:43 +0000
Received: by mail-da0-f49.google.com with SMTP id q27so1746303daj.36
 for <linux-mtd@lists.infradead.org>; Sun, 28 Oct 2012 00:19:39 -0700 (PDT)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH 3/9] mtd: mtd_nandecctest: use random32_get_bytes instead of
 get_random_bytes()
Date: Sun, 28 Oct 2012 16:19:00 +0900
Message-Id: <1351408746-8623-3-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1351408746-8623-1-git-send-email-akinobu.mita@gmail.com>
References: <1351408746-8623-1-git-send-email-akinobu.mita@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using random32_get_bytes() is enough.  Because this data is only used
for testing, not used for cryptographic use.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/mtd_nandecctest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index a5fb9b0..0ddcbec 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -253,7 +253,7 @@ static int nand_ecc_test_run(const size_t size)
 		goto error;
 	}
 
-	get_random_bytes(correct_data, size);
+	random32_get_bytes(correct_data, size);
 	__nand_calculate_ecc(correct_data, size, correct_ecc);
 
 	for (i = 0; i < ARRAY_SIZE(nand_ecc_test); i++) {
-- 
1.7.11.7
