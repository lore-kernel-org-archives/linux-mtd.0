Received: from mtagate6.uk.ibm.com ([195.212.29.139])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGXLo-0007hM-WE
	for linux-mtd@lists.infradead.org; Mon, 12 Feb 2007 09:20:01 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate6.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l1C9H1uu188668
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 09:17:01 GMT
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l1C9H1qi610552
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 09:17:01 GMT
Received: from d06av01.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l1C9H1De022851
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 09:17:01 GMT
Received: from dyn-9-152-251-65.boeblingen.de.ibm.com
	(dyn-9-152-251-65.boeblingen.de.ibm.com [9.152.251.65])
	by d06av01.portsmouth.uk.ibm.com (8.12.11.20060308/8.12.11) with ESMTP
	id l1C9H1tx022845
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 09:17:01 GMT
From: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] UBI: fix parameter description of mtd_read
MIME-Version: 1.0
Content-Disposition: inline
Date: Mon, 12 Feb 2007 10:15:37 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200702121015.37415.lindhors@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix the parameter description of mtd_read in io.c

Signed-off-by: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/io.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- ubi-2.6.git.orig/drivers/mtd/ubi/io.c
+++ ubi-2.6.git/drivers/mtd/ubi/io.c
@@ -66,7 +66,7 @@ static int paranoid_check_all_ff(const s
 /**
  * mtd_read - read data from flash.
  *
- * @ubi: the UBI device description object
+ * @io: I/O unit description object
  * @buf: a buffer where to store the read data
  * @pnum: physical eraseblock number to read from
  * @offset: offset to read from
