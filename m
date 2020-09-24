Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1495BC2D0E2
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 12:27:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A362C206A5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 12:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T7Tab6Xb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A362C206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RQtsb5kMweKqNq47shF/4ciDHiDJbB8XfYRgX3X5B54=; b=T7Tab6XbdJhm8tpjW+ELEMfnV
	y+UvE2Tr0cI9p1TNdpShRKh51pGItgCnX4/oVg9u51HiWqwaPu3rU4sR/5qZd0bXmhOcdRZuntQxG
	yohiv5iRBd3lqq13ksBLYqGWnU0iI0/p1zpplJhuzkfv5l+kEDnSYy2WaGDWBnEcmey6OXVIlNw0x
	1mE9QAlw+Ka+0I3s7c1Fs9Q8eQOyY9Z7OByGeHlfbh8vnXGjF+CrhQHr3rh5/Y7hN29QQ2x8+xGiN
	IM7gmY51W+2uI0YWL6xKw11IMTIh2OFhTx27h4m+xD+HgUJ4c79XoYJuszXf24zpAXsLjZhKZe10S
	elrbZy8cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLQKB-0007S6-9m; Thu, 24 Sep 2020 12:26:11 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLQK2-0007Oa-I7
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 12:26:03 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 455BBEEFC9594D316F69;
 Thu, 24 Sep 2020 20:25:53 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 24 Sep 2020 20:25:46 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <john.garry@huawei.com>, <broonie@kernel.org>
Subject: [PATCH 3/4] spi: hisi-sfc-v3xx: factor out the bit definition of
 interrupt register
Date: Thu, 24 Sep 2020 20:24:29 +0800
Message-ID: <1600950270-52536-4-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1600950270-52536-1-git-send-email-yangyicong@hisilicon.com>
References: <1600950270-52536-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_082602_853479_D803B5D5 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 yangyicong@hisilicon.com, tudor.ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The definition of the register field in the interrupt corresponding
registers are the same. So factor them out to public place.

Acked-by: John Garry <john.garry@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/spi/spi-hisi-sfc-v3xx.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
index 62d4ed8..4a241d7 100644
--- a/drivers/spi/spi-hisi-sfc-v3xx.c
+++ b/drivers/spi/spi-hisi-sfc-v3xx.c
@@ -18,10 +18,7 @@
 #define HISI_SFC_V3XX_VERSION (0x1f8)
 
 #define HISI_SFC_V3XX_INT_STAT (0x120)
-#define HISI_SFC_V3XX_INT_STAT_PP_ERR BIT(2)
-#define HISI_SFC_V3XX_INT_STAT_ADDR_IACCES BIT(5)
 #define HISI_SFC_V3XX_INT_CLR (0x12c)
-#define HISI_SFC_V3XX_INT_CLR_CLEAR (0xff)
 #define HISI_SFC_V3XX_CMD_CFG (0x300)
 #define HISI_SFC_V3XX_CMD_CFG_DATA_CNT_OFF 9
 #define HISI_SFC_V3XX_CMD_CFG_RW_MSK BIT(8)
@@ -34,6 +31,13 @@
 #define HISI_SFC_V3XX_CMD_ADDR (0x30c)
 #define HISI_SFC_V3XX_CMD_DATABUF0 (0x400)
 
+/* Common definition of interrupt bit masks */
+#define HISI_SFC_V3XX_INT_MASK_ALL (0x1ff)	/* all the masks */
+#define HISI_SFC_V3XX_INT_MASK_PP_ERR BIT(2)	/* page progrom error */
+#define HISI_SFC_V3XX_INT_MASK_IACCES BIT(5)	/* error visiting inaccessible/
+						 * protected address
+						 */
+
 /* IO Mode definition in HISI_SFC_V3XX_CMD_CFG */
 #define HISI_SFC_V3XX_STD (0 << 17)
 #define HISI_SFC_V3XX_DIDO (1 << 17)
@@ -266,15 +270,15 @@ static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
 	 * next time judgement.
 	 */
 	int_stat = readl(host->regbase + HISI_SFC_V3XX_INT_STAT);
-	writel(HISI_SFC_V3XX_INT_CLR_CLEAR,
+	writel(HISI_SFC_V3XX_INT_MASK_ALL,
 	       host->regbase + HISI_SFC_V3XX_INT_CLR);
 
-	if (int_stat & HISI_SFC_V3XX_INT_STAT_ADDR_IACCES) {
+	if (int_stat & HISI_SFC_V3XX_INT_MASK_IACCES) {
 		dev_err(host->dev, "fail to access protected address\n");
 		return -EIO;
 	}
 
-	if (int_stat & HISI_SFC_V3XX_INT_STAT_PP_ERR) {
+	if (int_stat & HISI_SFC_V3XX_INT_MASK_PP_ERR) {
 		dev_err(host->dev, "page program operation failed\n");
 		return -EIO;
 	}
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
