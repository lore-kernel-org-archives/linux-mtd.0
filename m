Return-Path: <SRS0=6YPz=VT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B11FC76195
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:01:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E852021955
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:01:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mK/y+X0W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym0q0ag5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E852021955
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMqfNier+VPOeTGJnPIULfu3TUe8grbrQrorqkzbq1I=; b=mK/y+X0WBwDGyy
	reP5lljUDB2rzxhtuPXOrC44B9AFhK3AiooZ1Duu1lj0Uv1kr5AGRT9Gkoc8PFCWwbQYRR09220RB
	t+hCARayLYoVc27lMZoH6+7fiTnmhRXewsDubKGPWt8aEKQkgLTUDmGdLeVLcHYGdIFzRZ6eNdFT7
	U/Lh4jfwQNBVhM6HeS7JCVp6kQRomdp8T+zSPYZicXjZ17MZgHPIqTxI01DtPPo5fchStZRCVGVtD
	x6wtwhc2bCXfRrkAeDItcVbjS3qXvXxL/pzOw4ztrDIoqn/4Ks5HCTp3LyQeZ6DqOPxLK4RiTKcBw
	sWkkC+cSmvGu03M7BQ+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpRNy-00026b-0A; Mon, 22 Jul 2019 06:01:22 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpRJs-00069a-JQ
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2019 05:57:11 +0000
Received: by mail-ed1-x542.google.com with SMTP id v15so39502389eds.9
 for <linux-mtd@lists.infradead.org>; Sun, 21 Jul 2019 22:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=iMlH/BYqbAh4REkdZXe54Nv2D1l55hhhpJHFooXoPH0=;
 b=Ym0q0ag5yqQqLX/IsCxjkPoRHUyTN5NoYbQvyfK8War1pID/3YChEiEjhavjfOk3UU
 2ykmSz5cS7SUuhYcviJls6J1SwWLuAQozyFl1lXn7Awk2IYQmToDgSOhw8qghRymhnJ+
 yC8j4IXCGIeWw1c4wIrc8J2n8KlcuXue6fVtgFwgRGuS10SkWQTNQGdwmNHviffDqn4b
 c7n92Eb+7LSQDkmb8h4XS5doko3q2Jt4Dw34cE2cboG+vI1SvVRDYCOcumcawJbCjcrJ
 77UzTovNf3hqYxkmeGmoVEYrtnx9HFdeywFbU08/Th/PXjFIUxz17lQGZlciBrB9eZxp
 yIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=iMlH/BYqbAh4REkdZXe54Nv2D1l55hhhpJHFooXoPH0=;
 b=oKtLF3oRNiwuVnk3YgM1CVTvf1UIVx9LVFZ1+VmgTsDcrdkT9F1guxQGHEfik5aTeB
 fFbXImA1vKmxWCCFdwJfk8OxzzoT5qVONwoKYmx3WyX4nAFxur8eCNLWaWDBZ1IAB8Ya
 TUlZM+kUrC9NjK2Xgt5yegIRYmzIMLQUutTlw5MxocpGqq5w0yK2E0hgbiAyS0U2GDfE
 A3/604Y0lEww4fsecIq/BCNCPLvQuOtTZO2JyEf3yHWRqe+qKWoBJizzC+mduFXC6Ry9
 g/6CBmJ1TDOw8Zt2/mCcE31x91MU0jlvrsSn+RKOJqfWP5MvIg5ObOoDdfiCDN+Pmyc7
 xBPg==
X-Gm-Message-State: APjAAAW54w7Q3A9V3STRUfGg8o+IstuHUqAxTRaldbI7P6yDEBQN6lQ/
 OEpKL43qkfaWASy6MrjsH0N4jHUc1Qb0Pg==
X-Google-Smtp-Source: APXvYqyMcOm1g8pB9ctwTxhdfq5bvQ4iIn4xrBML8nSEMEUpaszUlrmNnvVIPgwihnggFB/zjxendA==
X-Received: by 2002:a50:9999:: with SMTP id m25mr59306263edb.183.1563775027233; 
 Sun, 21 Jul 2019 22:57:07 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id a6sm10351725eds.19.2019.07.21.22.57.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 22:57:06 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: [PATCH 4/8] mtd: spinand: enabled parameter page support
Date: Mon, 22 Jul 2019 07:56:17 +0200
Message-Id: <20190722055621.23526-5-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722055621.23526-1-sshivamurthy@micron.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190721_225709_794519_44793590 
X-CRM114-Status: GOOD (  19.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Some of the SPI NAND devices has parameter page, which is similar to
ONFI table.

But, it may not be self sufficient to propagate all the required
parameters. Fixup function has been added in struct manufacturer to
accommodate this.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/core.c | 134 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |   3 +
 2 files changed, 137 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 89f6beefb01c..7ae76dab9141 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -400,6 +400,131 @@ static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
 	return spinand_write_reg_op(spinand, REG_BLOCK_LOCK, lock);
 }
 
+/**
+ * spinand_read_param_page_op - Read parameter page operation
+ * @spinand: the spinand
+ * @page: page number where parameter page tables can be found
+ * @buf: buffer used to store the parameter page
+ * @len: length of the buffer
+ *
+ * Read parameter page
+ *
+ * Returns 0 on success, a negative error code otherwise.
+ */
+static int spinand_parameter_page_read(struct spinand_device *spinand,
+				       u8 page, void *buf, unsigned int len)
+{
+	struct spi_mem_op pread_op = SPINAND_PAGE_READ_OP(page);
+	struct spi_mem_op pread_cache_op =
+				SPINAND_PAGE_READ_FROM_CACHE_OP(false,
+								0,
+								1,
+								buf,
+								len);
+	u8 feature;
+	u8 status;
+	int ret;
+
+	if (len && !buf)
+		return -EINVAL;
+
+	ret = spinand_read_reg_op(spinand, REG_CFG,
+				  &feature);
+	if (ret)
+		return ret;
+
+	/* CFG_OTP_ENABLE is used to enable parameter page access */
+	feature |= CFG_OTP_ENABLE;
+
+	spinand_write_reg_op(spinand, REG_CFG, feature);
+
+	ret = spi_mem_exec_op(spinand->spimem, &pread_op);
+	if (ret)
+		return ret;
+
+	ret = spinand_wait(spinand, &status);
+	if (ret < 0)
+		return ret;
+
+	ret = spi_mem_exec_op(spinand->spimem, &pread_cache_op);
+	if (ret)
+		return ret;
+
+	ret = spinand_read_reg_op(spinand, REG_CFG,
+				  &feature);
+	if (ret)
+		return ret;
+
+	feature &= ~CFG_OTP_ENABLE;
+
+	spinand_write_reg_op(spinand, REG_CFG, feature);
+
+	return 0;
+}
+
+static int spinand_param_page_detect(struct spinand_device *spinand)
+{
+	struct mtd_info *mtd = spinand_to_mtd(spinand);
+	struct nand_memory_organization *memorg;
+	struct nand_onfi_params *p;
+	struct nand_device *base = spinand_to_nand(spinand);
+	int i, ret;
+
+	memorg = nanddev_get_memorg(base);
+
+	/* Allocate buffer to hold parameter page */
+	p = kzalloc((sizeof(*p) * 3), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	ret = spinand_parameter_page_read(spinand, 0x01, p, sizeof(*p) * 3);
+	if (ret) {
+		ret = 0;
+		goto free_param_page;
+	}
+
+	for (i = 0; i < 3; i++) {
+		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)&p[i], 254) ==
+				le16_to_cpu(p->crc)) {
+			if (i)
+				memcpy(p, &p[i], sizeof(*p));
+			break;
+		}
+	}
+
+	if (i == 3) {
+		const void *srcbufs[3] = {p, p + 1, p + 2};
+
+		pr_warn("Could not find a valid ONFI parameter page, trying bit-wise majority to recover it\n");
+		nand_bit_wise_majority(srcbufs, ARRAY_SIZE(srcbufs), p,
+				       sizeof(*p));
+
+		if (onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 254) !=
+				le16_to_cpu(p->crc)) {
+			pr_err("ONFI parameter recovery failed, aborting\n");
+			goto free_param_page;
+		}
+	}
+
+	parse_onfi_params(memorg, p);
+
+	mtd->writesize = memorg->pagesize;
+	mtd->erasesize = memorg->pages_per_eraseblock * memorg->pagesize;
+	mtd->oobsize = memorg->oobsize;
+
+	/* Manufacturers may interpret the parameter page differently */
+	if (spinand->manufacturer->ops->fixup_param_page)
+		spinand->manufacturer->ops->fixup_param_page(spinand, p);
+
+	/* Identification done, free the full parameter page and exit */
+	ret = 1;
+
+free_param_page:
+	kfree(p);
+
+	return ret;
+}
+
 static int spinand_check_ecc_status(struct spinand_device *spinand, u8 status)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
@@ -911,6 +1036,15 @@ static int spinand_detect(struct spinand_device *spinand)
 		return ret;
 	}
 
+	if (!spinand->base.memorg.pagesize) {
+		ret = spinand_param_page_detect(spinand);
+		if (ret <= 0) {
+			dev_err(dev, "no parameter page for %*phN\n",
+				SPINAND_MAX_ID_LEN, spinand->id.data);
+			return -ENODEV;
+		}
+	}
+
 	if (nand->memorg.ntargets > 1 && !spinand->select_target) {
 		dev_err(dev,
 			"SPI NANDs with more than one die must implement ->select_target()\n");
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 4ea558bd3c46..fea820a20bc9 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -15,6 +15,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
+#include <linux/mtd/onfi.h>
 
 /**
  * Standard SPI NAND flash operations
@@ -209,6 +210,8 @@ struct spinand_manufacturer_ops {
 	int (*detect)(struct spinand_device *spinand);
 	int (*init)(struct spinand_device *spinand);
 	void (*cleanup)(struct spinand_device *spinand);
+	void (*fixup_param_page)(struct spinand_device *spinand,
+				 struct nand_onfi_params *p);
 };
 
 /**
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
