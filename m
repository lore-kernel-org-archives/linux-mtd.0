Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CDCew-0001QZ-CQ
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2004 21:56:36 -0400
Received: from slurryseal.ddns.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id SAA14252
	for <linux-mtd@lists.infradead.org>; Thu, 30 Sep 2004 18:56:20 -0700
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8) with ESMTP id
	i911uKLV024519
	for <linux-mtd@lists.infradead.org>; Thu, 30 Sep 2004 18:56:20 -0700
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8/Submit) id i911uKQA024517
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2004 18:56:20 -0700
Date: Thu, 30 Sep 2004 18:56:20 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20041001015620.GA24506@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Patch: Check eraseregion bounds in cfi_varsize_frob
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

cfi_varsize_frob checks for proper eraseregion index in a couple places,
but not in one other place.  Although it only happens when the geometry
isn't setup right (chipshift or block size * numblocks), it can lockup
or cause other strange flash access that would be nice to avoid.  Just
in case this sanity check would be considered a good thing. -- Todd


Index: drivers/mtd/chips/cfi_util.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_util.c,v
retrieving revision 1.5
diff -u -r1.5 cfi_util.c
--- drivers/mtd/chips/cfi_util.c	12 Aug 2004 06:40:23 -0000	1.5
+++ drivers/mtd/chips/cfi_util.c	1 Oct 2004 01:42:37 -0000
@@ -168,9 +168,17 @@
 		len -= size;
 
 		chipmask = (1 << cfi->chipshift) - 1;
-		if ((adr & chipmask) == ((regions[i].offset + size * regions[i].numblocks) & chipmask))
+		if ((adr & chipmask) == ((regions[i].offset + size * regions[i].numblocks) & chipmask)) {
 			i++;
 
+			if ((i >= mtd->numeraseregions) && len) {
+				printk(KERN_WARNING "Attempt to access illegal"
+				       " erase region #%d on %s\n", i,
+				       mtd->name);
+				return -EINVAL;
+			}
+		}
+
 		if (adr >> cfi->chipshift) {
 			adr = 0;
 			chipnum++;
