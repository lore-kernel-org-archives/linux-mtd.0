Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Te4vJ-00053b-ER
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2012 14:17:05 +0000
Date: Thu, 29 Nov 2012 17:16:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtg: docg3: potential divide by zero in doc_write_oob()
Message-ID: <20121129141651.GA12199@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ivan Djelic <ivan.djelic@parrot.com>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we set oobdelta to zero then we will either return -EINVAL or hit
a divide (modulus) by zero on the next line when we check
"(ooblen % oobdelta)".  It's better to just return -EINVAL here instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  I don't know if it's actually possible to hit this
condition.

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index d34d83b..8510ccb 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1440,7 +1440,7 @@ static int doc_write_oob(struct mtd_info *mtd, loff_t ofs,
 		oobdelta = mtd->ecclayout->oobavail;
 		break;
 	default:
-		oobdelta = 0;
+		return -EINVAL;
 	}
 	if ((len % DOC_LAYOUT_PAGE_SIZE) || (ooblen % oobdelta) ||
 	    (ofs % DOC_LAYOUT_PAGE_SIZE))
