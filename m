Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A70C43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 06:39:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E7722075E
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 06:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I494GyCO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E7722075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NfelvpZIRyW1dJt2aj5vL2oO4+NhiuJeAqkbKjd5AIw=; b=I494GyCOvFUq9H
	kz3XU9Jnakxq5MeJA6g18/ra/Pl8tPZ0xnVdFQ4qLG+ds3fuihMvaBggcXctbiRpOg7YrGvYWvYK2
	yoA2EdZtraxSj0fDMrDH5lH0tZHyRPXwvAQiYF/LTNzd+OIJzk1xaRDsQ3w/uZ2BRwQ75dKUhS0Tu
	snlUieXMFS6tYtURtsFAjnP1RU7Ie1XhKykVk9eTgqIXaUsEdgA0hVjA23OEkD20W6mpwfFSa6ecR
	7V0pzxfm5I+W2UPkifR8cg9yrHh9eeXWN1cNVXIdCGh3y46QcjR1SX0FGWxG3tksAvAx/FOu9jDgp
	pgnqo6RxnIlHxWYZviKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKzwP-0005w9-GN; Mon, 29 Apr 2019 06:39:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKzw6-0005To-7O; Mon, 29 Apr 2019 06:38:51 +0000
X-UUID: 527d2a7c23c64749856ca7c87ddee261-20190428
X-UUID: 527d2a7c23c64749856ca7c87ddee261-20190428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 349634368; Sun, 28 Apr 2019 22:38:43 -0800
Received: from mtkmbs03n2.mediatek.inc (172.21.101.182) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 28 Apr 2019 23:38:42 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs03n2.mediatek.inc (172.21.101.182) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 29 Apr 2019 14:38:39 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 29 Apr 2019 14:38:39 +0800
From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: [PATCH 2/5] mtd: rawnand: mtk: Improve data sampling timing for read
 cycle
Date: Mon, 29 Apr 2019 14:38:31 +0800
Message-ID: <20190429063834.45967-3-xiaolei.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190429063834.45967-1-xiaolei.li@mediatek.com>
References: <20190429063834.45967-1-xiaolei.li@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CDF10B6E30D85B07B70D086744F874FC004A29F1A2E07477D3132D0799E5B3CA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_233846_470445_D24F4E11 
X-CRM114-Status: GOOD (  12.47  )
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

Test tool: mtd_speedtest.ko

Read speed without this patch:
mtd_speedtest: page read speed is 14012 KiB/s
mtd_speedtest: 2 page read speed is 14860 KiB/s

Read speed with this patch:
mtd_speedtest: page read speed is 18724 KiB/s
mtd_speedtest: 2 page read speed is 18713 KiB/s

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index dd855f860a4b..a2f7af536380 100644
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
@@ -509,6 +513,7 @@ static int mtk_nfc_setup_data_interface(struct nand_chip *chip, int csline,
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
 	const struct nand_sdr_timings *timings;
 	u32 rate, tpoecs, tprecs, tc2r, tw2r, twh, twst = 0, trlt = 0;
+	u32 tsel, reg;
 
 	timings = nand_get_sdr_timings(conf);
 	if (IS_ERR(timings))
@@ -556,10 +561,25 @@ static int mtk_nfc_setup_data_interface(struct nand_chip *chip, int csline,
 	if ((twh + 1) * 1000000 / rate < timings->tRC_min / 1000)
 		trlt = (timings->tRC_min / 1000 - (twh + 1) * 1000000 / rate)
 			* 1000;
-	trlt = max3(trlt, timings->tREA_max, timings->tRP_min) / 1000;
+	trlt = max(trlt, timings->tRP_min) / 1000;
 	trlt = DIV_ROUND_UP(trlt * rate, 1000000) - 1;
 	trlt &= 0xf;
 
+	/* Calculate strobe sel */
+	reg = nfi_readl(nfc, NFI_DEBUG_CON1);
+	reg &= ~STROBE_MASK;
+	if ((trlt + 1) * 1000000 / rate < timings->tREA_max / 1000) {
+		tsel = timings->tREA_max / 1000;
+		tsel = DIV_ROUND_UP(tsel * rate, 1000000);
+		tsel -= (trlt + 1);
+		if (tsel > MAX_STROBE_DLY) {
+			trlt += tsel - MAX_STROBE_DLY;
+			tsel = MAX_STROBE_DLY;
+		}
+		reg |= tsel << STROBE_SHIFT;
+	}
+	nfi_writel(nfc, reg, NFI_DEBUG_CON1);
+
 	/*
 	 * ACCON: access timing control register
 	 * -------------------------------------
-- 
2.18.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
