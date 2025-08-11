Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50A9CA0EDA
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GA+X13aVP0+Gfrsgt8zhULBi1QJdTnbMPA/xt/8c8bQ=; b=WK2ccVnVYSvQa6
	c6s0FJhKd5RW7+hR2D7j4R0GGaYYUkMg7ngkhfLh5/P/Pq36vGiYNvoTCF2wlsV2JWMEzflh94n5d
	bMOzWHcX73x4ZZahDDKjo0DY3kK0QVMIScljZ1o3ClzLJg+oLGzHjpMp00lscMPpN067gQS2VBUlm
	eiJ3g5YChd5dFKNQXgYtfEFxmu94xI0Z55UXpTSyunJ5p0UVM4thLsvJERQRWz9kZCyvKAGCNwEY9
	4Y+S+TvyKdfO8si1/Ro+dKt4fUjEfKjOEzqHG4TArMKfS7xsy+hdxZav9Ryw49ekErvJc1eX5pUiI
	DE0/Ts297cAOQEb5l5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulad3-00000009DKl-1YYA;
	Mon, 11 Aug 2025 22:04:29 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYGb-00000008vyR-07KY
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 19:33:10 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57BJX2lo1180188;
	Mon, 11 Aug 2025 14:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754940782;
	bh=APF5bHQmgG8ox+n+lb2Pf49z5+3ddAxHmRPYSNB3FA0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oBKPVKhMyIULKXmH9flNHB70B+IJZdXWkMHJzwL97rChVbMtZwMaG/idL4kqUoSFC
	 VKFJI4J/XaiQn9bcgiC3jCxpiph5J70m+Z3545xNdmzjxOUzw3NUZ+sPaeNs/rDSA/
	 fsgFodGfSJcWZveHV/jaUalBxfsfUU7wirtcxWsc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57BJX2PX3941521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 14:33:02 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 14:33:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 14:33:01 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57BJWq1o3690681;
	Mon, 11 Aug 2025 14:32:57 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <broonie@kernel.org>, <tudor.ambarus@linaro.org>,
        <pratyush@kernel.org>, <mwalle@kernel.org>, <p-mantena@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <s-k6@ti.com>, <a-dutta@ti.com>,
        <u-kumar1@ti.com>, <praneeth@ti.com>
Subject: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning controller
Date: Tue, 12 Aug 2025 01:02:10 +0530
Message-ID: <20250811193219.731851-2-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811193219.731851-1-s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_123309_159061_F63300FA 
X-CRM114-Status: GOOD (  16.93  )
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

From: Pratyush Yadav <pratyush@kernel.org>

Some controllers like the Cadence OSPI controller need to perform a
tuning sequence to operate at high data rates. Tuning is needs to happen
once the device is switched to appropriate mode (say 8S-8S-8S or
8D-8D-8D). Add a hook that spi-mem client devices can call in order to tune
the controller to operate in a given mode and data rate.

This is somewhat similar to eMMC/SD tuning for higher speed modes like
HS200, but there isn't a standard specification around the same though.

Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-mem.c       | 11 +++++++++++
 include/linux/spi/spi-mem.h |  9 +++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 064b99204d9a..6c254291ee23 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -559,6 +559,17 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
 }
 EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
 
+int spi_mem_execute_tuning(struct spi_mem *mem, const struct spi_mem_op *op)
+{
+	struct spi_controller *ctlr = mem->spi->controller;
+
+	if (!ctlr->mem_ops || !ctlr->mem_ops->execute_tuning)
+		return -EOPNOTSUPP;
+
+	return ctlr->mem_ops->execute_tuning(mem, op);
+}
+EXPORT_SYMBOL_GPL(spi_mem_execute_tuning);
+
 /**
  * spi_mem_adjust_op_freq() - Adjust the frequency of a SPI mem operation to
  *			      match controller, PCB and chip limitations
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 82390712794c..639fee61251c 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -314,6 +314,12 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
  * @poll_status: poll memory device status until (status & mask) == match or
  *               when the timeout has expired. It fills the data buffer with
  *               the last status value.
+ * @execute_tuning: perform PHY tuning to achieve high speed SPI operations.
+ *		    Should be called after the SPI memory device has been
+ *		    completely initialized. The op passed should contain a
+ *		    template for the read operation used for the device so the
+ *		    controller can decide what type of tuning is required
+ *		    for the type of read op passed.
  *
  * This interface should be implemented by SPI controllers providing an
  * high-level interface to execute SPI memory operation, which is usually the
@@ -344,6 +350,8 @@ struct spi_controller_mem_ops {
 			   unsigned long initial_delay_us,
 			   unsigned long polling_rate_us,
 			   unsigned long timeout_ms);
+	int (*execute_tuning)(struct spi_mem *mem,
+			      const struct spi_mem_op *op);
 };
 
 /**
@@ -423,6 +431,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 #endif /* CONFIG_SPI_MEM */
 
 int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
+int spi_mem_execute_tuning(struct spi_mem *mem, const struct spi_mem_op *op);
 void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op);
 u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op *op);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
