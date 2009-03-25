Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmPNE-0003gP-1r
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 09:26:18 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LmPNB-0004Yf-4l
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 09:26:09 +0000
Received: from 217.147.39.138 ([217.147.39.138])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Mar 2009 09:26:09 +0000
Received: from augulis.darius by 217.147.39.138 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Mar 2009 09:26:09 +0000
To: linux-mtd@lists.infradead.org
From: Darius Augulis <augulis.darius@gmail.com>
Subject: [PATCH] Fixup for Numonyx M29W128 chips
Date: Wed, 25 Mar 2009 11:23:51 +0200
Message-ID: <gqctb6$ie0$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080608060702060902080402"
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------080608060702060902080402
Content-Type: text/plain; charset=ISO-8859-13; format=flowed
Content-Transfer-Encoding: 7bit


--------------080608060702060902080402
Content-Type: text/plain;
 name="patch-mtd-fixup-M29W128G"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch-mtd-fixup-M29W128G"

From: Darius Augulis <augulis.darius@gmail.com>

Prevent NUMONYX M29W128G memories from using write buffer,
because it doesn't work properly.

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>

Index: linux-2.6.29/drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
--- linux-2.6.29.orig/drivers/mtd/chips/cfi_cmdset_0002.c
+++ linux-2.6.29/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -282,6 +282,16 @@ static void fixup_s29gl032n_sectors(stru
 	}
 }
 
+static void fixup_M29W128G_write_buffer(struct mtd_info *mtd, void *param)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	if (cfi->cfiq->BufWriteTimeoutTyp) {
+		pr_warning("Don't use write buffer on ST flash M29W128G\n");
+		cfi->cfiq->BufWriteTimeoutTyp = 0;
+	}
+}
+
 static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
 #ifdef AMD_BOOTLOC_BUG
@@ -298,6 +308,7 @@ static struct cfi_fixup cfi_fixup_table[
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors, NULL, },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors, NULL, },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors, NULL, },
+	{ CFI_MFR_ST,  0x227E, fixup_M29W128G_write_buffer, NULL, },
 #if !FORCE_WORD_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
 #endif

--------------080608060702060902080402--
