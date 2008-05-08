Received: from ip66-104-21-76.z21-104-66.customer.algx.net ([66.104.21.76]
	helo=beretta.inhandelectronics.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JtwGW-0007lr-V9
	for linux-mtd@lists.infradead.org; Thu, 08 May 2008 02:53:53 +0000
From: Vernon Sauder <VernonInHand@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: add more StrataFlash chip ids that need powerup fixup
Date: Wed, 7 May 2008 22:35:56 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200805072235.56227.VernonInHand@gmail.com>
Reply-To: Vernon Sauder <VernonInHand@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Vernon Sauder <VernonInHand@gmail.com>

Signed-off-by: Vernon Sauder <VernonInHand@gmail.com>
---

--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2008-05-07 18:35:36.000000000 -0400
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2008-05-07 18:19:40.000000000 -0400
@@ -245,6 +245,11 @@ static struct cfi_fixup cfi_fixup_table[
 #endif
 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
+	{ MANUFACTURER_INTEL, 0x8917,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, 0x8918,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, 0x8919,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, 0x891a,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, 0x891b,	      fixup_use_powerup_lock, NULL, },
 	{ MANUFACTURER_INTEL, 0x891c,	      fixup_use_powerup_lock, NULL, },
 	{ 0, 0, NULL, NULL }
 };
