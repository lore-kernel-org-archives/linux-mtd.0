Received: from mtagate8.uk.ibm.com ([195.212.29.141])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGcgK-0002T3-RC
	for linux-mtd@lists.infradead.org; Mon, 12 Feb 2007 15:01:33 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate8.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l1CF1F4P172672
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 15:01:15 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l1CF1FFx602322
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 15:01:15 GMT
Received: from d06av03.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l1CF1F9I023981
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 15:01:15 GMT
Received: from dyn-9-152-251-65.boeblingen.de.ibm.com
	(dyn-9-152-251-65.boeblingen.de.ibm.com [9.152.251.65])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.12.11) with ESMTP
	id l1CF1F0Y023966
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 15:01:15 GMT
From: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH take 2] [MTD] UBI: Fix counting of ec value
MIME-Version: 1.0
Content-Disposition: inline
Date: Mon, 12 Feb 2007 15:59:50 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200702121559.50774.lindhors@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the torture is triggered on a peb, the block is erased more than
once. So the ec value should be increased accordingly.
ubi_io_sync_erase returns the number of erasures made, so this value
can be used instead of a static 1.

Signed-off-by: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/wl.c |   30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

--- ubi-2.6.git.orig/drivers/mtd/ubi/wl.c
+++ ubi-2.6.git/drivers/mtd/ubi/wl.c
@@ -1398,24 +1398,14 @@ static int sync_erase(const struct ubi_i
 	int err;
 	struct ubi_ec_hdr *ec_hdr;
 	struct ubi_wl_info *wl = ubi->wl;
-	uint64_t ec = e->ec + 1;
+	uint64_t ec = e->ec;
 
-	dbg_wl("erase PEB %d, new EC %lld", e->pnum, (long long)ec);
+	dbg_wl("erase PEB %d, old EC %llu", e->pnum, (unsigned long long)ec);
 
 	err = paranoid_check_ec(ubi, e->pnum, e->ec);
 	if (unlikely(err > 0))
 		return -EINVAL;
 
-	if (unlikely(ec > UBI_MAX_ERASECOUNTER)) {
-		/*
-		 * Erase counter overflow. Upgrade UBI and use 64-bit
-		 * erase counters internally.
-		 */
-		ubi_err("erase counter overflow at PEB %d, EC %d",
-			e->pnum, e->ec);
-		return -EINVAL;
-	}
-
 	ec_hdr = ubi_zalloc_ec_hdr(ubi);
 	if (unlikely(!ec_hdr))
 		return -ENOMEM;
@@ -1424,13 +1414,27 @@ static int sync_erase(const struct ubi_i
 	if (unlikely(err < 0))
 		goto out_free;
 
+	ec += err;
+	if (unlikely(ec > UBI_MAX_ERASECOUNTER)) {
+		/*
+		 * Erase counter overflow. Upgrade UBI and use 64-bit
+		 * erase counters internally.
+		 */
+		ubi_err("erase counter overflow at PEB %d, EC %llu",
+			e->pnum, (unsigned long long)ec);
+		err = -EINVAL;
+		goto out_free;
+	}
+
+	dbg_wl("erased PEB %d, new EC %llu", e->pnum, (unsigned long long)ec);
+
 	ec_hdr->ec = cpu_to_ubi64(ec);
 
 	err = ubi_io_write_ec_hdr(ubi, e->pnum, ec_hdr);
 	if (unlikely(err))
 		goto out_free;
 
-	e->ec += 1;
+	e->ec = ec;
 	if (e->ec > wl->max_ec)
 		wl->max_ec = e->ec;
 
