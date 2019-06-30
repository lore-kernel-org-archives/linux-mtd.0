Return-Path: <SRS0=n829=U5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF6EC5B57E
	for <linux-mtd@archiver.kernel.org>; Sun, 30 Jun 2019 16:08:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18254206E0
	for <linux-mtd@archiver.kernel.org>; Sun, 30 Jun 2019 16:08:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FZdMhiN/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WWhjAcJe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18254206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IBpFvmRXYNwkTWbiQGwtGJFF6Kw4pRXw2wazfqO6bvo=; b=FZdMhiN/tzRw9w
	9M/V9vDO7B3rBbfDgpVSYioA26l1UAYv9x0O4TGyc5ThuMI5rQvvNIPK5aCl30n05V9jEK+oKfOFv
	0beZeFvgGvwjMuSYBpAtV3OPRujqGcR5wdBnLtRNILs8f/fHNP5JgX0MFNnwkRkfTjZnpoqpvObtK
	7EfFM6OBKz6ghsw8EDbpvBJKrl09+cgNGYeeWip8SBlLUQkmgbZcV2PPio9ypU2sQL3a3euw9Eoh9
	ZXmHN4e0V+D394tKF+1HQ4IIbRX6VKyNSiNpYifxAFf+jsopXqYJKf8mkymEJsLRPzdOIfcvULXhl
	El/tJ+viVOX/5O4AzHeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhcMj-0001P5-7r; Sun, 30 Jun 2019 16:07:45 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhcMM-0001Ab-09
 for linux-mtd@lists.infradead.org; Sun, 30 Jun 2019 16:07:23 +0000
Received: by mail-pf1-x444.google.com with SMTP id p184so5310545pfp.7
 for <linux-mtd@lists.infradead.org>; Sun, 30 Jun 2019 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GvtWRTZzYJCoh3kBu10Gbyh1vhhZa3AxKvxk95ea2Z8=;
 b=WWhjAcJe2exCcDC6/A/ofBRAAQS03XsOA5dhtT7s9O4EH/XJBmY6aNPWOAF6TsL9Mw
 EeuMoDI9EB2e9dJKivXd6FLAGpoWjVI6vYlBut0aIZkmpAZMT4hwvBMQ+43DplODPFf2
 cOzeN+PB5fUaEhoEf9uvmHKQbwZ/WLxAEBMNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GvtWRTZzYJCoh3kBu10Gbyh1vhhZa3AxKvxk95ea2Z8=;
 b=XVcwfiXbRlhK6jDojNMXi17k9qLSKU7pSxnn0zFIxFk6ojPwRdpGExbplLWr66XUur
 pZKMd3kp8qYeN/mVlEe25g5QfTsyolK3uvs0jQNdNEs+DBYtAx4XMFHTVN8Fzt4Dx/0d
 EgukVM4touOxP/vzysMVk3NaQDQRhIg0s5bzxfNGsII0a03FfbH/btFMwSOZTbTOrIjp
 M0Hy1Rrb2SzZcRgjtceGv5pEoNWYgOwvLAQzbyBHDTOmK0rpzekaIu28L0FQ7po7ey/U
 P0lVN8HX4XwfI540DuAJoQlHOyrZrCI4kHPKk41VM+48rGfS3RIsIxaoCOd12bJAFviv
 htiA==
X-Gm-Message-State: APjAAAVrZs9vXNQyZqgR5IEtK69Ghrk7TgUR07axVRW3I3LnD695n1DZ
 mlDgs3BW/qiX7GMQQ3i5oKZvSuNxfso=
X-Google-Smtp-Source: APXvYqw+0/5GONQTfUqDDIBJixcHnbmFyMF3q7QDqs/k+Ulw88JmZdNHIPX/45b9dsay2tC5UUKqMw==
X-Received: by 2002:a17:90a:db52:: with SMTP id
 u18mr25860508pjx.107.1561910841020; 
 Sun, 30 Jun 2019 09:07:21 -0700 (PDT)
Received: from zhuohao-z440.tpe.corp.google.com
 ([2401:fa00:1:10:e25c:13cd:9607:cc7f])
 by smtp.gmail.com with ESMTPSA id y10sm8990409pfm.66.2019.06.30.09.07.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 09:07:20 -0700 (PDT)
From: Zhuohao Lee <zhuohao@chromium.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v8 2/2] mtd: spi-nor: enable the debugfs for the partname and
 partid
Date: Mon,  1 Jul 2019 00:07:11 +0800
Message-Id: <20190630160711.178679-2-zhuohao@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190630160711.178679-1-zhuohao@chromium.org>
References: <20190630160711.178679-1-zhuohao@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190630_090722_119540_D91D6A53 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: drinkcat@chromium.org, zhuohao@chromium.org, bbrezillon@kernel.org,
 richard@nod.at, briannorris@chromium.org, marek.vasut@gmail.com,
 boris.brezillon@collabora.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch adds spi_nor_debugfs_init() for the debugfs initialization.
With this patch, we can read the partname and partid through the
debugfs.

The output of new debugfs nodes on my device are:
cat /sys/kernel/debug/mtd/mtd0/partid
spi-nor:ef6017
cat /sys/kernel/debug/mtd/mtd0/partname
w25q64dw

Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd1aaa5..52b1a2da9ac0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -3935,6 +3935,17 @@ static void spi_nor_resume(struct mtd_info *mtd)
 		dev_err(dev, "resume() failed\n");
 }
 
+static void spi_nor_debugfs_init(struct spi_nor *nor,
+		const struct flash_info *info)
+{
+	struct mtd_info *mtd = &nor->mtd;
+
+	mtd->dbg.partname = info->name;
+	mtd->dbg.partid = devm_kasprintf(nor->dev, GFP_KERNEL,
+					"spi-nor:%*phN",
+					 info->id_len, info->id);
+}
+
 void spi_nor_restore(struct spi_nor *nor)
 {
 	/* restore the addressing mode */
@@ -4036,6 +4047,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->_read = spi_nor_read;
 	mtd->_resume = spi_nor_resume;
 
+	spi_nor_debugfs_init(nor, info);
+
 	/* NOR protection support for STmicro/Micron chips and similar */
 	if (JEDEC_MFR(info) == SNOR_MFR_ST ||
 	    JEDEC_MFR(info) == SNOR_MFR_MICRON ||
-- 
2.22.0.410.gd8fdbe21b5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
