Received: from mtagate6.uk.ibm.com ([195.212.29.139])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGXRw-00087E-84
	for linux-mtd@lists.infradead.org; Mon, 12 Feb 2007 09:26:20 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate6.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l1C9I4uo187154
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 09:18:04 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l1C9I4oL590038
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 09:18:04 GMT
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l1C9I4qI010694
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 09:18:04 GMT
Received: from dyn-9-152-251-65.boeblingen.de.ibm.com
	(dyn-9-152-251-65.boeblingen.de.ibm.com [9.152.251.65])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.12.11) with ESMTP
	id l1C9I37k010679
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 09:18:04 GMT
From: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] UBI: Fix counting of ec value
MIME-Version: 1.0
Content-Disposition: inline
Date: Mon, 12 Feb 2007 10:16:40 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200702121016.40516.lindhors@linux.vnet.ibm.com>
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
 drivers/mtd/ubi/wl.c |   27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

--- ubi-2.6.git.orig/drivers/mtd/ubi/wl.c
+++ ubi-2.6.git/drivers/mtd/ubi/wl.c
@@ -1395,34 +1395,37 @@ bitflip:
 static int sync_erase(const struct ubi_info *ubi, struct ubi_wl_entry *e,
 		      int torture)
 {
-	int err;
+	int err, ret;
 	struct ubi_ec_hdr *ec_hdr;
 	struct ubi_wl_info *wl = ubi->wl;
-	uint64_t ec = e->ec + 1;
+	uint64_t ec = e->ec;
 
-	dbg_wl("erase PEB %d, new EC %lld", e->pnum, (long long)ec);
+	dbg_wl("erase PEB %d, old EC %lld", e->pnum, (long long)ec);
 
 	err = paranoid_check_ec(ubi, e->pnum, e->ec);
 	if (unlikely(err > 0))
 		return -EINVAL;
 
+	ec_hdr = ubi_zalloc_ec_hdr(ubi);
+	if (unlikely(!ec_hdr))
+		return -ENOMEM;
+
+	ret = err = ubi_io_sync_erase(ubi, e->pnum, torture);
+	if (unlikely(err < 0))
+		goto out_free;
+
+	ec += ret;
 	if (unlikely(ec > UBI_MAX_ERASECOUNTER)) {
 		/*
 		 * Erase counter overflow. Upgrade UBI and use 64-bit
 		 * erase counters internally.
 		 */
 		ubi_err("erase counter overflow at PEB %d, EC %d",
-			e->pnum, e->ec);
+			e->pnum, ec);
 		return -EINVAL;
 	}
 
-	ec_hdr = ubi_zalloc_ec_hdr(ubi);
-	if (unlikely(!ec_hdr))
-		return -ENOMEM;
-
-	err = ubi_io_sync_erase(ubi, e->pnum, torture);
-	if (unlikely(err < 0))
-		goto out_free;
+	dbg_wl("erased PEB %d, new EC %lld", e->pnum, (long long)ec);
 
 	ec_hdr->ec = cpu_to_ubi64(ec);
 
@@ -1430,7 +1433,7 @@ static int sync_erase(const struct ubi_i
 	if (unlikely(err))
 		goto out_free;
 
-	e->ec += 1;
+	e->ec = ec;
 	if (e->ec > wl->max_ec)
 		wl->max_ec = e->ec;
 
