Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlzzC-0004L9-UM
	for linux-mtd@lists.infradead.org; Thu, 29 Jan 2004 00:24:47 +0000
Received: from mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id QAA32099
	for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2004 16:24:42 -0800
Sender: ahennessy@mvista.com
Message-ID: <4018514D.6E4DB38A@mvista.com>
Date: Wed, 28 Jan 2004 16:18:21 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: gen_probe.c issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

The following patch fixes a problem seen when the map->size is less than
the actual chip size.
Without the fix,  max_chips gets set to 0.

Alice

Index: drivers/mtd/chips/gen_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/gen_probe.c,v
retrieving revision 1.14
diff -u -r1.14 gen_probe.c
--- drivers/mtd/chips/gen_probe.c       8 Nov 2003 00:51:21 -0000
1.14
+++ drivers/mtd/chips/gen_probe.c       28 Jan 2004 23:58:38 -0000
@@ -108,6 +108,9 @@
         * Align bitmap storage size to full byte.
         */
        max_chips = map->size >> cfi.chipshift;
+        /* correct for case where map->size is less than chip size */
+        if (!max_chips)
+                max_chips = 1;
        chip_map = kmalloc((max_chips / 8) + ((max_chips % 8) ? 1 : 0),
GFP_KERNEL);
        if (!chip_map) {
                printk(KERN_WARNING "%s: kmalloc failed for CFI chip
map\n", map->name);
