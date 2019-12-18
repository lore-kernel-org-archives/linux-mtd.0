Return-Path: <SRS0=i5Q8=2I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7460C43603
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2019 09:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88C0B2072B
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2019 09:57:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PEmlFAtf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqBQcuqW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88C0B2072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=okM2jzE/x3YLEAVf9ei+yqhACP565PNZv0p8tTzl4A0=; b=PEmlFAtfF7NS/QKLnOt9rEuzu7
	F/N3VFHTnUQ+ww0tLDQJn1xJ6m4AID2ZZC9/5OMJ2G21FKt+u2opCquLTq9FTriJajnn3ZS2s8HNv
	hddasFhm2QiaSyJwUgkqL/tj6dopxgrI16yFbi56DyOtTCFoGiqZzhtxdAKhQRepq4bNpW1ZNfu+8
	YAb5dGs6tMuxNijYkEvOnEQlbne2LGdPJG2QyInC+ie0xVEgIHMc6AkEExx/KowziRpbFeQSLpZdP
	21/J3hD2uT55NL22OQPWSccw8lqSNPvDBQKFlQXwabkemIGRXQUIdzFnySM/IaspRY1dUdO1KsnKR
	5T/mQSgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihW5M-0004aw-49; Wed, 18 Dec 2019 09:57:40 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihW5H-0004ad-Ox
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2019 09:57:37 +0000
Received: by mail-lf1-x141.google.com with SMTP id r14so1237349lfm.5
 for <linux-mtd@lists.infradead.org>; Wed, 18 Dec 2019 01:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KjaQHbXEtUPbdJ5QolbnF2SXTiBMUzW0K/9APW3u0l8=;
 b=qqBQcuqWxfmEOhAv2j2zB9V7DG9wlHUZh0Lntv5/nArDEyFNeBWjxQSpkFQpcMGQzL
 nOZnjHG21pchuRXBzstaMuKQHSZsPed929jEUocODrPV9zt9pzGPKQBh620ztRuFgx6+
 h3qtMwV6Q9eD3EpCNfUKH4Nim1UxocwqsqmSb/RatDe866l5a1DfBj7f69Ddx9ngilJu
 M5H/Fq7e120StNIm5qwvoMHC2XPgSCNuZfp47CHoAfmsSKUELixulRK/xrfbKms6m11h
 w41zuUHkdpNPrs+zx+CIr/BYyn6+C7o8WD+8H30UpKFOBJ2jCL3WIj1d4iYuSCURaQ1g
 lexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KjaQHbXEtUPbdJ5QolbnF2SXTiBMUzW0K/9APW3u0l8=;
 b=m8bKpWvKrWVdR4g1y1ns7UXi/c/SnkNaGyoRcyJzak/oR07TClo1gLhQurMq2UlS7b
 AGdwM371ZJmYzEo3gllB3U42VTvsTZ7Lmyg/5uVh/8E0VPUyCKtbo8h+6kGWAve07Gis
 YEtNm65AoeIxM0FqDEp9vxlwotPcsXF7zUVYCkaU7nvCy9BkBLgUBp3EH/qpaDU4RoV3
 55770LtaYzc0Fa4NIfvhU9d19H9wCVuLKZo+53AgM5L1Y5mE2npPUriNf5s7/4ZZGVIW
 JTz93VSjJ6z/X7YTgLr1z3+U5xXno8nZ7VPgCGuRCEd4OQvri333eeADy9mOTZ2u94jk
 toVg==
X-Gm-Message-State: APjAAAWtpxkTMJKbN47IDbQuae0YP3pIb4utRaGaK7VZw04s4RD360lk
 iwbw6ljCrW/QbApLa7OVKcc=
X-Google-Smtp-Source: APXvYqw85KoX8B9V58ziifcfW3NELC+JU9AdHtK13IDrwqjZeTnTVLzU9rFYc1TPL2FPyuBgBhEKNQ==
X-Received: by 2002:ac2:4194:: with SMTP id z20mr1226185lfh.20.1576663053560; 
 Wed, 18 Dec 2019 01:57:33 -0800 (PST)
Received: from kbp1-lhp-A00636.cisco.com ([195.238.92.77])
 by smtp.gmail.com with ESMTPSA id o69sm830412lff.14.2019.12.18.01.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 01:57:33 -0800 (PST)
From: Vasyl Gomonovych <gomonovych@gmail.com>
To: piotrs@cadence.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v2] mtd: cadence: Fix cast to pointer from integer of
 different size warning
Date: Wed, 18 Dec 2019 11:57:15 +0200
Message-Id: <20191218095715.25585-1-gomonovych@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216110947.6fb2423a@xps13>
References: <20191216110947.6fb2423a@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_015735_832995_A7044AA2 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: Vasyl Gomonovych <gomonovych@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use dma_addr_t type to pass memory address and control data in
DMA descriptor fields memory_pointer and ctrl_data_ptr
To fix warning: cast to pointer from integer of different size

Signed-off-by: Vasyl Gomonovych <gomonovych@gmail.com>
---

Changes since v1:
 * Remove type casting (void *)(uintptr_t)dma_buf
 * Change type of function parameters
 
 drivers/mtd/nand/raw/cadence-nand-controller.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 3a36285a8d8a..f6c7102a1e32 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -914,8 +914,8 @@ static void cadence_nand_get_caps(struct cdns_nand_ctrl *cdns_ctrl)
 /* Prepare CDMA descriptor. */
 static void
 cadence_nand_cdma_desc_prepare(struct cdns_nand_ctrl *cdns_ctrl,
-			       char nf_mem, u32 flash_ptr, char *mem_ptr,
-			       char *ctrl_data_ptr, u16 ctype)
+			       char nf_mem, u32 flash_ptr, dma_addr_t mem_ptr,
+				   dma_addr_t ctrl_data_ptr, u16 ctype)
 {
 	struct cadence_nand_cdma_desc *cdma_desc = cdns_ctrl->cdma_desc;
 
@@ -931,13 +931,13 @@ cadence_nand_cdma_desc_prepare(struct cdns_nand_ctrl *cdns_ctrl,
 	cdma_desc->command_flags |= CDMA_CF_DMA_MASTER;
 	cdma_desc->command_flags  |= CDMA_CF_INT;
 
-	cdma_desc->memory_pointer = (uintptr_t)mem_ptr;
+	cdma_desc->memory_pointer = mem_ptr;
 	cdma_desc->status = 0;
 	cdma_desc->sync_flag_pointer = 0;
 	cdma_desc->sync_arguments = 0;
 
 	cdma_desc->command_type = ctype;
-	cdma_desc->ctrl_data_ptr = (uintptr_t)ctrl_data_ptr;
+	cdma_desc->ctrl_data_ptr = ctrl_data_ptr;
 }
 
 static u8 cadence_nand_check_desc_error(struct cdns_nand_ctrl *cdns_ctrl,
@@ -1280,8 +1280,7 @@ cadence_nand_cdma_transfer(struct cdns_nand_ctrl *cdns_ctrl, u8 chip_nr,
 	}
 
 	cadence_nand_cdma_desc_prepare(cdns_ctrl, chip_nr, page,
-				       (void *)dma_buf, (void *)dma_ctrl_dat,
-				       ctype);
+				       dma_buf, dma_ctrl_dat, ctype);
 
 	status = cadence_nand_cdma_send_and_wait(cdns_ctrl, thread_nr);
 
@@ -1360,7 +1359,7 @@ static int cadence_nand_erase(struct nand_chip *chip, u32 page)
 
 	cadence_nand_cdma_desc_prepare(cdns_ctrl,
 				       cdns_chip->cs[chip->cur_cs],
-				       page, NULL, NULL,
+				       page, 0, 0,
 				       CDMA_CT_ERASE);
 	status = cadence_nand_cdma_send_and_wait(cdns_ctrl, thread_nr);
 	if (status) {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
