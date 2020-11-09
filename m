Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C6EC2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:23:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B560B206F1
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 18:23:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kLAaQxi6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F+ZvdTVf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B560B206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0JPJh5x9sYDiBUOX8A/85x0XQf3tuSTQnmrCnkWyeQU=; b=kLAaQxi6FZoRcQl+u1QCeCD2x
	Bh9pLoowMOZQyq/pPCiBaKKWnzijkPjIsVvg73QeBRr09r3O9CnwMhvJff7AuMyJJkfjBUbjGzKtx
	bEgFsB86pdhQLk2TfIftA9maAASL3wDpjZV/LC5MuN6Wky6zl1U5nnss/EqdrkvFVjgVwE7/d1ojp
	7CCMcQxQCMdlIX/NPqX6/+EseqGxTPjQ9jUqxFLO+ZprhszjcZ9Ye2+BNvtLOYhSU+O5+v8kZkpNS
	mC/M6zipw21T/G6K4jEtmcE0vn7AlVwNuDM5CEAnvSxS1NSp1up5nwjBMf+nJ3EuyOxs2W3masOPk
	zggE4z6vA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcBoH-0000rt-2C; Mon, 09 Nov 2020 18:22:33 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcBo8-0000ok-4G
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 18:22:28 +0000
Received: by mail-wm1-x343.google.com with SMTP id h2so410345wmm.0
 for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2020 10:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kN+nLzLc6b7cOpaWz6eZ4gZDLXqa51d6pByGdFZOfqY=;
 b=F+ZvdTVfnmjMXGSx8RoJArP9mYgb6L0mURGvhy8zo5keNvI2erU5GFgmqjFjC1EBnr
 oYJKjRClMhVseA4yWoa+zele2IZaHfRfpdW7TCR6W/c+wsKQ/RwjMHcol69anMrdXVem
 egxPWz9OSnO46hy3I0k3b41lurIRC6St9SJep8l+cRKoVsJBzvszVtKHYZber7rRh3Pz
 SpWHFdgn41nzJsiqZA7TWG1f6TPQa6CvmajSDYkrRxjGm+ScUYSQHXWxf4L8jb0oNM7b
 hXKAlwJ9AWT5GstvOuq8Rh7cV/CbkyzaldLohyd1+ykzfpUgkW+Q4jFcSl8kgtdP539O
 HLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kN+nLzLc6b7cOpaWz6eZ4gZDLXqa51d6pByGdFZOfqY=;
 b=lnZo03MXebROHskRtrCWyG/mmvh1+y5Mw9QBqd5ZudPLaU8dX/i+kkj0x5vgY/pqUf
 cbNRhfH7kNQtj9AuupA3Vyo3s3GK/7M49VXw4qUdWT0yH4iYkvV/2oLZ24csPvzYGANS
 Wc41PTJr9SJPnmbiNhD5R4LG7K2G7GRv2k7H0jmEcoAj4hnzAjxLpYexYHLZGpuymXtK
 SuWS5Xyk3xRVetXfzH0EMIJLUTJw5dBo5MK5KYz6gzMkHRFvxGQxIbX4SbV3XCfRqid+
 3xbwlxhFFlNhfiIs1kTjWNyT43+ZR+4lWOWcLo6TtTBl98704dRNL9DPd74P5fDMh3pQ
 NNlg==
X-Gm-Message-State: AOAM530Jzg/1jdGE4x9gEgQUD6fnWf0FfqkYws1ldw2npL4HakaYCBuQ
 OerynufHdG4zyBouLua1XC6CXQ==
X-Google-Smtp-Source: ABdhPJx2cRCR5MumYHhSe9bOuIXvuy0M70QEB8hG/wCQFrg/vjCkg9pVmz/SovG4i36C/5ecIpSMOQ==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr438554wmd.147.1604946143007; 
 Mon, 09 Nov 2020 10:22:23 -0800 (PST)
Received: from dell.default ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g186sm735365wma.1.2020.11.09.10.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 10:22:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v3 04/23] mtd: devices: docg3: Fix kernel-doc 'bad line' and
 'excessive doc' issues
Date: Mon,  9 Nov 2020 18:21:47 +0000
Message-Id: <20201109182206.3037326-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109182206.3037326-1-lee.jones@linaro.org>
References: <20201109182206.3037326-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_132224_964912_31C4595D 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch also places the descriptions in the correct order.

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/devices/docg3.c:819: warning: bad line:
 drivers/mtd/devices/docg3.c:1799: warning: Excess function parameter 'base' description in 'doc_probe_device'

Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/docg3.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index a030792115bc2..5b0ae5ddad745 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -816,7 +816,7 @@ static void doc_read_page_finish(struct docg3 *docg3)
 
 /**
  * calc_block_sector - Calculate blocks, pages and ofs.
-
+ *
  * @from: offset in flash
  * @block0: first plane block index calculated
  * @block1: second plane block index calculated
@@ -1783,10 +1783,9 @@ static int __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 
 /**
  * doc_probe_device - Check if a device is available
- * @base: the io space where the device is probed
+ * @cascade: the cascade of chips this devices will belong to
  * @floor: the floor of the probed device
  * @dev: the device
- * @cascade: the cascade of chips this devices will belong to
  *
  * Checks whether a device at the specified IO range, and floor is available.
  *
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
