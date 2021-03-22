Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC16C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 15:09:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D63F86192B
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 15:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D63F86192B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yxZYFHyIEAIbzrWyb/MnNb7jKTTuwsqV7VhTCrpYRuM=; b=CTaxaG53mIbnTrFlM3ijGn7Nh6
	Aj8YV0oTk+JHqXA7zWfTtgoSwe+E/eTAFOFHGj+PzX79TOMgL5qjpkrwCABBz1la3GTBTyhOCbq0E
	LEHcn5fYqTXyGukdypUhMHY9KCOHyYnBJSefN/eAN6nNkky85yGRbu0QkcMbmmsaplqzclger372v
	Tv1o9AnFrXxIM4RxMKBsKHPrhHwrBdahjFdjZR+xvliOuvwNfE5NAsnr2/PMJb5ZRsQUk1U4KT0Bz
	w2DQNSkx/0UjMhrQwYh2O3VLWKA7RaC8fOew0EY2jHDTZGIZeZNlmP0k8mz4JcqddYicUZNJMQg8x
	WeKu6ZCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOM9c-00Bqzx-Ob; Mon, 22 Mar 2021 15:07:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOM9R-00BqyD-Vg; Mon, 22 Mar 2021 15:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1616425648; x=1647961648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PKEVxUCgPKYfeTmheletBgau4WWVsW+3puprPtDA3sw=;
 b=QmH1OO2mkLpXoK+RY2sMrRKqLn45TcJF+QwHpfTfmdssR74dmYlS2XmZ
 ntROh4rSxX4f09M5XjjyDlTm4WhiXu/z7UIxdazSXhSL3nGZFc240Ik/m
 YaNw6fDJKNOtVXdDNMikHfM5fEmYFVWnah1WHK/ZwPXPw1tExqcuWqdqH
 pxuqtLfd/8uxF6sJizeLyC4J4nig2LLMfn1fZBSg9JB2uesHt4ph+N953
 0Fa+TLtpX03GJeTr8MOSyHjZlJOoQlm9VHAfeNs0+9DF3Zu4ZjKHJI4QD
 aiV7n8/bjSBeNqh1z1PM8jvYcSn/RISkhy8K5401/IFADtWHUiw1Vi0yr Q==;
IronPort-SDR: 2k6wZB5WbX+HIh6DWKmt2jsnNmQ88DYxESFLawyT2CQbVn6VCxREeIZdFanxgafkNYJ/q+FZsM
 /+35jIGaslhfYDgkHTCwBNmRPN4y5Qs8fv8ambqE4V2sMN7uj90lfz/ULpyHBAwi1bbq5MtF4c
 46Xs18xj+5zv9Rk/8t4C6YV/oAryI4PqSJ/pvHsV+z+j/X74hquJOiQNmid6rqGff4Yffi+79D
 kzvdmqB71j8VIhr7CZ9c52XuCy/2NXC3RZUu9EDsYCoVFdd+Dj402ts/9ZmC7Yi8+3ZA+s3/0D
 xm0=
X-IronPort-AV: E=Sophos;i="5.81,269,1610434800"; d="scan'208";a="119923115"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Mar 2021 08:07:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 22 Mar 2021 08:07:19 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 22 Mar 2021 08:07:16 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <bbrezillon@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Kai Stuhlemmer (ebee Engineering)"
 <kai.stuhlemmer@ebee.de>, <stable@vger.kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: rawnand: atmel: Update ecc_stats.corrected counter
Date: Mon, 22 Mar 2021 17:07:14 +0200
Message-ID: <20210322150714.101585-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_150731_497350_AC11DDA0 
X-CRM114-Status: UNSURE (   8.62  )
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

From: "Kai Stuhlemmer (ebee Engineering)" <kai.stuhlemmer@ebee.de>

Update MTD ECC statistics with the number of corrected bits.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: stable@vger.kernel.org
Signed-off-by: Kai Stuhlemmer (ebee Engineering) <kai.stuhlemmer@ebee.de>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index e6ceec8f50dc..8aab1017b460 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -883,10 +883,12 @@ static int atmel_nand_pmecc_correct_data(struct nand_chip *chip, void *buf,
 							  NULL, 0,
 							  chip->ecc.strength);
 
-		if (ret >= 0)
+		if (ret >= 0) {
+			mtd->ecc_stats.corrected += ret;
 			max_bitflips = max(ret, max_bitflips);
-		else
+		} else {
 			mtd->ecc_stats.failed++;
+		}
 
 		databuf += chip->ecc.size;
 		eccbuf += chip->ecc.bytes;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
