Received: from li10-212.members.linode.com ([70.85.16.212] helo=armcc.org)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ERveQ-0007lc-ED
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 13:53:32 -0400
Received: from localhost ([127.0.0.1] helo=www.armcc.org)
	by armcc.org with esmtp (Exim 4.50) id 1ERuoe-0005Oi-R8
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 09:59:56 -0700
Message-ID: <21246.161.88.255.140.1129654796.squirrel@www.armcc.org>
Date: Tue, 18 Oct 2005 09:59:56 -0700 (PDT)
From: "Andre" <andre@armcc.org>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Kernel oops if CFI probe finds a device larger than map->size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

genprobe_ident_chips() doesn't enforce a lower limit on the value
calculated for 'max_chips'. If the device found during initial probing is
larger than map->size, max_chips will end up being 0 (which causes all
sorts of bad things to happen...).

The following patch seems to fix things for me:

diff -ru mtd_orig/drivers/mtd/chips/gen_probe.c
mtd/drivers/mtd/chips/gen_probe.c
--- mtd_orig/drivers/mtd/chips/gen_probe.c      2005-09-15
05:17:56.000000000 -0700
+++ mtd/drivers/mtd/chips/gen_probe.c   2005-10-18 10:02:01.000000000 -0700
@@ -98,8 +98,12 @@
        /*
         * Allocate memory for bitmap of valid chips.
         * Align bitmap storage size to full byte.
+        * Ensure we probe at least one chip, even if device
+        * is larger than map->size.
         */
        max_chips = map->size >> cfi.chipshift;
+       if (max_chips == 0)
+               max_chips = 1;
        mapsize = (max_chips / 8) + ((max_chips % 8) ? 1 : 0);
        chip_map = kmalloc(mapsize, GFP_KERNEL);
        if (!chip_map) {


Andre McCurdy
--
