Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D6DC2BB1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 07:48:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03E1A2063A
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 07:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLLASxpZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03E1A2063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U3NMTTw337wXm2BrnV3xNyJcfbBGMcDiSL1rTVCuQPI=; b=RLLASxpZa2mAI5
	HgWRRGUbS586yQdGK8dpf+Td6DmHo1CeQb+YDLPEOYPJVM+gcM8/FC6XU2opHEdI4k6EEgNFSRqw9
	116XPtDvGGqdcctnGtW9PUPTR89ZsduoShWDiO88mI02k3CWcd+EX7T/uIkrUer0rKV+AS2rJ/H7Q
	o7RSLjYwYmHD6oe+/drl3owwgWmeQVzdJMfdh9l7MaiJQTUKZ0HTyV5aO0VSczV/CSkKYDOq/iCWs
	yeZbkFlVD3oJVUe2X0KCBjSdLSDsFg463joCA5BCEzAOk1zejLLxtkMDtJDKStNqnjJ+03WvdPr4F
	P9lOsBSjme/CTr5MUMig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPLk4-0005H0-EE; Fri, 17 Apr 2020 07:48:52 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPLk0-0005Dl-VI
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 07:48:50 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0C924D82A5D41BD46BDB;
 Fri, 17 Apr 2020 15:48:38 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 17 Apr 2020 15:48:27 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <broonie@kernel.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH] spi: hisi-sfc-v3xx: add error check after per operation
Date: Fri, 17 Apr 2020 15:48:27 +0800
Message-ID: <1587109707-23597-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_004849_187072_580596F2 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: john.garry@huawei.com, linux-mtd@lists.infradead.org, linuxarm@huawei.com,
 yangyicong@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The controller may receive instructions of accessing protected address,
or may perform failed page program. These operations will not succeed
and the controller will receive interrupts when such failure occur.
Previously we don't check the interrupts and return 0 even if such
operation fails.

Check the interrupts after per command and inform the user
if there is an error.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Acked-by: John Garry <john.garry@huawei.com>
---
 drivers/spi/spi-hisi-sfc-v3xx.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
index e3b5725..64a18d0 100644
--- a/drivers/spi/spi-hisi-sfc-v3xx.c
+++ b/drivers/spi/spi-hisi-sfc-v3xx.c
@@ -17,6 +17,11 @@
 
 #define HISI_SFC_V3XX_VERSION (0x1f8)
 
+#define HISI_SFC_V3XX_INT_STAT (0x120)
+#define HISI_SFC_V3XX_INT_STAT_PP_ERR BIT(2)
+#define HISI_SFC_V3XX_INT_STAT_ADDR_IACCES BIT(5)
+#define HISI_SFC_V3XX_INT_CLR (0x12c)
+#define HISI_SFC_V3XX_INT_CLR_CLEAR (0xff)
 #define HISI_SFC_V3XX_CMD_CFG (0x300)
 #define HISI_SFC_V3XX_CMD_CFG_DUAL_IN_DUAL_OUT (1 << 17)
 #define HISI_SFC_V3XX_CMD_CFG_DUAL_IO (2 << 17)
@@ -163,7 +168,7 @@ static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
 					 u8 chip_select)
 {
 	int ret, len = op->data.nbytes;
-	u32 config = 0;
+	u32 int_stat, config = 0;
 
 	if (op->addr.nbytes)
 		config |= HISI_SFC_V3XX_CMD_CFG_ADDR_EN_MSK;
@@ -228,6 +233,25 @@ static int hisi_sfc_v3xx_generic_exec_op(struct hisi_sfc_v3xx_host *host,
 	if (ret)
 		return ret;
 
+	/*
+	 * The interrupt status register indicates whether an error occurs
+	 * after per operation. Check it, and clear the interrupts for
+	 * next time judgement.
+	 */
+	int_stat = readl(host->regbase + HISI_SFC_V3XX_INT_STAT);
+	writel(HISI_SFC_V3XX_INT_CLR_CLEAR,
+	       host->regbase + HISI_SFC_V3XX_INT_CLR);
+
+	if (int_stat & HISI_SFC_V3XX_INT_STAT_ADDR_IACCES) {
+		dev_err(host->dev, "fail to access protected address\n");
+		return -EIO;
+	}
+
+	if (int_stat & HISI_SFC_V3XX_INT_STAT_PP_ERR) {
+		dev_err(host->dev, "page program operation failed\n");
+		return -EIO;
+	}
+
 	if (op->data.dir == SPI_MEM_DATA_IN)
 		hisi_sfc_v3xx_read_databuf(host, op->data.buf.in, len);
 
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
