Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C9Xpz-0001Ue-Ug
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2004 19:44:53 -0400
Date: Tue, 21 Sep 2004 00:44:50 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20040920234450.GA17169@home.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Ben Dooks <ben@fluff.org>
Cc: ben@fluff.org
Subject: Fix to jedec_probe unlock addresses
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix unlock address calculation for non-x8 chips for the
cfi cmdset code, which assumes always X8

Patch against 2.6.9-rc2 with 19th September CVS

Signed-off-by: Ben Dooks <ben-mtd@fluff.org>

--- linux-2.6.9-rc2-bk6-mtd20040919/drivers/mtd/chips/jedec_probe.c	2004-09-20 13:02:46.000000000 +0100
+++ linux-2.6.9-rc2-bk6-mtd20040919-work/drivers/mtd/chips/jedec_probe.c	2004-09-20 23:21:40.000000000 +0100
@@ -2046,7 +2046,15 @@
 	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
 	       map->name, cfi_interleave(cfi), cfi->device_type*8, base, 
 	       map->bankwidth*8);
-	
+
+	/* fixup unlock addresses for the cmdset */
+
+	cfi->addr_unlock1 *= cfi_interleave(cfi) * cfi->device_type;
+	cfi->addr_unlock2 *= cfi_interleave(cfi) * cfi->device_type;
+
+	printk(KERN_DEBUG "unlocks at %08x,%08x\n", 
+	       cfi->addr_unlock1, cfi->addr_unlock2);
+
 	return 1;
 }
 
