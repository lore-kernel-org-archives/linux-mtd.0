Return-Path: <SRS0=mw3I=EN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4CDC388F9
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2020 11:03:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A028206F4
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2020 11:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GBXBqt5U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A028206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvYFOn413mCpUdgji/vveMQawQHJwfVh20BaC0wK9UA=; b=GBXBqt5UMf1wzoN3L8WX/ijYei
	og4Pka0Id4qlrxRH+YClfjk8b2uzMDriCLcw3C98vK7t0BhbxjW83JmpdQ0qvPwtcxeYoYN9yL87c
	jh5n4wg/rvCydEdzjZLwl+JT+UDGfFmrgsviTC+uWYDdM9aUIHhZmVcjlc5u8juEEIpsGQnRNkjis
	EyjKuIVBRgf3ZqSKL4AIF0nTroDrG/JlEHTi271HhmyDAbUkwdPup3lsEE1F7YaSwKgRye4UcBkeK
	CV7tlxSySg+JDI+xKZEijEusQjmI2lO+WMUTUIGZoG+rOACVqIZlTTTBk1s2JA9P5mJPy/DEMmsN5
	oepgkxXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbLzG-0001Vv-Ra; Sat, 07 Nov 2020 11:02:26 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbLzB-0001VJ-Rv
 for linux-mtd@lists.infradead.org; Sat, 07 Nov 2020 11:02:24 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CSvTf5LgBzhh15;
 Sat,  7 Nov 2020 19:01:58 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Sat, 7 Nov 2020
 19:02:01 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <han.xu@nxp.com>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
Subject: [PATCH] mtd: rawnand: gpmi: fix reference count leak in gpmi ops
Date: Sat, 7 Nov 2020 19:05:52 +0800
Message-ID: <20201107110552.1568742-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_060223_208805_2343F038 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

pm_runtime_get_sync() will increment pm usage at first and it
will resume the device later. If runtime of the device has
error or device is in inaccessible state(or other error state),
resume operation will fail. If we do not call put operation to
decrease the reference, it will result in reference leak in
the two functions(gpmi_init and gpmi_nfc_exec_op). Moreover,
this device cannot enter the idle state and always stay busy or
other non-idle state later. So we fixed it through adding
pm_runtime_put_noidle.

Fixes: 5bc6bb603b4d0 ("mtd: rawnand: gpmi: Fix suspend/resume problem")

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index dc8104e67506..b5f46f214a58 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -149,8 +149,10 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	int ret;
 
 	ret = pm_runtime_get_sync(this->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(this->dev);
 		return ret;
+	}
 
 	ret = gpmi_reset_block(r->gpmi_regs, false);
 	if (ret)
@@ -2263,8 +2265,10 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 		this->transfers[i].direction = DMA_NONE;
 
 	ret = pm_runtime_get_sync(this->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(this->dev);
 		return ret;
+	}
 
 	/*
 	 * This driver currently supports only one NAND chip. Plus, dies share
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
