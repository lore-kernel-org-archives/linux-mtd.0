Return-Path: <SRS0=b+Mj=J6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB0FC433ED
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 15:59:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958CC61183
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 15:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 958CC61183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EGV+dxocFXsqSl08a2XaxTWEYpMGKZeDtMOwEQIf5D0=; b=IGjfqGMmX1BJjO+gclAFmwJLF
	EiH32A1fkU2OfFJoSa5tgH+TWXNI6UWp8amvd1BZ6ZF7M+opfOsF8UAqebigpJlhDgEVb7NpOpJUT
	BjaMZmtNXTwgPehLXgJvrCZgABmQKELX0lGj+F7mfaDtXBpSraEoXsFJOHjiCPWV6YSAjrcCMad6l
	2JBSTll0cvqsRh1sPHoEldYVXnEN9lpVrCTe3ldsD2bDuxjeXs5U3hW00QiyRAWzAF/HIQ42BkWGW
	K6OXqrpjlP/dAIkiimwKDABnwuuSsBZp+snq9dVm5JjWgiz3L1VOtRbOp+rfRntGj2Lbda2UjCGo/
	qaz3xgeww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldaxb-00EJho-IQ; Mon, 03 May 2021 15:58:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldawY-00EJaj-9z
 for linux-mtd@desiato.infradead.org; Mon, 03 May 2021 15:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rn6h3XU4qpU2xLKnq1zA5PvaNO0j68Bcov48KV6nNm4=; b=4i+ZnSYKvAJ4Zo/UKEmlZ24zUo
 3I6nZXg47q7WE2HIbN4GY+jRB4TfOx7WX7lnwcCMQ0hvYVY1pk8ZZRvzWXQCHTnvhSGxdOg39yc5F
 avaAXBlMedOiyeA9tVMiYCPrUQxaBIhAc1YNCAeB/QchfnG4IP4B6DAvOaH9z9I7isW5CC023Wqc5
 29aFMCOj8vmk1lPI2iRdaY1Iwhltaf94HyPvHs+luR8K+qwk02Yg/owVpM9wB2g4PWk/pOOr6HGJ9
 kFZZV8lMXtFLJBXDMvY6bezD50d0IoUq1s9jflxFqQddaYvVHE2z1V+LbAlkQSFggMe0lbTHZczJO
 uHiGW+tA==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldawU-003Cuz-CN
 for linux-mtd@lists.infradead.org; Mon, 03 May 2021 15:57:09 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2BF5D22235;
 Mon,  3 May 2021 17:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620057420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rn6h3XU4qpU2xLKnq1zA5PvaNO0j68Bcov48KV6nNm4=;
 b=KU3eDts2m6XWnJHOhUs7szr9IGo2SCU0WIFLKGLfvF4PLAhBx1d3AXP0myCwFPnyFq9Upb
 LwLbMQhZi3XRGAIm1kjqeQo/ZBLYjWHwKN5CRd9Lr8UpDtz++4QeE8Ax70MISv+kfd+Sfc
 rlUZ9hCVchECzoHlZM+14sDXl3HJaag=
From: Michael Walle <michael@walle.cc>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alexander Williams <awill@google.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Michael Walle <michael@walle.cc>
Subject: [PATCH v4 2/2] mtd: spi-nor: add initial sysfs support
Date: Mon,  3 May 2021 17:56:51 +0200
Message-Id: <20210503155651.30889-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210503155651.30889-1-michael@walle.cc>
References: <20210503155651.30889-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_085706_748059_9DBF1E89 
X-CRM114-Status: GOOD (  21.31  )
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

Add support to show the manufacturer, the partname and JEDEC identifier
as well as to dump the SFDP table. Not all flashes list their SFDP table
contents in their datasheet. So having that is useful. It might also be
helpful in bug reports from users.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Pratyush, Heiko, I've dropped your Acked and Tested-by because there
were some changes.

 .../ABI/testing/sysfs-bus-spi-devices-spi-nor | 31 +++++++
 drivers/mtd/spi-nor/Makefile                  |  2 +-
 drivers/mtd/spi-nor/core.c                    |  1 +
 drivers/mtd/spi-nor/core.h                    |  2 +
 drivers/mtd/spi-nor/sysfs.c                   | 93 +++++++++++++++++++
 5 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
 create mode 100644 drivers/mtd/spi-nor/sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
new file mode 100644
index 000000000000..d76cd3946434
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
@@ -0,0 +1,31 @@
+What:		/sys/bus/spi/devices/.../spi-nor/jedec_id
+Date:		April 2021
+KernelVersion:	5.14
+Contact:	linux-mtd@lists.infradead.org
+Description:	(RO) The JEDEC ID of the SPI NOR flash as reported by the
+		flash device.
+
+
+What:		/sys/bus/spi/devices/.../spi-nor/manufacturer
+Date:		April 2021
+KernelVersion:	5.14
+Contact:	linux-mtd@lists.infradead.org
+Description:	(RO) Manufacturer of the SPI NOR flash.
+
+
+What:		/sys/bus/spi/devices/.../spi-nor/partname
+Date:		April 2021
+KernelVersion:	5.14
+Contact:	linux-mtd@lists.infradead.org
+Description:	(RO) Part name of the SPI NOR flash.
+
+
+What:		/sys/bus/spi/devices/.../spi-nor/sfdp
+Date:		April 2021
+KernelVersion:	5.14
+Contact:	linux-mtd@lists.infradead.org
+Description:	(RO) This attribute is only present if the SPI NOR flash
+		device supports the "Read SFDP" command (5Ah).
+
+		If present, it contains the complete SFDP (serial flash
+		discoverable parameters) binary data of the flash.
diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 136f245c91dc..6b904e439372 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-spi-nor-objs			:= core.o sfdp.o swp.o otp.o
+spi-nor-objs			:= core.o sfdp.o swp.o otp.o sysfs.o
 spi-nor-objs			+= atmel.o
 spi-nor-objs			+= catalyst.o
 spi-nor-objs			+= eon.o
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 20c7ee604731..57d8a4dae5fd 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3349,6 +3349,7 @@ static struct spi_mem_driver spi_nor_driver = {
 		.driver = {
 			.name = "spi-nor",
 			.of_match_table = spi_nor_of_table,
+			.dev_groups = spi_nor_sysfs_groups,
 		},
 		.id_table = spi_nor_dev_ids,
 	},
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 92ee2f6551b3..b988e5e64b2d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -489,6 +489,8 @@ extern const struct spi_nor_manufacturer spi_nor_winbond;
 extern const struct spi_nor_manufacturer spi_nor_xilinx;
 extern const struct spi_nor_manufacturer spi_nor_xmc;
 
+extern const struct attribute_group *spi_nor_sysfs_groups[];
+
 void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 			     struct spi_mem_op *op,
 			     const enum spi_nor_protocol proto);
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
new file mode 100644
index 000000000000..9aec9d8a98ad
--- /dev/null
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/mtd/spi-nor.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+#include <linux/sysfs.h>
+
+#include "core.h"
+
+static ssize_t manufacturer_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct spi_device *spi = to_spi_device(dev);
+	struct spi_mem *spimem = spi_get_drvdata(spi);
+	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+
+	return sysfs_emit(buf, "%s\n", nor->manufacturer->name);
+}
+static DEVICE_ATTR_RO(manufacturer);
+
+static ssize_t partname_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct spi_device *spi = to_spi_device(dev);
+	struct spi_mem *spimem = spi_get_drvdata(spi);
+	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+
+	return sysfs_emit(buf, "%s\n", nor->info->name);
+}
+static DEVICE_ATTR_RO(partname);
+
+static ssize_t jedec_id_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct spi_device *spi = to_spi_device(dev);
+	struct spi_mem *spimem = spi_get_drvdata(spi);
+	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+
+	return sysfs_emit(buf, "%*phN\n", nor->info->id_len, nor->info->id);
+}
+static DEVICE_ATTR_RO(jedec_id);
+
+static struct attribute *spi_nor_sysfs_entries[] = {
+	&dev_attr_manufacturer.attr,
+	&dev_attr_partname.attr,
+	&dev_attr_jedec_id.attr,
+	NULL
+};
+
+static ssize_t sfdp_read(struct file *filp, struct kobject *kobj,
+			 struct bin_attribute *bin_attr, char *buf,
+			 loff_t off, size_t count)
+{
+	struct spi_device *spi = to_spi_device(kobj_to_dev(kobj));
+	struct spi_mem *spimem = spi_get_drvdata(spi);
+	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+	struct sfdp *sfdp = nor->sfdp;
+	size_t sfdp_size = sfdp->num_dwords * sizeof(*sfdp->dwords);
+
+	return memory_read_from_buffer(buf, count, &off, nor->sfdp->dwords,
+				       sfdp_size);
+}
+static BIN_ATTR_RO(sfdp, 0);
+
+static struct bin_attribute *spi_nor_sysfs_bin_entries[] = {
+	&bin_attr_sfdp,
+	NULL
+};
+
+static umode_t spi_nor_sysfs_is_bin_visible(struct kobject *kobj,
+					    struct bin_attribute *attr, int n)
+{
+	struct spi_device *spi = to_spi_device(kobj_to_dev(kobj));
+	struct spi_mem *spimem = spi_get_drvdata(spi);
+	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+
+	if (attr == &bin_attr_sfdp && nor->sfdp)
+		return 0444;
+
+	return 0;
+}
+
+static const struct attribute_group spi_nor_sysfs_group = {
+	.name		= "spi-nor",
+	.is_bin_visible	= spi_nor_sysfs_is_bin_visible,
+	.attrs		= spi_nor_sysfs_entries,
+	.bin_attrs	= spi_nor_sysfs_bin_entries,
+};
+
+const struct attribute_group *spi_nor_sysfs_groups[] = {
+	&spi_nor_sysfs_group,
+	NULL
+};
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
