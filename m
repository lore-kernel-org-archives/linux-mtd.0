Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55203ECAAA2
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 21:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTiEBykw7VPY9iwItgn7bpuyanhkvy/DgXl3tNaXFOw=; b=GhjTYJQJCAczep
	SDr2YCmJWpFFzfprJc329VnH7mIPwbi7Xh9fD1qqZXduy7dOSADZFVvOakVq1sSIsZM2/ch8uV6zy
	OvoEzOfFhDLT0/iJtSaER5onsVjTLllxxbFvz70zYFURqorOLcEDDQksLKbCQkNOH2viA2NVh3ax0
	EYJBHqG27BTPuBFnPB7I91JAOk/SRTbEEaVI8lNd+Ga0Bz+8KUeXFAwRLFXfJQxa31bJJzKzT/aiN
	tkMfk9/U3tQNI10O4mv9wxxHHZe3r8s9z0wWYPGtqS4KWZiwjMPH+0zOksgxXGXqCzOXfcH3frb8B
	e69VkR5+UMWaeNBHwycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKns-003ckf-Iq; Thu, 25 Aug 2022 21:54:20 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKea-003XVL-SL; Thu, 25 Aug 2022 21:44:48 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5AD7398F8;
	Thu, 25 Aug 2022 23:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1661463881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZ0MB2oqU++FCqLOXHr3+VjUWFBZ0liXMlmqroQmEUU=;
	b=uyKoL9zfJgM6YR5kpaLWJ9M/6XYY+6B1YfX/EgNk0VuTy1k+ps1CY+IJv5zklWHYhG16nj
	47TW5CYs/4ntqSnpePVEKP9A7WGN38riPevWIWzwtLXqS+elvWN6lfQ46GLppOOdHf/GO7
	1a18I8IEQmgtXuZ4vFO8uGdIHX8WQ1wE7b2yrBR7a14xv9SoyweOAv0DSjjerLYZCqU4c0
	pIjgeb1ZkP6PVQwko6Y80CHBMlXyuz6gNIN3lGFU5DJn9YlnMWN9TFPeFmj4T8R+g7wBvd
	sLThdknz2cPx4RVc6fYylF/v/Ma2275hx/aCWfaCaxPHM1TYqGdwJRbRiN5vKg==
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
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v1 11/14] nvmem: core: export nvmem device size
Date: Thu, 25 Aug 2022 23:44:20 +0200
Message-Id: <20220825214423.903672-12-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220825214423.903672-1-michael@walle.cc>
References: <20220825214423.903672-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_144445_165447_16F9DC4A 
X-CRM114-Status: GOOD (  10.16  )
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
 drivers/nvmem/core.c           | 13 +++++++++++++
 include/linux/nvmem-consumer.h |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index cbfbe6264e6c..f46ae358fe88 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -2031,6 +2031,19 @@ const char *nvmem_dev_name(struct nvmem_device *nvmem)
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
index 761b8ef78adc..6b2a80a5fdd5 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -90,6 +90,7 @@ ssize_t nvmem_device_cell_read(struct nvmem_device *nvmem,
 			   struct nvmem_cell_info *info, void *buf);
 int nvmem_device_cell_write(struct nvmem_device *nvmem,
 			    struct nvmem_cell_info *info, void *buf);
+size_t nvmem_device_size(struct nvmem_device *nvmem);
 
 const char *nvmem_dev_name(struct nvmem_device *nvmem);
 
@@ -219,6 +220,11 @@ static inline int nvmem_device_write(struct nvmem_device *nvmem,
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
