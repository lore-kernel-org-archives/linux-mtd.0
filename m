Received: from over.ny.us.ibm.com ([32.97.182.150])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HI65S-0005rU-EA
	for linux-mtd@lists.infradead.org; Fri, 16 Feb 2007 11:37:36 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
	by pokfb.esmtp.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	l1GGDPYb007781
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Fri, 16 Feb 2007 11:13:25 -0500
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e31.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l1GG4qHg024350
	for <linux-mtd@lists.infradead.org>; Fri, 16 Feb 2007 11:04:52 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.2) with ESMTP id
	l1GG4qqH413532
	for <linux-mtd@lists.infradead.org>; Fri, 16 Feb 2007 09:04:52 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l1GG4qNS012630
	for <linux-mtd@lists.infradead.org>; Fri, 16 Feb 2007 09:04:52 -0700
Subject: [PATCH] [JFFS2] fix compile warnings
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: dwmw2@infradead.org
Content-Type: text/plain
Date: Fri, 16 Feb 2007 10:05:44 -0600
Message-Id: <1171641944.4003.206.camel@zod.rchland.ibm.com>
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

Fix a handful of warnings when compiling for 64 bit

fs/jffs2/wbuf.c: In function 'jffs2_check_oob_empty':
fs/jffs2/wbuf.c:993: warning: format '%d' expects type 'int', but
argument 3 has type 'size_t'

Signed-off-by: Josh Boyer <jwboyer@linux.vnet.ibm.com>


diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 58cb77b..922bfc9 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -988,8 +988,8 @@ int jffs2_check_oob_empty(struct jffs2_sb_info *c,
 
 	ret = c->mtd->read_oob(c->mtd, jeb->offset, &ops);
 	if (ret || ops.oobretlen != ops.ooblen) {
-		printk(KERN_ERR "cannot read OOB for EB at %08x, requested %d "
-				"bytes, read %d bytes, error %d\n", jeb->offset,
+		printk(KERN_ERR "cannot read OOB for EB at %08x, requested %zd "
+				"bytes, read %zd bytes, error %d\n", jeb->offset,
 				ops.ooblen, ops.oobretlen, ret);
 		if (!ret)
 			ret = -EIO;
@@ -1031,8 +1031,8 @@ int jffs2_check_nand_cleanmarker(struct jffs2_sb_info *c,
 
 	ret = c->mtd->read_oob(c->mtd, jeb->offset, &ops);
 	if (ret || ops.oobretlen != ops.ooblen) {
-		printk(KERN_ERR "cannot read OOB for EB at %08x, requested %d "
-				"bytes, read %d bytes, error %d\n", jeb->offset,
+		printk(KERN_ERR "cannot read OOB for EB at %08x, requested %zd "
+				"bytes, read %zd bytes, error %d\n", jeb->offset,
 				ops.ooblen, ops.oobretlen, ret);
 		if (!ret)
 			ret = -EIO;
@@ -1057,8 +1057,8 @@ int jffs2_write_nand_cleanmarker(struct jffs2_sb_info *c,
 
 	ret = c->mtd->write_oob(c->mtd, jeb->offset, &ops);
 	if (ret || ops.oobretlen != ops.ooblen) {
-		printk(KERN_ERR "cannot write OOB for EB at %08x, requested %d "
-				"bytes, read %d bytes, error %d\n", jeb->offset,
+		printk(KERN_ERR "cannot write OOB for EB at %08x, requested %zd "
+				"bytes, read %zd bytes, error %d\n", jeb->offset,
 				ops.ooblen, ops.oobretlen, ret);
 		if (!ret)
 			ret = -EIO;
