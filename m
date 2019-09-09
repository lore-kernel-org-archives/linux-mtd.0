Return-Path: <SRS0=kLyw=XE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A91EC4740A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2019 10:48:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3270621479
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2019 10:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cSulhhzI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3270621479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JzGUxUX7dzyuRZ8DX66tqv+ogDTUh/8PY3drBTSk1Wc=; b=cSulhhzIN70U/Cu95nHH+RWGGK
	TMmRKo0oc7/60zpgivhlKbI4eXcLw6+bVt+iZtbmHkkOSw0073bPYmaWejeLfBB46povNSlIpFUk8
	50CXY8LCmRcnuMdLi8wWPHIQ3VD3nt/C2i4Lr6Ud4+VoFrJI9BBGRfhemaOehXwMdUd0XTFJ+TRCQ
	p2KPRFYzbLM41HFrcr+sWhKlCDZ1s7GZmgm2Va44AsuV4tbsjRiajkFoZ+6b+mcy0idkCqUU3I1yH
	mZG1uwqj9xnAvkamGZXfdaL8B16RMy+IEwtJDMDt5JtRVP8dM6s1Kpn+tsQeaA+4Na9iFpnmdIrZu
	ckG3TgKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7HDb-0006XZ-Tw; Mon, 09 Sep 2019 10:48:24 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7HDB-0006Lo-Cx
 for linux-mtd@lists.infradead.org; Mon, 09 Sep 2019 10:47:58 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2019 03:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,484,1559545200"; d="scan'208";a="183782889"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2019 03:47:49 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 3/3] mtd: spi-nor: cadence-quadspi: disable the auto-poll
 for Intel LGM
Date: Mon,  9 Sep 2019 18:47:33 +0800
Message-Id: <20190909104733.14273-4-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190909104733.14273-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20190909104733.14273-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190909_034757_603616_D09026AE 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 tudor.ambarus@gmail.com, vigneshr@ti.com, boris.brezillon@free-electrons.com,
 richard@nod.at, qi-ming.wu@intel.com, linux-kernel@vger.kernel.org,
 david.oberhollenzer@sigma-star.at,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 miquel.raynal@bootlin.com, jwboyer@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, cyrille.pitchen@atmel.com, andriy.shevchenko@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

On Intel's Lightning Mountain(LGM) SoC QSPI controller do not auto-poll.
This patch introduces to properly disable the auto-polling feature to
improve the performance of cadence-quadspi.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 73b9fbd1508a..60998eaad1cc 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -135,6 +135,8 @@ struct cqspi_driver_platdata {
 #define CQSPI_REG_RD_INSTR_TYPE_DATA_MASK	0x3
 #define CQSPI_REG_RD_INSTR_DUMMY_MASK		0x1F
 
+#define CQSPI_REG_WR_COMPLETION_CTRL		0x38
+#define CQSPI_REG_WR_COMPLETION_DISABLE_AUTO_POLL	BIT(14)
 #define CQSPI_REG_WR_INSTR			0x08
 #define CQSPI_REG_WR_INSTR_OPCODE_LSB		0
 #define CQSPI_REG_WR_INSTR_TYPE_ADDR_LSB	12
@@ -471,6 +473,18 @@ static int cqspi_command_write_addr(struct spi_nor *nor,
 	return cqspi_exec_flash_cmd(cqspi, reg);
 }
 
+static int cqspi_disable_auto_poll(struct cqspi_st *cqspi)
+{
+	void __iomem *reg_base = cqspi->iobase;
+	unsigned int reg;
+
+	reg = readl(reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
+	reg |= CQSPI_REG_WR_COMPLETION_DISABLE_AUTO_POLL;
+	writel(reg, reg_base + CQSPI_REG_WR_COMPLETION_CTRL);
+
+	return 0;
+}
+
 static int cqspi_read_setup(struct spi_nor *nor)
 {
 	struct cqspi_flash_pdata *f_pdata = nor->priv;
@@ -508,6 +522,11 @@ static int cqspi_read_setup(struct spi_nor *nor)
 	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
 	reg |= (nor->addr_width - 1);
 	writel(reg, reg_base + CQSPI_REG_SIZE);
+
+	/* Disable auto-polling */
+	if (!f_pdata->use_direct_mode)
+		cqspi_disable_auto_poll(cqspi);
+
 	return 0;
 }
 
@@ -627,6 +646,11 @@ static int cqspi_write_setup(struct spi_nor *nor)
 	reg &= ~CQSPI_REG_SIZE_ADDRESS_MASK;
 	reg |= (nor->addr_width - 1);
 	writel(reg, reg_base + CQSPI_REG_SIZE);
+
+	/* Disable auto-polling */
+	if (!f_pdata->use_direct_mode)
+		cqspi_disable_auto_poll(cqspi);
+
 	return 0;
 }
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
