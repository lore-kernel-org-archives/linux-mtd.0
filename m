Return-Path: <SRS0=TrVe=KB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34EBC433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:21:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1531F61107
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 19:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1531F61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n/Vx7N5EHUypLJr86ooCFYzRz7ecAx/3PtAdhRspI8I=; b=TMvtzeM3H7C80qdd7G+EeU9X0
	dJSZZxwIBJWn/bMBC+vspP54JDGEjvnXWl4Zc1i5eBYkoXzTXXRvUmMY6IuG0jFfExRk5xAFkn7Qn
	67337wP+uYu0ApTq6eWIYpXmKsIaoDEfiYnxSd9zuUmqWq+vH/ocp0iNy0bnt8QbvoHu7txzs+WTx
	UIfTWMsVMZNlFGQKIs7gR83tOWGLdc7p0fIQh7KqQStQiloXICgwFLSkIr8wIi8hNPte9AoZyAgHe
	znKmCU7O5iWxEWOr+zyAT7QHfMsUc61NmIpCAOuwjVi//IQXOoOyBqur7sSLlyoOz5Y/kJ0BM5O+g
	p8BO7YhbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lejXN-0057rm-Jg; Thu, 06 May 2021 19:19:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWP-0057a4-SO
 for linux-mtd@desiato.infradead.org; Thu, 06 May 2021 19:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=51TzeSbN2W/QrtF8UKtVaKXzI9nWsasCyemZNbc06W8=; b=ObSHmZYca3Qnn2lA/dHgwh4BCr
 fh4xGBCVe0QJ9RAn649Ft6w0Hf/UIgzUN3zJZs0qmLJJpzEGsj9CVX5mw7hlklubjDkjlPg7IFf0K
 ENIIx0ScjURNugyMHNjam0S4mSoZrJ8N0RVm/eSlqyFYam3X+HTH3sHabjpxH7qyE3Y2QAyP4ok+l
 dgHn/cqk2QSOTjxaCJnFSxo0LxSsTw0u3ZNLiGsoG/L/qFDkW2m1PRyx0tBqIuYucukV85Pf2pdrr
 uZwYmw+dQ4ku5wJlrvX1KRPQVhtWw8ucHuVwYT8kzQJdY1GGOE+/H0F26jqfaaNZVpNir/Y2wFELK
 UU7ky0CQ==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lejWN-006KiW-CM
 for linux-mtd@lists.infradead.org; Thu, 06 May 2021 19:18:52 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 146JIl7Q080697;
 Thu, 6 May 2021 14:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620328727;
 bh=51TzeSbN2W/QrtF8UKtVaKXzI9nWsasCyemZNbc06W8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=DsIYSc4ZgQFbLd6jCAtwVLWOundP5ZBYXW6hBKZugGo0/4aFPwpeaUdFy+KQ64RHM
 oIpkQE+2bmyLTPaz5qsHSMY2xvGuat/oAR10/FzlNVA/OJEqVvgTueFWk4GUeH9ON+
 WCeFYTpiEuSv08D9m6EulMfjP5K0aVfZWvbaSOCg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 146JIlPe097520
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 May 2021 14:18:47 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 6 May
 2021 14:18:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 6 May 2021 14:18:47 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 146JIUNG026052;
 Thu, 6 May 2021 14:18:44 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark
 Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH 4/6] spi: spi-mem: reject partial cycle transfers in 8D-8D-8D
 mode
Date: Fri, 7 May 2021 00:48:27 +0530
Message-ID: <20210506191829.8271-5-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210506191829.8271-1-p.yadav@ti.com>
References: <20210506191829.8271-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_121851_518809_A32162E4 
X-CRM114-Status: GOOD (  11.24  )
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

In 8D-8D-8D mode two bytes are transferred per cycle. So an odd number
of bytes cannot be transferred because it would leave a residual half
cycle at the end. Consider such a transfer invalid and reject it.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

---
This patch should go through the SPI tree but I have included it in this
series because if it goes in before patches 1-3, Micron MT35XU and
Cypress S28HS flashes will stop working correctly.

 drivers/spi/spi-mem.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 1513553e4080..ab9eefbaa1d9 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -162,7 +162,17 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
 bool spi_mem_dtr_supports_op(struct spi_mem *mem,
 			     const struct spi_mem_op *op)
 {
-	if (op->cmd.nbytes != 2)
+	if (op->cmd.buswidth == 8 && op->cmd.nbytes % 2)
+		return false;
+
+	if (op->addr.nbytes && op->addr.buswidth == 8 && op->addr.nbytes % 2)
+		return false;
+
+	if (op->dummy.nbytes && op->dummy.buswidth == 8 && op->dummy.nbytes % 2)
+		return false;
+
+	if (op->data.dir != SPI_MEM_NO_DATA &&
+	    op->dummy.buswidth == 8 && op->data.nbytes % 2)
 		return false;
 
 	return spi_mem_check_buswidth(mem, op);
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
