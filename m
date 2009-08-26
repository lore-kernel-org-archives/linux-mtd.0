Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MgKdc-0007sJ-Jx
	for linux-mtd@lists.infradead.org; Wed, 26 Aug 2009 15:42:22 +0000
Received: by fxm26 with SMTP id 26so233978fxm.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Aug 2009 08:42:14 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 26 Aug 2009 17:42:14 +0200
Message-ID: <62cbdcd90908260842l66275d12na133bdb7cc4ac14@mail.gmail.com>
Subject: [PATCH] [MTD] CHIPS: 0xFF intolerance for M29W128G
From: massimo cirillo <maxcir@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: augulis.darius@gmail.com, RichardRetanubun@ruggedcom.com
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
Intel-like devices are not influenced by a 0xF0 command.
This fix solves also the cause of the fixup_M29W128G_write_buffer() fix,
that can be commented out now.
The following patch applies to 2.6.30 kernel.

Signed-off-by: Massimo Cirillo <maxcir@gmail.com>
---
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c
old mode 100644
new mode 100755
index 61ea833..5a65e92
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -308,7 +308,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors, NULL, },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors, NULL, },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors, NULL, },
-	{ CFI_MFR_ST,  0x227E, fixup_M29W128G_write_buffer, NULL, },
+	/*{ CFI_MFR_ST,  0x227E, fixup_M29W128G_write_buffer, NULL, },*/
 #if !FORCE_WORD_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
 #endif
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
old mode 100644
new mode 100755
index 34d40e2..9c897f9
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -61,8 +61,8 @@ int __xipram cfi_qry_mode_on(uint32_t base,
 		return 1;
 	/* QRY not found probably we deal with some odd CFI chips */
 	/* Some revisions of some old Intel chips? */
-	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
 	if (cfi_qry_present(map, base, cfi))
 		return 1;
@@ -79,8 +79,11 @@ EXPORT_SYMBOL_GPL(cfi_qry_mode_on);
 void __xipram cfi_qry_mode_off(uint32_t base, struct map_info *map,
 			       struct cfi_private *cfi)
 {
-	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+    /* Numonyx M29W128G requires two 0xF0 to exit succesfully from
+    autoselect mode. No consequences on Intel-like devices. */
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 }
 EXPORT_SYMBOL_GPL(cfi_qry_mode_off);

--
