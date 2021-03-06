Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EF9C433DB
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 09:51:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A326A65018
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 09:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A326A65018
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UxUUZW18CCXclK5DgbTUDv/990qnlsWDx5+ZEaTtvBY=; b=aRZTXsfIRzkJxXdJSsiFY2w/P
	R0KMzPzEttS2gbfLmKE+4kOMhR9hhiFHGcCtFqWgXuVVLMG8nNPAj3zJjp+uusU6Hn8HCkHvM0iST
	AFD5cdAUk4R3nSY1JqIIRAeGOvPTL+kl8YnO2sM/EusRqZRtf8woeV6nHpC1mRI3md6Ip0Lw9AcdO
	VJDkhNsomMWfY5SP5y2WP1FO7+zHJJzUjCQY2hEB94yeMSWPvgNg5chhBM23j5SGm+KoCQxkoyA7m
	ckClC3ohSiBOrjPoUfRmy3MYnwRr1W/m8L7GWZ++SWIl1v7fup6A1IGA0MLpMYRzMLL1GaOAFpSXu
	HIfYV6OKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lITaB-002iWl-0a; Sat, 06 Mar 2021 09:50:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lITZh-002iR1-IV
 for linux-mtd@lists.infradead.org; Sat, 06 Mar 2021 09:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615024217; x=1646560217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q1NJu+PzcJ011hmNSl8tydQwSF2vMf5cAQI9rgS5dDM=;
 b=V5D5sUY/jgSczQR6h+mfJw1nCtiKAn1WUJH8E8SCm99xmsYduZ95geUq
 WmOOQLG5Ye9D1z1QvQd26zu/Ryo2bXtRBiUdTx2+PRglah86gkHtFFoJO
 vBCc3zYi7azRr1mIkhe/oj6uN60S4+xil5n8qL88jtPSwcY2DP/HxU4qG
 mwLHpvgxpIrPpLHpMk2nbgdWEhjmd8PyvST7ZyK9H8Y3UnUMh1BK7eT1I
 uOJOTkRsSx+CXa1kMqsIDrMVd4HLk1v5JYTrM691ghN+xZM9Jktl+9aTl
 RJQQTx8cv1BU00NYOuTGsTPlLhao1zDcQxVeKmeXVQSIgAU9+Rd90I2na g==;
IronPort-SDR: lqBQgVhA2pbC6ItG57GVR8mLpSnjiRicRzH4Xcf2rDbLFHqGKjjaSmDc8NtGU4RVriEgS7etHi
 YzZpNnOIoRwUA368ORMXGpG2Nud34BTheNylNI6niWpYUEmQZK0F1KDZsYOtLoeC6wBN7J3S7z
 ytzR9GSAYmDwTLsHaQ1sIiQlfD4vCSMPsFRevAbicv3PcBdJk2wJDHsKZu4iZ2bN9aQDvCWsFe
 Lmuun9uMZ5sw3COUePZzzyrRBUMyK0/XuW9VIyxgs/LWJDB/RrCT62eDWLAGdN1B+QSTmXItm4
 k68=
X-IronPort-AV: E=Sophos;i="5.81,227,1610434800"; d="scan'208";a="111726340"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Mar 2021 02:50:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 6 Mar 2021 02:50:13 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Sat, 6 Mar 2021 02:50:11 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <vigneshr@ti.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-kernel@vger.kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH v2 2/5] mtd: spi-nor: core: Add vdbg msg for
 spi_nor_erase_multi_sectors()
Date: Sat, 6 Mar 2021 11:49:59 +0200
Message-ID: <20210306095002.22983-3-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306095002.22983-1-tudor.ambarus@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_095018_091478_E0DC8486 
X-CRM114-Status: UNSURE (   6.91  )
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

Useful when debugging non-uniform erase.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v2: 
- s/dev_dbg/dev_vdb
- move vdbg message the first thing in the while

 drivers/mtd/spi-nor/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bcaa161bc7db..498da1ec3a89 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1610,6 +1610,9 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 	list_for_each_entry_safe(cmd, next, &erase_list, list) {
 		nor->erase_opcode = cmd->opcode;
 		while (cmd->count) {
+			dev_vdbg(nor->dev, "erase_cmd->size = 0x%08x, erase_cmd->opcode = 0x%02x, erase_cmd->count = %d\n",
+				 cmd->size, cmd->opcode, cmd->count);
+
 			ret = spi_nor_write_enable(nor);
 			if (ret)
 				goto destroy_erase_cmd_list;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
