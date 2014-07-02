Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2KPd-0002jS-Cs
 for linux-mtd@lists.infradead.org; Wed, 02 Jul 2014 13:17:26 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: reduce the warning noise when the ECC is too weak
Date: Wed,  2 Jul 2014 15:16:32 +0200
Message-Id: <1404306992-28968-1-git-send-email-thomas.petazzoni@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In commit 67a9ad9b8a6f ("mtd: nand: Warn the user if the selected ECC
strength is too weak"), a check was added to inform the user when the
ECC used for a NAND device is weaker than the recommended ECC
advertised by the NAND chip. However, the warning uses WARN_ON(),
which has two undesirable side-effects:

 - It just prints to the kernel log the fact that there is a warning
   in this file, at this line, but it doesn't explain anything about
   the warning itself.

 - It dumps a stack trace which is very noisy, for something that the
   user is most likely not able to fix. If a certain ECC used by the
   kernel is weaker than the advertised one, it's most likely to make
   sure the kernel uses an ECC that is compatible with the one used by
   the bootloader, and changing the bootloader may not necessarily be
   easy. Therefore, normal users would not be able to do anything to
   fix this very noisy warning, and will have to suffer from it at
   every kernel boot. At least every time I see this stack trace in my
   kernel boot log, I wonder what new thing is broken, just to realize
   that it's once again this NAND ECC warning.

Therefore, this commit turns:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at /home/thomas/projets/linux-2.6/drivers/mtd/nand/nand_base.c:4051 nand_scan_tail+0x538/0x780()
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 3.16.0-rc3-dirty #4
[<c000e3dc>] (unwind_backtrace) from [<c000bee4>] (show_stack+0x10/0x14)
[<c000bee4>] (show_stack) from [<c0018180>] (warn_slowpath_common+0x6c/0x8c)
[<c0018180>] (warn_slowpath_common) from [<c001823c>] (warn_slowpath_null+0x1c/0x24)
[<c001823c>] (warn_slowpath_null) from [<c02c50cc>] (nand_scan_tail+0x538/0x780)
[<c02c50cc>] (nand_scan_tail) from [<c0639f78>] (orion_nand_probe+0x224/0x2e4)
[<c0639f78>] (orion_nand_probe) from [<c026da00>] (platform_drv_probe+0x18/0x4c)
[<c026da00>] (platform_drv_probe) from [<c026c1f4>] (really_probe+0x80/0x218)
[<c026c1f4>] (really_probe) from [<c026c47c>] (__driver_attach+0x98/0x9c)
[<c026c47c>] (__driver_attach) from [<c026a8f0>] (bus_for_each_dev+0x64/0x94)
[<c026a8f0>] (bus_for_each_dev) from [<c026bae4>] (bus_add_driver+0x144/0x1ec)
[<c026bae4>] (bus_add_driver) from [<c026cb00>] (driver_register+0x78/0xf8)
[<c026cb00>] (driver_register) from [<c026da5c>] (platform_driver_probe+0x20/0xb8)
[<c026da5c>] (platform_driver_probe) from [<c00088b8>] (do_one_initcall+0x80/0x1d8)
[<c00088b8>] (do_one_initcall) from [<c0620c9c>] (kernel_init_freeable+0xf4/0x1b4)
[<c0620c9c>] (kernel_init_freeable) from [<c049a098>] (kernel_init+0x8/0xec)
[<c049a098>] (kernel_init) from [<c00095f0>] (ret_from_fork+0x14/0x24)
---[ end trace 62f87d875aceccb4 ]---

Into the much shorter, and much more useful:

nand: WARNING: MT29F2G08ABAEAWP: the ECC used on your system is too weak compared to the one required by the NAND chip

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 41167e9..4f3e80c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4047,8 +4047,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 		ecc->layout->oobavail += ecc->layout->oobfree[i].length;
 	mtd->oobavail = ecc->layout->oobavail;
 
-	/* ECC sanity check: warn noisily if it's too weak */
-	WARN_ON(!nand_ecc_strength_good(mtd));
+	/* ECC sanity check: warn if it's too weak */
+	if (!nand_ecc_strength_good(mtd))
+		pr_warn("WARNING: %s: the ECC used on your system is too weak compared to the one required by the NAND chip\n",
+			mtd->name);
 
 	/*
 	 * Set the number of read / write steps for one page depending on ECC
-- 
2.0.0
