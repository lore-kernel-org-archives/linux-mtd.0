Received: from mail-ew0-f172.google.com ([209.85.219.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LfCQB-0000OW-Uk
	for linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 12:11:30 +0000
Received: by ewy20 with SMTP id 20so3354247ewy.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Mar 2009 04:11:26 -0800 (PST)
Message-ID: <49AFC16E.5090904@gmail.com>
Date: Thu, 05 Mar 2009 13:11:26 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: [PATCH] maps: test before subtraction on unsigned long intel1size
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found this by code inspection, I could be wrong, but isn't a test required
before this subtraction? note that intel1size is unsigned long.
Also I noted that the file makes extensive use of volatile. is that necessary?
------------------------------>8-------------8<---------------------------------
Test before subtraction on unsigned long intel1size.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/drivers/mtd/maps/nettel.c b/drivers/mtd/maps/nettel.c
index a97133e..ed2fc83 100644
--- a/drivers/mtd/maps/nettel.c
+++ b/drivers/mtd/maps/nettel.c
@@ -349,11 +349,12 @@ static int __init nettel_init(void)
 		goto out_unmap1;
 	}
 
-	intel1size = intel_mtd->size - intel0size;
-	if (intel1size > 0) {
+	if (intel_mtd->size > intel0size) {
+		intel1size = intel_mtd->size - intel0size;
 		*intel1par = SC520_PAR(intel1cs, intel1addr, intel1size);
 		__asm__ ("wbinvd");
 	} else {
+		intel1size = 0;
 		*intel1par = 0;
 	}
 
