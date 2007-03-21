Received: from mtagate5.uk.ibm.com ([195.212.29.138])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HU2Po-0007iv-72
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 15:07:56 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate5.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l2LF7diY324778
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 15:07:39 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.3) with
	ESMTP id l2LF7duS2019330
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 15:07:39 GMT
Received: from d06av03.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l2LF7cVI004215
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 15:07:38 GMT
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Artem.Bityutskiy@nokia.com,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] UBI: fix typos in wl.c
Date: Wed, 21 Mar 2007 16:07:30 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703211607.30931.alexs@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/wl.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/wl.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/wl.c
@@ -811,7 +811,7 @@ static int schedule_erase(struct ubi_dev
  * @wrk: the work object
  * @cancel: non-zero if the worker has to free memory and exit
  *
- * This function copies a less worn out physical eraseblock to a more worn out
+ * This function copies a more worn out physical eraseblock to a less worn out
  * one. Returns zero in case of success and a negative error code in case of
  * failure.
  */
@@ -891,7 +891,7 @@ static int wear_leveling_worker(struct u
 	ubi_assert(!ubi->move_from && !ubi->move_to);
 	ubi_assert(!ubi->move_to_put && !ubi->move_from_put);
 	ubi->move_from = e1;
-	ubi->move_to = e1;
+	ubi->move_to = e2;
 	spin_unlock(&ubi->wl_lock);
 
 	/*
