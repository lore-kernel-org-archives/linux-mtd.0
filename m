Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51243ECAAD2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 22:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wW41SUdrtpl2GHsnUgYvVSAt1UyfgPPI04n+1oo9yoo=; b=4rKaEabmW6Fx2b
	DYrhfFsgTY/Flxjj7qpi4M0IEstRsjNwADFvTKxhxt493sBpf5JEY9K0m8kCoxdkSydlyhwjcAD3Z
	Zc2wE1YKdtL0ibPMSwSAVqZZZdoMGzqTzG1EjVQlb5t2oYxuSG9koZB6Y26ChNyrGX+eUcYbsYEmZ
	01ZelIsRxg3bjvaj+goWCnOEmZBaJ0zYdQgv2/DDsL6F4LSo4Dmhh9EKubcdRIIqxNiC3Zy0Yir5h
	JgOUpQ4Bx3LhRMDaWLe/pwxA5TUy4lCnL8CjBt+jx9ms/6sSqd/dmd4pTb6KiOOiWF9H+MYiLelgD
	DmoEg3TK+OfhwHulPdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsk0-00FNoj-T1; Thu, 01 Sep 2022 22:32:53 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsWy-00FEi4-6W; Thu, 01 Sep 2022 22:19:27 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B428E2215;
	Fri,  2 Sep 2022 00:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662070754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N9wQTn8dC8bPriyX4SQQmb5oAnnt3YF+DVu2omjw3q0=;
	b=c0/5bLSF9fHzm+ZVLZ0QjPdba/j5vXimofHWypL1EtuVd62/K6bVwF+Bd5owz+nwBI9E+a
	KyF0GQt+nxmSExwWxbRFCr9wL9UFPNhrJGI4pKJOXwjlo2kFCBN3GgzBxQxpuzhj8wYbXF
	OZ+fCpBgiPLzG58nDeq8saEEO1EjgKfnMmyv4gx/PHx3H8mTpZ31FrXRll2ddtu2SuxAW1
	pRj9porzJqzbIFjHSjQF/1qJ8LSI8UXV6YF4OyZZRdJzeqagtTmdsYRaVudWpSovulOaNo
	Wr6s/bObnSQ8oCyS9cxOIkaUdRGV9Sfd7+kC2v5Dyphd51D1W1ZQLlX4EkZ5KA==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 17/20] nvmem: core: export nvmem device size
Date: Fri,  2 Sep 2022 00:18:54 +0200
Message-Id: <20220901221857.2600340-18-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901221857.2600340-1-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_151924_454088_96A1A880 
X-CRM114-Status: GOOD (  10.78  )
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

Export the size of the nvmem device. NVMEM layout drivers might need it
and might not have access to the device which is registering the NVMEM
device.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v1:
 - none

 drivers/nvmem/core.c           | 13 +++++++++++++
 include/linux/nvmem-consumer.h |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 6910796937f9..81fca32a7418 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -2045,6 +2045,19 @@ const char *nvmem_dev_name(struct nvmem_device *nvmem)
 }
 EXPORT_SYMBOL_GPL(nvmem_dev_name);
 
+/**
+ * nvmem_device_size() - Get the size of a given nvmem device.
+ *
+ * @nvmem: nvmem device.
+ *
+ * Return: size of the nvmem device.
+ */
+size_t nvmem_device_size(struct nvmem_device *nvmem)
+{
+	return nvmem->size;
+}
+EXPORT_SYMBOL_GPL(nvmem_device_size);
+
 static int __init nvmem_init(void)
 {
 	return bus_register(&nvmem_bus_type);
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 1f62f7ba71ca..6607f9a1d6dc 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -77,6 +77,7 @@ ssize_t nvmem_device_cell_read(struct nvmem_device *nvmem,
 			   struct nvmem_cell_info *info, void *buf);
 int nvmem_device_cell_write(struct nvmem_device *nvmem,
 			    struct nvmem_cell_info *info, void *buf);
+size_t nvmem_device_size(struct nvmem_device *nvmem);
 
 const char *nvmem_dev_name(struct nvmem_device *nvmem);
 
@@ -206,6 +207,11 @@ static inline int nvmem_device_write(struct nvmem_device *nvmem,
 	return -EOPNOTSUPP;
 }
 
+static inline size_t nvmem_device_size(struct nvmem_device *nvmem)
+{
+	return 0;
+}
+
 static inline const char *nvmem_dev_name(struct nvmem_device *nvmem)
 {
 	return NULL;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
