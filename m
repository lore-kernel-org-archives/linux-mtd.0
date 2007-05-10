Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hm454-0005oq-FL
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 04:33:04 -0400
Received: from [10.191.255.159] (dhcp-255-159.norway.atmel.com
	[10.191.255.159])
	by relay.atmel.no (8.13.4/8.13.4) with ESMTP id l4A8Wufg087618
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 May 2007 10:32:56 +0200 (CEST)
	(envelope-from hcegtvedt@atmel.com)
Subject: [PATCH] fix Atmel NOR flash for command set 0002
From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-VBDn+JWOY31vOAXKudPl"
Date: Thu, 10 May 2007 10:32:48 +0200
Message-Id: <1178785968.11554.58.camel@localhost.localdomain>
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-VBDn+JWOY31vOAXKudPl
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

Trying to prod my co-worker backfired, so here is the patch with a
changelog.

The included patch corrects the fixup table and properly sets the
BufWriteTimeoutTyp and BufWriteTimeoutMax to zero. Doing this will
disable buffered writing, which Atmel has a different command for and is
only supporting dual word writes.

Signed-off-by: Hans-Christian Egtvedt <hcegtvedt@atmel.com>

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway

--=-VBDn+JWOY31vOAXKudPl
Content-Disposition: attachment;
	filename=fix-atmel-cmdset_0002-fixup-table.patch
Content-Type: text/x-patch; name=fix-atmel-cmdset_0002-fixup-table.patch;
	charset=UTF-8
Content-Transfer-Encoding: 7bit

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 1f64458..205977b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -185,6 +185,10 @@ static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
 		extp->TopBottom = 2;
 	else
 		extp->TopBottom = 3;
+
+	/* burst write mode not supported */
+	cfi->cfiq->BufWriteTimeoutTyp = 0;
+	cfi->cfiq->BufWriteTimeoutMax = 0;
 }
 
 static void fixup_use_secsi(struct mtd_info *mtd, void *param)
@@ -217,6 +221,7 @@ static void fixup_use_atmel_lock(struct mtd_info *mtd, void *param)
 }
 
 static struct cfi_fixup cfi_fixup_table[] = {
+	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 #ifdef AMD_BOOTLOC_BUG
 	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
 #endif
@@ -229,7 +234,6 @@ static struct cfi_fixup cfi_fixup_table[] = {
 #if !FORCE_WORD_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
 #endif
-	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 	{ 0, 0, NULL, NULL }
 };
 static struct cfi_fixup jedec_fixup_table[] = {

--=-VBDn+JWOY31vOAXKudPl--
