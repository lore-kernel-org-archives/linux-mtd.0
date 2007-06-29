Received: from mtagate1.de.ibm.com ([195.212.29.150])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I4Dzj-0004l0-81
	for linux-mtd@lists.infradead.org; Fri, 29 Jun 2007 11:46:32 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate1.de.ibm.com (8.13.8/8.13.8) with ESMTP id l5TAkPFG091422
	for <linux-mtd@lists.infradead.org>; Fri, 29 Jun 2007 10:46:25 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.3) with
	ESMTP id l5TAkP9X2101260
	for <linux-mtd@lists.infradead.org>; Fri, 29 Jun 2007 12:46:25 +0200
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l5TAkOB2020752
	for <linux-mtd@lists.infradead.org>; Fri, 29 Jun 2007 12:46:24 +0200
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI-Utils: ubimirror discards returncode
Date: Fri, 29 Jun 2007 12:46:11 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200706291246.11487.alexs@linux.vnet.ibm.com>
Cc: Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ubimirror compares volumes before they are mirrored, but discards the
result of the comparison and alway copies volumes.

I've tested this code with equal and unequal volumes and it seems to work
fine now.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 ubi-utils/src/libubimirror.c |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

--- mtd-utils.orig/ubi-utils/src/libubimirror.c
+++ mtd-utils/ubi-utils/src/libubimirror.c
@@ -190,11 +190,13 @@ int ubimirror(uint32_t devno, int seqnum
 		if (rc < 0) {
 			EBUF("compare error volume %d and %d", src_id, ids[i]);
 			goto err;
-		}
-		rc = copy_files(fd_in, fd_out);
-		if (rc != 0) {
-			EBUF("mirror error volume %d to %d", src_id, ids[i]);
-			goto err;
+		} else if (rc == compare_different) {
+			rc = copy_files(fd_in, fd_out);
+			if (rc != 0) {
+				EBUF("mirror error volume %d to %d", src_id,
+						ids[i]);
+				goto err;
+			}
 		}
 		if ((rc = ubi_vol_close(fd_out)) == -1) {
 			EBUF("close error volume %d", ids[i]);
