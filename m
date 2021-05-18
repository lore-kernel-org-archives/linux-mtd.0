Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5E3C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 09:43:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3F85610A8
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 09:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3F85610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nzn6T7Oq23GfwT/eVWMYcREoTrVRHLZrEMMYb7r5Lms=; b=HVOytMeFWFca8fDFxTJELdTI+
	miY2XQ9GZRxirmuBbMl7WKQg1HA9XPqPon+2AQaQLqCnksQDLa1SL0fr3sxLIobh4FzQqJeDVXIMk
	s7nP6+6cY/M9ZXtcOPEcN3PpSYJVuA/tUiAYqXL+8KXNFwEbjs/4sBsJSlsal5EQFk3Ws4FOMdw8w
	H3wCvMYKRLDTr3XI+Vv7Wt20C12urK96hMlDhWQ8jke5IQ29lWMVxv14WCptt/qYJLsHSS+duiMLw
	I+hvH82vQcJjDht+Pw3SDqlEsYNK9xOv0kDr9pHl06oSl3dKp2A3wwzcpcr9LoaAZ6jGgKSK4x0I6
	FGG5cF3SA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liwFZ-000CQv-OO; Tue, 18 May 2021 09:42:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwF9-000CIZ-I0; Tue, 18 May 2021 09:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Hm9eUZ1rRsqjTF/wGw5t+2xooDAi1RRSxQyIvMYz34Y=; b=lFC6KIRK9wj1QYVi0M5Nd2whCY
 di68nFO4m4ehKB0hrWwHbFc2lG3yxqCkhzhzl1MQeiNcw9Yni8Diezpx9ATwZGC0URwKA77+q2cUp
 PPeC3WXALuWeYUtEjyc4fxlDbCcc0kb82cT9LS2qJYuIhFpYgIzVTOG+6k2j0RJ8h4R+I2DHIFfuS
 /h5huoHbodM3m1cCEZvAaAfFAgnITJ8qXYIFlrlJ+MKbO1o0W/qrYWH64aQFFJdrc0zA4WvWUwZtm
 v3lk33PLgtQpjkbWrfu0DgUbhA0hdcPABdmEVlcRezIBDPTw7CU4Bi1T962p69Pz9f/qs8vsrF88M
 Il9iSd5A==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liwF6-00EWJK-95; Tue, 18 May 2021 09:42:26 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14I9MtK6009763; Tue, 18 May 2021 11:42:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Hm9eUZ1rRsqjTF/wGw5t+2xooDAi1RRSxQyIvMYz34Y=;
 b=Hedqiy0jbwJdN3Z2suqJAD9Rn/k3bI9lHvtJ1cJ6QgYowYULjgDox7aNtFZiNTn2X6DC
 oFksGhzvcF4XwkqD2T0/MjPzpcLZ4cZuVaSc0QiTUJwhgEt9wbk3MFFkA1WAv9fc51CB
 ouds9nqb2wt1cziSuXSsVZYIMDTWTDcLpmq5NJTg0y9ooRz7evCrpND8YTncWbmB6Jad
 GIS3haJFjOhqnLsqBCrwy73Itq5ffGNciJRmQJaAdAiKQ9ZJ0DBqv7uPF7BG9zMafq/X
 aJgIipcWgg2a3edIQD/tNhhyLwlXbQ4PetFtpxgUdOG48OvlRTebOz9Q19BmL8lkf2Dm ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38maunr4mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 11:42:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D708A100034;
 Tue, 18 May 2021 11:42:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C27D721CA63;
 Tue, 18 May 2021 11:42:12 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 11:42:12
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH v3 1/3] spi: spi-mem: add automatic poll status functions
Date: Tue, 18 May 2021 11:39:49 +0200
Message-ID: <20210518093951.23136-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518093951.23136-1-patrice.chotard@foss.st.com>
References: <20210518093951.23136-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-17,
 2021-05-18 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_024224_732798_445D5E89 
X-CRM114-Status: GOOD (  27.83  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

With STM32 QSPI, it is possible to poll the status register of the device.
This could be done to offload the CPU during an operation (erase or
program a SPI NAND for example).

spi_mem_poll_status API has been added to handle this feature.
This new function take care of the offload/non-offload cases.

For the non-offload case, use read_poll_timeout() to poll the status in
order to release CPU during this phase.
For example, previously, when erasing large area, in non-offload case,
CPU load can reach ~50%, now it decrease to ~35%.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
Changes in v3:
  - Add spi_mem_read_status() which allows to read 8 or 16 bits status.
  - Add initial_delay_us and polling_delay_us parameters to spi_mem_poll_status()
    and also to poll_status() callback.
  - Move spi_mem_supports_op() in SW-based polling case.
  - Add delay before invoking read_poll_timeout().
  - Remove the reinit/wait_for_completion() added in v2.

Changes in v2:
  - Indicates the spi_mem_poll_status() timeout unit
  - Use 2-byte wide status register
  - Add spi_mem_supports_op() call in spi_mem_poll_status()
  - Add completion management in spi_mem_poll_status()
  - Add offload/non-offload case management in spi_mem_poll_status()
  - Optimize the non-offload case by using read_poll_timeout()

 drivers/spi/spi-mem.c       | 85 +++++++++++++++++++++++++++++++++++++
 include/linux/spi/spi-mem.h | 14 ++++++
 2 files changed, 99 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 1513553e4080..257dc501d5df 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -6,6 +6,7 @@
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
  */
 #include <linux/dmaengine.h>
+#include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
@@ -743,6 +744,89 @@ static inline struct spi_mem_driver *to_spi_mem_drv(struct device_driver *drv)
 	return container_of(drv, struct spi_mem_driver, spidrv.driver);
 }
 
+int spi_mem_read_status(struct spi_mem *mem,
+			const struct spi_mem_op *op,
+			u16 *status)
+{
+	const u8 *bytes = (u8 *)op->data.buf.in;
+	int ret;
+
+	ret = spi_mem_exec_op(mem, op);
+	if (ret)
+		return ret;
+
+	if (op->data.nbytes > 1)
+		*status = ((u16)bytes[0] << 8) | bytes[1];
+	else
+		*status = bytes[0];
+
+	return 0;
+}
+
+/**
+ * spi_mem_poll_status() - Poll memory device status
+ * @mem: SPI memory device
+ * @op: the memory operation to execute
+ * @mask: status bitmask to ckeck
+ * @match: (status & mask) expected value
+ * @initial_delay_us: delay in us before starting to poll
+ * @polling_delay_us: time to sleep between reads in us
+ * @timeout_ms: timeout in milliseconds
+ *
+ * This function send a polling status request to the controller driver
+ *
+ * Return: 0 in case of success, -ETIMEDOUT in case of error,
+ *         -EOPNOTSUPP if not supported.
+ */
+int spi_mem_poll_status(struct spi_mem *mem,
+			const struct spi_mem_op *op,
+			u16 mask, u16 match,
+			unsigned long initial_delay_us,
+			unsigned long polling_delay_us,
+			u16 timeout_ms)
+{
+	struct spi_controller *ctlr = mem->spi->controller;
+	int ret = -EOPNOTSUPP;
+	int read_status_ret;
+	u16 status;
+
+	if (op->data.nbytes < 1 || op->data.nbytes > 2)
+		return -EINVAL;
+
+	if (ctlr->mem_ops && ctlr->mem_ops->poll_status) {
+		ret = spi_mem_access_start(mem);
+		if (ret)
+			return ret;
+
+		ret = ctlr->mem_ops->poll_status(mem, op, mask, match,
+						 initial_delay_us, polling_delay_us,
+						 timeout_ms);
+
+		spi_mem_access_end(mem);
+	}
+
+	if (ret == -EOPNOTSUPP) {
+		if (!spi_mem_supports_op(mem, op))
+			return ret;
+
+		if (initial_delay_us < 10)
+			udelay(initial_delay_us);
+		else
+			usleep_range((initial_delay_us >> 2) + 1,
+				     initial_delay_us);
+
+		ret = read_poll_timeout(spi_mem_read_status, read_status_ret,
+					(read_status_ret || ((status) & mask) == match),
+					polling_delay_us, timeout_ms * 1000, false, mem,
+					op, &status);
+		if (read_status_ret)
+			return read_status_ret;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(spi_mem_poll_status);
+
 static int spi_mem_probe(struct spi_device *spi)
 {
 	struct spi_mem_driver *memdrv = to_spi_mem_drv(spi->dev.driver);
@@ -763,6 +847,7 @@ static int spi_mem_probe(struct spi_device *spi)
 	if (IS_ERR_OR_NULL(mem->name))
 		return PTR_ERR_OR_ZERO(mem->name);
 
+	init_completion(&ctlr->xfer_completion);
 	spi_set_drvdata(spi, mem);
 
 	return memdrv->probe(mem);
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 2b65c9edc34e..10375d9ad747 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -250,6 +250,7 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
  *		  the currently mapped area), and the caller of
  *		  spi_mem_dirmap_write() is responsible for calling it again in
  *		  this case.
+ * @poll_status: poll memory device status
  *
  * This interface should be implemented by SPI controllers providing an
  * high-level interface to execute SPI memory operation, which is usually the
@@ -274,6 +275,12 @@ struct spi_controller_mem_ops {
 			       u64 offs, size_t len, void *buf);
 	ssize_t (*dirmap_write)(struct spi_mem_dirmap_desc *desc,
 				u64 offs, size_t len, const void *buf);
+	int (*poll_status)(struct spi_mem *mem,
+			   const struct spi_mem_op *op,
+			   u16 mask, u16 match,
+			   unsigned long initial_delay_us,
+			   unsigned long polling_rate_us,
+			   unsigned long timeout_ms);
 };
 
 /**
@@ -369,6 +376,13 @@ devm_spi_mem_dirmap_create(struct device *dev, struct spi_mem *mem,
 void devm_spi_mem_dirmap_destroy(struct device *dev,
 				 struct spi_mem_dirmap_desc *desc);
 
+int spi_mem_poll_status(struct spi_mem *mem,
+			const struct spi_mem_op *op,
+			u16 mask, u16 match,
+			unsigned long initial_delay_us,
+			unsigned long polling_delay_us,
+			u16 timeout);
+
 int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
 				       struct module *owner);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
