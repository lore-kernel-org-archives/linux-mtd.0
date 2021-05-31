Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4FEC47082
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 18:20:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51FA7600EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 18:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51FA7600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmS5DzraRZOJx/9evxJkDpg+WbhivbrjEaeo4/69ZhM=; b=LWaeVKNCi9ZCQs
	svAQbIjroAsjg6tsxeESSYEBXRfJCflBz8Ctp9V1JMOuJ8p1FMJu9cHibEWZtu4BF2qUVM3cU8hDA
	oD82ke35A23jU4xpFyOfMrUK/PDIxMtHzm1/HjcWKCw0jlPkKO36srStp52qhsV3S/yiwgObStZs1
	yA0AP4Kapv55tDDlW9FkhLpwo2xFPW1u+u0gA0V52zZVrcyUCbfMytCzIlZvEaAy9p3+PaGsX/3r+
	RLkWDf9Y4I23uLcB7xH5AK8bQVtn5q97741kQmdvl/4Z2vIU+MMYSA2hEHBwfKx7Z5jM2GGwXzJUW
	SPH8+w7eC7H2SX+Vk9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnmVM-00D5rf-No; Mon, 31 May 2021 18:19:12 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnmUT-00D5YA-Uu
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 18:18:19 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14VIIESF129967;
 Mon, 31 May 2021 13:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622485095;
 bh=Fu8WvY6/rtLls9Y273CPvcnnzDx3DcNBfQsHz4ua8x8=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=xl/YcaysWm93KAdXX+ysTbABNSvUBkYAUTx9M1XhQyklygP9QPlvN8GrhKSC0LLpM
 8mOHzG+ZuLtKLFmGZDMjBtc+K0X4+qwOkvLZOn1Mha4+5cZg65DfQL9tXcBUbQifer
 29xftLSfXHsCZtvm6x5nEeamsTEQTabBzZSRHlJU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14VIIEJT027570
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 May 2021 13:18:14 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 13:18:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 31 May 2021 13:18:14 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14VIHwdJ118543;
 Mon, 31 May 2021 13:18:12 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH v2 4/6] spi: spi-mem: reject partial cycle transfers in
 8D-8D-8D mode
Date: Mon, 31 May 2021 23:47:55 +0530
Message-ID: <20210531181757.19458-5-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210531181757.19458-1-p.yadav@ti.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_111818_093933_CBCDDD2F 
X-CRM114-Status: GOOD (  11.38  )
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
Reviewed-by: Mark Brown <broonie@kernel.org>

---

Changes in v2:
- Add Mark's R-by (spell corrected).

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
