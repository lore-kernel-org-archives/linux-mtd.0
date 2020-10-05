Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE5AC4363A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 09:04:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C771820674
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 09:04:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OOGzdrFd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="x0I55o1n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C771820674
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dlDpXOSb9OmIJKccbvJNLQ6zQmvv6zh0DDunqnSKg28=; b=OOGzdrFddrOQr3GxqTlrjC2PYH
	uvcW4I6Td2oUiMQmsEteTUocncvMvWJ3OyMsKEX4QFZEtUTilgSrdKvnx4fl6oooh+7+OIpn0pddO
	oelLX+tLa0hg1A23QrMUBNzoBgcMBMOKLmhVgNWJYBbiY4BplOo/oZdryIfQ8eZn7v9fKEXCztGHO
	lyAePLa029WYVqOyjd3LMK/178scpukZXSt6STbJAHUC2HFSrKz8ii0kCbF9008TAnSYFOdHdKp4A
	kcXLI/TL+IK/P+V6CGQXOl/w8Yyr7J07JFnyPKzDEzRpAmZm/DVrCIEQT55qBOvvqnlVGff/EsJbx
	ue6KZ0SQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPMPF-0005WW-8s; Mon, 05 Oct 2020 09:03:41 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPMPC-0005Uj-8d
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2020 09:03:39 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09593UqQ117722;
 Mon, 5 Oct 2020 04:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601888610;
 bh=34zB5rxU6oGZs0aqc0RCPFb2g/4HaIl26DX44jowZg0=;
 h=From:To:CC:Subject:Date;
 b=x0I55o1nHe4WURr1DGQW8EWhcmXIlf7fPM9nKXRuc78W6G/0s729Q4rPYQ5+AiJg2
 zxdbpnulNKbby/quBIltos1z1155+vIBU7w6Q1gHz38+nyAWqjv9UP5Dz5lSfUKoHS
 PvdqcjXh0EQuQdqFt4qvsTD9M1RKvsJQluLqs7Z0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09593U7B075801
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Oct 2020 04:03:30 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 04:03:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 04:03:30 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09593Rkr005614;
 Mon, 5 Oct 2020 04:03:27 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] Revert "mtd: spi-nor: Prefer asynchronous probe"
Date: Mon, 5 Oct 2020 14:33:21 +0530
Message-ID: <20201005090321.8724-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_050338_377041_3EEE68C2 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Doug Anderson <dianders@chromium.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This reverts commit 03edda0e1edaa3c2e99239c66e3c14d749318fd6.

This leads to warn dump like [1] on some platforms and reorders MTD
devices thus may break user space expectations. So revert the change.

[1]:

[    1.849801] ------------[ cut here ]------------
[    1.854271] mscc_felix 0000:00:00.5: device is disabled, skipping
[    1.858753] WARNING: CPU: 1 PID: 7 at kernel/kmod.c:136 __request_module+0x3a4/0x568

[...]

Reported-by: Michael Walle <michael@walle.cc>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2add4a01fce2..0369d98b2d12 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3451,7 +3451,6 @@ static struct spi_mem_driver spi_nor_driver = {
 		.driver = {
 			.name = "spi-nor",
 			.of_match_table = spi_nor_of_table,
-			.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		},
 		.id_table = spi_nor_dev_ids,
 	},
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
