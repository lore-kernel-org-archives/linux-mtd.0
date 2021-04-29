Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7199C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 15:59:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1088161409
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 15:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1088161409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RuTKWYyOmqorDo/LY3ZnPkeNKOEhW6r7Df4LKS9GPkM=; b=lmp0tGY0BI6uUj0ePBWcYxdWC
	AsziV2P6jCFNHggWZKHrmksqa72BC9H8eLr8ArCAr1+l4OzOmF5M/k+AQo//eod6uxhDVUa0FZcZK
	drcH7rNroAPXTEIQHIGgdqmR8dVvhRtJ3XHVhgMYft176jR04CLSGlxsMYcxRvvvbfOw7MHyxea/r
	nj9RsT21ROu+T15XVwfV3ViG/rsGAOcf3/HABOAtHC3dLkD7RzDIbQIuCuvnpPBupiZXnn5+q23wO
	TOMt8JZFrSsW5J9a4/pVlzv1UZg2wmRiLy3b9piE8yUV7vxXFxJ3Q2bd+z0webcyqEWTAdWbj+caT
	FBpiwf+FA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc93F-0060zL-1S; Thu, 29 Apr 2021 15:58:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc92l-0060xI-5o
 for linux-mtd@desiato.infradead.org; Thu, 29 Apr 2021 15:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=exHt7jGjL5ivMzMAGm04Xavf1GZfyAPchfYVuiKjf8w=; b=gzp8W5dmAw/QMzl57s6dURkIRl
 7TRpatwZciYjwM7SaAWho5GP5tUcfJrcA9sY5TLeGkyIeuD8InsKbb5ieIevQQQi6FviCKhpDSBxI
 k3TXXMXoMDP1MfQDL0h+2i7l89RVLEfzhx9JTg5jDohtTZlbE2+WUhe2LmjfOOqZoyMTJH+ni+sRl
 UwCkcPFesUavRErb0pfycG0YiqL1N1+hy8C3J7XbLcyuLLViF3qvgATUp/IJwMQcXOSoT3fskolSS
 XAxx7Xp1WpefJxB6UV2WT7ylz3z0fByPMnVGDTGTK5wCZg69EndIx0ypeGn5EBS9ZA6W33f1d9oxC
 hUZ5JS+Q==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc92i-000k11-3W
 for linux-mtd@lists.infradead.org; Thu, 29 Apr 2021 15:57:34 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2F22B22234;
 Thu, 29 Apr 2021 17:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619711849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=exHt7jGjL5ivMzMAGm04Xavf1GZfyAPchfYVuiKjf8w=;
 b=dHbfL81zqkW46HjcWv78rLQ3dhoHkDsS0Ik55w2HaOqHvZR6N/lFvU9kHLWdyU86+dLWpm
 R2tERNiOyT3sAcLm89/k9XEQO0pUnhy3uv70z+ZkyTqRsn94/X/1YQ29ivSqYHl08P5QOn
 MwJnnvV7QZekLdDjaGuGLoGxDbFBw6k=
From: Michael Walle <michael@walle.cc>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alexander Williams <awill@google.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Michael Walle <michael@walle.cc>
Subject: [PATCH v3 2/2] mtd: spi-nor: add initial sysfs support
Date: Thu, 29 Apr 2021 17:57:13 +0200
Message-Id: <20210429155713.28808-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210429155713.28808-1-michael@walle.cc>
References: <20210429155713.28808-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_085732_480234_BEEDC713 
X-CRM114-Status: GOOD (  21.12  )
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
 drivers/mtd/spi-nor/sysfs.c                   | 92 +++++++++++++++++++
 5 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
 create mode 100644 drivers/mtd/spi-nor/sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
new file mode 100644
index 000000000000..4c88307759e2
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
@@ -0,0 +1,31 @@
+What:		/sys/bus/spi/devices/.../jedec_id
+Date:		April 2021
+KernelVersion:	5.14
+Contact:	linux-mtd@lists.infradead.org
+Description:	(RO) The JEDEC ID of the SPI NOR flash as reported by the
+		flash device.
+
+
+What:		/sys/bus/spi/devices/.../manufacturer
+Date:		April 2021
+KernelVersion:	5.14
+Contact:	linux-mtd@lists.infradead.org
+Description:	(RO) Manufacturer of the SPI NOR flash.
+
+
+What:		/sys/bus/spi/devices/.../partname
+Date:		April 2021
+KernelVersion:	5.14
+Contact:	linux-mtd@lists.infradead.org
+Description:	(RO) Part name of the SPI NOR flash.
+
+
+What:		/sys/bus/spi/devices/.../sfdp
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
index 000000000000..8f1aad4061cd
--- /dev/null
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -0,0 +1,92 @@
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
