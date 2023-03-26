Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E14C7619A
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Mar 2023 23:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ll9nPpJYg/4L0XElxKmoO0m8R/860t8GWdpBByOp8+o=; b=J6AM7Zk3n0FFVW
	4JQSZGNZH0o9KkAj2+Rd95rFCGfov64e4doO3ig4V/y3WNvK97P9ec1kxMCADCXrku2SgxlHjEi+k
	YqNx00rtq46oDCwZbvTFgZZBcbp0LhgGpleBGqrrEwmFsRx9oUT8DitfsbNBF8eAKGsmuEIZXdtU/
	evJqF9MyTYB11hZTa8U/wsYdhg8CqoK2ZPOF7caLQVHJ3XWf1PrAlAvxWLzhB8Y1jyt//4qUuHm4o
	u1GLTNWK9LcnZsfynyb/o1TF5d+Z5tNamepfF4/PG3+1CLgjvBLO61gdYbf+p76mfXZnRGbCKxN5F
	mTE58s5tk0whwOEiGSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgaAQ-009NSo-36;
	Sun, 26 Mar 2023 23:52:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgaAN-009NS5-20
	for linux-mtd@lists.infradead.org;
	Sun, 26 Mar 2023 23:52:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id n19so4086571wms.0
        for <linux-mtd@lists.infradead.org>; Sun, 26 Mar 2023 16:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomn.co.uk; s=google; t=1679874769;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mVT486p4K1nhoxKc0w9XDqDSduSDIiQYo+LAG7KIkEM=;
        b=HBC/iemV+5YQ/3Y5am10OecYtf4KMEnoRZWqfmGt4lxs5KrPn4br2KvYIIsiMVUx8k
         8dWUeuCm8A4LLUmSV5lXvnTzaZjxmf1SjuNYNWUxIoAcupJmCtyZ3+yuNUnTFY2ei0uH
         ZqBGZ3MMxvTNg8ZdwSXLQ3Ui4fox+jqNVgjNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679874769;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mVT486p4K1nhoxKc0w9XDqDSduSDIiQYo+LAG7KIkEM=;
        b=r5SJKFq55vdmkx+PBFFliBCv43RMlpsm/n24vPYq4Mj/DI0zKv/3mb0DpEusG4np/B
         FDWvxi9ifXYXEv0wYz9TbirDGwkTKWfaT7wx5s+SKT8j7yxqtUI2+MZPLCXIDSqUgmHq
         tfDNC9pHp6a+iYO/ouk4R/xrMp5IgQFb0rOE4uwR0pNJ6pNGMBeYQaXfHMxlkCUlbV7Y
         +sTBkDf8O249aVMjyvFNA7jXNb+VZeHHfc/naAor2enn3EpMI2yC1+CaZJPf1VRXmPDO
         FdsLJQsIPycZ1pkgP6ifjBQqQoXg3OipAYG6sDjCJE0A/mhpsq0ZL6LsngRrx4aHWRfo
         9IsA==
X-Gm-Message-State: AO0yUKVcABV47c99FQg51rovnOfpsxhu5GYP+4Kqn34UrwWW9wofAPCZ
	z2QSz+wW9VDM8bUfBg8xlXGR3UePIBDVKis8bw4=
X-Google-Smtp-Source: AK7set/kY+pa2vFDxywtVRreQThedb0qSFQq+xtRD+ls2+F4uwP0BmUg1fg4j+Me7VPXOZEgNnfh5g==
X-Received: by 2002:a05:600c:378d:b0:3ea:f6c4:5f3d with SMTP id o13-20020a05600c378d00b003eaf6c45f3dmr8113371wmr.2.1679874769188;
        Sun, 26 Mar 2023 16:52:49 -0700 (PDT)
Received: from tom-tp (218.95.2.81.in-addr.arpa. [81.2.95.218])
        by smtp.gmail.com with ESMTPSA id x11-20020a05600c21cb00b003ede3e54ed7sm11864410wmj.6.2023.03.26.16.52.48
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 16:52:48 -0700 (PDT)
Date: Mon, 27 Mar 2023 00:52:39 +0100
From: Thomas Nixon <tom@tomn.co.uk>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC] mtd: rawnand: xway: don't yield while holding spinlock
Message-ID: <ZCDax6AWvz9mKGPr@tom-tp>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_165251_659531_4A891978 
X-CRM114-Status: GOOD (  11.52  )
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

xway_nand holds the ebu_lock spinlock during transactions by locking and
unlocking in select_chip. Yielding while this is held is bad, so block
in dev_ready so that nand_wait and nand_wait_ready never yield.

This fixes crashes mostly seen in ath9k_pci_owl_loader.

Tested on a bt homehub v5a, with openwrt-patched 5.10 and 5.15 kernels.

Link: https://github.com/openwrt/openwrt/issues/9829
Signed-off-by: Thomas Nixon <tom@tomn.co.uk>
---

Obviously this is a hack, but other options don't seem great either --
maybe someone has a better idea?

Perhaps this should implement a timeout warning too? Adding an actual
timeout seems tricky, as xway_dev_ready would have to return 1 even when
it's not ready in to break out of the loop in nand_wait/nand_wait_ready
without yielding (and triggering this bug).

 drivers/mtd/nand/raw/xway_nand.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index 035b82aa2f4a..ea10a35db6db 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -122,7 +122,13 @@ static void xway_cmd_ctrl(struct nand_chip *chip, int cmd, unsigned int ctrl)
 
 static int xway_dev_ready(struct nand_chip *chip)
 {
-	return ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_RD;
+	/*
+	 * wait until ready, as otherwise the driver will yield in nand_wait or
+	 * nand_wait_ready, which is a bad idea when we're holding ebu_lock
+	 */
+	while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_RD) == 0)
+		;
+	return 1;
 }
 
 static unsigned char xway_read_byte(struct nand_chip *chip)
-- 
2.33.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
