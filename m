Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cr2b0-0005MF-Pc
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 18:17:14 -0500
Received: from slurryseal.ddns.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id PAA24493
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jan 2005 15:16:59 -0800
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8) with ESMTP id
	j0INGxLV029659
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jan 2005 15:16:59 -0800
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8/Submit) id j0INGwFx029657
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 15:16:58 -0800
Date: Tue, 18 Jan 2005 15:16:58 -0800
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050118231658.GA28585@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: JFFS2: Eep. No valid nodes for ino #1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jffs2_get_inode_nodes() recently started to print:

# flash_eraseall /dev/mtd2
# mount -t jffs2 /dev/mtdblock2 /mnt
Eep. No valid nodes for ino #1

The old code printed that message if !f->inocache->nodes while the new
code will also print it if !f->inocache->nodes->next_in_ino (the entry
points back to the inode cache).  Hazarding a guess that the new check
is valid for all cases except when creating inode #1 for a new fs (for
which there are no data nodes).  If yet another special check for
inode #1 is needed then here's a suggested patch:

===== fs/jffs2/nodelist.c 1.15 vs edited =====
--- 1.15/fs/jffs2/nodelist.c	2004-12-13 03:33:34 -08:00
+++ edited/fs/jffs2/nodelist.c	2005-01-18 13:31:19 -08:00
@@ -127,7 +127,7 @@
 
 	valid_ref = jffs2_first_valid_node(f->inocache->nodes);
 
-	if (!valid_ref)
+	if (!valid_ref && (f->inocache->ino != 1))
 		printk(KERN_WARNING "Eep. No valid nodes for ino #%u\n", f->inocache->ino);
 
 	while (valid_ref) {


-- 
Todd
