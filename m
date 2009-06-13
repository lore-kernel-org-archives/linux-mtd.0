Received: from mail.frequentis.com ([212.186.194.131])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MFaQs-0001Tq-MK
	for linux-mtd@lists.infradead.org; Sat, 13 Jun 2009 21:06:41 +0000
Date: Sat, 13 Jun 2009 23:06:29 +0200
From: Christian Engelmayer <christian.engelmayer@frequentis.com>
To: dwmw2@infradead.org
Subject: [PATCH 1/1] jffs2: leaking jffs2_summary in function jffs2_scan_medium
Message-ID: <20090613230629.2a0bc935@frequentis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, christian.engelmayer@frequentis.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Christian Engelmayer <christian.engelmayer@frequentis.com>

In case of an error returned by file_dirty() 's' is not freed as the cleanup
path is skipped.

Signed-off-by: Christian Engelmayer <christian.engelmayer@frequentis.com>
--
Reported by Coverity.

--- linux-2.6.29.4/fs/jffs2/scan.c.orig	2009-06-13 22:49:07.000000000 +0200
+++ linux-2.6.29.4/fs/jffs2/scan.c	2009-06-13 22:29:06.000000000 +0200
@@ -196,7 +196,7 @@ int jffs2_scan_medium(struct jffs2_sb_in
 				if (c->nextblock) {
 					ret = file_dirty(c, c->nextblock);
 					if (ret)
-						return ret;
+						goto out;
 					/* deleting summary information of the old nextblock */
 					jffs2_sum_reset_collected(c->summary);
 				}
@@ -207,7 +207,7 @@ int jffs2_scan_medium(struct jffs2_sb_in
 			} else {
 				ret = file_dirty(c, jeb);
 				if (ret)
-					return ret;
+					goto out;
 			}
 			break;
 
