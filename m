Received: from wip-ectls-mx1.wipro.com ([203.91.193.21])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HxyWD-0003cy-6n
	for linux-mtd@lists.infradead.org; Tue, 12 Jun 2007 01:02:18 -0400
Subject: [PATCH]is_power_of_2-mtd/ubi/build.c
From: vignesh babu <vignesh.babu@wipro.com>
To: dwmw2@infradead.org, dedekind@infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Jun 2007 10:31:05 +0530
Message-Id: <1181624466.3109.23.camel@merlin.linuxcoe.com>
Mime-Version: 1.0
Cc: Kernel Janitors List <kernel-janitors@lists.osdl.org>,
	linux-mtd@lists.infradead.org
Reply-To: vignesh.babu@wipro.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 555d594..54e923f 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -33,6 +33,7 @@
 #include <linux/moduleparam.h>
 #include <linux/stringify.h>
 #include <linux/stat.h>
+#include <linux/log2.h>
 #include "ubi.h"
 
 /* Maximum length of the 'mtd=' parameter */
@@ -422,8 +423,7 @@ static int io_init(struct ubi_device *ubi)
 	ubi->hdrs_min_io_size = ubi->mtd->writesize >> ubi->mtd->subpage_sft;
 
 	/* Make sure minimal I/O unit is power of 2 */
-	if (ubi->min_io_size == 0 ||
-	    (ubi->min_io_size & (ubi->min_io_size - 1))) {
+	if (!is_power_of_2(ubi->min_io_size)) {
 		ubi_err("bad min. I/O unit");
 		return -EINVAL;
 	}

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"



The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments. 

WARNING: Computer viruses can be transmitted via email. The recipient should check this email and any attachments for the presence of viruses. The company accepts no liability for any damage caused by any virus transmitted by this email.
 
www.wipro.com
