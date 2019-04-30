Return-Path: <SRS0=r2JG=TA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8391BC43219
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 10:05:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 510962075E
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 10:05:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="teomxGzC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 510962075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q27sa9aimNygMMKqN//EULfHzFVoZkrKxLWGK8H1Piw=; b=teomxGzCAeaQ64
	i1ht4m0/Yj3ArbbvlGYCKygcoSjFzWH/0fScjN4eehNzbgySEL4FdPuzMzIkxIIXn2RIqsDoqb/ms
	1sdrfyQ7E8SjpT52MWiX0vXBID4RBHgjxYwUN5wYOO5YHn5eUY4tRmyW41H4aYM+YLXINQEBLMk+6
	ZSyash7Rr6M2BWGO4ksc2rIJELspTgpoRrWDLZul2YgVjxmXXbRtuWH7xkMlNKCUpnPSAaSST3HWV
	ovLb49YOS5pU3MxHohYiW6Y6dEiz8WQlPlfDo/rCZCQE2BImIelV2coiSmhVEOlPboQXSbGHJptha
	+K6rHmhOD4zPytqDYtmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLPda-000309-1X; Tue, 30 Apr 2019 10:05:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLPd9-0001Tb-Cn; Tue, 30 Apr 2019 10:05:04 +0000
X-UUID: f562b3ba87e74bc080e9f56f3f35283f-20190430
X-UUID: f562b3ba87e74bc080e9f56f3f35283f-20190430
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1868088766; Tue, 30 Apr 2019 02:04:15 -0800
Received: from mtkmbs03n2.mediatek.inc (172.21.101.182) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 30 Apr 2019 03:04:14 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs03n2.mediatek.inc (172.21.101.182) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 30 Apr 2019 18:04:01 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 30 Apr 2019 18:04:01 +0800
From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: [PATCH v2 2/5] mtd: rawnand: mtk: Improve data sampling timing for
 read cycle
Date: Tue, 30 Apr 2019 18:02:47 +0800
Message-ID: <20190430100250.28083-3-xiaolei.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190430100250.28083-1-xiaolei.li@mediatek.com>
References: <20190430100250.28083-1-xiaolei.li@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CD42D21B5C5AFE41F5E602EC4C821D349F22DB4D1B5EBE0394710986FD2EDA7E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_030455_773601_0FC5578E 
X-CRM114-Status: GOOD (  14.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently, we expand RE# low level time by choosing the max value
between RE# pulse width and RE# access time, and sample data at the
rising edge of RE#.

Then, if RE# access time is bigger than RE# pulse width, the real
read cycle time may be more than NAND SPEC required. This makes
read performance be worse than that expected.

This patch improves data sampling timing by calculating RE# low level
time according to RE# pulse width. If RE# access time is bigger than
RE# pulse width, then delay sampling data timing.

The result of contrast test base on MT2712 evaluat board is as follow.

nand: Micron MT29F16G08ADBCAH4
nand: 2048 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 224
NFI 2x clock rate: 124800000 HZ.

Read speed without this patch:
mtd_speedtest: page read speed is 14012 KiB/s
mtd_speedtest: 2 page read speed is 14860 KiB/s

Read speed with this patch:
mtd_speedtest: page read speed is 18724 KiB/s
mtd_speedtest: 2 page read speed is 18713 KiB/s

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 46 ++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 4fbb0c6ecae3..e90c38c6f835 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -87,6 +87,10 @@
 #define NFI_FDMM(x)		(0xA4 + (x) * sizeof(u32) * 2)
 #define NFI_FDM_MAX_SIZE	(8)
 #define NFI_FDM_MIN_SIZE	(1)
+#define NFI_DEBUG_CON1		(0x220)
+#define		STROBE_MASK		GENMASK(4, 3)
+#define		STROBE_SHIFT		(3)
+#define		MAX_STROBE_DLY		(3)
 #define NFI_MASTER_STA		(0x224)
 #define		MASTER_STA_MASK		(0x0FFF)
 #define NFI_EMPTY_THRESH	(0x23C)
@@ -509,7 +513,7 @@ static int mtk_nfc_setup_data_interface(struct nand_chip *chip, int csline,
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	const struct nand_sdr_timings *timings;
 	u32 rate, tpoecs, tprecs, tc2r, tw2r, twh, twst = 0, trlt = 0;
-	u32 thold;
+	u32 temp, tsel = 0;
 
 	timings = nand_get_sdr_timings(conf);
 	if (IS_ERR(timings))
@@ -546,30 +550,52 @@ static int mtk_nfc_setup_data_interface(struct nand_chip *chip, int csline,
 	twh &= 0xf;
 
 	/* Calculate real WE#/RE# hold time in nanosecond */
-	thold = (twh + 1) * 1000000 / rate;
+	temp = (twh + 1) * 1000000 / rate;
 	/* nanosecond to picosecond */
-	thold *= 1000;
+	temp *= 1000;
 
 	/**
 	 * WE# low level time should be expaned to meet WE# pulse time
 	 * and WE# cycle time at the same time.
 	 */
-	if (thold < timings->tWC_min)
-		twst = timings->tWC_min - thold;
+	if (temp < timings->tWC_min)
+		twst = timings->tWC_min - temp;
 	twst = max(timings->tWP_min, twst) / 1000;
 	twst = DIV_ROUND_UP(twst * rate, 1000000) - 1;
 	twst &= 0xf;
 
 	/**
-	 * RE# low level time should be expaned to meet RE# pulse time,
-	 * RE# access time and RE# cycle time at the same time.
+	 * RE# low level time should be expaned to meet RE# pulse time
+	 * and RE# cycle time at the same time.
 	 */
-	if (thold < timings->tRC_min)
-		trlt = timings->tRC_min - thold;
-	trlt = max3(trlt, timings->tREA_max, timings->tRP_min) / 1000;
+	if (temp < timings->tRC_min)
+		trlt = timings->tRC_min - temp;
+	trlt = max(trlt, timings->tRP_min) / 1000;
 	trlt = DIV_ROUND_UP(trlt * rate, 1000000) - 1;
 	trlt &= 0xf;
 
+	/**
+	 * Calculate strobe select timing.
+	 * If RE# access time is bigger than RE# pulse time,
+	 * delay sampling data timing.
+	 */
+	temp = (trlt + 1) * 1000000 / rate;
+	/* nanosecond to picosecond */
+	temp *= 1000;
+	if (temp < timings->tREA_max) {
+		tsel = timings->tREA_max / 1000;
+		tsel = DIV_ROUND_UP(tsel * rate, 1000000);
+		tsel -= (trlt + 1);
+		if (tsel > MAX_STROBE_DLY) {
+			trlt += tsel - MAX_STROBE_DLY;
+			tsel = MAX_STROBE_DLY;
+		}
+	}
+	temp = nfi_readl(nfc, NFI_DEBUG_CON1);
+	temp &= ~STROBE_MASK;
+	temp |= tsel << STROBE_SHIFT;
+	nfi_writel(nfc, temp, NFI_DEBUG_CON1);
+
 	/*
 	 * ACCON: access timing control register
 	 * -------------------------------------
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
