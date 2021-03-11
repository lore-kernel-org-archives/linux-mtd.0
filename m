Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7ED2C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:20:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E45A64FE7
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E45A64FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+qbjf9Bjedsg1UTYEKgdDoaTMDaPqfvLNOItwc0BIg=; b=MzswK54jVvzKB7Yd5eElP0pHBN
	gJlQ1eq9NkSY3hrSYnh7uZXP0TpHKY9Xfwkx5HcsZ0gZsu8HANaDrZoUnexm196KPJ+63sAoqKZPq
	VmqKzNQBGR5vOryE4y/5PxLNX+V1PfWI/wTjPUm2Ubmgea01Jaeti7SLr8Gt0ZaXsBbCoKS/b3mdr
	qJhT251Vyu+WB+kFGHRczM5M5oXo97rpY9JIw2h58oOAbgoRMhk/erzuDqEOMh86BZFBShzHhweni
	fCIm4FMhGqoM5vpym3RRKo+Xgpv+GsICx3G4cbNBxyhJHdtgXCtkvBcFeaoI6G+PRnK1kSgg5hA4o
	sxBd1VkQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKOy1-009hZ9-ES; Thu, 11 Mar 2021 17:19:21 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKOtw-009gXF-RT
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 17:15:11 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 ga23-20020a17090b0397b02900c0b81bbcd4so9393085pjb.0
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 09:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=g5hE2AWs+PGnGdSTksH6QWUvWe0n4LMgRHwtjboedWo=;
 b=Mu6ah/UDZAy2dCL8eXAiHLdGkUDudEjJULnyNPXEwGzeB3yEQMFqGce/8V7OdKIQ+6
 I1miXZzantBU07ZFNPbSemc/dAYMAsxDTFP7E5wYxc+Huv3M7BrQkFepvWVVTeGVsblK
 Rs3ZmW+ZNVc/qmmtePYrSnhhZJPU00HIVqvNxlLUYCIpUO4eMkIIWV7T4TWORISRW+GA
 +i+jLVgZo/1YCzBTtGBBDJfX+doHSueBH+E34UGj5sWzcRuBREhUXUTvs5pbP/rJenbD
 cyTr/VECrHqMocq82thyY7BLFWg+KE9d2KcT1QFG+WQFPIkWu64byK9ZuhN/rx7SEiD/
 pw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=g5hE2AWs+PGnGdSTksH6QWUvWe0n4LMgRHwtjboedWo=;
 b=W68K40Iv9TfIblKED8LpoJOoo8ZtuW9iElsKIT1u3e4uzDzMqN7z9z75s0uhw7a6Y5
 7BK6LI4jfWnFG+HTXVqz+0wSidru/pzzoUHjzpA7ZOBR1UgBmHg8t+iS8YkanbSRf6O0
 e0cdMjRUCvMxJHLKuIMto5TKCky3+cJCL9iv6zmfWiPy8w/oHkyup1cajTiVhPJUZdHt
 03fqpiMWW4pm0++yrwxkeHajaJw+Wp+FuLlsxRk1yDtdulDqC1yNKNmbE1Q0vh0Id+/8
 1ciVklO9B3FAbQ/gWYwbY4H6c3pnqYi9gQvc2xz5jT3BP7WecgSvMPsI6QVV3awKJ0C9
 n+kA==
X-Gm-Message-State: AOAM530s3iCRCyW80+bSByIsbZipX87UnGUGA+CAt+7MbOL/u/ErMF+1
 m3aZlaxcN2izdg3Kl4XOf7durIqz8pg=
X-Google-Smtp-Source: ABdhPJyq/9C5N7Ah3t18RKohtbHRl6FVhs30IIo9xGFodtxzWevwSSyudBZyJjPIYeCcMg5CQADyGg==
X-Received: by 2002:a17:90b:228e:: with SMTP id
 kx14mr10004058pjb.71.1615482906825; 
 Thu, 11 Mar 2021 09:15:06 -0800 (PST)
Received: from mail.broadcom.net ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id e190sm3007121pfe.3.2021.03.11.09.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:15:06 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: f.fainelli@gmail.com, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd: rawnand: brcmnand: move to polling in pio mode on
 oops write
Date: Thu, 11 Mar 2021 12:09:09 -0500
Message-Id: <20210311170909.9031-2-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210311170909.9031-1-kdasu.kdev@gmail.com>
References: <20210311170909.9031-1-kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_171509_168502_92527089 
X-CRM114-Status: GOOD (  12.12  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This change makes sure that Broadcom NAND driver moves to interrupt
polling on the first brcmnand_write() call.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 1c95b21aa63b..e6966db5f0d8 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2341,6 +2341,10 @@ static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
 	for (i = 0; i < ctrl->max_oob; i += 4)
 		oob_reg_write(ctrl, i, 0xffffffff);
 
+	if (mtd->oops_panic_write)
+		/* switch to interrupt polling and PIO mode */
+		disable_ctrl_irqs(ctrl);
+
 	if (use_dma(ctrl) && (has_edu(ctrl) || !oob) && flash_dma_buf_ok(buf)) {
 		if (ctrl->dma_trans(host, addr, (u32 *)buf, oob, mtd->writesize,
 				    CMD_PROGRAM_PAGE))
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
