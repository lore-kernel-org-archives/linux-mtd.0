Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NKhrV-0003av-61
	for linux-mtd@lists.infradead.org; Wed, 16 Dec 2009 00:35:33 +0000
Received: by ewy21 with SMTP id 21so538992ewy.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Dec 2009 16:35:26 -0800 (PST)
Message-ID: <4B282BBD.4050106@gmail.com>
Date: Wed, 16 Dec 2009 01:37:17 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: Kyungmin Park <kyungmin.park@samsung.com>,
	linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] OneNAND: Fix test of unsigned in onenand_otp_walk()
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd->writesize and len are unsigned so the test does not work.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
you can test this with:

#include <stdio.h>

int main()
{
        int c = 1, d = 1;
        unsigned a = 30;
        unsigned b = 10;

        if ((b * c) - (d + a) < 0)
                printf("good\n");
        else
                printf("bad\n");
        return 0;
}


diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index ff66e43..cbe2711 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2725,7 +2725,7 @@ static int onenand_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 	}
 
 	/* Check User/Factory boundary */
-	if (((mtd->writesize * otp_pages) - (from + len)) < 0)
+	if (mtd->writesize * otp_pages < from + len)
 		return 0;
 
 	onenand_get_device(mtd, FL_OTPING);
