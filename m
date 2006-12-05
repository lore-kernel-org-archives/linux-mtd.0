Received: from mtagate6.uk.ibm.com ([195.212.29.139])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GrVwh-0007d8-BQ
	for linux-mtd@lists.infradead.org; Tue, 05 Dec 2006 08:46:39 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate6.uk.ibm.com (8.13.8/8.13.8) with ESMTP id kB58kDAB258568
	for <linux-mtd@lists.infradead.org>; Tue, 5 Dec 2006 08:46:13 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with
	ESMTP id kB58kCBF2949366
	for <linux-mtd@lists.infradead.org>; Tue, 5 Dec 2006 08:46:12 GMT
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id kB58kC8Y007518
	for <linux-mtd@lists.infradead.org>; Tue, 5 Dec 2006 08:46:12 GMT
Received: from dyn-9-152-251-65.boeblingen.de.ibm.com
	(dyn-9-152-251-65.boeblingen.de.ibm.com [9.152.251.65])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.12.11) with ESMTP
	id kB58kCJh007515
	for <linux-mtd@lists.infradead.org>; Tue, 5 Dec 2006 08:46:12 GMT
From: Timo Lindhorst <lindhors@vnet.ibm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD-UTILS] nanddump.c: fix up long_options
MIME-Version: 1.0
Content-Disposition: inline
Date: Tue, 5 Dec 2006 09:46:11 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200612050946.11666.lindhors@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the missing long option '--file'.

From: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
Signed-off-by: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
---
 nanddump.c |    1 +
 1 file changed, 1 insertion(+)

--- mtd-utils.git.orig/nanddump.c
+++ mtd-utils.git/nanddump.c
@@ -91,6 +91,7 @@ void process_options (int argc, char *ar
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 0},
 			{"version", no_argument, 0, 0},
+			{"file", required_argument, 0, 'f'},
 			{"ignoreerrors", no_argument, 0, 'i'},
 			{"prettyprint", no_argument, 0, 'p'},
 			{"omitoob", no_argument, 0, 'o'},
