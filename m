Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19UrYn-0000NX-M5
	for <linux-mtd@lists.infradead.org>; Tue, 24 Jun 2003 18:26:25 +0100
Received: from hermes.fachschaften.tu-muenchen.de ([129.187.202.12])
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 19UrZA-00084Y-00
	for linux-mtd@lists.infradead.org; Tue, 24 Jun 2003 18:26:48 +0100
Date: Tue, 24 Jun 2003 19:26:39 +0200
From: Adrian Bunk <bunk@fs.tum.de>
To: dwmw2@redhat.com, linux-mtd@lists.infradead.org
Message-ID: <20030624172639.GR3710@fs.tum.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
cc: linux-kernel@vger.kernel.org
cc: trivial@rustcorp.com.au
Subject: [2.5 patch] two small MTD fixes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch below contains the following fixes for MTD in 2.5.73:
- postfix a constat in mptbase.c with ULL
- add an extern declaration for a function that is later called in
  gen_probe.c

Please apply
Adrian

--- linux-2.5.73-not-full/drivers/message/fusion/mptbase.c.old	2003-06-23 23:07:57.000000000 +0200
+++ linux-2.5.73-not-full/drivers/message/fusion/mptbase.c	2003-06-23 23:08:27.000000000 +0200
@@ -1279,7 +1279,7 @@
 	u32		 psize;
 	int		 ii;
 	int		 r = -ENODEV;
-	u64		 mask = 0xffffffffffffffff;
+	u64		 mask = 0xffffffffffffffffULL;
 
 	if (pci_enable_device(pdev))
 		return r;
--- linux-2.5.73-not-full/drivers/mtd/chips/gen_probe.c.old	2003-06-23 23:16:23.000000000 +0200
+++ linux-2.5.73-not-full/drivers/mtd/chips/gen_probe.c	2003-06-23 23:16:45.000000000 +0200
@@ -281,6 +281,7 @@
 
 extern cfi_cmdset_fn_t cfi_cmdset_0001;
 extern cfi_cmdset_fn_t cfi_cmdset_0002;
+extern cfi_cmdset_fn_t cfi_cmdset_0020;
 
 static inline struct mtd_info *cfi_cmdset_unknown(struct map_info *map, 
 						  int primary)
