Received: from web43139.mail.sp1.yahoo.com ([216.252.121.69])
	by bombadil.infradead.org with smtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqHLd-0000A0-LK
	for linux-mtd@lists.infradead.org; Thu, 08 Nov 2007 19:03:52 -0500
Date: Thu, 8 Nov 2007 16:03:40 -0800 (PST)
From: Justin Treon <justin_treon@yahoo.com>
Subject: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on power up
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <752503.63551.qm@web43139.mail.sp1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding the ability to unlocking all Intel flash that is locked on power up. 
Currently only Intel P30 flash is unlocked.  All Intel flash is locked on power up.

Signed-off-by: Justin Treon <justin_treon@yahoo.com>
----
diff -r c105f44cf785 drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Nov 08 15:36:57 2007 -0800
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	Thu Nov 08 15:42:01 2007 -0800
@@ -244,7 +244,7 @@ static struct cfi_fixup cfi_fixup_table[
 #endif
 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
-	{ MANUFACTURER_INTEL, 0x891c,	      fixup_use_powerup_lock, NULL, },
+	{ MANUFACTURER_INTEL, CFI_ID_ANY,     fixup_use_powerup_lock, NULL, },
 	{ 0, 0, NULL, NULL }
 };
 

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
