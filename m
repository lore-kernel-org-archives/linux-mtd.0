Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC20C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 02:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CBsUCxDirI4MyjIfdPVIsjdpiRrgxGR9stCFKKP6Efc=; b=g8kJl5l6Gz7y5P
	GeVmC6v2IRsVnxtahb+cbxM25rsEirLFDJofw6Z/o9oPPz51kD1kGvfGRSw5PiLyqJQealmU//l/j
	BSAVj+qODUYwrSUS1vJjiBXWGhhpc6Lek0RdFl8i//YTe+SIPbUh5sx1dZKPmqFobF/nC0ZABds3a
	A5wib1vAHylpfj/azL0e/W+mSTAkcSrua/NgiKJC6B74fmbmoCDUftBGT3WAMZeweLnatXEv8ygci
	qtEDQES9dTW1R1Mmf6nT5SGChKa6tzJxJ5Nm/FEHFZf1QxK8Xrl0Dmp3pKvhmCTy0/w8bxur6aEmE
	3OnKpToLJOCe1PNVVHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWTzA-009g59-Ry; Tue, 22 Mar 2022 02:11:00 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWTyp-009g3M-GI
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 02:10:44 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so899301pjl.4
 for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2022 19:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j0NQxKjly0nqK+Zg1+EsccxDdb8ufucNliJsJwxIFJ0=;
 b=AjSbFypixNHgd6glOF4XCOxL55EIecI8X/ZAsz/glwzNf7ytgP5uj0+oAGewOuv1i6
 UzxxRPkqOvxgpY01wHt7aX5FVJDE6/y16KUqfjAeiC15M4mTcmXZTEEuGxAd2UdqBByf
 raREGCkx4bllIB0TkhsxPSnd797FDP9eP7UXtd5f3OPbaw0fJ0F20fgcqk6ycf3pSz/C
 v/YONjti9+ms/thzSEDoJhmVbKx7ytZ742TknuUW20PKKfKzEcZLW7DfkC5Lq1Skl8+H
 jHQ3WWxuOzMgqmrJ0uX2tijX15VgXX8cGrSOvkdomafcSLMtaVI0zpkGcY1DFLhHjz5F
 WOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j0NQxKjly0nqK+Zg1+EsccxDdb8ufucNliJsJwxIFJ0=;
 b=asRlFDmR0XSBvNrY475Rv/5wfBokdw5wddDdE45oOMluaraJXqflbrtcuA2wr3vjPa
 sFYFxWwj9wwX8rFUeT1tbHI9FkLHSLJUyeY0J5ExNsNkb6e7GIa0WMWVz7dHBxahfTiM
 rxC3QvhXl3FlioElq0sX14UnTI94lEhdXvvtAJXtEKtn/cU0HnWn9egDqrTs4sUp1hw1
 JMuNGv/vLHslS4uauGb/MGQUmG6KNsoUJwsOgELGRpKnFoFIYvw7+gn82KVOt53b3NYp
 hh2AYQe1L89dK1LA3ZGuwWL9dxJTN3XkrpcLZxinFX8kdtB9qHpM/0auIE6It+IBEEJt
 DW+g==
X-Gm-Message-State: AOAM531rCBKtBHih7rfQCWd8wmvMK683ydKAa+oQcRI6oWfRa8GjEE1t
 A9+WLpaooWyf8l54//HrX4GAxuCdaTIPVA==
X-Google-Smtp-Source: ABdhPJwLyb6N0/nqD9s7kNXVw4oaMnIZnEFhjII5jgFgCwYZzvxMgAiy0HKSwqbh++Q0EYxMnV6img==
X-Received: by 2002:a17:90b:250f:b0:1b8:f257:c39 with SMTP id
 ns15-20020a17090b250f00b001b8f2570c39mr2261902pjb.135.1647915038566; 
 Mon, 21 Mar 2022 19:10:38 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:1847:b4dd:1227:a1f6])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a655bc5000000b00372f7ecfcecsm15673579pgr.37.2022.03.21.19.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 19:10:38 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH v5 2/3] mtd: cfi_cmdset_0002: Use chip_ready() for write on
 S29GL064N
Date: Tue, 22 Mar 2022 11:10:00 +0900
Message-Id: <20220322021001.138206-3-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220322021001.138206-1-ikegami.t@gmail.com>
References: <20220322021001.138206-1-ikegami.t@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_191039_573704_1217D3A3 
X-CRM114-Status: GOOD (  20.15  )
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

Since commit dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to
check correct value") buffered writes fail on S29GL064N. This is
because, on S29GL064N, reads return 0xFF at the end of DQ polling for
write completion, where as, chip_good() check expects actual data
written to the last location to be returned post DQ polling completion.
Fix is to revert to using chip_good() for S29GL064N which only checks
for DQ lines to settle down to determine write completion.

Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 42 +++++++++++++++++++++++------
 include/linux/mtd/cfi.h             |  1 +
 2 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 9ccde90dc180..59334530dd46 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -59,6 +59,10 @@
 #define CFI_SR_WBASB		BIT(3)
 #define CFI_SR_SLSB		BIT(1)
 
+enum cfi_quirks {
+	CFI_QUIRK_DQ_TRUE_DATA = BIT(0),
+};
+
 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 #if !FORCE_WORD_WRITE
@@ -436,6 +440,15 @@ static void fixup_s29ns512p_sectors(struct mtd_info *mtd)
 		mtd->name);
 }
 
+static void fixup_quirks(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	if (cfi->mfr == CFI_MFR_AMD && cfi->id == 0x0c01)
+		cfi->quirks |= CFI_QUIRK_DQ_TRUE_DATA;
+}
+
 /* Used to fix CFI-Tables of chips without Extended Query Tables */
 static struct cfi_fixup cfi_nopri_fixup_table[] = {
 	{ CFI_MFR_SST, 0x234a, fixup_sst39vf }, /* SST39VF1602 */
@@ -474,6 +487,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 #if !FORCE_WORD_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers },
 #endif
+	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_quirks },
 	{ 0, 0, NULL }
 };
 static struct cfi_fixup jedec_fixup_table[] = {
@@ -846,6 +860,18 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 	return map_word_equal(map, t, *expected);
 }
 
+static int __xipram chip_good(struct map_info *map, struct flchip *chip,
+			      unsigned long addr, map_word *expected)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	map_word *datum = expected;
+
+	if (cfi->quirks & CFI_QUIRK_DQ_TRUE_DATA)
+		datum = NULL;
+
+	return chip_ready(map, chip, addr, datum);
+}
+
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
 {
 	DECLARE_WAITQUEUE(wait, current);
@@ -1662,11 +1688,11 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 		}
 
 		/*
-		 * We check "time_after" and "!chip_ready" before checking
-		 * "chip_ready" to avoid the failure due to scheduling.
+		 * We check "time_after" and "!chip_good" before checking
+		 * "chip_good" to avoid the failure due to scheduling.
 		 */
 		if (time_after(jiffies, timeo) &&
-		    !chip_ready(map, chip, adr, &datum)) {
+		    !chip_good(map, chip, adr, &datum)) {
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
@@ -1674,7 +1700,7 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 			break;
 		}
 
-		if (chip_ready(map, chip, adr, &datum)) {
+		if (chip_good(map, chip, adr, &datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
@@ -1942,18 +1968,18 @@ static int __xipram do_write_buffer_wait(struct map_info *map,
 		}
 
 		/*
-		 * We check "time_after" and "!chip_ready" before checking
-		 * "chip_ready" to avoid the failure due to scheduling.
+		 * We check "time_after" and "!chip_good" before checking
+		 * "chip_good" to avoid the failure due to scheduling.
 		 */
 		if (time_after(jiffies, timeo) &&
-		    !chip_ready(map, chip, adr, &datum)) {
+		    !chip_good(map, chip, adr, &datum)) {
 			pr_err("MTD %s(): software timeout, address:0x%.8lx.\n",
 			       __func__, adr);
 			ret = -EIO;
 			break;
 		}
 
-		if (chip_ready(map, chip, adr, &datum)) {
+		if (chip_good(map, chip, adr, &datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index fd1ecb821106..d88bb56c18e2 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -286,6 +286,7 @@ struct cfi_private {
 	map_word sector_erase_cmd;
 	unsigned long chipshift; /* Because they're of the same type */
 	const char *im_name;	 /* inter_module name for cmdset_setup */
+	unsigned long quirks;
 	struct flchip chips[];  /* per-chip data structure for each chip */
 };
 
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
