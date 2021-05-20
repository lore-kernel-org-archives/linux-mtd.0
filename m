Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8E7C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 11:50:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14AD46101E
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 11:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14AD46101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X8tFTjrpi933rgqohd0w0MiPmhQK9Nl10d+JZsNjXJI=; b=a2qdB9ohjL+Fvqs78alqpr0bJw
	CRNMYxsnHmeC8j86NZra5wasq6OknbgD7Nq7v6OoR5Xg5nYyuYF1kCUhlMkRHz2x4qE1+udenamAV
	uv0q0KAoIYZvxn33h8950I89VTlQrMDo7JSWAIofckPSDwR6LR982/A7yPZ6PfYqIcLXVzdr+32pr
	SwWVewYYq8qX057fNqIiatdAilwK/9baakshyIM/5yOfZHOat8q805gIDZ5GBRqfX7MqS9FbNGuxh
	MpZ/cXEFBXJkagOU96dShDoEb2/qmufmVvF8r4Cq1iVVHtmFPPEDDNy/A+kOHPX1/9UePVjCUS4J8
	Hwv2+bBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljhAo-000bbV-Qn; Thu, 20 May 2021 11:49:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljhAm-000baU-HP
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 11:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=/62pxyhgvbPd5KZXSP5vbpV2Faf9Dp1qOkElacWi2Ho=; b=fKrnZROiA400pvslgi+2TkOS6S
 aCPzEgx4ZOCUAJ2wtwA9LJn/4Hn8E4BmmFQFB2+B+lQzIVIyo1ZTLvOkqY8f3MjA5ncmA0ANxzmry
 5cvQwKkobEL2lLhM1pUTT5Lu+s3Cll0OJnoA9tW0soOcuhH7uf05N8bawkdhoft+KxhmoQIG2IJ87
 sw2ZQMExoeqWWXpO/bR1DJNIXR5DLXLxsx9YoX6wJJwsS6WVB2/59Hhe3JNWEh0JuxNmpDIc8R0rh
 ZmSoYVZIZlQksHobti7B/0XME9zTPvFbym7yGEMww+RmNVjM3RaMGB/2ywkC/dG7whHcD00YA3A8M
 BHRAUx6g==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljhAj-00GGrq-GF
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 11:49:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so5044685wmg.3
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 04:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/62pxyhgvbPd5KZXSP5vbpV2Faf9Dp1qOkElacWi2Ho=;
 b=Hgww3V2vjG/idQ3o9V4g0CompcUETxFS1pbBHbReWrU5mg9GzciyHljVqhLFnGVZ1D
 gbxp8kKUpmr3WOXK6c1xGFB0DcBKOKGUITjcoYocmcIHH+oRxYypwyNJ0SuosH2NgrZo
 M/nU2UCbaBjvmnKlSNxL7rEO36aB44caEgwi/AZAf09YRK/zt5xIacPqll/fZlzWh788
 AoPKiSeYnGhEAjrwrhCgvZafoH/wfDlSWhdG9h3qXpKVtZPnre2wp8cSTtBEwBj4od5X
 Uqd9R95YAWsR9xTmkp4y5Hv/6KGzIPjtsPx6tofY1hqgCHfevKvrWolo9LfQkFMIRdzh
 gSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/62pxyhgvbPd5KZXSP5vbpV2Faf9Dp1qOkElacWi2Ho=;
 b=STYj1PxAJ7L8rO5/ey21UIiOoQhIDcB+3DnXcVkqIZGNRuoV/2LX6uUOdhUoU+vkXs
 jB0v5sAhKbubmMqczmf3PcG8mArjfAaEf9mkaYbb5GEjewtVSYWBmSXZ0TeKu2/NImre
 5oLh6S7nJoRTN7UXoipNqL2H8NeDEWRY1Wp97uUwTBOKIW29QLElGb55jpw8SVjBaXnM
 1nwFmJDe8Ush7F1zTyaspsxUw7wVkYIY8kZ6iXJHAl9QNciPfgXqtIUteV/mUTRf2vgv
 hzfFIRY7nx5jQP2ECPxwPe98jiKgTly3rbK9+YMiFpGCHmDvfWAzr/TWW7fwygNxP8aa
 i5pA==
X-Gm-Message-State: AOAM53196uQWmEzE3hukyofvMIcjfSA1I+a+paUzMzKGKA0QDeAUtaMp
 JtlmMBZ+Pw9lGSBa/9UZwQaTYw==
X-Google-Smtp-Source: ABdhPJzmI9RrPGlYzCa8BOTpXn+t3QQHvMmxMBduTKRJ7NaXdyUyTq41RgT/m8ysi7gendwuNjlL8w==
X-Received: by 2002:a1c:bd8a:: with SMTP id n132mr3269285wmf.106.1621511340280; 
 Thu, 20 May 2021 04:49:00 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s83sm2478886wms.16.2021.05.20.04.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:48:59 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: boris.brezillon@bootlin.com, linus.walleij@linaro.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 1/2] mtd: partitions: redboot: seek fis-index-block in the
 right node
Date: Thu, 20 May 2021 11:48:50 +0000
Message-Id: <20210520114851.1274609-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_044901_558364_0701DEDC 
X-CRM114-Status: GOOD (  12.28  )
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

fis-index-block is seeked in the master node and not in the partitions node.
For following binding and current usage, the driver need to check the
partitions subnode.

Fixes: c0e118c8a1a3 ("mtd: partitions: Add OF support to RedBoot partitions")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/mtd/parsers/redboot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index 91146bdc4713..3ccd6363ee8c 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -45,6 +45,7 @@ static inline int redboot_checksum(struct fis_image_desc *img)
 static void parse_redboot_of(struct mtd_info *master)
 {
 	struct device_node *np;
+	struct device_node *npart;
 	u32 dirblock;
 	int ret;
 
@@ -52,7 +53,11 @@ static void parse_redboot_of(struct mtd_info *master)
 	if (!np)
 		return;
 
-	ret = of_property_read_u32(np, "fis-index-block", &dirblock);
+	npart = of_get_child_by_name(np, "partitions");
+	if (!npart)
+		return;
+
+	ret = of_property_read_u32(npart, "fis-index-block", &dirblock);
 	if (ret)
 		return;
 
-- 
2.26.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
