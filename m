Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C8DC04AAA
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:44:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83C9D205C9
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 08:44:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i/cLMaT+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fSMu0uHX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83C9D205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HyHLxLnwAEAc65lF0x7ENyes/EANmbCfdvAyU3XNVzg=; b=i/cLMaT+o6LWb+
	lcsb1vXL8fg9QYsZOWzP1P7xXbDEyyEMKQh0R4ALs/lUulm9ePq9WNvmE1agaF6O8cih/h7twTSmF
	/1aGUDHX76rs2AAet0VN0uLafOE1HGiJy8JNJbqQtlNx5Nl/dGqXYUq7LhD+jiKLLaqYn+NeyUq/p
	IwenMGTx88pWuLQ5rsul6sjA+LpVPONYC8Sh+aoiaJOWRthKnHOZXdKOJ+N0mSbFLZz38ZiUNH1H3
	mgE340qXAxaqOOANcuoReKWPARPLLpkZt1ERB739sowgDbfvlRu4wuwSpULnOpbG9x2KTeX2rRByV
	SPBxgwFySsi++gbk4rng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNZEV-00059V-P4; Mon, 06 May 2019 08:44:23 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNZES-000543-8A
 for linux-mtd@lists.infradead.org; Mon, 06 May 2019 08:44:21 +0000
Received: by mail-pf1-x444.google.com with SMTP id v80so6389947pfa.3
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2019 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/afAazh4wuf+y940dkVcYam7j3ANFrVWHKvnKRTy/6M=;
 b=fSMu0uHXQndsvIk23RkKsxRruz77vNf6SOMdGLut+jgR3cfoALotNhsL8haU6O7peh
 roT6F8+mp7TEjccjHKpkXtDyJZzx+2BoLjebHlB7lhQDs4DzPwkC8VdP9JWTMqS1PcDk
 bdirVpflI2fT5ZXQqbL0Tr3X7wCgnhhEkyN3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/afAazh4wuf+y940dkVcYam7j3ANFrVWHKvnKRTy/6M=;
 b=D5ONYBCncw3McAikMGJLycgGjOO492w9K+WbBfnAtBoIe/FQ86ilUz0XqfgsaBuHa/
 ar8bARkyr+zQnxS/R+ODRHUcSCrIfkljCciFC7LV/yEhTxZ49MQ4z6sHDYUUAxGHs6Ld
 y4iTW/O8MiCUnaFponfGiJQWC9DCmqksgHABcN1t9BBOTwLuOiqLncVAwbLM8bLVOz7f
 xxbJF6R+vTTe/JEiww+AJPiyiJdGuUoXT3jq0QCBPd33rIKQY9ejj38H/3ooAWTlcws5
 PhJdQZuuUi81cfIhAdC9by8DsH+noQ35/vzNwfX+BYUDC7wKy3boTT6Y1ZAuih4ahQfw
 jmBg==
X-Gm-Message-State: APjAAAUvRLSBpeecnf7o1dPZ2naw/cQghrfFtTqGwMUmuvFvLGFzntWP
 6ONKnioFjnUWbBU12ZmIBN6zdkbBuQI=
X-Google-Smtp-Source: APXvYqwM7aKNGJiVn/PdQMmrlU2Prxgyroly/b3lhzQnv7bVuKdUnojhMM2OB0ASoAMa0+hnqf+T9Q==
X-Received: by 2002:a63:5d44:: with SMTP id o4mr30495476pgm.15.1557132258807; 
 Mon, 06 May 2019 01:44:18 -0700 (PDT)
Received: from zhuohao-z440.tpe.corp.google.com
 ([2401:fa00:1:10:e25c:13cd:9607:cc7f])
 by smtp.gmail.com with ESMTPSA id 15sm12310214pfy.88.2019.05.06.01.44.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 01:44:18 -0700 (PDT)
From: Zhuohao Lee <zhuohao@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spi-nor: add debugfs nodes for querying the flash
 name and id
Date: Mon,  6 May 2019 16:44:14 +0800
Message-Id: <20190506084414.89702-1-zhuohao@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_014420_320234_C2EF8C7F 
X-CRM114-Status: GOOD (  16.64  )
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
Cc: drinkcat@chromium.org, zhuohao@chromium.org, bbrezillon@kernel.org,
 richard@nod.at, briannorris@chromium.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently, we don't have vfs nodes for querying the underlying
flash name and flash id. This information is important especially
when we want to know the flash detail of the defective system.
In order to support the query, we add a function spi_nor_debugfs_create()
to create the debugfs node (ie. flashname and flashid)
This patch is modified based on the SPI-NOR flash system as we
only have the SPI-NOR system now. But the idea should be applied to
the other flash driver like NAND flash.

The output of new debugfs nodes on my device are:
cat /sys/kernel/debug/mtd/mtd0/flashid
ef6017
cat /sys/kernel/debug/mtd/mtd0/flashname
w25q64dw

Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
---
 drivers/mtd/devices/m25p80.c  |  5 ++-
 drivers/mtd/spi-nor/spi-nor.c | 62 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |  6 ++++
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c4a1d04b8c80..be11e7d96646 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -231,8 +231,11 @@ static int m25p_probe(struct spi_mem *spimem)
 	if (ret)
 		return ret;
 
-	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
+	ret = mtd_device_register(&nor->mtd, data ? data->parts : NULL,
 				   data ? data->nr_parts : 0);
+	if (!ret)
+		spi_nor_debugfs_create(nor);
+	return ret;
 }
 
 
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd1aaa5..004b6adf5866 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -21,6 +21,8 @@
 #include <linux/of_platform.h>
 #include <linux/spi/flash.h>
 #include <linux/mtd/spi-nor.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
 
 /* Define max times to check status register before we give up. */
 
@@ -4161,6 +4163,66 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 }
 EXPORT_SYMBOL_GPL(spi_nor_scan);
 
+static int flashid_dbg_show(struct seq_file *s, void *p)
+{
+	struct spi_nor *nor = (struct spi_nor *)s->private;
+	const struct flash_info *info = nor->info;
+
+	if (!info->id_len)
+		return 0;
+	seq_printf(s, "%*phN\n", info->id_len, info->id);
+	return 0;
+}
+
+static int flashid_debugfs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, flashid_dbg_show, inode->i_private);
+}
+
+static const struct file_operations flashid_dbg_fops = {
+	.open		= flashid_debugfs_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static int flashname_dbg_show(struct seq_file *s, void *p)
+{
+	struct spi_nor *nor = (struct spi_nor *)s->private;
+	const struct flash_info *info = nor->info;
+
+	if (!info->name)
+		return 0;
+	seq_printf(s, "%s\n", info->name);
+	return 0;
+}
+
+static int flashname_debugfs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, flashname_dbg_show, inode->i_private);
+}
+
+static const struct file_operations flashname_dbg_fops = {
+	.open		= flashname_debugfs_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+void spi_nor_debugfs_create(struct spi_nor *nor)
+{
+	struct mtd_info *mtd = &nor->mtd;
+	struct dentry *root = mtd->dbg.dfs_dir;
+
+	if (IS_ERR_OR_NULL(root) || IS_ERR_OR_NULL(nor)) {
+		return;
+	}
+	debugfs_create_file("flashid", S_IRUSR, root, nor,
+			&flashid_dbg_fops);
+	debugfs_create_file("flashname", S_IRUSR, root, nor,
+			&flashname_dbg_fops);
+}
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Huang Shijie <shijie8@gmail.com>");
 MODULE_AUTHOR("Mike Lavender");
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index fa2d89e38e40..eadb5230c6d0 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -530,4 +530,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
  */
 void spi_nor_restore(struct spi_nor *nor);
 
+/**
+ * spi_nor_debugfs_create() - create debug fs
+ * @mtd:	the spi_nor structure
+ */
+void spi_nor_debugfs_create(struct spi_nor *nor);
+
 #endif
-- 
2.21.0.1020.gf2820cf01a-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
