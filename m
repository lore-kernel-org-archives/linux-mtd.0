Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE579C433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 14:33:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 552E9619BB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 14:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 552E9619BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xeIWAEugNBfmimsL+nuUbQwkJpefmdwzclAhN6ZFGn4=; b=ZqIBfyccc1AMEqGkh8RMJZu/C
	V8OXK66r1pzpCP3WNY3CJCbTEFPDRX1OXH4K6Uud4Te1AVwvpSowewCRYKJPLqo9pP2QaRQG6v6M6
	eYqDOxANP9HM+h4gOlcfvOkr9n9JC8JGR/zprVcpI3gl6FNhrWg4fhvx3TY56swkb2YM7Jrt63GGG
	hwCZXVjiP/4xcHzqVipH0BI/3xQf3dJXHBo45WHoM23J6l1hgs1UcIUcjWp4ZrhQVodq94vhrECXA
	PZAcqt5vAsypWsF7YyNaonoPBo9lxvM+2wqalCzU79RXOihunsKwsr+X2c8YEqHpTNeL+jjZ7wCqQ
	W245ffOgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOi56-00FAiB-PD; Tue, 23 Mar 2021 14:32:28 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOi4d-00FAdf-5c
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 14:32:04 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3CFB72224F;
 Tue, 23 Mar 2021 15:31:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616509916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqDwUOS8t48iI83sbUfZg6wVYC3/vN00CtmG7zSzNiQ=;
 b=VvsZsk1fhFSBLxUVhuR9uiZP10RdOLLx5hlzp9KradJzDP5iaFN8r4nEJXquy4Wlg4GIbi
 Ywnd7CjDxsELo/k0U3k370T3p5gaWL1rD3WGm0bd7lqgcFT1LB8OsMgcU6pGpXzx3OexFb
 oSPnZ+5J8Hgg/A6yjZuhAT1jKl10Jzs=
From: Michael Walle <michael@walle.cc>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v2 2/2] mtd: spi-nor: add initial sysfs support
Date: Tue, 23 Mar 2021 15:31:44 +0100
Message-Id: <20210323143144.12730-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323143144.12730-1-michael@walle.cc>
References: <20210323143144.12730-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_143159_527066_5CB03C28 
X-CRM114-Status: GOOD (  19.77  )
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

Add support to show the name and JEDEC identifier as well as to dump the
SFDP table. Not all flashes list their SFDP table contents in their
datasheet. So having that is useful. It might also be helpful in bug
reports from users.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/Makefile |  2 +-
 drivers/mtd/spi-nor/core.c   |  5 +++
 drivers/mtd/spi-nor/core.h   |  3 ++
 drivers/mtd/spi-nor/sysfs.c  | 86 ++++++++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/spi-nor/sysfs.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 653923896205..aff308f75987 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-spi-nor-objs			:= core.o sfdp.o
+spi-nor-objs			:= core.o sfdp.o sysfs.o
 spi-nor-objs			+= atmel.o
 spi-nor-objs			+= catalyst.o
 spi-nor-objs			+= eon.o
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index fbc34158a883..02523ddac612 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3708,6 +3708,10 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	if (ret)
 		return ret;
 
+	ret = spi_nor_sysfs_create(nor);
+	if (ret)
+		return ret;
+
 	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
 				   data ? data->nr_parts : 0);
 }
@@ -3717,6 +3721,7 @@ static int spi_nor_remove(struct spi_mem *spimem)
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
 	spi_nor_restore(nor);
+	spi_nor_sysfs_remove(nor);
 
 	/* Clean up MTD stuff. */
 	return mtd_device_unregister(&nor->mtd);
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 08d2469837da..599035200a03 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -486,4 +486,7 @@ static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
 	return mtd->priv;
 }
 
+int spi_nor_sysfs_create(struct spi_nor *nor);
+void spi_nor_sysfs_remove(struct spi_nor *nor);
+
 #endif /* __LINUX_MTD_SPI_NOR_INTERNAL_H */
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
new file mode 100644
index 000000000000..c62cc4d6bce6
--- /dev/null
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/mtd/spi-nor.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+#include <linux/sysfs.h>
+
+#include "core.h"
+
+static ssize_t name_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct spi_device *spi = to_spi_device(dev);
+	struct spi_mem *spimem = spi_get_drvdata(spi);
+	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+
+	return sysfs_emit(buf, "%s\n", nor->info->name);
+}
+static DEVICE_ATTR_RO(name);
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
+	&dev_attr_name.attr,
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
+	if (attr == &bin_attr_sfdp && !nor->sfdp)
+		return 0;
+
+	return 0444;
+}
+
+static struct attribute_group spi_nor_sysfs_attr_group = {
+	.name		= NULL,
+	.is_bin_visible	= spi_nor_sysfs_is_bin_visible,
+	.attrs		= spi_nor_sysfs_entries,
+	.bin_attrs	= spi_nor_sysfs_bin_entries,
+};
+
+int spi_nor_sysfs_create(struct spi_nor *nor)
+{
+	return sysfs_create_group(&nor->dev->kobj, &spi_nor_sysfs_attr_group);
+}
+
+void spi_nor_sysfs_remove(struct spi_nor *nor)
+{
+	sysfs_remove_group(&nor->dev->kobj, &spi_nor_sysfs_attr_group);
+}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
