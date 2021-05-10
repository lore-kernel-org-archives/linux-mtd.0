Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E15C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 12:03:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06A94613C2
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 12:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06A94613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+/UJY8Q/EMGKYtG5w40tJxRA40F4Ak0kmZnuWUQI01U=; b=T5Gp9ghn5o51gfw7ORTq7cdc7M
	G0YTQ2pZCTEiznumWEggBQp/21n8sgVI9udKgH6L5u6Jl/3kQvROYhX5f5tNOxaBMnjLKD8juWTKe
	aWDCaa03wsTTlHY0OuRcFT4gi0A9FlkwPJoSsbH/YH4ej5m4ydSFjX3AZfUTo4JuVW5r/Vzg7wqch
	Jh7XGbC2bccUcPCjHc91mG2cBkwB24k0MUE07X02lqoIsGb+tusZHJ21K3Rdv1ZxlUws/SnJuk5TC
	QVSaiusYmzJOlObeexR6X8IpNwFfSXXlA6VGxIUQpFIisoZd/5/gp72q4U6tjyAn6XzmUpo2p6f2Z
	oqkwQTJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg4c0-00EB3p-SD; Mon, 10 May 2021 12:02:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4QG-00E8vX-MZ
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 11:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=FzfkkTcGyYFnSqf9jzvWbtj3qoPX8WvTWWzEFa2cXQ4=; b=Lp40rbJLcmfjUj0SNP/BLLZ7MN
 g/h2Yz3spI+Bu3mtq6eRYJmX+F4iVPqjFV2hc7/ghuGStomNNATWJ6IjcMRm7kYIPQ0wNSNkP1Wck
 hgR+Sw51Nm4ayhKc6C0GSWNwWefuLf84Y3yvoutffdegBN0Bm297BTXhMYI7iVDWHl6j3WFYKdO+N
 y4BejCGq+fX3HLds8f8MERErQjwFFiQPopGqWapuySAkXGUOg5F1ZxSfMtF5je5grXYCLtKdVEUQ6
 m3b3oEo47HC9Hnfn+a59+fgxensHWj4M+CT+40PzAUkP9hdRl8qLoCSwxPUHswH9jdXWMMvA2Uogf
 UIORBE6A==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4QC-008dxe-RB
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 11:50:02 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fdzn40LblzkYKF;
 Mon, 10 May 2021 19:47:20 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 10 May 2021 19:49:50 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd
 <linux-mtd@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] mtd: rawnand: qcom: Delete an unneeded bool conversion
Date: Mon, 10 May 2021 19:49:44 +0800
Message-ID: <20210510114944.3527-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_045001_059499_35A6336E 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

The result of an expression consisting of a single relational operator is
already of the bool type and does not need to be evaluated explicitly.

No functional change.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index a64fb6ce915daee..22e6ca521185dca 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1850,8 +1850,7 @@ static int parse_read_errors(struct qcom_nand_host *host, u8 *data_buf,
 			 * ERASED_CW bits are set.
 			 */
 			if (host->bch_enabled) {
-				erased = (erased_cw & ERASED_CW) == ERASED_CW ?
-					 true : false;
+				erased = (erased_cw & ERASED_CW) == ERASED_CW;
 			/*
 			 * For RS ECC, HW reports the erased CW by placing
 			 * special characters at certain offsets in the buffer.
-- 
2.26.0.106.g9fadedd



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
