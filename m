Return-Path: <SRS0=AizK=EC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3472C4363A
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 22:21:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17F4B206B2
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 22:21:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tfG+cpj0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r17wQTop"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17F4B206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TkAEIhUPp+YwuDfspJusSyI9COLy10e1KqnH3xUhNYw=; b=tfG+cpj0L/+/fD8PyNknw6Jna0
	hB3o0dlP5IR9nNr/Ok773DBsGxgqOZ10VGDPlybgZ6PRzSieYkHpOuchB4AmQXqMXGWVVlialj3Tr
	2r9a1+OqsGdUW75HzKdgEgBABvWNAFJdxfesbozakWQUkEOCVSYyg8erk8E3PP1Wsf6k/qe68zRR0
	ez3CvkPfXCM9GJisZN8TNd1q8XRqKhfkHZUL/I9eBTdnQ+JBvvqf08cpczNN6GAVKetxF9tI5zvwi
	thPd8gMBHZ/jbt3i/cWHpYrVND8Rq5o2RzvGUWLOLlYeYgoT6t4z2b4X6Toal2E+IrrBXdwhx8VAx
	951bii0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXXKI-000162-5U; Tue, 27 Oct 2020 22:20:22 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXXKG-00015Y-3f
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2020 22:20:20 +0000
Received: by mail-lf1-x141.google.com with SMTP id 184so4358282lfd.6
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2020 15:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4rIlx5iHRWLrAeM8TAAis2f6tH+Oo0h4v5TRV3wRals=;
 b=r17wQTopCXHz7OuKPdY4dgSf6QjzwWEOBU4yxsWJfyd6GL/bf7yrh/8dZTi4+PbAYQ
 2pIjORcG5Y5vv5Nq40W7zLMcYwGtrpIwvHe/IHoczbs1UmK0xICmJTqgw0UITkLGa3YV
 a3I+I9GFpC3LIAtDzmn5bvG8PqvOwqFNg2teeJwllvAlBj3Gcd/C5V+gXdialdMcxl4/
 S+y9FbaS/qlYotAoGvTzSxRVpE8XTc9zhAOGk/s2jJB5wjUFVVjFTU4e3WgWzoa00Go0
 QSiqBvgJnu/gHiX6EM6un9zZH5D2irmU/EnXDHi86KHRq4PUnyWMDixMpQ0RP8CAjTke
 jHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4rIlx5iHRWLrAeM8TAAis2f6tH+Oo0h4v5TRV3wRals=;
 b=RPw73hHNqD6WIFsAW5xPWLiu5ThmM/WsUTrRaMHdBh66oV2AyHBz+rE8HOFw6OSNmS
 IOpx5CZtvOZ3Mb30Vlk6eHtfQgl1HOPcDGgG0ZpORqntN/KbGlizDvfIRk25zMThStFS
 EuwXQ1Wu/0SibxQl4gKMtomd9LgQVCZbLv3UtJY20HSxjvGkczsHn/XRhBUEJPVg6oFo
 898b21BWE77Dy8R34/TKbNCv+V3TG+en/i01Luh779cZaXk0UOdHTy/18yhufgr8maGF
 u2CutW7scGOgstYtCLXvJmmbB3KpmOKQJfeG7Vkl5y9KlxTFpTRc/W/dAEBNT9YifSwi
 03kw==
X-Gm-Message-State: AOAM533KOb+Rs5nX8vkTTT2DdaJPWZs3aUsevw5WFtcoti+4Pq8zSWKi
 4N48WFiEve4YtsGrprkGEpAcWVtES1JtOA==
X-Google-Smtp-Source: ABdhPJzmFIcJehj3ruDU//MFnPjgtdih4uICoUJFpawn38lX7qfrbdJqIWvo055Q0dLJORAQUF1mRA==
X-Received: by 2002:ac2:4422:: with SMTP id w2mr1495305lfl.219.1603837218355; 
 Tue, 27 Oct 2020 15:20:18 -0700 (PDT)
Received: from sas-MacBook-Pro.lan ([87.228.30.148])
 by smtp.gmail.com with ESMTPSA id q16sm335033ljj.32.2020.10.27.15.20.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 15:20:17 -0700 (PDT)
From: sa <saproj@gmail.com>
X-Google-Original-From: sa <sa@sas-MacBook-Pro.lan>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: meson: fix meson_nfc_dma_buffer_release() arguments
Date: Wed, 28 Oct 2020 01:20:15 +0300
Message-Id: <20201027222015.17508-1-sa@sas-MacBook-Pro.lan>
X-Mailer: git-send-email 2.17.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_182020_234550_10760397 
X-CRM114-Status: GOOD (  15.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sergei Antonov <saproj@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 Yixun Lan <yixun.lan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Sergei Antonov <saproj@gmail.com>

Arguments 'infolen' and 'datalen' to meson_nfc_dma_buffer_release() were mixed up.
Also extra spaces removed.

Signed-off-by: Sergei Antonov <saproj@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Liang Yang <liang.yang@amlogic.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 48e6dac96be6..578373a3d213 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -246,7 +246,7 @@ static void meson_nfc_select_chip(struct nand_chip *nand, int chip)
 		value = (NFC_CLK_CYCLE - 1) | (meson_chip->bus_timing << 5);
 		writel(value, nfc->reg_base + NFC_REG_CFG);
 		writel((1 << 31), nfc->reg_base + NFC_REG_CMD);
-		nfc->bus_timing =  meson_chip->bus_timing;
+		nfc->bus_timing = meson_chip->bus_timing;
 	}
 }
 
@@ -510,7 +510,7 @@ static int meson_nfc_dma_buffer_setup(struct nand_chip *nand, void *databuf,
 }
 
 static void meson_nfc_dma_buffer_release(struct nand_chip *nand,
-					 int infolen, int datalen,
+					 int datalen, int infolen,
 					 enum dma_data_direction dir)
 {
 	struct meson_nfc *nfc = nand_get_controller_data(nand);
@@ -637,7 +637,7 @@ static int meson_nfc_write_page_sub(struct nand_chip *nand,
 
 	meson_nfc_select_chip(nand, nand->cur_cs);
 
-	data_len =  mtd->writesize + mtd->oobsize;
+	data_len = mtd->writesize + mtd->oobsize;
 	info_len = nand->ecc.steps * PER_INFO_BYTE;
 
 	ret = meson_nfc_rw_cmd_prepare_and_execute(nand, page, DIRWRITE);
@@ -721,7 +721,7 @@ static int meson_nfc_read_page_sub(struct nand_chip *nand,
 
 	meson_nfc_select_chip(nand, nand->cur_cs);
 
-	data_len =  mtd->writesize + mtd->oobsize;
+	data_len = mtd->writesize + mtd->oobsize;
 	info_len = nand->ecc.steps * PER_INFO_BYTE;
 
 	ret = meson_nfc_rw_cmd_prepare_and_execute(nand, page, DIRREAD);
@@ -792,7 +792,7 @@ static int meson_nfc_read_page_hwecc(struct nand_chip *nand, u8 *buf,
 			mtd->ecc_stats.failed++;
 			return bitflips;
 		}
-		ret  = meson_nfc_read_page_raw(nand, buf, 0, page);
+		ret = meson_nfc_read_page_raw(nand, buf, 0, page);
 		if (ret)
 			return ret;
 
@@ -810,7 +810,7 @@ static int meson_nfc_read_page_hwecc(struct nand_chip *nand, u8 *buf,
 				mtd->ecc_stats.failed++;
 			} else {
 				mtd->ecc_stats.corrected += ret;
-				bitflips =  max_t(u32, bitflips, ret);
+				bitflips = max_t(u32, bitflips, ret);
 			}
 		}
 	} else if (buf && buf != meson_chip->data_buf) {
@@ -960,7 +960,7 @@ static int meson_ooblayout_ecc(struct mtd_info *mtd, int section,
 	if (section >= nand->ecc.steps)
 		return -ERANGE;
 
-	oobregion->offset =  2 + (section * (2 + nand->ecc.bytes));
+	oobregion->offset = 2 + (section * (2 + nand->ecc.bytes));
 	oobregion->length = nand->ecc.bytes;
 
 	return 0;
@@ -1080,7 +1080,7 @@ static int meson_chip_buffer_init(struct nand_chip *nand)
 
 	nsectors = mtd->writesize / nand->ecc.size;
 
-	page_bytes =  mtd->writesize + mtd->oobsize;
+	page_bytes = mtd->writesize + mtd->oobsize;
 	info_bytes = nsectors * PER_INFO_BYTE;
 
 	meson_chip->data_buf = kmalloc(page_bytes, GFP_KERNEL);
@@ -1459,7 +1459,7 @@ static struct platform_driver meson_nfc_driver = {
 	.probe  = meson_nfc_probe,
 	.remove = meson_nfc_remove,
 	.driver = {
-		.name  = "meson-nand",
+		.name = "meson-nand",
 		.of_match_table = meson_nfc_id_table,
 	},
 };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
