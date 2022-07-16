Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B85C433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Jul 2022 00:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sfnJOXno/6JmU68ylUOSEL6jZkjQLAS824hUy4bPmTI=; b=KbL980E+i8YvIh
	7LkK7CmZuCzxDQ+JbLTmoinCe7lBU1Qbd/gQF4h1DdauYeo+Ct/tEG1sgRgKysayAqMdvRmkLFB12
	7z7sPmxA3hf3ccfuWPsB9SFRsxMHHJu8gg5PX64k6EYX+Kh4z5jucNHnHumrclS1GNaovBPYVElKw
	GBbfjNlEmFSwKzah+ntvasfvmtL/Ylg9q4f0xW8QxbSzPJFLArmbIEv2rcbiPZ4dl6B/HKFiV/eC2
	Q/Rdoy88r8iR/gsiE/a/k8izdNS0DHO/gNBaiHkQqw3BQ4ITaQ5kovmLN1EvcdguWNddkDctnvarQ
	Scjys1A48aWNGsg+f3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCVL5-00BNAm-51; Sat, 16 Jul 2022 00:07:19 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCVL2-00BN8I-GB
	for linux-mtd@lists.infradead.org; Sat, 16 Jul 2022 00:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657930036; x=1689466036;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B0NmcVWqBiIJwuMdhqHTpX2jPTKLv5AzIu63NOheRms=;
  b=O56gVsbZx38sNY7fdmvZFOeQijGvnh2bCLE/0N9LTIH2L3udclg6qbvS
   cPd0MexmHfLH5DEebOPNg2pIoVIITaOOpKoR2kxToQHiWN1JJq7sKiTzh
   hqCp5qEgx0DjUM1DY+oPoHdDKgif0E8fEEvURd70jl5ZG+8gHWgP7y9Xb
   8=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Jul 2022 17:07:07 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 17:07:07 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 15 Jul 2022 17:07:06 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 15 Jul
 2022 17:07:05 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<p.yadav@ti.com>, Michael Walle <michael@walle.cc>
CC: Jamie Iles <quic_jiles@quicinc.com>, Graeme Gregory
	<quic_ggregory@quicinc.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
	<clg@kaod.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] mtd: spi-nor: fix select_uniform_erase to skip 0 erase size
Date: Fri, 15 Jul 2022 17:06:42 -0700
Message-ID: <20220716000643.3541839-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_170716_589451_5D3C7969 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Michael Walle <michael@walle.cc>

4bait will set the erase size to 0 if there is no corresponding
opcode for the 4byte erase. Fix spi_nor_select_uniform_erase to skip
the 0 erase size to avoid mtd device registration failure cases.

Reported-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v3:
 * Added newly in v3.

 drivers/mtd/spi-nor/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 502967c76c5f..666ef6ce9549 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2113,6 +2113,10 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
 
 		tested_erase = &map->erase_type[i];
 
+		/* Skip masked erase types. */
+		if (!tested_erase->size)
+			continue;
+
 		/*
 		 * If the current erase size is the one, stop here:
 		 * we have found the right uniform Sector Erase command.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
