Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCtGf-0007QY-VL
	for linux-mtd@lists.infradead.org; Fri, 02 Feb 2007 02:55:36 -0500
Received: from esebh108.NOE.Nokia.com (esebh108.ntc.nokia.com [172.21.143.145])
	by mgw-ext12.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l127rInp016135
	for <linux-mtd@lists.infradead.org>; Fri, 2 Feb 2007 09:53:28 +0200
Message-ID: <45C2EE39.7050909@nokia.com>
Date: Fri, 02 Feb 2007 09:54:33 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] OneNAND: Do not allow oob write past end of page
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From ba01b89188f21ca9a982e33452217e5c6874fd0b Mon Sep 17 00:00:00 2001
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date: Thu, 1 Feb 2007 16:04:50 +0200
Subject: [MTD] OneNAND: Do not allow oob write past end of page

OneNAND can write oob to successive pages, but NAND
does not do that.  For compatibility, disallow OneNAND
from writing past the end of the page.

Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 9ec28bb..b7da84a 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1191,6 +1191,13 @@ static int onenand_do_write_oob(struct m
 		return -EINVAL;
 	}
 
+	/* For compatibility with NAND: Do not allow write past end of page */
+	if (column + len > oobsize) {
+		DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: "
+		      "Attempt to write past end of page\n");
+		return -EINVAL;
+	}
+
 	/* Do not allow reads past end of device */
 	if (unlikely(to >= mtd->size ||
 		     column + len > ((mtd->size >> this->page_shift) -
-- 
1.4.3
