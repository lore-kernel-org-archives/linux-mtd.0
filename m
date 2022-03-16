Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B41C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Mar 2022 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJqbKsQjxFprdCvHePZa2w8uALaI6MLJXVDZP6qq6Qk=; b=nNCzL1sSDbjUrw
	AOjQPv4zSm2kl/n6of+UpxDIHNqMzHCBa0ExwWZ65zp05fdISI+G60eC24CjwJpDXfzwKVTCieRci
	frw1FtixWpxzZDXetxPzZpEBJ196JCops1yeHzF/qXud1hxMyrFLx0BMgGDDs7uWWM2lhd9dzG1IJ
	oxTpIlk6HlvKVV+iBVXmzOIwZl728z/etPC4j+SGpehrhN8TqZKN936I0JWGKPVEZHO3gYWqRGqC9
	Z1Iu9tWsh+QWmbZPnNNSJCVVf7mCuO15ymBc3Grxa3yFHVsYCj0jS3quTG9IL8V8xRiMbPc7UX5Y8
	a8djTVTIRpsKA4wasmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVzc-00Dev9-Sc; Wed, 16 Mar 2022 15:55:20 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVzU-00DetO-2j
 for linux-mtd@lists.infradead.org; Wed, 16 Mar 2022 15:55:13 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 kx13-20020a17090b228d00b001c6715c9847so666264pjb.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Mar 2022 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KD5Vik00eM9ZbihLcHenZZWI4BOquYXJRbBsUzTo9js=;
 b=nOLC969K9agbENEcz5XtoQ6AYS58HoDltAylg+Y1q4QiGM23x7utwhvpShM/kRCk6E
 iGUfMblkurjKlntkr2pf4vdr69JxUKvSbBb8FOYLslldrZ1moEU/kkl38bFC6UO67fL0
 zXpETZqk0HKglOvIpHpsazU9pl0otXfAw2C7XqCUMjsgeLWJ3XgK3UnODGUw1pJ3F8Zx
 DxcZmuLCCdD5RfigsYQ+q54J/ufOo8bDhnjXXY70sJXznROenRYxJGhh5IckF1e+6XWa
 sJl9TOcWUwIlhWKRoY+RUPCIogxSVCjhsghEPFKKzKvZ6toJvB+iwl2BV9QwgxYh7vTq
 NcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KD5Vik00eM9ZbihLcHenZZWI4BOquYXJRbBsUzTo9js=;
 b=HW3IfxBMTxHXFZiR6N8c/RDOm+KHtoCPozUJZ9ULkChvYsUKGcup35VUSbHcUvgN/A
 m/YkqO1OwGV3btvRvNNczUNWIEYq8Dh0KAdDE5cT6H/zZlJSVehk/b/5tFen0E3PLumA
 v8mRxIhFKtLcXmNEngEhS+pPVRyoHIGG8wBdpeKPXATXutsihKfJFce8TSg3YalGIP9d
 Mp2eqcPucROqgokYu2XFSa834MN4HYMotRkYBrVKuvvuYJB4wi+nSy7x3ChKd5cw+wMH
 Ddq4ipXdiAlGSkwnE5QYukIfPIu1oDVmDizwcsSOoGCEgrgj+6bJyYaRMyyOrQAkqpTK
 xV8g==
X-Gm-Message-State: AOAM531Ji8x4FroC4q2QYZrFKGS70aZW9lO+Ltsqkzdds8oD09wCUPZs
 t/IPrs5psyaAJ/z+5mOzosG8WQWErudZgQ==
X-Google-Smtp-Source: ABdhPJxVLKMm1Ja08E3Qvvn0H8/k8tf/6608qvzu8MlFBHsscsInWpsnw/NGSrF9gJ1+DGV1GMPnOw==
X-Received: by 2002:a17:90b:4f8f:b0:1bf:84ad:1fe6 with SMTP id
 qe15-20020a17090b4f8f00b001bf84ad1fe6mr346352pjb.189.1647446110661; 
 Wed, 16 Mar 2022 08:55:10 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:9500:ad27:b03f:5499])
 by smtp.gmail.com with ESMTPSA id
 x29-20020aa79a5d000000b004f0ef1822d3sm3427852pfj.128.2022.03.16.08.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 08:55:10 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH v4 1/3] mtd: cfi_cmdset_0002: Move and rename
 chip_check/chip_ready/chip_good_for_write
Date: Thu, 17 Mar 2022 00:54:53 +0900
Message-Id: <20220316155455.162362-2-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316155455.162362-1-ikegami.t@gmail.com>
References: <20220316155455.162362-1-ikegami.t@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_085512_150481_D42ADD31 
X-CRM114-Status: GOOD (  16.59  )
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

This is a preparation patch for the functional change in preparation to a change
expected to fix the buffered writes on S29GL064N.

Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 77 ++++++++++++-----------------
 1 file changed, 32 insertions(+), 45 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a761134fd3be..e68ddf0f7fc0 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -801,22 +801,12 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
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
@@ -826,17 +816,35 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
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
@@ -852,32 +860,11 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
  * as each chip must be checked independently of the others).
  *
  */
-static int __xipram chip_good(struct map_info *map, struct flchip *chip,
-			      unsigned long addr, map_word expected)
-{
-	struct cfi_private *cfi = map->fldrv_priv;
-	map_word oldd, curd;
-
-	if (cfi_use_status_reg(cfi)) {
-		map_word ready = CMD(CFI_SR_DRB);
-
-		/*
-		 * For chips that support status register, check device
-		 * ready bit
-		 */
-		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
-				 cfi->device_type, NULL);
-		curd = map_read(map, addr);
-
-		return map_word_andequal(map, curd, ready, ready);
-	}
-
-	oldd = map_read(map, addr);
-	curd = map_read(map, addr);
-
-	return	map_word_equal(map, oldd, curd) &&
-		map_word_equal(map, curd, expected);
-}
+#define chip_good(map, chip, addr, expected) \
+	({ \
+		map_word datum = expected; \
+		chip_check(map, chip, addr, &datum); \
+	})
 
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
 {
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
