Return-Path: <SRS0=p/ok=GY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4857DC433E6
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jan 2021 09:22:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4D5523888
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jan 2021 09:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4D5523888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yddxcxc/lXcle0uH2n1CkA9OgzjWoNllv8VxEn2eBro=; b=ZNview7AJQTmmMcXbpTIg24Xq4
	GT1Qtz9270Z8HxEv0HsVxFsRX1i718tn6oBsg9kLyHtbkeTzTleEgHm2IISn7uOT1AE3TVzHdkSip
	I4KTgJCDKHElkPk2F9p95BNMXrWB+4G+TytF7WzRWE5G0Y+TJMXH1iQu8M09mqflwxjVSujsPeZb4
	XrbPDejCa2MCNk+KtZXLHa4+BQ2EvyFW2dcHZiZP70OFnIr0EsYfRf6IW7F7V1s8EIGKqbJ9IKzG3
	th0Im31165b7bi+OIxh6wv1vBsTiZQMLr17NjE8HQVJqXe9HgLYLSBHs3q3RdsfWoxcevpLGs5jhP
	58dbAf9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2W9r-0005PU-6f; Thu, 21 Jan 2021 09:21:39 +0000
Received: from m12-17.163.com ([220.181.12.17])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2W9l-0005OF-1v
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2021 09:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=LcPAqHxUl72bUh++s/
 JaCuY9FecmEkxLra2ChECTzy8=; b=jV5R1Z7YTjED/uiqTKAEe+MEhWS3H1hPAe
 rfeFA3ct7btWUh6VAj4Eg4LnO8L+hGSN+HTV5d4tWkowd2y66dE5P0mx1cDPRu8F
 9Jygm/kAaUZRLCOX4D83f4gPXSQF+lbgLJQuWB53dwN6puYryLTKmMvSab1x4qdO
 FQWZAs2Lw=
Received: from localhost.localdomain (unknown [119.3.119.20])
 by smtp13 (Coremail) with SMTP id EcCowABXXZ38RglgC3Gogw--.2681S4;
 Thu, 21 Jan 2021 17:18:56 +0800 (CST)
From: Pan Bian <bianpan2016@163.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mtd: spi-nor: hisi-sfc: Put child node np on error path
Date: Thu, 21 Jan 2021 01:18:47 -0800
Message-Id: <20210121091847.85362-1-bianpan2016@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EcCowABXXZ38RglgC3Gogw--.2681S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF1xJw48uFyxKr4kWw1rJFb_yoWfWrcE9F
 4xuFyxZrs2kF4rKwnFkw18uryYka1FgryfCa1SyF9xt3y7WrnYga4DZrW5Zwn8Ar42yryD
 uw4qvryxCr47CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj-6pJUUUUU==
X-Originating-IP: [119.3.119.20]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/1tbiDgAhclXly8wsIwAAsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_042135_022924_D9B2E815 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: Pan Bian <bianpan2016@163.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Put the child node np when it fails to get or register device.

Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index 7c26f8f565cb..47fbf1d1e557 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -399,8 +399,10 @@ static int hisi_spi_nor_register_all(struct hifmc_host *host)
 
 	for_each_available_child_of_node(dev->of_node, np) {
 		ret = hisi_spi_nor_register(np, host);
-		if (ret)
+		if (ret) {
+			of_node_put(np);
 			goto fail;
+		}
 
 		if (host->num_chip == HIFMC_MAX_CHIP_NUM) {
 			dev_warn(dev, "Flash device number exceeds the maximum chipselect number\n");
-- 
2.17.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
