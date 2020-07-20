Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858C7C433E3
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:29:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54651207DD
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:29:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WcaYcO4C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="raPRCmxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54651207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=85WTjzckI8ECo7elHcS6nChv6N+7vPx1ggy0EuTae8A=; b=WcaYcO4Cqr1HhG39i+aaBKNTT
	S0Zi+YOpAnQ+/uwkLaOBn1eJ5VWRkTW/0vsY4k8R0HMV8BXJlSC5wBBmPJ65PxzIdroZ4nhoK7r0J
	kzSYRbRiLU5+6wjQcmr3dXoPwkynoH701DIKyYcQjbXtk2zOyAowlonGk7zhxDIkmny/FGVjDrWvv
	WXOalSkeUBuQ/PCYP2ee5wdyVHmS4Lbttw1Ae4Wdm1ZGxDQf/FB/O4xsKNcO+rytUr31l9lUhnZ/U
	pUCtxPT5pNB74J+wmUK8CZPYSi5UeQcSlOD7NadqrxJd05LN4TNsNAaYa+gxq/+g89sgR6ZaIp49M
	mWboqKDPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxNPX-0006NC-Ft; Mon, 20 Jul 2020 04:28:19 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxNPT-0006KT-2l
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 04:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595219295; x=1626755295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oIbYRy1hxuOw7zH/MuGRp+Vl/RqZPuV6n/AmSUin5WI=;
 b=raPRCmxeCMyOV/WaVTMzhpw7x/CK3kBTOJtT6AhSqjyhyeLCnQgtt7gm
 pyoXqJOqwofh5Tc4tGlx5cyrZw/1bxxBIkuV+Umei1O6KTsQs5yPwkMYT
 QF2Ht+Ll3S8RmekLzh8o2Hit64weAGxrgZNBFidTLXKeHo69g6bAemyIH
 +TAY79yv3KAFaeiwTvW9gzJl82rMpVFYoht1IDvU73sPt019jWmEHMmKL
 f9o6toLw7sc6GLvQUkfyCesHo/wgCbSDKOm9SZ2CoYdeR9N/QWHEZxjgU
 ZhQ4Q7teqTkw9ukMZeg4hPNWOs9lSHK8rW7+y38u32NXH9GsYv1Z7B2rq g==;
IronPort-SDR: bmvOvfPZSOQ40e0ToqhDSID2OSlMwsfjN9pu7E9dUTJ0JFS57wrgGEOc2DVo9X9CZURcUeEfVm
 dqUOl+VknTzpQ+OWcVidcoKcCJVPH/oB2Ohw74BRaQDbNZUgseWU+Jw9Ci8CrFfXdpJt15dmtn
 7mO/WAjHlG1dE4BbP7MMR3Dt6etlqNQthKWT+dnH7Vc3LnHkOuVTmZhm4/ST8tmrYnhtVebtnk
 +9EcoIkK+rtBEk6mP/I0+HM8CT3ChcNG4WiXaSuSyjRDRb5281jEm4BI6he9DDnSewXo67czLo
 DuQ=
X-IronPort-AV: E=Sophos;i="5.75,373,1589266800"; d="scan'208";a="83812066"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jul 2020 21:28:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 19 Jul 2020 21:28:13 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Sun, 19 Jul 2020 21:27:35 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <boris.brezillon@collabora.com>
Subject: [PATCH v4 4/6] mtd: rawnand: atmel: Use nand_prog_page_end_op()
Date: Mon, 20 Jul 2020 07:27:57 +0300
Message-ID: <20200720042759.1482341-5-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
References: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_002815_308463_57F69B7E 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>

The nand_prog_page_end_op() sequence is open-coded in
atmel_hsmc_nand_pmecc_write_pg(). Let's use the generic helper here.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index a3f901e64bfb..3fe0b3caa5b9 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -902,7 +902,7 @@ static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct atmel_nand *nand = to_atmel_nand(chip);
 	struct atmel_hsmc_nand_controller *nc;
-	int ret, status;
+	int ret;
 
 	nc = to_hsmc_nand_controller(chip->controller);
 
@@ -936,19 +936,7 @@ static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
 
 	nand_write_data_op(chip, chip->oob_poi, mtd->oobsize, false);
 
-	nc->op.cmds[0] = NAND_CMD_PAGEPROG;
-	nc->op.ncmds = 1;
-	nc->op.cs = nand->activecs->id;
-	ret = atmel_nfc_exec_op(nc, false);
-	if (ret)
-		dev_err(nc->base.dev, "Failed to program NAND page (err = %d)\n",
-			ret);
-
-	status = chip->legacy.waitfunc(chip);
-	if (status & NAND_STATUS_FAIL)
-		return -EIO;
-
-	return ret;
+	return nand_prog_page_end_op(chip);
 }
 
 static int atmel_hsmc_nand_pmecc_write_page(struct nand_chip *chip,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
