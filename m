Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135C6C433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Mar 2022 15:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xHPTYfZpbkrvr7kcimX5kZ2FPPZPEptkhEgCPWBdx0o=; b=pzYnTuJWjB586w
	+yVnCnNYMkZkUVbzRR0Q1r2JtMpjjXjHhIm1sJ7S04JfhPbcyhCo92COpCYmBoOeIOvNVx4sSUWeF
	yCs+c1184qBjOamUMWwPL850T7EeBCcaR1uc58pjyIPLzrkpbCXT/zdxmGXQmuTAYGa6/xlneRvJg
	pRLQ4MeX95jHwJExwJgi2m0UiM95xJetfvgtqDeSSakiv1MpEZDlZjbFDyfjOhe2roVjHgV4Kekaa
	iAF9EAeiYCfAEX0+gWjKj7RT/srIC1M8/BrbGSGFyYaOtdVr0DTA0EPQTxaVTd53j3k58C7QrC18F
	csMcVFYyL2AaNyLIpJyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQst7-00EuWg-Kp; Sun, 06 Mar 2022 15:33:37 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQst4-00EuWG-2n
 for linux-mtd@lists.infradead.org; Sun, 06 Mar 2022 15:33:36 +0000
Received: by mail-pg1-x533.google.com with SMTP id t187so7296178pgb.1
 for <linux-mtd@lists.infradead.org>; Sun, 06 Mar 2022 07:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXYCAvH5QXBZfZLy8LZVI1ZLS4flN5UA88X9rSzFHso=;
 b=iMWe1XWd7bhFyUmsogsIR5EDIkOrbXj7gbAbymf8cCeOuK9CkMQISduNzp0LdQI75n
 aFrgnsQXXMMUaN4GC/jolb/tqXKWvGg0gdG3gatx+DvpPGCl94xsLBnxe8IdtIuYfjez
 LaocSlBRaTyWHtDker5XpCYxDS+YjKHmHOkE5BfjR6Dt0rvRaqe0dP2nbHCXtWUzJadO
 2akDM0NSCJvMOWYCQ0FC4cUDBc7omDEeu50++FtT62RDcFNjS7/zYLHKpMhcxe/TO5CP
 g9MwDAFUMbzooiQNwsLYF2bYWsgsViZkABI0pHVqRfthHNdRTG1aE5bxza5XHU9yBX/K
 NGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXYCAvH5QXBZfZLy8LZVI1ZLS4flN5UA88X9rSzFHso=;
 b=JJKdNwka+f0cTnPm3cMmZmvWmzoCprGY2K9medneugWzP4+nz1jW+9pnjuoST6P8UR
 SVammJbUhcYb0XoEAZy8MPpqZbMTJxpXScIau6lMQRSPT91wAhWYNIoC2uk4MBOI71IL
 Arfmr5zKRBGV4Vmd0Lm/Bfa8NciKBOzS9cZUzRSXy3fGEk9NudaNJP2n1/0yAJehroaD
 UGOn6/lE26CCqyGrcJ8eZTm71CtELa5CSSnX/0lOu1PleZlwwjhNbiGYAQKO8T0J29++
 H8Sm8j2JclzffXtC+oCIgMe39ASZL2t4FCzjaNqzECXz5aDu1mw2/N6QVn/B3ew+oEcK
 sKbg==
X-Gm-Message-State: AOAM53187sEWj5y8pWYLtt6CYtGnsn35IoZcng+3ltgn3G+VyuIF0paV
 Wcs+y2O0uzMJGkYzSDskamE=
X-Google-Smtp-Source: ABdhPJxI3NjDqplpVf/vzZ2RSBIXGfZ9M2R5ELkt8NUwLG1nzA1acU17sF9uo9KfRI6NIKY/nPKtoQ==
X-Received: by 2002:a05:6a00:1f9b:b0:4f4:1c0b:7102 with SMTP id
 bg27-20020a056a001f9b00b004f41c0b7102mr8603324pfb.62.1646580810504; 
 Sun, 06 Mar 2022 07:33:30 -0800 (PST)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:7cd8:5236:546e:2b2c])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a056a0007d600b004f11e614565sm12619338pfu.189.2022.03.06.07.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 07:33:30 -0800 (PST)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org
Subject: [PATCH v2] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Date: Mon,  7 Mar 2022 00:32:13 +0900
Message-Id: <20220306153213.411425-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_073334_176591_C1EFDB7D 
X-CRM114-Status: GOOD (  19.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The regression issue has been caused on S29GL064N and reported it.
Also the change mentioned is to use chip_good() for buffered write.
So disable the change on S29GL064N and use chip_ready() as before.

Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 89 +++++++++++++++--------------
 1 file changed, 47 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a761134fd3be..5e14b60e8638 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -48,6 +48,7 @@
 #define SST49LF040B		0x0050
 #define SST49LF008A		0x005a
 #define AT49BV6416		0x00d6
+#define S29GL064N_MN12		0x0c01
 
 /*
  * Status Register bit description. Used by flash devices that don't
@@ -462,7 +463,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi },
 	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi },
 	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi },
-	{ CFI_MFR_AMD, 0x0c01, fixup_s29gl064n_sectors },
+	{ CFI_MFR_AMD, S29GL064N_MN12, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors },
@@ -801,22 +802,12 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 	return NULL;
 }
 
-/*
- * Return true if the chip is ready.
- *
- * Ready is one of: read mode, query mode, erase-suspend-read mode (in any
- * non-suspended sector) and is indicated by no toggle bits toggling.
- *
- * Note that anything more complicated than checking if no bits are toggling
- * (including checking DQ5 for an error status) is tricky to get working
- * correctly and is therefore not done	(particularly with interleaved chips
- * as each chip must be checked independently of the others).
- */
-static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
-			       unsigned long addr)
+static int __xipram chip_check(struct map_info *map, struct flchip *chip,
+			       unsigned long addr, map_word *expected)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	map_word d, t;
+	map_word oldd, curd;
+	int ret;
 
 	if (cfi_use_status_reg(cfi)) {
 		map_word ready = CMD(CFI_SR_DRB);
@@ -826,17 +817,35 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 		 */
 		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
 				 cfi->device_type, NULL);
-		d = map_read(map, addr);
+		curd = map_read(map, addr);
 
-		return map_word_andequal(map, d, ready, ready);
+		return map_word_andequal(map, curd, ready, ready);
 	}
 
-	d = map_read(map, addr);
-	t = map_read(map, addr);
+	oldd = map_read(map, addr);
+	curd = map_read(map, addr);
+
+	ret = map_word_equal(map, oldd, curd);
 
-	return map_word_equal(map, d, t);
+	if (!ret || !expected)
+		return ret;
+
+	return map_word_equal(map, curd, *expected);
 }
 
+/*
+ * Return true if the chip is ready.
+ *
+ * Ready is one of: read mode, query mode, erase-suspend-read mode (in any
+ * non-suspended sector) and is indicated by no toggle bits toggling.
+ *
+ * Note that anything more complicated than checking if no bits are toggling
+ * (including checking DQ5 for an error status) is tricky to get working
+ * correctly and is therefore not done	(particularly with interleaved chips
+ * as each chip must be checked independently of the others).
+ */
+#define chip_ready(map, chip, addr) chip_check(map, chip, addr, NULL)
+
 /*
  * Return true if the chip is ready and has the correct value.
  *
@@ -855,28 +864,24 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 static int __xipram chip_good(struct map_info *map, struct flchip *chip,
 			      unsigned long addr, map_word expected)
 {
-	struct cfi_private *cfi = map->fldrv_priv;
-	map_word oldd, curd;
-
-	if (cfi_use_status_reg(cfi)) {
-		map_word ready = CMD(CFI_SR_DRB);
+	return chip_check(map, chip, addr, &expected);
+}
 
-		/*
-		 * For chips that support status register, check device
-		 * ready bit
-		 */
-		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
-				 cfi->device_type, NULL);
-		curd = map_read(map, addr);
+static bool cfi_use_chip_ready_for_write(struct map_info *map)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
 
-		return map_word_andequal(map, curd, ready, ready);
-	}
+	return cfi->mfr == CFI_MFR_AMD && cfi->id == S29GL064N_MN12;
+}
 
-	oldd = map_read(map, addr);
-	curd = map_read(map, addr);
+static int __xipram chip_good_for_write(struct map_info *map,
+					struct flchip *chip, unsigned long addr,
+					map_word expected)
+{
+	if (cfi_use_chip_ready_for_write(map))
+		return chip_ready(map, chip, addr);
 
-	return	map_word_equal(map, oldd, curd) &&
-		map_word_equal(map, curd, expected);
+	return chip_good(map, chip, addr, expected);
 }
 
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
@@ -1699,7 +1704,7 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 		 * "chip_good" to avoid the failure due to scheduling.
 		 */
 		if (time_after(jiffies, timeo) &&
-		    !chip_good(map, chip, adr, datum)) {
+		    !chip_good_for_write(map, chip, adr, datum)) {
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
@@ -1707,7 +1712,7 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 			break;
 		}
 
-		if (chip_good(map, chip, adr, datum)) {
+		if (chip_good_for_write(map, chip, adr, datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
@@ -1979,14 +1984,14 @@ static int __xipram do_write_buffer_wait(struct map_info *map,
 		 * "chip_good" to avoid the failure due to scheduling.
 		 */
 		if (time_after(jiffies, timeo) &&
-		    !chip_good(map, chip, adr, datum)) {
+		    !chip_good_for_write(map, chip, adr, datum)) {
 			pr_err("MTD %s(): software timeout, address:0x%.8lx.\n",
 			       __func__, adr);
 			ret = -EIO;
 			break;
 		}
 
-		if (chip_good(map, chip, adr, datum)) {
+		if (chip_good_for_write(map, chip, adr, datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
