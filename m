Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8858C43217
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 02:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbdSQTUfIuMonrH/2l9t0j5cYYAxkzzq5CIU23v2o7Q=; b=Mq7MFzA11JtBJ3
	XOfyQPn8cxJ1jq/kzdq6UUln4STBJTtKveeh2yCSFpkdCFJ2f8tuwXrizwyKBX66Flg2OlY3A5MPV
	Yx2etwqLWGCUxlC8Tm4NNH4LzpGayrq6vob5SIFIk7Vl54Gp7/eeyusD+v8uCFrQQOG03CeNDF0aB
	F40C7wiWE6UJiHMrYsDLU+Ahc67pF5eu1BsClP2QkgBpkdH1XEsMj8NPiTpiiaGEPMeg1MkysdLhr
	czpGiyY95CfYCyhq7JXZqUdzmtkitXlDc4YV1Hj6TIrm7oonYYrS0pQSvkni3QifTupU6dssxSb4B
	VpKwc1VG20Xaq4I/FbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWTzL-009g6R-NC; Tue, 22 Mar 2022 02:11:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWTys-009g3h-GV
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 02:10:47 +0000
Received: by mail-pl1-x62f.google.com with SMTP id n18so14268757plg.5
 for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2022 19:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t1lkFoZuyjVvqqybmiHfPVW8TOj0i+C0KlphpwcCdc4=;
 b=ABuSqbWeA8WNGIe2wrSIobZubCuVhO4uQlxAUEeCmHlSNEZRR8JPuaVSTBNgIPHH9U
 gRGYSZH8zCu9yDlSu81Dg0jpFMTdjdhLJbKu7++9FVqmS0WlNyLUvqdOfzLzE4wLodqJ
 xkckEzMqar/IAGBBakUYpELMuQfmH9y+kSYV0vcanuzbtl6LjNHIztUAG/YJ9Hh//TY5
 rXqEzk7gcKfE/F0HOBNVKuCtJ1RBr35kJEws+Md6GBPe+AZXUWweBdKfvh7PJkQPjqiL
 qELkHg984ba+RWyIhNl/4CguO2I83PdC451xzW9eWIU3DbtTfpnPfK3zIiFQUtXcNcW+
 3pSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t1lkFoZuyjVvqqybmiHfPVW8TOj0i+C0KlphpwcCdc4=;
 b=rmlZHg/0pFq1VYaup/6Ji52XIxKox/hwmm+9xoeNuD5jPb9kwG77i2nnJkcmNlUtwh
 qRTx/N+c0QF+KqSrIUdTZ/kpxw6s/6t74pkKbwSRXq2CMv6CchR11+uyjyZCyuQ3Kmr1
 gyMeH/ii1O1WIisZ4agEkyv6AUEerqEcELVe4ojpPTmhB02Q9zu5E8x1ITkhCOlEsZ86
 r2DBYG+owuGLkJcEFG2f2yV+2btAXw0cvv65M4ZKuAjqobaLi8mMjLT62kXbJoEDfv/p
 4SP3SAgZ1a6zOddenvqPrUt1rXd0InLrO0SABeu1mUZ+LmmOVuIG9yrfiq7Xb3wDvcdn
 a9VA==
X-Gm-Message-State: AOAM533m08hrTr6+fX0U+RQR858/TcSINcd3tEcO+3Xaew7mxRyTZFSB
 ci9mwibE7SVkl9ZgZ5VwMpjItivGKJ5IIQ==
X-Google-Smtp-Source: ABdhPJwF+vMgiwNDc0wAD3XotPJF2DiS4B5OMmPeAnitdPmkyTyhLUrqDtSNDCA4OGVXqBgc48+ENw==
X-Received: by 2002:a17:903:1c7:b0:154:1831:1f76 with SMTP id
 e7-20020a17090301c700b0015418311f76mr16034042plh.0.1647915041670; 
 Mon, 21 Mar 2022 19:10:41 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:1847:b4dd:1227:a1f6])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a655bc5000000b00372f7ecfcecsm15673579pgr.37.2022.03.21.19.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 19:10:41 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v5 3/3] mtd: cfi_cmdset_0002: Add S29GL064N ID definition
Date: Tue, 22 Mar 2022 11:10:01 +0900
Message-Id: <20220322021001.138206-4-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220322021001.138206-1-ikegami.t@gmail.com>
References: <20220322021001.138206-1-ikegami.t@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_191042_573696_8E0CE9FD 
X-CRM114-Status: GOOD (  13.67  )
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

It is for the model number 01, 02, V1 and V2.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 59334530dd46..67453f59c69c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -48,6 +48,7 @@
 #define SST49LF040B		0x0050
 #define SST49LF008A		0x005a
 #define AT49BV6416		0x00d6
+#define S29GL064N_MN12		0x0c01
 
 /*
  * Status Register bit description. Used by flash devices that don't
@@ -445,7 +446,7 @@ static void fixup_quirks(struct mtd_info *mtd)
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 
-	if (cfi->mfr == CFI_MFR_AMD && cfi->id == 0x0c01)
+	if (cfi->mfr == CFI_MFR_AMD && cfi->id == S29GL064N_MN12)
 		cfi->quirks |= CFI_QUIRK_DQ_TRUE_DATA;
 }
 
@@ -475,7 +476,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi },
 	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi },
 	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi },
-	{ CFI_MFR_AMD, 0x0c01, fixup_s29gl064n_sectors },
+	{ CFI_MFR_AMD, S29GL064N_MN12, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors },
@@ -833,7 +834,7 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 			       unsigned long addr, map_word *expected)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	map_word d, t;
+	map_word oldd, curd;
 	int ret;
 
 	if (cfi_use_status_reg(cfi)) {
@@ -844,20 +845,20 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 		 */
 		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
 				 cfi->device_type, NULL);
-		t = map_read(map, addr);
+		curd = map_read(map, addr);
 
-		return map_word_andequal(map, t, ready, ready);
+		return map_word_andequal(map, curd, ready, ready);
 	}
 
-	d = map_read(map, addr);
-	t = map_read(map, addr);
+	oldd = map_read(map, addr);
+	curd = map_read(map, addr);
 
-	ret = map_word_equal(map, d, t);
+	ret = map_word_equal(map, oldd, curd);
 
 	if (!ret || !expected)
 		return ret;
 
-	return map_word_equal(map, t, *expected);
+	return map_word_equal(map, curd, *expected);
 }
 
 static int __xipram chip_good(struct map_info *map, struct flchip *chip,
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
