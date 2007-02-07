Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HEo8g-0001Wl-FP
	for linux-mtd@lists.infradead.org; Wed, 07 Feb 2007 14:51:19 +0000
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l17Emxe4004536
	for <linux-mtd@lists.infradead.org>; Wed, 7 Feb 2007 09:48:59 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l17Emx0N502052
	for <linux-mtd@lists.infradead.org>; Wed, 7 Feb 2007 07:48:59 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l17EmwY4006295
	for <linux-mtd@lists.infradead.org>; Wed, 7 Feb 2007 07:48:58 -0700
Subject: [PATCH] [MTD] UBI: Remove ubi_ro_mode
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dedekind@infradead.org
Content-Type: text/plain
Date: Wed, 07 Feb 2007 08:50:00 -0600
Message-Id: <1170859801.4884.38.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit 021b3d2fdf21ce241c8cb65d0887a6c72513c7b4
Author: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Date:   Wed Feb 7 08:46:20 2007 -0600

    [MTD] UBI: Remove ubi_ro_mode
    
    Remove a completely unused function
    
    Signed-off-by: Josh Boyer <jwboyer@linux.vnet.ibm.com>

diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
index 1a80fc2..6cf76cc 100644
--- a/drivers/mtd/ubi/misc.c
+++ b/drivers/mtd/ubi/misc.c
@@ -102,13 +102,6 @@ int ubi_calc_data_len(const struct ubi_info *ubi, const uint8_t *buf,
 	return length;
 }
 
-void ubi_ro_mode(const struct ubi_info *ubi)
-{
-	ubi_bgt_disable(ubi);
-	ubi->io->ro_mode = 1;
-	ubi_warn("switched to read-only mode");
-}
-
 int check_volume(const struct ubi_info *ubi, int vol_id)
 {
 	void *buf;
diff --git a/drivers/mtd/ubi/misc.h b/drivers/mtd/ubi/misc.h
index f6f2ced..831a0d2 100644
--- a/drivers/mtd/ubi/misc.h
+++ b/drivers/mtd/ubi/misc.h
@@ -112,13 +112,6 @@ int ubi_calc_data_len(const struct ubi_info *ubi, const uint8_t *buf,
 		      size_t length);
 
 /**
- * ubi_ro_mode - switch UBI to read-only mode.
- *
- * @ubi: the UBI device description object
- */
-void ubi_ro_mode(const struct ubi_info *ubi);
-
-/**
  * check_volume - check the contents of a static volume.
  *
  * @ubi: the UBI device description object
