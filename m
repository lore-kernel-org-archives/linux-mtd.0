Return-Path: <SRS0=79EA=KN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66259C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 16:30:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE8F1611CE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 May 2021 16:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE8F1611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ST4WHmEtpbGbKv5+/qikRbatRqkxhaLJxtol4TX2e6U=; b=hmuFgZY9/Szx6B6KEuG6hYPF5
	D84B2YGAlqhVsOKm2jOfEfTYSI7hhTWIbhUwc5enk6Gp0TiXW3MgLKOU/hiVrN/faKv0sAPhM1NhY
	PEe4rTc9sDfDElqnhvYBZ6yw+YUZ8xy/lDnfYNCE+Zc/r4gX8B09wm5cnGyNJFLR+zU909Db7HtXo
	vsnn0WAFNHfGtF3dPiL8ot9QzPWm/wDOAVpUti93UGdZovf9yssCSK8Kt1m3Z+duzIEOb+UbrZXWO
	z0KCQK76MxJsmoCWHB2mIJ90Nczpf4wih/xG+E+ps2c1SdEFbF5IvclKgh5ovQwQ3ASYB+UjUPf14
	FHj+s1slw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj2b4-001K7A-Hv; Tue, 18 May 2021 16:29:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj2Zj-001JuI-HB; Tue, 18 May 2021 16:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0bHg0ARHkdCFC1flU57WX7u1lRnnB5XX9tbgb0TFL7c=; b=IoVoapxwq0HoZxB1Y+VyjStnf+
 CgXJ0PCSfRyqXdlSqSpneLr0IikTa38iorMPexuWtAYLgpn8GjdGtK93cwp3EjWMgQwi85pLXA5sL
 u3O4Ptv54/Wik7ew8YdtWC2EMfCYfL7y2RNMXeApuLxrD4MqnOAlrdtPm4y2/sEYvZe8tpx4Ua64q
 aVxKACdYJqPEAyeMF1rtwwJmm+lyAPSu+taR2HYmOolX/AAlOkPK1m/yeiLodtaOTmSILklH5MBkj
 5rUPjepmE0la4wXi5jEet3VKWCFTjNIjrGo0/Yez6ogQkEi2kgy6+z842u7U6Mm7Z91v2SvAu/67s
 TzDrIN+A==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj2Zf-00Enhx-Df; Tue, 18 May 2021 16:28:06 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IGLm4w023140; Tue, 18 May 2021 18:27:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=0bHg0ARHkdCFC1flU57WX7u1lRnnB5XX9tbgb0TFL7c=;
 b=sZfuDR4Fs030jFiaYA2JrwUeEipTWD3UJpYSC53fZ0KCudE8DwBCWYW0Qvw63QR/LHEP
 zbWID4KUHLMePbWr1DyorEVWls3ujhyVjTAhWJXl5WTDL0QBdFw71v79fBeja17XEMOG
 0MR/CggrUSlMynJjm159OLie2SK3sv7mNEbd6kaWbY39I3SP6ey7cOs0ZiKWtn2EwTi9
 mhnFsO2PIlyOfxCnWfGLr7H1GghiXGvwLmncvoaeeRH9/6PnFwkpfg/vE8cllgesSL/N
 7a4KL47DD0s7bqUpUq0AyK9yIc3aI1vXZhWgL9oP4kYBPwgUW/mZbMvyDv3K+Umo9miv +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38mekkrvjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 18:27:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 293FC100034;
 Tue, 18 May 2021 18:27:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C34E23FE73;
 Tue, 18 May 2021 18:27:57 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 18:27:56
 +0200
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <patrice.chotard@foss.st.com>, <christophe.kerello@foss.st.com>
Subject: [PATCH v5 1/3] spi: spi-mem: add automatic poll status functions
Date: Tue, 18 May 2021 18:27:52 +0200
Message-ID: <20210518162754.15940-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518162754.15940-1-patrice.chotard@foss.st.com>
References: <20210518162754.15940-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_08:2021-05-18,
 2021-05-18 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_092803_780150_5F1284A7 
X-CRM114-Status: GOOD (  28.55  )
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
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Changes in v5:
  - Update spi_mem_read_status() description.
  - Update poll_status() description API by indicating that data buffer is
    filled with last status value.
  - Update timeout parameter by timeout_ms in spi_mem_poll_status() prototype.
  - Remove parenthesys arount -EINVAL in spi_mem_poll_status().
  - Add Boris Reviewed-by.

Changes in v4:
  - Remove init_completion() from spi_mem_probe() added in v2.
  - Add missing static for spi_mem_read_status().
  - Check if operation in spi_mem_poll_status() is a READ.

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

 drivers/spi/spi-mem.c       | 86 +++++++++++++++++++++++++++++++++++++
 include/linux/spi/spi-mem.h | 16 +++++++
 2 files changed, 102 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 1513553e4080..177b3e21febf 100644
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
@@ -743,6 +744,91 @@ static inline struct spi_mem_driver *to_spi_mem_drv(struct device_driver *drv)
 	return container_of(drv, struct spi_mem_driver, spidrv.driver);
 }
 
+static int spi_mem_read_status(struct spi_mem *mem,
+			       const struct spi_mem_op *op,
+			       u16 *status)
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
+ * This function polls a status register and returns when
+ * (status & mask) == match or when the timeout has expired.
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
+	if (op->data.nbytes < 1 || op->data.nbytes > 2 ||
+	    op->data.dir != SPI_MEM_DATA_IN)
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
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 2b65c9edc34e..85e2ff7b840d 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -250,6 +250,9 @@ static inline void *spi_mem_get_drvdata(struct spi_mem *mem)
  *		  the currently mapped area), and the caller of
  *		  spi_mem_dirmap_write() is responsible for calling it again in
  *		  this case.
+ * @poll_status: poll memory device status until (status & mask) == match or
+ *               when the timeout has expired. It fills the data buffer with
+ *               the last status value.
  *
  * This interface should be implemented by SPI controllers providing an
  * high-level interface to execute SPI memory operation, which is usually the
@@ -274,6 +277,12 @@ struct spi_controller_mem_ops {
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
@@ -369,6 +378,13 @@ devm_spi_mem_dirmap_create(struct device *dev, struct spi_mem *mem,
 void devm_spi_mem_dirmap_destroy(struct device *dev,
 				 struct spi_mem_dirmap_desc *desc);
 
+int spi_mem_poll_status(struct spi_mem *mem,
+			const struct spi_mem_op *op,
+			u16 mask, u16 match,
+			unsigned long initial_delay_us,
+			unsigned long polling_delay_us,
+			u16 timeout_ms);
+
 int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
 				       struct module *owner);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
