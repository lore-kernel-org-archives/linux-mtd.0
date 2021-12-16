Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E11EC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdg+OiN9Te2I26qaCObk4oby7hvnbQ66xKf6tLYhMl8=; b=vRRJmcqELdc060
	KNx1WCErqYqAAhJx0zyevtv23tfKpNj/ioSCuYT+OYrJ8RmHIEe6Lh4sUYOXsBwFcDrt9Zn1gpDx2
	XXdh5BUkyNy9JvkjO0/w2uAIgUP+55CtKN+MtFbqwaYjX4/MvYtQboLuP5/HhvUWMSkDckbyYphK8
	u2+BdK+dXZ3cZHOw4K16+kiuadWKEe/85TnwkDpxL6Y886W5MT56Lh6spgJjlWmnRV8fgNZwnb1LA
	mNBfHKAaqdvpUmoY17/vWwJ7L8n/zfjxnwhw032bNg7Em/LY814v63XaKuYhff/Pmffnl4hzhA1so
	8THlUop5vU4jtcdwN/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxpOI-005JAZ-LC; Thu, 16 Dec 2021 11:57:42 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxolQ-00572r-Mf
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 11:17:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7AC58E0013;
 Thu, 16 Dec 2021 11:17:29 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 19/28] spi: spi-mem: Introduce a capability structure
Date: Thu, 16 Dec 2021 12:16:45 +0100
Message-Id: <20211216111654.238086-20-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211216111654.238086-1-miquel.raynal@bootlin.com>
References: <20211216111654.238086-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_031732_938618_4F10C3EB 
X-CRM114-Status: GOOD (  11.55  )
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

Create a spi_controller_mem_caps structure and put it within the
spi_controller_mem_ops structure as these are highly related. So far the
only field in this structure is the support for dtr operations, but soon
we will add another parameter.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 85e2ff7b840d..42f3850610b5 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -220,6 +220,14 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
 	return mem->drvpriv;
 }
 
+/**
+ * struct spi_controller_mem_caps - SPI memory controller capabilities
+ * @dtr: Supports DTR operations
+ */
+struct spi_controller_mem_caps {
+	bool dtr;
+};
+
 /**
  * struct spi_controller_mem_ops - SPI memory operations
  * @adjust_op_size: shrink the data xfer of an operation to match controller's
@@ -253,6 +261,7 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
  * @poll_status: poll memory device status until (status & mask) == match or
  *               when the timeout has expired. It fills the data buffer with
  *               the last status value.
+ * @caps: controller capabilities for the handling of the above operations.
  *
  * This interface should be implemented by SPI controllers providing an
  * high-level interface to execute SPI memory operation, which is usually the
@@ -283,6 +292,7 @@ struct spi_controller_mem_ops {
 			   unsigned long initial_delay_us,
 			   unsigned long polling_rate_us,
 			   unsigned long timeout_ms);
+	const struct spi_controller_mem_caps *caps;
 };
 
 /**
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
