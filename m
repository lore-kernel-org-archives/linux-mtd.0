Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D71C282CB
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 05:02:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6EE120870
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 05:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D0aLDG+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6EE120870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=YEs+DKybWV+jcjNJ7Uu7Q60l3wQ+F4lPJ+qbLBz5Oag=; b=D0a
	LDG+r2LBbuiNgf+KEhRxYUfDn4UBAR9wSwwwh6MOX5ehS9PwrWeyy6CNq5k2IWAKYJf1FEAjezkVt
	o8tprXj3GFQ+kfXNL0j9ILA6VHEDMkt7AUE34HBXAPHsGIb3rBpXuJ55sS0AAdfeByHfu7KjIKwaH
	QlDdoplEwwtaRDJiPeTw/OOeaWy06XFRO2mw5R7eE3YYEom4eINTccAmb+dKnF/DGGHkJUslILbX1
	/rrO989G1GpBc+zXmIixBtArQxSP1j34hH5s/ieJDcNvTJ+7YZyGudbqGL9VFKfmSivULEW3P16gw
	KNd7WTKioI0Yx4QJv4P6524+RMuwpYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnz48-0007Aw-Ma; Mon, 28 Jan 2019 05:02:36 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnz45-0007AV-RN
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2019 05:02:35 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2019 21:02:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,532,1539673200"; d="scan'208";a="141880827"
Received: from unknown (HELO dev03.ndswc.sj.intel.com) ([10.233.132.114])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jan 2019 21:02:32 -0800
From: Purna Chandra Mandal <purna.chandra.mandal@intel.com>
To: Fred Bloggs <f.blogs@napier.co.nz>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: cadence-quadspi: write upto 8-bytes data in
 STIG mode
Date: Sun, 27 Jan 2019 21:02:29 -0800
Message-Id: <20190128050229.44965-1-purna.chandra.mandal@intel.com>
X-Mailer: git-send-email 2.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190127_210233_926715_FED2FC9B 
X-CRM114-Status: GOOD (  13.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Purna Chandra Mandal <purna.chandra.mandal@intel.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

cadence-quadspi controller allows upto eight bytes of data to
be written in software Triggered Instruction generator (STIG) mode
of operation. Lower 4 bytes are written through writedatalower and
upper 4 bytes by writedataupper register.

This patch allows all the 8 bytes to be written.

Signed-off-by: Purna Chandra Mandal <purna.chandra.mandal@intel.com>
---

 drivers/mtd/spi-nor/cadence-quadspi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 04cedd3a2bf6..7f78f9409ddd 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -418,9 +418,10 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
 	void __iomem *reg_base = cqspi->iobase;
 	unsigned int reg;
 	unsigned int data;
+	u32 write_len;
 	int ret;
 
-	if (n_tx > 4 || (n_tx && !txbuf)) {
+	if (n_tx > CQSPI_STIG_DATA_LEN_MAX || (n_tx && !txbuf)) {
 		dev_err(nor->dev,
 			"Invalid input argument, cmdlen %d txbuf 0x%p\n",
 			n_tx, txbuf);
@@ -433,10 +434,18 @@ static int cqspi_command_write(struct spi_nor *nor, const u8 opcode,
 		reg |= ((n_tx - 1) & CQSPI_REG_CMDCTRL_WR_BYTES_MASK)
 			<< CQSPI_REG_CMDCTRL_WR_BYTES_LSB;
 		data = 0;
-		memcpy(&data, txbuf, n_tx);
+		write_len = (n_tx > 4) ? 4 : n_tx;
+		memcpy(&data, txbuf, write_len);
+		txbuf += write_len;
 		writel(data, reg_base + CQSPI_REG_CMDWRITEDATALOWER);
-	}
 
+		if (n_tx > 4) {
+			data = 0;
+			write_len = n_tx - 4;
+			memcpy(&data, txbuf, write_len);
+			writel(data, reg_base + CQSPI_REG_CMDWRITEDATAUPPER);
+		}
+	}
 	ret = cqspi_exec_flash_cmd(cqspi, reg);
 	return ret;
 }
-- 
2.13.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
