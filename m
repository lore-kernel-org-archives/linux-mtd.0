Received: from mtagate6.uk.ibm.com ([195.212.29.139])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HM2Zr-00068F-1X
	for linux-mtd@lists.infradead.org; Tue, 27 Feb 2007 13:41:16 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate6.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l1RDYXvD103656
	for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2007 13:34:33 GMT
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l1RDYXOP1224706
	for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2007 13:34:33 GMT
Received: from d06av01.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l1RDYX9M018986
	for <linux-mtd@lists.infradead.org>; Tue, 27 Feb 2007 13:34:33 GMT
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Artem <dedekind@infradead.org>
Subject: [PATCH] [MTD] UBI: fix background thread define
Date: Tue, 27 Feb 2007 14:34:28 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200702271434.28774.alexs@linux.vnet.ibm.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

This patch renames DBG_ENABLE_BGT to DBG_DISABLE_BGT, which makes it more
obvious that the background thread should be enabled by default. The name
corresponds to the kernel config option now.

I also fixed the semantics on intialisation (bgt now gets enabled when
DBG_DISABLE_BGT == 0), and compilation with debugging disabled works again.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/build.c |    2 +-
 drivers/mtd/ubi/debug.h |    6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/build.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/build.c
@@ -266,7 +266,7 @@ static int attach_mtd_dev(const char *mt
 	ubi_msg("number of PEBs reserved for bad PEB handling: %d",
 		ubi->beb.reserved_pebs);
 
-	if (!DBG_ENABLE_BGT && !ubi->io.ro_mode)
+	if (!DBG_DISABLE_BGT && !ubi->io.ro_mode)
 		ubi_bgt_enable(ubi);
 
 	return 0;
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/debug.h
+++ dedekind-ubi-2.6/drivers/mtd/ubi/debug.h
@@ -30,9 +30,9 @@
 #ifdef CONFIG_MTD_UBI_DEBUG
 
 #ifdef CONFIG_MTD_UBI_DEBUG_DISABLE_BGT
-#define DBG_ENABLE_BGT 0
+#define DBG_DISABLE_BGT 1
 #else
-#define DBG_ENABLE_BGT 1
+#define DBG_DISABLE_BGT 0
 #endif
 #define UBI_DEBUG 1
 
@@ -142,6 +142,8 @@ void __exit ubi_dbg_close(void);
 
 #define UBI_DEBUG 0
 
+#define DBG_DISABLE_BGT 0
+
 #define ubi_assert(expr)    ({})
 
 #define dbg_err(fmt, ...)    ({})
