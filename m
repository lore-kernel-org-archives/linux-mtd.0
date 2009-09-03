Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MjDOq-00069v-JK
	for linux-mtd@lists.infradead.org; Thu, 03 Sep 2009 14:35:04 +0000
Received: by fxm26 with SMTP id 26so1682644fxm.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Sep 2009 07:34:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0908310724030.10961@casper.infradead.org>
References: <alpine.LFD.2.00.0908310724030.10961@casper.infradead.org>
Date: Thu, 3 Sep 2009 16:34:39 +0200
Message-ID: <62cbdcd90909030734x4749fe0fhc0b1d81843882b8e@mail.gmail.com>
Subject: Re: [PATCH] [MTD] CHIPS: 0xFF intolerance for M29W128G
From: massimo cirillo <maxcir@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: jamie@shareable.com, akorolev@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Massimo Cirillo <maxcir@gmail.com>

The M29W128G Numonyx flash devices are intolerant to any 0xFF command:
in the Cfi_util.c the function cfi_qry_mode_off() (that resets the device
after the autoselect mode) must have a 0xF0 command after the 0xFF command.
This fix solves also the cause of the fixup_M29W128G_write_buffer() fix,
that can be removed now.
The following patch applies to 2.6.30 kernel.

Signed-off-by: Massimo Cirillo <maxcir@gmail.com>
Acked-by: alexey Korolev <akorolev@infradead.org>
---
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c
old mode 100644
new mode 100755
index 61ea833..94bb61e
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -282,16 +282,6 @@ static void fixup_s29gl032n_sectors(struct mtd_info *mtd,
 	}
 }

-static void fixup_M29W128G_write_buffer(struct mtd_info *mtd, void *param)
-{
-	struct map_info *map = mtd->priv;
-	struct cfi_private *cfi = map->fldrv_priv;
-	if (cfi->cfiq->BufWriteTimeoutTyp) {
-		pr_warning("Don't use write buffer on ST flash M29W128G\n");
-		cfi->cfiq->BufWriteTimeoutTyp = 0;
-	}
-}
-
 static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 #ifdef AMD_BOOTLOC_BUG
@@ -308,7 +298,6 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors, NULL, },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors, NULL, },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors, NULL, },
-	{ CFI_MFR_ST,  0x227E, fixup_M29W128G_write_buffer, NULL, },
 #if !FORCE_WORD_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
 #endif
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
old mode 100644
new mode 100755
index 34d40e2..8b87652
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -81,6 +81,10 @@ void __xipram cfi_qry_mode_off(uint32_t base,
 {
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+	/* M29W128G flashes require an additional reset command
+	   when exit qry mode */
+	if ((cfi->mfr == CFI_MFR_ST) && (cfi->id == 0x227E || cfi->id == 0x7E))
+		cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 }
 EXPORT_SYMBOL_GPL(cfi_qry_mode_off);
