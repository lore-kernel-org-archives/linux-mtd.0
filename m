Return-Path: <SRS0=MQGH=JZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC98AC433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 05:29:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 415CC61420
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 05:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 415CC61420
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+FaZAvQ5u9E8IIEH1ebCZWqOywneXE6u16yLDVJEs7k=; b=hIPqKF3ysDrbFPlJ5NqybJEfjK
	TTfDoIH6aa/Ca8sIlvBMjOW9FKoyTgj81cEfxLG9odtZIXrdTLqgT3nP/l7rLkt7HsXhGp2jkUc6s
	i2A3ZUPgrEkpvVVsRX5QiZcm00sxr5LcQnH/TXgaU7IYox+X1HdoI4xygtjBFyo/2ju0my8reqstF
	El3Eqytnb7iBlEgvNn/ddrDTazCVS5xfCjoAktB0Y129ZFrHAoGbzajM19a7vVcYZVFE64KgE80Qa
	cF/Dm0ufj0XU4yDlzMJvF6CAXg9d3x5OU5x9FicXBqmrRwGwmMIPKDYxVKK/1KeAbjD5Vk+oN3FQ9
	/kDjmPiQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbckq-002pDB-AN; Wed, 28 Apr 2021 05:28:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbcki-002pD2-4s
 for linux-mtd@desiato.infradead.org; Wed, 28 Apr 2021 05:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:From:Subject:
 Mime-Version:Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=fx7vPqk/u89PVg1T4cJ8wHcLfNDs90uQPpODd7f8SmI=; b=ZTefLXH1XKYgBnhyF2+n8VkkdI
 cQNPb0xTTw3RkyGoJUyyWO3I2gC063xyfGK7NxbQJVJY3ZcjffJi3qwgLhAmX7kZ1+T+KLs3z8Nxf
 4N4s7Usu+9z6hW0+GqX1y7TT77uRKi/pIlA566udc8iMWTClBzqev2Qdw/hRK4IW70CYvtN1TMfMq
 p1FCu4rM111ONWeluHuwxQYrk/BFK69L/Ox28Q4XQuduGEM4fmAENNrN9//ClbiclmDY9RDri+qQb
 gU4Wm2S0AsdB8u0bNUWmgfnMn8TbiQhn6ZwyCferSMb1uw8e8SkFUyYU7wchCyQC09Q3bN6C9pZFz
 p2kaOfvQ==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbckf-00HBbA-6R
 for linux-mtd@lists.infradead.org; Wed, 28 Apr 2021 05:28:46 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 q132-20020a25d98a0000b02904ee0668e15bso7605884ybg.4
 for <linux-mtd@lists.infradead.org>; Tue, 27 Apr 2021 22:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=fx7vPqk/u89PVg1T4cJ8wHcLfNDs90uQPpODd7f8SmI=;
 b=WI/UfsWtCK2MyrZgzlYnMET5R+hL1DkqbfeRyxi+2yNGTOplf7gIiZ+KXxP4KwoDT5
 iXUzZEY+AevdWksG/0UWjiC3AnkZ0wRKE7Lb7urhi1/b/wDQaLkJD4llZQH4geQILdBe
 T5Y0nep3OZVSzpjd3jelbK+TkYeFiPiUnpNP9a1RkxDMY4z8O5fUKjAX2eQPvN053uMG
 QqE4V2pCyuqcT6COgnx4npbKTo/uqNGCq2hhwHWEbOUhZJ6VWW40bQhju8k5jXXwnENa
 ryE6QMOIUFU/5TnWwY9GKL7H3uuprsGSakQb4RQeDmSdSeTCm63ibeZwjlCGD1D6byaL
 Y+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=fx7vPqk/u89PVg1T4cJ8wHcLfNDs90uQPpODd7f8SmI=;
 b=JhYESurclgnVLFFnY19cZDPemV40QEAarvHwBhI15dvi9xe7h28VXwm5QohIlQz5O5
 0mFeIkJPkeGLY4DOavf0Svm4L6B6ifePO+kqX7JZr0LksMLQJztEJiFJ2dGisTbKMR9b
 tDbOBGy1R24/iNxXwytbGry4p6vgTsDmizounfNyHQV56IF+3Nanegt6n45fIzEF83g5
 7sHnSDnZuVtrAdgDz6LJTyFdATvWIPuFqj2zeAR7C7LuCDsMcRTLc+NXz5sm7qaynd6o
 xZVERpL6otMzxpOGKsD4/5op3GIso/RWvZPOTP7uTW/QSk/4ZkkQmXmHJiyf/ZrA3Qct
 blow==
X-Gm-Message-State: AOAM531j7NbQ0CE1+F0ecLFS/QN1VWoEx7bptKjTSqyPze4KrYFpCCid
 3jF1xf3ArEzvANNEAxI0nRSMsUvy6w==
X-Google-Smtp-Source: ABdhPJwLCfun3+Cpls2Ncq0PflIJ5DGzWXDHMSBpoht8YFI4VKrO3BWrLCODE/Aaub22hLjkZM7MGpVKKQ==
X-Received: from peanut.svl.corp.google.com
 ([2620:15c:2c5:1:db71:d573:45a1:86c9])
 (user=awill job=sendgmr) by 2002:a25:ab83:: with SMTP id
 v3mr8868507ybi.400.1619587722204; 
 Tue, 27 Apr 2021 22:28:42 -0700 (PDT)
Date: Tue, 27 Apr 2021 22:27:25 -0700
Message-Id: <20210428052725.530939-1-awill@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [PATCH 1/3] mtd: spi-nor: Export SFDP access to sysfs
From: Alexander Williams <awill@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexander Williams <awill@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_222845_296669_968D87E1 
X-CRM114-Status: GOOD (  23.21  )
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

Add the ability to specify a technology-specific attribute_group, and
expose the SFDP through spi-nor's private group. This enables user space
to have full access to the contents of the SFDP, so all information is
available without regard for whether the kernel supports parsing it.

Signed-off-by: Alexander Williams <awill@google.com>
---
 drivers/mtd/mtdcore.c      | 17 ++++++++++++++++-
 drivers/mtd/spi-nor/core.c | 39 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h |  2 ++
 drivers/mtd/spi-nor/sfdp.c | 10 ++++++++--
 drivers/mtd/spi-nor/sfdp.h |  2 ++
 include/linux/mtd/mtd.h    |  1 +
 6 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 9aaeadd53eb4..65dc956e7d47 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -667,10 +667,20 @@ int add_mtd_device(struct mtd_info *mtd)
 	dev_set_name(&mtd->dev, "mtd%d", i);
 	dev_set_drvdata(&mtd->dev, mtd);
 	of_node_get(mtd_get_of_node(mtd));
-	error = device_register(&mtd->dev);
+	device_initialize(&mtd->dev);
+	dev_set_uevent_suppress(&mtd->dev, 1);
+	error = device_add(&mtd->dev);
 	if (error)
 		goto fail_added;
 
+	if (master->priv_attr_group) {
+		error = devm_device_add_group(&mtd->dev, master->priv_attr_group);
+		WARN_ON(error);
+		error = 0;
+	}
+	dev_set_uevent_suppress(&mtd->dev, 0);
+	kobject_uevent(&mtd->dev.kobj, KOBJ_ADD);
+
 	/* Add the nvmem provider */
 	error = mtd_nvmem_add(mtd);
 	if (error)
@@ -719,6 +729,7 @@ int del_mtd_device(struct mtd_info *mtd)
 {
 	int ret;
 	struct mtd_notifier *not;
+	struct mtd_info *master = mtd_get_master(mtd);
 
 	mutex_lock(&mtd_table_mutex);
 
@@ -743,6 +754,10 @@ int del_mtd_device(struct mtd_info *mtd)
 		if (mtd->nvmem)
 			nvmem_unregister(mtd->nvmem);
 
+		if (master->priv_attr_group) {
+			devm_device_remove_group(&mtd->dev,
+						 master->priv_attr_group);
+		}
 		device_unregister(&mtd->dev);
 
 		idr_remove(&mtd_idr, mtd->index);
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bd2c7717eb10..1eec1ce44882 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3058,6 +3058,44 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 	return info;
 }
 
+static ssize_t sfdp_read(struct file *file, struct kobject *kobj,
+			 struct bin_attribute *attr, char *buf, loff_t offset,
+			 size_t len)
+{
+	int ret;
+	struct spi_nor *nor;
+	struct device *dev = kobj_to_dev(kobj);
+	struct mtd_info *mtd = container_of(dev, struct mtd_info, dev);
+
+	mtd = mtd_get_master(mtd);
+	nor = mtd_to_spi_nor(mtd);
+
+	if (nor->params->sfdp_size == 0)
+		return 0;
+
+	if (nor->info->flags & SPI_NOR_SKIP_SFDP)
+		return -EOPNOTSUPP;
+
+	len = min_t(size_t, len, nor->params->sfdp_size - offset);
+	ret = spi_nor_read_sfdp_dma_unsafe(nor, offset, len, buf);
+
+	if (ret)
+		return ret;
+	return len;
+}
+
+static BIN_ATTR_RO(sfdp, 0);
+
+static struct bin_attribute *spi_nor_bin_attrs[] = {
+	&bin_attr_sfdp,
+	NULL,
+};
+
+static struct attribute_group spi_nor_group = {
+	.name		= "spi-nor",
+	.bin_attrs	= spi_nor_bin_attrs,
+};
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -3122,6 +3160,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
 	mtd->priv = nor;
+	mtd->priv_attr_group = &spi_nor_group;
 	mtd->type = MTD_NORFLASH;
 	mtd->writesize = nor->params->writesize;
 	mtd->flags = MTD_CAP_NORFLASH;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 28a2e0be97a3..18e27725fafb 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -240,6 +240,7 @@ struct spi_nor_otp {
  * @rdsr_dummy:		dummy cycles needed for Read Status Register command.
  * @rdsr_addr_nbytes:	dummy address bytes needed for Read Status Register
  *			command.
+ * @sfdp_size		discovered size of the SFDP.
  * @hwcaps:		describes the read and page program hardware
  *			capabilities.
  * @reads:		read capabilities ordered by priority: the higher index
@@ -268,6 +269,7 @@ struct spi_nor_flash_parameter {
 	u32				page_size;
 	u8				rdsr_dummy;
 	u8				rdsr_addr_nbytes;
+	u32				sfdp_size;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 23c28e91f698..221c7dc1aee1 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -210,8 +210,8 @@ static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
  * Return: -ENOMEM if kmalloc() fails, the return code of spi_nor_read_sfdp()
  *          otherwise.
  */
-static int spi_nor_read_sfdp_dma_unsafe(struct spi_nor *nor, u32 addr,
-					size_t len, void *buf)
+int spi_nor_read_sfdp_dma_unsafe(struct spi_nor *nor, u32 addr, size_t len,
+				 void *buf)
 {
 	void *dma_safe_buf;
 	int ret;
@@ -1247,6 +1247,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	struct device *dev = nor->dev;
 	size_t psize;
 	int i, err;
+	u32 param_limit;
 
 	/* Get the SFDP header. */
 	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &header);
@@ -1266,6 +1267,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	if (SFDP_PARAM_HEADER_ID(bfpt_header) != SFDP_BFPT_ID ||
 	    bfpt_header->major != SFDP_JESD216_MAJOR)
 		return -EINVAL;
+	nor->params->sfdp_size = sizeof(header);
 
 	/*
 	 * Allocate memory then read all parameter headers with a single
@@ -1299,6 +1301,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	 */
 	for (i = 0; i < header.nph; i++) {
 		param_header = &param_headers[i];
+		param_limit = SFDP_PARAM_HEADER_PTP(param_header)
+				+ param_header->length * 4;
+		nor->params->sfdp_size = max(param_limit,
+					     nor->params->sfdp_size);
 
 		if (SFDP_PARAM_HEADER_ID(param_header) == SFDP_BFPT_ID &&
 		    param_header->major == SFDP_JESD216_MAJOR &&
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index bbf80d2990ab..17548b320397 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -108,5 +108,7 @@ struct sfdp_parameter_header {
 };
 
 int spi_nor_parse_sfdp(struct spi_nor *nor);
+int spi_nor_read_sfdp_dma_unsafe(struct spi_nor *nor, u32 addr, size_t len,
+				 void *buf);
 
 #endif /* __LINUX_MTD_SFDP_H */
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a89955f3cbc8..2ef1f7e2db76 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -374,6 +374,7 @@ struct mtd_info {
 	int subpage_sft;
 
 	void *priv;
+	struct attribute_group *priv_attr_group;
 
 	struct module *owner;
 	struct device dev;
-- 
2.31.1.527.g47e6f16901-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
