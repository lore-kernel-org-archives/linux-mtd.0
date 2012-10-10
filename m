Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TM0EA-0003iS-80
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 17:37:50 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so993478pbc.36
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 10:37:46 -0700 (PDT)
Message-ID: <5075B24F.4050606@gmail.com>
Date: Wed, 10 Oct 2012 23:07:19 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND 2/9] mtd_tests/mtd_nandecctest: Use pr_fmt macro
References: <5075B105.4080701@gmail.com>
In-Reply-To: <5075B105.4080701@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use KBUILD_MODNAME instead of hardcoding the filename

Signed-off-by: Vikram Narayanan <vikram186@gmail.com>
---
 drivers/mtd/tests/mtd_nandecctest.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/tests/mtd_nandecctest.c b/drivers/mtd/tests/mtd_nandecctest.c
index b437fa4..1eee264 100644
--- a/drivers/mtd/tests/mtd_nandecctest.c
+++ b/drivers/mtd/tests/mtd_nandecctest.c
@@ -1,3 +1,5 @@
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/list.h>
@@ -264,13 +266,13 @@ static int nand_ecc_test_run(const size_t size)
 						correct_data, size);
 
 		if (err) {
-			pr_err("mtd_nandecctest: not ok - %s-%zd\n",
+			pr_err("not ok - %s-%zd\n",
 				nand_ecc_test[i].name, size);
 			dump_data_ecc(error_data, error_ecc,
 				correct_data, correct_ecc, size);
 			break;
 		}
-		pr_info("mtd_nandecctest: ok - %s-%zd\n",
+		pr_info("ok - %s-%zd\n",
 			nand_ecc_test[i].name, size);
 	}
 error:
-- 
1.7.4.1
