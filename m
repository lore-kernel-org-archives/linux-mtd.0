Return-Path: <SRS0=q3Mz=WL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19C7C31E40
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 06:04:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83205206C2
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Aug 2019 06:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ep20KUIe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePRxHxTw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83205206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uI7bEAzNYWzO59C2DoKu6vSyYT9mzjISoGnBI5ky83A=; b=Ep20KUIeL4N0+7
	hm+BfSX2PrmBpNrV8aKlB/uHfdVN0JNkYwmeKQ7IKDuse2bmGgf1LVJA2eTFeGKqsBwB/MhXP0OyH
	U2wf2et6DXlSEHCy9QcgsU4HSUEr2lu7AP/UmpmmJKyreUOY3/woVBIyEZkkAfSA1QFomMHNpJYHX
	qrK9hBKOG1QIWntTDiJ2LjlXVNSFdn/ZEdrEmHSriEbnQXBqRsR7Vo2z5wWHRO0skMHUmoxcpMJ4S
	PyOXftQiJlIShG14+mW8/+XN7B0wDgr0ZaJV0vN5rI3WWNCLvbALRP+Q3ygByv79DYXh0l8guUOUJ
	jE8kK1Dl2Vml7WG6jt0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hy8rY-0005Pm-6C; Thu, 15 Aug 2019 06:03:52 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hy8rV-0005PR-Af
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2019 06:03:50 +0000
Received: by mail-pf1-x441.google.com with SMTP id b24so868171pfp.1
 for <linux-mtd@lists.infradead.org>; Wed, 14 Aug 2019 23:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WMQ21vF3felpWyZJOQr71AP+Z4WYkH6fdGUWXpY/1+U=;
 b=ePRxHxTwQFmSjnXhVgMfSTLKL7+3Cj3uwC0YmF8dXrQfu+vDHIZsnOaNAoxfd6XLRR
 oUGwkY76ZUYDr/1wL/uHBnpirICfb9pxnTpjCyObDHtkp/0AJq64pCbV24UNoiE+ilng
 LZfe+KUc8ORqmu/v75pNopCdeuuiW8xwjskMbD3FGxoKU9c8pJu7oISqx5CxIvL9rpR+
 KkjBC0seh/oCxAl3y3oNfy3YD6v8jg2KkYbpyN7QGGKi9wlJetkQlhOPHLb1eSYgQcf4
 5Gu0+/8PBemccL10gWxR5tsiv8DIAdZBYIn7C447mqARvJ/9m2e9YScbK0MUFtj1HMx0
 a5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WMQ21vF3felpWyZJOQr71AP+Z4WYkH6fdGUWXpY/1+U=;
 b=m2LvzKq1HBPwCvvaSyyjZIf+p4m2PcVWdvu3LCVcoY9vrbe/CesXItqgWtN1mt7lr2
 utLWKySVXlSPXvTokE83cFqTMAjF/I6gVS+dT0cVVjhOXXVUdNr6APVsxF31bWpXNA2Q
 oUn6meVP8qz/7VGsEOiBh95HxheFHffvfIHlZT04NPxY9+PD49KU6g53FuDWcjV75vSl
 xmgbge6SYCo3DitthUsJUVEhzdpBAdIT79r8yAWXZSWIR+KlZsDu4YHSAcXo6NFenw5L
 j1LIavQto7bvh/ff9dN93vZwaK8GeDEdScNSZxieRg5ijUCau5r2mG1N9P25bnyWcBB3
 q1IA==
X-Gm-Message-State: APjAAAVD3oB1DWSRdTNDzhanOEmBvPTU41ci+/f1GeqcdpgMNpztpayc
 uH8yc/cAkoC4/rM97CnP4gw=
X-Google-Smtp-Source: APXvYqy9oMAsxww5/3ODxk/IiNEoLWjAl57y2xLFVhVxKSovBIte0+VcywYvlgwZuWvsEHG1jc0Ygw==
X-Received: by 2002:a17:90a:2767:: with SMTP id
 o94mr777986pje.25.1565849028405; 
 Wed, 14 Aug 2019 23:03:48 -0700 (PDT)
Received: from localhost.localdomain ([110.225.3.176])
 by smtp.gmail.com with ESMTPSA id q13sm1748440pfl.124.2019.08.14.23.03.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 23:03:47 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: hisi-sfc: Add of_node_put() before break
Date: Thu, 15 Aug 2019 11:33:34 +0530
Message-Id: <20190815060334.2632-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_230349_374974_1798EC9A 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Each iteration of for_each_available_child_of_node puts the previous
node, but in the case of a break from the middle of the loop, there
is no put, thus causing a memory leak. Hence add an of_node_put before
the break.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/mtd/spi-nor/hisi-sfc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
index dea43ea3eea3..6dac9dd8bf42 100644
--- a/drivers/mtd/spi-nor/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/hisi-sfc.c
@@ -401,6 +401,7 @@ static int hisi_spi_nor_register_all(struct hifmc_host *host)
 
 		if (host->num_chip == HIFMC_MAX_CHIP_NUM) {
 			dev_warn(dev, "Flash device number exceeds the maximum chipselect number\n");
+			of_node_put(np);
 			break;
 		}
 	}
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
