Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2928C4CEC4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 01:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70A0C218AE
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 01:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e9jxs1wz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxMr17/n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70A0C218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A9neTfU32X9cYIiMccwCLGeL9l61f4zkjJvL6+Iu5DU=; b=e9jxs1wzHcflll
	9CFaodjqkfTikyFE4CGfxOPWWO5sQDBt1LxgsJftKjcr29GIMwaTFW5Fbcs00BAxk9koSdJ04Oi4z
	/wHoIt48Dzw1+qZO8af0hMJYJTtXcKSPv0gGlQXhAHaYl2KqfxzcUqQHMGcB8oW6sIioUX6qosCvm
	DxLnM1tnTtWWGr4GFw23fYEAzEyrIacR+tuMNJzfnPBFtnyNbNBI2I/Q77g50iMtkDDG5rzHLpFR6
	Jx1CHzIe3jjtrA7XQh9SFJk9MbDRWPMi0Jxfm22TM2BQtqkVn9EIJloKbfm7tOVhoJb3rvfXqJPZ1
	vnC3cLzdZ+EWCl/qGGnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAlZa-0005p1-DX; Thu, 19 Sep 2019 01:49:30 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAlZX-0005oe-J4
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 01:49:28 +0000
Received: by mail-pf1-x444.google.com with SMTP id 205so1182729pfw.2
 for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2019 18:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GfRZjmE14s24eFUinYyfK45PVFtEOKsb6d5yrSz1evU=;
 b=hxMr17/nmJPBxQAZZIOUCXhEwYbKjnmK3niA0as0ONDJmiTjopFWtSiU5KM3iSn38r
 A4zZd+wZExIVbmTcuXo63u7rE4pMS05S0yDNChYyHF+KYHuFmNO0hf55rdun+AsQ/fQC
 YVDX3uDcUdgkivwk54d/QR/hCY2uYA5yAAtnhH+u7ZqAl/MbPONR4B5JN6PM5bqGrWdV
 nAJ2N0wJ9ctfNF+ri+7+5oEUwILfa1+Be2/ZAcPZbu1N+Mqaf6AelFG8K/HfCGAhQvj6
 H3QJHROsgDPG8Hx0AlbqWteCSl7aiMfqkWgZdT+1Hqc6mLnLKsWZB+qSi4WLbF08pp4Z
 hKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GfRZjmE14s24eFUinYyfK45PVFtEOKsb6d5yrSz1evU=;
 b=YDrZx8pE3RX7gOJJBTkMyIpe7EasTB78Yhn/x2Nce1bsMc8o0nP9FUW76ptt1RaExu
 D28LA9ETbGEJKvCLCMdDWU35wNik6qIxD5MrJz9uXhmuUrAXvpTJroodk4mZ0Wyqy6ze
 Zf58H9rnM7g01kEx4Ct8r4A33TtnNqoL6dyzFBGkmMU+19K7sK7mVCGy6Dz7O3fGdyrG
 tRrj+xkJjRN8iLUl48MlKn/2zI3bufSvKzc/u0UaEyRsqU9iwWDIf2YSvW0BEb6ISTTL
 /lBb2hzMBa7/+2k5v2UXRFSbBT3YA30j0Hb+bcQZK68+qnbyu8d/KonYtCOQX/qF9Mdj
 6omg==
X-Gm-Message-State: APjAAAXhrqGWy58ASVe4RN5plrN9CNY6OvkA4MeWSpDPKp+0hrXbE41+
 s5x3eRImDw04UKHfp7n/bFQ=
X-Google-Smtp-Source: APXvYqwtvasIU4amb4Lm9GYQiP80nKnqve4NpqLuK9BEjTQpLBNPHDFtw47mi6Y70Cy9HQg7vq/CWA==
X-Received: by 2002:a63:e54d:: with SMTP id z13mr6662464pgj.209.1568857766311; 
 Wed, 18 Sep 2019 18:49:26 -0700 (PDT)
Received: from D19-03074.biamp.com (tel3187236.lnk.telstra.net.
 [203.54.172.54])
 by smtp.gmail.com with ESMTPSA id k15sm6734598pgt.66.2019.09.18.18.49.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Sep 2019 18:49:25 -0700 (PDT)
From: Shreyas Joshi <shreyasjoshi15@gmail.com>
X-Google-Original-From: Shreyas Joshi <shreyas.joshi@biamp.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com,
 linux-mtd@lists.infradead.org, shreyasjoshi15@gmail.com
Subject: [PATCH] driver/mtd/spi-nor: Regression lock/unlock fail
Date: Thu, 19 Sep 2019 11:49:16 +1000
Message-Id: <20190919014916.1303-1-shreyas.joshi@biamp.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190918_184927_634148_C6FE9168 
X-CRM114-Status: GOOD (  11.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: shreyas <shreyasjoshi15@gmail.com>

      The n25q128 micron chips cannot be treated similar to STM SPI NOR
      when it comes to flash lock/unlock. The JDEC ID read here is just 1 byte
      and it is not sufficient to distinguish between different chips. Thus,
      memory type is used here in addition to JDEC ID to distinguish further.
      Once the unique manufacture id is detected, it will invoke the required
      lock/unlock function required for n25 micron chipsets.

Signed-off-by: shreyas <shreyasjoshi15@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 20 +++++++++++---------
 include/linux/mtd/spi-nor.h   |  4 ++--
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f3b2df2c52b4..6dfdd95a5961 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1356,6 +1356,7 @@ static int n25q_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	uint32_t offset = ofs;
 	int ret = 0;
+
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
@@ -1373,7 +1374,8 @@ static int n25q_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		status_new = (status_old & ~(SR_BP2|SR_BP0)) | SR_BP1;
 	else
 		status_new = (status_old & ~(SR_BP2|SR_BP1)) | SR_BP0;
-	if ((status_new & (SR_BP2|SR_BP1|SR_BP0)) > (status_old & (SR_BP2|SR_BP1|SR_BP0))) {
+	if ((status_new & (SR_BP2|SR_BP1|SR_BP0)) >
+			(status_old & (SR_BP2|SR_BP1|SR_BP0))) {
 		write_enable(nor);
 		if (write_sr(nor, status_new) < 0)
 			return -EINVAL;
@@ -1392,6 +1394,7 @@ static int n25q_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	uint32_t offset = ofs;
 	int ret = 0;
+
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
@@ -4266,14 +4269,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (JEDEC_MFR(info) == SNOR_MFR_ST ||
 	    JEDEC_MFR(info) == SNOR_MFR_MICRON ||
 	    info->flags & SPI_NOR_HAS_LOCK) {
-	if (JEDEC_MT(info) == SNOR_MT_MICRON) {
-		nor->flash_lock = n25q_lock;
-		nor->flash_unlock = n25q_unlock;
-	}
-	else {
-		nor->flash_lock = stm_lock;
-		nor->flash_unlock = stm_unlock;
-	}
+		if (JEDEC_MT(info) == SNOR_MT_MICRON) {
+			nor->flash_lock = n25q_lock;
+			nor->flash_unlock = n25q_unlock;
+		} else {
+			nor->flash_lock = stm_lock;
+			nor->flash_unlock = stm_unlock;
+		}
 	nor->flash_is_locked = stm_is_locked;
 	}
 	if (nor->flash_lock && nor->flash_unlock && nor->flash_is_locked) {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index aaa3c1065b3b..3939cd77d778 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -27,8 +27,8 @@
 #define SNOR_MFR_WINBOND	0xef /* Also used by some Spansion */
 
 /* Manufacturer Memory Type
-* The second byte returned from the flash after sending opcode SPINOR_OP_RDID.
-*/
+ * The second byte returned from the flash after sending opcode SPINOR_OP_RDID.
+ */
 #define SNOR_MT_MICRON	0xba
 #define SNOR_MT_ST      0x20
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
