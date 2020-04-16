Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1EAC2BB55
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 16:28:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C00020771
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 16:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="olIPool8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBCZkMhS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C00020771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YE5DeLeZtQh58N4UYVAf5Gx1GzrHkIGO7hePCkKGXmY=; b=olIPool8hjrNZQ
	vtkqvpHngkHw+FyAfpxBVM4CKECIBus+/2ZN+u1PKlYsJD4TXRW+bGwZRJ/di1B75YMFz80d4qtAE
	uBbs27i5Nx8RF+PwE7s8ppSHogN/qOFHtyVnAoCFHYm9iZEZPjjdGlAjWjU7sRObRi8Ggg7MgZeTp
	hCfLKqWRtOyrDvUv3lBpxdIWSzTcusp4Lv3QBLj1SOp60BloJ8Qpjrz0oak5zkUTf3NF9uIkjRB3L
	o4nSIhDhLyfBCXExg6QeSSevszyOZ3y3nE9AkOCABKwldj4lnXd4YDz7ir2pvKTH68+SXq91SbLHu
	anKb2rgjCaXCpr9v9KBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP7Nl-00019l-3w; Thu, 16 Apr 2020 16:28:53 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP7Ni-00019B-0v
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 16:28:51 +0000
Received: by mail-pl1-x644.google.com with SMTP id d24so1529658pll.8
 for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2020 09:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DH5AjWb5Y/HC4rBu1O6z9vHzFuPiXlFK1AmlrEvjj1A=;
 b=WBCZkMhS3gdLHak/VSo4Xn0s/nbTSmpk9Jj0cxWCDrvXpC+EtwYAWxrMqTLfbp/mBk
 lVhRuPFZSZ4YZz9o+xTcibUa4jjgvuNb6GjWx0qXZQy2QWygyA8QlM9ls8a+5LQ3uzaj
 MdThyYXqnpiDcsja+9uKGNwJE/mGRRDkcCrUFhv6LQ8BZM68dwp1p2pidbzLHaR/7pBq
 rRdhCQE+ADVVWwV5TOGE3fBEIVE049HgxmWxVIFdF+V6vgHr2LLzNP2gRg7ZeEa7uzyU
 1tXqrKcwWHDW5Te5aP9gsil2QL2f2pPEhzmRy2v/GzNDfnzOnN+vpwJVErfbojr2DCF2
 dvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DH5AjWb5Y/HC4rBu1O6z9vHzFuPiXlFK1AmlrEvjj1A=;
 b=WRo9bihptIPPmPvwTNixtpBwbEoRZR96bx97BQkuHHpP50Mb/srGEIs30BLjjmthnJ
 XuM1uLJ2tmPrgnczIksPUdcrzVxxNsIWD61QGiwkBB86XUpaiRDDDNUmFt4RtKbWpjWK
 ewpDgVoEuii7kkjaJd89OfTCcnz1NxfdPeMuQzXmNOqUOtO6bljtL5Xm5I8LA61q3sUR
 LfHxWuWV2Dbq5hszfwgpTEWf2lDOHd1NHCUqLZV4awFDi0XyzgSQjz7YT3VeXJW3fo5W
 nJxJ88/wFy5TUUwQOxC1+Q6fO4nJAykyu4VVuIjwNrYO+xd0FQo6Du+CfbPgnRVVVcu4
 seig==
X-Gm-Message-State: AGi0PuZr83zkOlWWSPjZio4LT+oGDqTC9fHLoFkzd4wf9esESheZXMMi
 tq/GSBL4cK5iLM/UJrog3RQudHzI
X-Google-Smtp-Source: APiQypK+z6rTLn+Bg3ChLHHVM5q18C6AjRuYYDu+Bu2MYmSnhwHnf0s/QBnuXaHNwo72Z2F5ZXpxzQ==
X-Received: by 2002:a17:90a:10d7:: with SMTP id
 b23mr6238055pje.111.1587054527623; 
 Thu, 16 Apr 2020 09:28:47 -0700 (PDT)
Received: from minnich.svl.corp.google.com
 ([2620:15c:2c5:3:65f9:fd8e:a0b8:2917])
 by smtp.googlemail.com with ESMTPSA id k14sm17411082pfg.15.2020.04.16.09.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 09:28:46 -0700 (PDT)
From: "Ronald G. Minnich" <rminnich@gmail.com>
X-Google-Original-From: "Ronald G. Minnich" <rminnich@google.com>
To: 
Subject: [PATCH] mtd: spi-nor: add cmdlineparts to intel-spi
Date: Thu, 16 Apr 2020 09:28:28 -0700
Message-Id: <20200416162830.183725-1-rminnich@google.com>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_092850_089524_F9D6B040 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: Enrico Weigelt <info@metux.net>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, "Ronald G. Minnich" <rminnich@google.com>,
 Jethro Beekman <jethro@fortanix.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Intel platforms, the usable SPI area is located several
MiB in from the start, to leave room for descriptors and
the Management Engine binary. Further, not all the remaining
space can be used, as the last 16 MiB contains firmware.

To make the SPI usable for mtdblock and other devices,
it is necessary to enable command line partitions so the
middle usable region can be specified.

Add a part_probes array which includes only "cmdelineparts",
and change to mtd_device_parse_register to use this part_probes.

Signed-off-by: Ronald G. Minnich <rminnich@google.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index 61d2a0ad2131..132129e89d07 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -894,6 +894,8 @@ static const struct spi_nor_controller_ops intel_spi_controller_ops = {
 	.erase = intel_spi_erase,
 };
 
+static const char * const part_probes[] = { "cmdlinepart", NULL };
+
 struct intel_spi *intel_spi_probe(struct device *dev,
 	struct resource *mem, const struct intel_spi_boardinfo *info)
 {
@@ -941,7 +943,8 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 	if (!ispi->writeable || !writeable)
 		ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
 
-	ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
+	ret = mtd_device_parse_register(&ispi->nor.mtd, part_probes,
+				       NULL, &part, 1);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.26.1.301.g55bc3eb7cb9-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
