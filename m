Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3BAC55167
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2026 07:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DgWfjSxbXWIIkx59pGcNdVCpqtz5mmrGYvDiig9Lfu4=; b=ZUdh3l39CTNUug
	O66VMvQYTkAoa6eXX3NtxoKZgU7O/iKbGq/wlVDndcs1mH6smd1PwSD+J81tGOpZba2NRtn3szqK9
	aOzzZolMd4K9HnGPkBapvkQlGsczLST8cwZh5zUlB4u6BFxERCy+HQuzCYG2KcUiVNgvSyA0/Clpc
	Vn6dbNa369YTw7qFmpRDcAVJyu+sy3ciahspwsaQY+FQUmYT/EReIQ6IWdgEO50ova97TKELL2d4L
	+CjHcZOfl+d+lTH1IITgOTqDaIeLJXQ71bR2ZrDbt2BCBvjAKAOVS6/dMewnTtDHAgIs2oNVnCjMp
	dyGAS9pApTDVRn5Jqk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpi7e-0000000C0Em-3ncj;
	Fri, 31 Jul 2026 07:57:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpi7Y-0000000C0Dn-479V
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jul 2026 07:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FD4D6004E;
	Fri, 31 Jul 2026 07:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF52CC2BCB9;
	Fri, 31 Jul 2026 07:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785484651;
	bh=BdtF3ST042y2YchbvBs4t9dLvIHevyY2/0fXOWGkF8g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Fn1XW7BGOHSKcn6kmXu/llZBM6CUDPJoRAzLYCxVLBgr4+iRG7HWOOFLpWOEjGrDH
	 tifeaH/QofgHURtbxwTW6gQjcPgRem3tq1tJrBO+HeKuYqTb5AKPd6MGVMtqKfJNSf
	 GkE4yTZ34Dekns7ZkaS6pJPgprvxpSWhZBHI1InajUIWxZJga1iHooCz+h5VqwxbxE
	 GVeFfGbcYELTAJu1mOl+bW0ZMFZJAAxX/qbTYj/HAnlIm3KWfX8XmfXsEZEGr0SmZP
	 myQsyATFFNa+loVIqBxoA4AnTc+MqWZuolrf2l6KaoG16Cox9PFzDmUxyTlZ7j9pyV
	 h3SpgihToWDzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9034C55171;
	Fri, 31 Jul 2026 07:57:31 +0000 (UTC)
From: Takahiro Kuwano via B4 Relay <devnull+takahiro.kuwano.infineon.com@kernel.org>
Date: Fri, 31 Jul 2026 16:57:19 +0900
Subject: [PATCH v3] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
MIME-Version: 1.0
Message-Id: <20260731-no_op_chip_erase-v3-1-41f101d9968b@infineon.com>
X-B4-Tracking: v=1; b=H4sIAF9VbGoC/yXMQQ6CMBBG4auQWdukQhD1KsY0bf2BcdE2HSQkh
 LtTZPkt3ltJkBlCz2qljJmFYyhoLhX50YYBij/FVOv6prvmqkI0MRk/cjLIVqBarb272846PKh
 kKaPn5b98vU/Lz33hp+ND27YD+1Y/dHQAAAA=
X-Change-ID: 20260731-no_op_chip_erase-500cb8a7abe9
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785484650; l=3127;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=jprftuHIU60xPd5Dstni2VUPc6HizHvPQXOhr2GB5c8=;
 b=EMtwEyxS9gBoBD2Qg+w33I764ypoFIdvNiYEtgWNG8lvesztgM1LFxjZo/o2GQ5UjTMNXmEgj
 f/fTHr0j5aXDzxTJ7PqBgNLMUayHjAPKf74R93jS5EdRZCkzqJ8I+Ph
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-Endpoint-Received: by B4 Relay for takahiro.kuwano@infineon.com/20250227
 with auth_id=566
X-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: takahiro.kuwano@infineon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

NO_OP_CHIP_ERASE flag is no longer used.
Remove definition and references of the flag in core and debugfs.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
---
Changes in v3:
- Rebase on top of v7.5-rc5
- Collect trailers
Changes in v2:
- Collect R-b from Tudor
- Just drop NO_OP_CHIP_ERASE and leave the rest of bit assignment as is
- Copy to <linux-kernel@vger.kernel.org>
---
 drivers/mtd/spi-nor/core.c    | 3 +--
 drivers/mtd/spi-nor/core.h    | 6 ++++--
 drivers/mtd/spi-nor/debugfs.c | 7 ++-----
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..4d868afca2c1 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1852,8 +1852,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		return ret;
 
 	/* chip (die) erase? */
-	if ((len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) ||
-	    multi_die_erase) {
+	if (len == mtd->size || multi_die_erase) {
 		ret = spi_nor_erase_dice(nor, addr, len, die_size);
 		if (ret)
 			goto erase_err;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ba2d1a862c9d..765a8542af54 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -121,10 +121,12 @@
 		   SPI_MEM_OP_NO_ADDR,					\
 		   SPI_MEM_OP_NO_DATA)
 
-/* Keep these in sync with the list in debugfs.c */
+/*
+ * This could contain holes, if adding a new flag use the first free spot.
+ * Keep the flags in sync with the list in debugfs.c
+ */
 enum spi_nor_option_flags {
 	SNOR_F_HAS_SR_TB	= BIT(0),
-	SNOR_F_NO_OP_CHIP_ERASE	= BIT(1),
 	SNOR_F_BROKEN_RESET	= BIT(2),
 	SNOR_F_4B_OPCODES	= BIT(3),
 	SNOR_F_HAS_4BAIT	= BIT(4),
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 288e2866daed..2ba8cbca04c9 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -14,7 +14,6 @@
 #define SNOR_F_NAME(name) [ilog2(SNOR_F_##name)] = #name
 static const char *const snor_f_names[] = {
 	SNOR_F_NAME(HAS_SR_TB),
-	SNOR_F_NAME(NO_OP_CHIP_ERASE),
 	SNOR_F_NAME(BROKEN_RESET),
 	SNOR_F_NAME(4B_OPCODES),
 	SNOR_F_NAME(HAS_4BAIT),
@@ -144,10 +143,8 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 		}
 	}
 
-	if (!(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
-		string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		seq_printf(s, " %02x (%s)\n", params->die_erase_opcode, buf);
-	}
+	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
+	seq_printf(s, " %02x (%s)\n", params->die_erase_opcode, buf);
 
 	seq_puts(s, "\nsector map\n");
 	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");

---
base-commit: 598149737c4965eb8e0b160faed32827a2d9eb77
change-id: 20260731-no_op_chip_erase-500cb8a7abe9

Best regards,
--  
Takahiro Kuwano <takahiro.kuwano@infineon.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
