Return-Path: <SRS0=11H7=KC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211A1C433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 13:21:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78583610F7
	for <linux-mtd@archiver.kernel.org>; Fri,  7 May 2021 13:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78583610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8RhnErTk+HgUHCmtZW47v0DTVpT/lHiQXWHtMC7Q2mA=; b=bg6wIfiCVFvpsREoOVEtO4u2e
	pOMrELuLgyeG/YhPuyfXX4SElxMgmHT/T3DrJ6Zwaxc3P/AkedqcDEqY8/UVK3MqnRM5XnzVZOGNP
	xade28Rk/RBoIQyHwemHhpHyagtsdZndAhGZJVqGy97aTm8rLN7FuDdl1QMEQGjuEvuY5g9oppsEr
	AlaHCEdVySdKr0EeReLgbmY2h+v8GRRd86CGdKrjxBkgNljSwJE2OtYywIAd1b0a/ypyvs2RC8EzZ
	CkuxRVDqA24i2IY5M7S3QN4TEEAwWV3zNd4ZO+PWAnuinqQw+rUwy9syXp+tgwuvvrdvEhB5ANSDw
	4ovrzl0Wg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf0PP-0079zs-4P; Fri, 07 May 2021 13:20:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0N6-0079Ia-4X; Fri, 07 May 2021 13:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2VbaSQPKll45bb5e+nOLyoc5u0h4ohc9JIgkDyyn1+g=; b=dRM1vBvqRB0OBgN37B6UwIkYmJ
 logYL/nQ/KYoOqvazePKlS0ie4zuxS1478SDgrYW8nGvuRsAZ9UxPr0mjh1dJv9o5EG1XSzEbtta6
 CNUwqdgAuqiMws/4KzNb+D5WdjT2KHSOvKpUFFjFyy6v2hEoKgCReNTzwvgLESMCzqYB0ChZ1sqN2
 e56P1JlTY/JTku/x6SUPUzJ/Swl2qCZH0Fe5wnSD1GIC4rQ1K2mR745JpujN5nfD6BKRgzK7qaF87
 z+2LgaMLcd0jWYX2AoFAPt7cZgDOYbkSXHfro86R6uOwgZOlykXL6fB675TVxR647onHZ+jYNaQ7n
 iaXn0GmA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0N2-006skt-GR; Fri, 07 May 2021 13:18:22 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147DGNw0023853; Fri, 7 May 2021 15:18:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=2VbaSQPKll45bb5e+nOLyoc5u0h4ohc9JIgkDyyn1+g=;
 b=a+LCm4edN9xxIkKKwKCS8ESJ22G477AXAryOAOzgXIAufLzTqdUW4VVuv+mmKoMoUTgo
 Vv6kSXimcwKhzG6wE2ujG9c59m38L2fFrte5MlbznnIbBLVqnwkXuDum+RwqnjDCKVWq
 ds9NJ87ZOVfrSfs51LzRFmJftVT2jhyMfKGN1D32dx7Fl65WAusuXAVZiCKcX9+iZPZF
 HoVIeqJo5xKZHJS8kixc86k94ax7owSleEEZT7wVviVkPmuZj9d0DxJdGnrvVRijcbKt
 Zux7aJ+X6ZGSu2m2lIpFUPbXvpBzi5VRno3ReJTjbKeuUtekF4MJfUIwzvMVbalgKipB Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38cspsc394-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 15:18:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 74114100039;
 Fri,  7 May 2021 15:18:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 650C4221F78;
 Fri,  7 May 2021 15:18:14 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 7 May 2021 15:18:14
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH v2 2/3] mtd: spinand: use the spi-mem poll status APIs
Date: Fri, 7 May 2021 15:17:55 +0200
Message-ID: <20210507131756.17028-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210507131756.17028-1-patrice.chotard@foss.st.com>
References: <20210507131756.17028-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_04:2021-05-06,
 2021-05-07 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_061820_866881_FC684FEB 
X-CRM114-Status: GOOD (  17.41  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Make use of spi-mem poll status APIs to let advanced controllers
optimize wait operations.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
Changes in v2:
  - non-offload case is now managed by spi_mem_poll_status()

 drivers/mtd/nand/spi/core.c | 17 +++++++++--------
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 17f63f95f4a2..56f81c7a73a6 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -475,18 +475,19 @@ static int spinand_erase_op(struct spinand_device *spinand,
 
 static int spinand_wait(struct spinand_device *spinand, u8 *s)
 {
-	unsigned long timeo =  jiffies + msecs_to_jiffies(400);
+	struct spi_mem_op op = SPINAND_GET_FEATURE_OP(REG_STATUS,
+						      spinand->scratchbuf);
 	u8 status;
 	int ret;
 
-	do {
-		ret = spinand_read_status(spinand, &status);
-		if (ret)
-			return ret;
+	ret = spi_mem_poll_status(spinand->spimem, &op, STATUS_BUSY, 0,
+				  SPINAND_STATUS_TIMEOUT_MS);
+	if (ret)
+		return ret;
 
-		if (!(status & STATUS_BUSY))
-			goto out;
-	} while (time_before(jiffies, timeo));
+	status = *spinand->scratchbuf;
+	if (!(status & STATUS_BUSY))
+		goto out;
 
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
