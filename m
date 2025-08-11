Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E42CA0EE1
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M75KkeVXzpohnKIgI1mDFaRj2KgkR0Hu/6R+bvR9peI=; b=rGLvO7i9+bI4hh
	uXX4VzloP2Fd7QpMXCQWqT7gaA38E1BX4OT+FOESGIRolzQTwhXgpECiK6EIYnpf8BKO9/vUMFEXx
	Rd5Fm8UtXhtSrKjYiDSWRM7jhAvBWupBNewpdyDV5dsVdlY3SoOgze5+N18w/Yv0SOpLmuW/wLtQR
	Kj1K+pTSbjWAe5/QFL+ZAnrZH8Q0h/Ss6YRZJVC+gpGbqhNQnm7mc4Mxnn3X24S5rOju7w5IxhLBA
	Hkobd7chJABsBVtA0ZwOlO7p6x+eDhfWanBrgUZxxgNpCec1GuFUTg2BIFMUjp0u1iKU/7Ndc3/ie
	eBZ6zlulQ818AGnjELcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulad8-00000009DTM-3jcA;
	Mon, 11 Aug 2025 22:04:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYHP-00000008w5d-2u7A
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Aug 2025 19:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Gqtsu4C7TidETAVnE77OpIDvlXHGXv1Mz6JMhY6rGHo=; b=rdPohLFgN6tacMxYyhTp9WKE5o
	b4+1gRl4QBl8rkM7tK+MHRpablQwCP36o3kY/h4IrE9WgqBf/4qyWCDM8PzxX3O/B/dBRFkVDrxHC
	864J/8yXp6JzMIQ64eCudF/LiniNhtP10K9ZkiTZdSsHChOCa+SMR4ZbA3Ul8YVDVaXd9Syac8Zii
	hLjl2YTlSBKsaANOQvSi+5YSh7fpzqTXemMCTTab11WvoqXc7U9IJgO7fUUuBBIiEQ97a21OOkt/X
	8CnA0r8v6MnVBaeq98n/QKtcw8CfnAntXN7o3QDlmankduBtudpvs4foLrgdxhHTzky4G8aDjCQLY
	UCpwiAxw==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYHJ-0000000FUwa-4BeS
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 19:33:56 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57BJXg1s1227857;
	Mon, 11 Aug 2025 14:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754940822;
	bh=Gqtsu4C7TidETAVnE77OpIDvlXHGXv1Mz6JMhY6rGHo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PQUSTZCp5bneAU1Ct823nP1oieJ9HPFezrBrDy5PJQYcEHKWnQHhym+a3JXzM7k5B
	 Lq/ZSTm2Ai6SxdgUtn38LXIvSnvZFMTFJzzTZPB6PKtvx3fCdizxk4Mq9nwIVgmBRw
	 O3zN49zwyruOIovEyOZV4kbYyDb3mBhpKrFsW9rY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57BJXg2l2910990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 14:33:42 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 14:33:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 14:33:41 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57BJWq1x3690681;
	Mon, 11 Aug 2025 14:33:37 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <broonie@kernel.org>, <tudor.ambarus@linaro.org>,
        <pratyush@kernel.org>, <mwalle@kernel.org>, <p-mantena@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <s-k6@ti.com>, <a-dutta@ti.com>,
        <u-kumar1@ti.com>, <praneeth@ti.com>
Subject: [RFC PATCH 10/10] spi: cadence-quadspi: Define cqspi_get_tuning_params()
Date: Tue, 12 Aug 2025 01:02:19 +0530
Message-ID: <20250811193219.731851-11-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811193219.731851-1-s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_203355_118477_3B7FA467 
X-CRM114-Status: UNSURE (   9.06  )
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

Define cqspi_get_tuning_params() to extract information about the PHY
tuning pattern and it's size from controller.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 1626cb9a9700..c9c4341d3275 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -2170,6 +2170,14 @@ static int cqspi_mem_execute_tuning(struct spi_mem *mem,
 	return ret;
 }
 
+static int cqspi_get_tuning_params(struct spi_mem *mem,
+				   struct spi_mem_tuning_params *tuning_params)
+{
+	tuning_params->pattern_ptr = phy_tuning_pattern;
+	tuning_params->pattern_size = sizeof(phy_tuning_pattern);
+	return 0;
+}
+
 static int cqspi_of_get_flash_pdata(struct platform_device *pdev,
 				    struct cqspi_flash_pdata *f_pdata,
 				    struct device_node *np)
@@ -2345,6 +2353,7 @@ static const struct spi_controller_mem_ops cqspi_mem_ops = {
 	.get_name = cqspi_get_name,
 	.supports_op = cqspi_supports_mem_op,
 	.execute_tuning = cqspi_mem_execute_tuning,
+	.get_tuning_params = cqspi_get_tuning_params,
 };
 
 static const struct spi_controller_mem_caps cqspi_mem_caps = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
