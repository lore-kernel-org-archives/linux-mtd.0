Return-Path: <SRS0=STJJ=JX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D563C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 14:41:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A3C60234
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 14:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A3C60234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M38qGZgYSRnv3vxvgVc70ZEdWEYtTsaTBZSuK3H+IHQ=; b=Yb5E1nbuR9WJ+mcShMa58Yxpv
	K0UNCwP+DgGvTxkdma1m/4K00H+DgmAQU/VvYw2UbzXEYlgPGjuorDbJUKC59QPezmcZLWrACIUV9
	XLoeOvQmd2CmB05uIgAcaTb56yC1QfZs/7upVmF0xrR0cNfdMCP/wll/enkPL8u8fn2rEbaAsfGxh
	t0XVTStYPY/pIDLQPOpCtG4M0zTJzVlTzcLL6U8nrC7CfgvEaTCtapDHbVxT6WkOPbHjQb+Ff0U3S
	BUklFGR0HwAdezXkpTTAXiUdbU1YtrNPunSNLqC1GVKwfHBJyoL3CJ73owd00KyEblJIZa0VQ3SEf
	Anol0Lhqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb2Ou-007rYr-Ue; Mon, 26 Apr 2021 14:39:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb2Oq-007rY0-W2; Mon, 26 Apr 2021 14:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lFJy9ccCm1PICKyVeTRoH866ML1NyAIfvIYxbbK1sKg=; b=ua37fkJ6qade5UN4YIXi4O/yz0
 CAVjVQk+3fKy9h3ojj8BXRPmhKaOc0UO8aCdvswKTosUxYvuKhwyzv6+X4DP7E7cQcLE3gkTzbR3j
 +VUpe5Oq+oPDUup644aSe/L5XR2EcO3rMcISDDCPkhHrWoV13QviHwcBlv0YXju5uQI/8vOiDJLIq
 RyvH/Ribb4qXKiJLz6Ue+/q2tOeKQX6ZJBs1IqAh+eA1ucNlHxKtqEb9yQKX7OZP+cNWc8nO0GG7n
 zSCa4W8fAu/ZlkZ+g9faFscg8tDdorzD2J8U+SK3WoefEcSeJY6jUWNWZviwSzN+u1mKxGK71HRDu
 PtplSt6Q==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb2On-00G1BF-Ha; Mon, 26 Apr 2021 14:39:47 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QEcGPU015802; Mon, 26 Apr 2021 16:39:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=lFJy9ccCm1PICKyVeTRoH866ML1NyAIfvIYxbbK1sKg=;
 b=e/XRIiBreWYUI3DY1MdI//XwCqziOHyve4kXKeACbb4ubERoBOwejjF1fQb9vMJEEf2p
 Jsjz77/9Kx+a4haGwWvYjXC865uDISp5GJK63aywDn0TosIvYLwIpZ/Wz04gVT4wELJE
 2avt+QPLxVRqanSvBzwfuEfdBCytEZFwWiEsnNEMqauCj9BQgSs/S+T17a/UrpDLIjmi
 4jmSkVasbYBhKAdn8ZBmT11bZ7zm2BituAr/ygCwakevQwGBMQOGxBKaDvcaxiWAgRou
 OhC1U0JOPH2LyENfhm0qNRP9PKc1R0cvu+bqK32vhuqtpa1BjKOBknCYNPdc9KsgRV4p Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385b0xx7d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 16:39:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 730F8100038;
 Mon, 26 Apr 2021 16:39:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 643002178E6;
 Mon, 26 Apr 2021 16:39:39 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 16:39:39
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH 2/3] mtd: spinand: use the spi-mem poll status APIs
Date: Mon, 26 Apr 2021 16:39:33 +0200
Message-ID: <20210426143934.25275-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426143934.25275-1-patrice.chotard@foss.st.com>
References: <20210426143934.25275-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_07:2021-04-26,
 2021-04-26 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_073946_050284_B05CF2EB 
X-CRM114-Status: GOOD (  18.59  )
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

From: Christophe Kerello <christophe.kerello@foss.st.com>

Make use of spi-mem poll status APIs to let advanced controllers
optimize wait operations

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/mtd/nand/spi/core.c | 22 ++++++++++++++++++----
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 17f63f95f4a2..916f435257bd 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -475,18 +475,32 @@ static int spinand_erase_op(struct spinand_device *spinand,
 
 static int spinand_wait(struct spinand_device *spinand, u8 *s)
 {
-	unsigned long timeo =  jiffies + msecs_to_jiffies(400);
+	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(REG_STATUS,
+						      spinand->scratchbuf);
+	unsigned long timeo =  jiffies + msecs_to_jiffies(SPINAND_STATUS_TIMEOUT_MS);
 	u8 status;
 	int ret;
 
-	do {
-		ret = spinand_read_status(spinand, &status);
+	ret = spi_mem_poll_status(spinand->spimem, &op, STATUS_BUSY, 0,
+				  SPINAND_STATUS_TIMEOUT_MS);
+	if (ret != -EOPNOTSUPP) {
 		if (ret)
 			return ret;
 
+		status = *spinand->scratchbuf;
+
 		if (!(status & STATUS_BUSY))
 			goto out;
-	} while (time_before(jiffies, timeo));
+	} else {
+		do {
+			ret = spinand_read_status(spinand, &status);
+			if (ret)
+				return ret;
+
+			if (!(status & STATUS_BUSY))
+				goto out;
+		} while (time_before(jiffies, timeo));
+	}
 
 	/*
 	 * Extra read, just in case the STATUS_READY bit has changed
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6bb92f26833e..28ee481d96eb 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -170,6 +170,7 @@ struct spinand_op;
 struct spinand_device;
 
 #define SPINAND_MAX_ID_LEN	4
+#define SPINAND_STATUS_TIMEOUT_MS	400
 
 /**
  * struct spinand_id - SPI NAND id structure
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
