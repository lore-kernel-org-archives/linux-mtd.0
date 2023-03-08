Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C94C6FD1E
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n72LTgmbsiqWoN7uA5/xOIBreFCpUDmoRkO95qZTDOw=; b=GOfHyzVlsRTNgw
	zbbsHMXSJKoDS0p6pVbjGwzsB9lvmxSCL6UDRO4AdoePqDsZnMRNl/DUBslcdEbvn5FFS5r1+T6e8
	r6fY2UsTxGllVL1T6wmuVf1T4scMNmNMsg6SrYDdZcPOIEEQkFuTG0b2kCgOrKCpo09c89uOWqNDq
	3RehG7A7hwSDFxm9FBlmimSD7O8NVA3liyg9mVw1UdXNNNI3ol0laVGnX7qDC/eH07PvLJ9OYJfDX
	k/cqfA5TmoJtRfRsqvyUMIHNzTjJbp5h87vs7iK5GrortiY7FuGLNKOGdSVoiBYdHJkhwK0KUkNC9
	fU8zxGPg1k5/0DYzlW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZp2M-003wAc-Ny; Wed, 08 Mar 2023 08:20:38 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZp2I-003w9N-PV
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2023 08:20:36 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9B5CA1682;
	Wed,  8 Mar 2023 09:20:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678263631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAMTuERNi5qJ5J2h23oJyeBeqJlcNnQwXiDuZ+qFEoo=;
	b=PKL5PtYz/bMjz4cxIcC8vIUdQ4+Jm10yyo3BPNlL6qIwlzqBZWnL7WnS/uPoNMvNZMUS+J
	rBEDvg8HzmWRea8GK1Mex6fjBqAFse89WwuT+U1MuBBFmdKjnXXft1ldkzyoAAeg81ac5s
	crYfufJ4eca0J5ltVqMIZJA+aBYd+eEH86LhOd4eVZDsLWvKfSKhLtE7Osnry4V77ANvoF
	2GajLhZZEtY/6YHAR9IkQyKyNs7nxaVyT1uflo5GtJPEybtU5D23NhchnwJ1UTDdIcngKq
	Cp/WNzTiax8PWJH+n8UIYGbl3Ni775RvqA8XMAFEBTvNWM7ewkZ/1Vqbvtg36A==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <michael@walle.cc>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] mtd: core: fix nvmem error reporting
Date: Wed,  8 Mar 2023 09:20:19 +0100
Message-Id: <20230308082021.870459-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308082021.870459-1-michael@walle.cc>
References: <20230308082021.870459-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_002035_039533_664AD565 
X-CRM114-Status: GOOD (  13.67  )
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

The master MTD will only have an associated device if
CONFIG_MTD_PARTITIONED_MASTER is set, thus we cannot use dev_err() on
mtd->dev. Instead use the parent device which is the physical flash
memory.

Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Walle <michael@walle.cc>
---
v2:
 - none

 drivers/mtd/mtdcore.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8fc66cda4a09..c38a13cb8d5e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -939,6 +939,7 @@ static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
 
 static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 {
+	struct device *dev = mtd->dev.parent;
 	struct nvmem_device *nvmem;
 	ssize_t size;
 	int err;
@@ -952,7 +953,7 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 			nvmem = mtd_otp_nvmem_register(mtd, "user-otp", size,
 						       mtd_nvmem_user_otp_reg_read);
 			if (IS_ERR(nvmem)) {
-				dev_err(&mtd->dev, "Failed to register OTP NVMEM device\n");
+				dev_err(dev, "Failed to register OTP NVMEM device\n");
 				return PTR_ERR(nvmem);
 			}
 			mtd->otp_user_nvmem = nvmem;
@@ -970,7 +971,7 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 			nvmem = mtd_otp_nvmem_register(mtd, "factory-otp", size,
 						       mtd_nvmem_fact_otp_reg_read);
 			if (IS_ERR(nvmem)) {
-				dev_err(&mtd->dev, "Failed to register OTP NVMEM device\n");
+				dev_err(dev, "Failed to register OTP NVMEM device\n");
 				err = PTR_ERR(nvmem);
 				goto err;
 			}
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
