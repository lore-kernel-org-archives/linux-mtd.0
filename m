Received: from mailout3.samsung.com ([203.254.224.33])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D1LD4-0000wq-GF
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 04:11:09 -0500
Received: from custom-daemon.mailout3.samsung.com by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	id <0IBZ00F0BYUA08@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 18:10:58 +0900 (KST)
Received: from ep_mmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IBZ00HNNYUAHX@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 18:10:58 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPSA id <0IBZ008IOYUAKZ@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 18:10:58 +0900 (KST)
Date: Wed, 16 Feb 2005 18:10:58 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: tglx@linutronix.de
Message-id: <0IBZ008IQYUAKZ@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=ks_c_5601-1987
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] Find correct manufacture ID
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	If you find 8-bit buswidth flash with 16-bit buswidth option, it
displays warning message.
	Before display you have to find correct manufacture ID.
 Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

diff -u -r1.1.1.1 nand_base.c
--- drivers/mtd/nand/nand_base.c        13 Jan 2005 06:51:14 -0000      1.1.
1.1
+++ drivers/mtd/nand/nand_base.c        16 Feb 2005 08:19:48 -0000
@@ -2259,9 +2259,15 @@
                /* Check, if buswidth is correct. Hardware drivers should
set
                 * this correct ! */
                if (busw != (this->options & NAND_BUSWIDTH_16)) {
+                       /* Try to identify manufacturer */
+                       for (j = 0; nand_manuf_ids[j].id != 0x0; j++) {
+                               if (nand_manuf_ids[j].id == nand_maf_id)
+                                       break;
+                       }
                        printk (KERN_INFO "NAND device: Manufacturer ID:"
                                " 0x%02x, Chip ID: 0x%02x (%s %s)\n",
nand_maf_id, nand_dev_id,
-                               nand_manuf_ids[i].name , mtd->name);
+                               nand_manuf_ids[j].name , mtd->name);
                        printk (KERN_WARNING
                                "NAND bus width %d instead %d bit\n",
                                        (this->options & NAND_BUSWIDTH_16)
? 16 : 8,
