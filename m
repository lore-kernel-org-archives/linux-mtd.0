Received: from [216.219.239.237] (helo=www.sensoria.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15w8Ki-00026a-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 21:39:32 +0100
Received: from baoha ([209.245.83.145])
	by www.sensoria.com (8.10.2/8.10.2) with SMTP id f9NKgrW04794
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 16:42:53 -0400
From: "Bao C. Ha" <baoha@sensoria.com>
To: <linux-mtd@lists.infradead.org>
Subject: Patch to prevent jffs2 from make changes to other filesystems
Date: Tue, 23 Oct 2001 13:46:17 -0700
Message-ID: <014f01c15c03$c45a8b10$456c020a@SENSORIA>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I would like to propose the following patch to
temporarily fix the problem of jffs2 making
changes to other filesystems stored on MTD
partitions.

--- scan.c.orig Tue Oct 23 13:35:38 2001
+++ scan.c      Tue Oct 23 13:32:28 2001
@@ -214,7 +214,8 @@
                        noisy_printk(&noise, "jffs2_scan_eraseblock(): Magic
bit
mask 0x%04x not found at 0x%08x: 0x%04x instead\n", JFFS2_MAGIC_BITMASK,
ofs, no
de.magic);
                        DIRTY_SPACE(4);
                        ofs += 4;
-                       continue;
+                       /* continue; */
+                       return -EINVAL;
                }
                /* We seem to have a node of sorts. Check the CRC */
                nodetype = node.nodetype;

Thanks.
Bao
