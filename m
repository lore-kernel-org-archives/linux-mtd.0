Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5E8C43460
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 10:52:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36EE061132
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 10:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36EE061132
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i4zNcYfqA+IRqQjtWd3K2GdHCxhWBl3D+zte2tvC3RE=; b=h9EkB8hVMVLHqOYR3jA8OxK+sc
	xYdrZlGbhFEaKqotGKDk2LHEouf9P8UonYM9E3HNhaUcsttvGpegq5F9dHWE4TI02yJzKNVXKjz4l
	7E4gVImvZ64VWJ1K0FzqpYCUIa4bBhMonpvDW3RTo+sLM/Fzeh/LUZJFrbJqlNoI3wzwtlRi3r9Ax
	eSEvjcn4DQztJXDgScR/mT8l36l5fdLR90mDDmQwzIisCeGshd/yZbFCjCQdcmFvfMr4FUp2py+81
	7rQFeY75bmycKUE/VvnE7aMFA1w9tThX8kV8EMzPcWcY91IYyj+IWzRZHVDKrJ35QTV6VGtroO9m1
	/73/nxag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgPyv-00H1Fa-TQ; Tue, 11 May 2021 10:51:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgOs7-00GjU3-39
 for linux-mtd@desiato.infradead.org; Tue, 11 May 2021 09:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=Er4e3Wlwj5BM2A9N1DSRChljXHG2w+7/nDeq1nnE1Ho=; b=Bg88M8LreNEVES9H0XPHSZiIaV
 DmHCVYepi/TvgW2ZwWovhNFHRjFPNybldo6eso8GoIi11xpWU6l0GUHXgh+SZtyrJR1Od/3Z0nSUH
 2Cuut3SR1tDwM5vSxvbtD7mmS7vj6UMloDtyIZRTyWN64duAcnEdKXwPOdKjmFd4GFxPTynawKAbG
 W+oD5YiRcfhPMJAqd12UIeiIhyeUxp07XRxVrP1yVVHCzrHniOlcZpnrUtZHdL90SrM7qtKMwRtYk
 R//hmPtR1UjAEsx6IHrvqhtCSalpnfw2ljivSVaBuM7VHjDo6RItWRX5bzJAfFC/SJWRp1omECSVK
 zCKZc8jw==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgOs3-009RHK-Ik
 for linux-mtd@lists.infradead.org; Tue, 11 May 2021 09:40:09 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14B9e3Zl105496;
 Tue, 11 May 2021 04:40:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620726003;
 bh=Er4e3Wlwj5BM2A9N1DSRChljXHG2w+7/nDeq1nnE1Ho=;
 h=From:To:CC:Subject:Date;
 b=W3ixTAsBPbdwW7z+9UNrCAgwKgSqS3KWm7nTlTsiuNA4oHhEU3yhG+G1BswDq5Dbr
 9HII/L497t1Eq4E4zKU720az38HZLQS4PQvV33NAmjyEBH/65WAcr49UBaJRs3URu3
 Xzo5UH5ZaUHQFmSRv98j+eAGzjoDotbECvXxSl84=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14B9e2c2067204
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 May 2021 04:40:03 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 11
 May 2021 04:40:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 11 May 2021 04:40:02 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14B9dxBK039609;
 Tue, 11 May 2021 04:40:00 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
CC: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, Miquel
 Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: Add documentation for spi_nor_soft_reset()
Date: Tue, 11 May 2021 15:09:58 +0530
Message-ID: <20210511093958.17258-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_024007_723588_35DF9474 
X-CRM114-Status: GOOD (  14.59  )
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

Document what the function does and that it should only be used when it
is known that the device supports it. This will avoid unaware
programmers thinking that they can arbitrarily use it to reset the
device.

Suggested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

---

 drivers/mtd/spi-nor/core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 265d8b25fc7f..59e207f2e0e3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2988,6 +2988,21 @@ static int spi_nor_init(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * spi_nor_soft_reset() - Perform a software reset
+ * @nor:	pointer to 'struct spi_nor'
+ *
+ * Performs a "Soft Reset and Enter Default Protocol Mode" sequence which resets
+ * the device to its power-on-reset state. This is useful when the software has
+ * made some changes to device (volatile) registers and needs to reset it before
+ * shutting down, for example.
+ *
+ * Not every flash supports this sequence. The same set of opcodes might be used
+ * for some other operation on a flash that does not support this. Support for
+ * this sequence can be discovered via SFDP in the BFPT table.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
 static void spi_nor_soft_reset(struct spi_nor *nor)
 {
 	struct spi_mem_op op;
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
