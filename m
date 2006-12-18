Received: from mtagate1.de.ibm.com ([195.212.29.150])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GwI3z-0006Jz-Gj
	for linux-mtd@lists.infradead.org; Mon, 18 Dec 2006 12:57:55 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate1.de.ibm.com (8.13.8/8.13.8) with ESMTP id kBICvgKC195818
	for <linux-mtd@lists.infradead.org>; Mon, 18 Dec 2006 12:57:42 GMT
Received: from d12av01.megacenter.de.ibm.com (d12av01.megacenter.de.ibm.com
	[9.149.165.212])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with
	ESMTP id kBICvg8Y2867350
	for <linux-mtd@lists.infradead.org>; Mon, 18 Dec 2006 13:57:42 +0100
Received: from d12av01.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av01.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id kBICvfan022983
	for <linux-mtd@lists.infradead.org>; Mon, 18 Dec 2006 13:57:42 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: "Artem, " <dedekind@infradead.org>
Subject: [PATCH] UBI: fix errorhandling in ioctl
Date: Mon, 18 Dec 2006 13:57:35 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200612181357.35365.alexs@linux.vnet.ibm.com>
Cc: "linux-mtd@lists.infradead.org, " <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

the double declaration of "int err" makes the ioctl() for resizing volumes
always return 0, even if errors occured during the resizing procedure.

I hope the patch applies this time, i double checked it...

Kind regards,
Alexander Schmidt

Signed-off-by: Alexander Schmidt, <alexs@linux.vnet.ibm.com>
---
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 469cc47..be304dc 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -824,7 +824,7 @@ out_free:
 	/* Re-size volume command */
 	case UBI_IOCRSVOL:
 	{
-		int err, rem, pebs;
+		int rem, pebs;
 		uint64_t tmp;
 		const struct ubi_vtbl_vtr *vtr;
 		struct ubi_rsvol_req req;
