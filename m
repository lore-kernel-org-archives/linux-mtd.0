Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H4fJl-0001yp-B5
	for linux-mtd@lists.infradead.org; Wed, 10 Jan 2007 10:24:48 -0500
Message-ID: <45A5050D.4010400@nokia.com>
Date: Wed, 10 Jan 2007 17:23:57 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH] [MTD] OneNAND: Return an error if a read timeout occurs
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If OneNAND is operating within specification, all operations
should easily be completed within the 20 millisecond timeout.
This patch faithlessly adds a check for the timeout and returns
an error in that case.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 02ad959..ff85a4f 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -333,6 +333,9 @@ static int onenand_wait(struct mtd_info 
 			} else if (ecc & ONENAND_ECC_1BIT_ALL)
 				mtd->ecc_stats.corrected++;
 		}
+	} else if (state == FL_READING) {
+		printk(KERN_ERR "onenand_wait: read timeout! ctrl=0x%04x intr=0x%04x\n", ctrl, interrupt);
+		return -EIO;
 	}
 
 	return 0;
-- 
1.4.3
