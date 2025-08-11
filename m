Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54D4CA0EE0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jv3tknTK9vL7G8zQYeb0Q8UtHhtGoXoyXL+owVlGloc=; b=MqQ1W5ESvIZtg3
	1IOnz8rk00oZNnjHNhbh15c3SV9q03seHUS0rIiUCx5TQvsNLF4El8wlzmafijojx92usPt8GxQ7R
	GNpqyFpBSvyHoRc8h2C804hKu7eNM3gFd0BAFlUgleiAQ64E2RvD+GwBra+dzOsAg+Jk+mElkq8DI
	yVRE0axVxAuCwMAGN1DnHO3yM8x1TcZf/tXoFNVCwtzukVY3B0BbnfxzLy97bZ1fwOmUvL3QR+LBz
	XaKQSZMbyaaRPFFmVSmVvp6t64ALPNuYrchlrn9a3Qk/8UXzDGhTtfHP0s5twylCXghFTLUxivSBg
	cHxo0vCvclRK9RlUEYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulad6-00000009DQC-45VZ;
	Mon, 11 Aug 2025 22:04:32 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYH3-00000008w24-3Yfp
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 19:33:39 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57BJXXf81180243;
	Mon, 11 Aug 2025 14:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754940813;
	bh=JNBUMqxnJPwUdETAbLE1uARqpWovKqp3PKZHw2LEmzU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lQ3+b6NSeYP1ttIrztc+ztRvjbjxSGVs779MY01FZgFCYaRkruQb7K0/OuwACNKLP
	 Y5W/+EBne/UdMkl257KVEXd5X3v6v04YTVRygUWjDuYWbpEwqFGAN42sbK+akwupMc
	 ZZxJ6BtGtzyd5ziYIW6Qk8ORGdsfd3ixmlALUUNo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57BJXXLf2910955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 14:33:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 14:33:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 14:33:32 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57BJWq1v3690681;
	Mon, 11 Aug 2025 14:33:28 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <broonie@kernel.org>, <tudor.ambarus@linaro.org>,
        <pratyush@kernel.org>, <mwalle@kernel.org>, <p-mantena@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <s-k6@ti.com>, <a-dutta@ti.com>,
        <u-kumar1@ti.com>, <praneeth@ti.com>
Subject: [RFC PATCH 08/10] spi: cadence-quadspi: Enable PHY for data writes
Date: Tue, 12 Aug 2025 01:02:17 +0530
Message-ID: <20250811193219.731851-9-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811193219.731851-1-s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_123337_974407_6019861D 
X-CRM114-Status: UNSURE (   9.85  )
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

PHY is tuned with optimal tuning point which allows controller to
run at higher speeds. Hence, increase the data writes' throughput in
OSPI/QSPI NAND flashes by enabling PHY for data writes to the NAND
flash devices.

The aim is to enable PHY only for the OSPI/QSPI NAND data writes,
so, exclude other operations like register writes to NAND flashes,
register and data writes to NOR flashes by introducing a check for
the 'n_tx' (op->data.nbytes) value before enabling.

Currently, OSPI/QSPI NOR's highest page size is 512 bytes, so, check
whether 'n_tx' is greater than or equal to 1024 and 'f_pdata->use_phy'
flag.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 2096027bca4c..6c1159435577 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1202,6 +1202,9 @@ static int cqspi_indirect_write_execute(struct cqspi_flash_pdata *f_pdata,
 	if (cqspi->apb_ahb_hazard)
 		readl(reg_base + CQSPI_REG_INDIRECTWR);
 
+	if (n_tx >= SZ_1K && f_pdata->use_phy)
+		cqspi_phy_enable(f_pdata, true);
+
 	while (remaining > 0) {
 		size_t write_words, mod_bytes;
 
@@ -1242,6 +1245,9 @@ static int cqspi_indirect_write_execute(struct cqspi_flash_pdata *f_pdata,
 		goto failwr;
 	}
 
+	if (n_tx >= SZ_1K && f_pdata->use_phy)
+		cqspi_phy_enable(f_pdata, false);
+
 	/* Disable interrupt. */
 	writel(0, reg_base + CQSPI_REG_IRQMASK);
 
@@ -1253,6 +1259,9 @@ static int cqspi_indirect_write_execute(struct cqspi_flash_pdata *f_pdata,
 	return 0;
 
 failwr:
+	if (n_tx >= SZ_1K && f_pdata->use_phy)
+		cqspi_phy_enable(f_pdata, false);
+
 	/* Disable interrupt. */
 	writel(0, reg_base + CQSPI_REG_IRQMASK);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
