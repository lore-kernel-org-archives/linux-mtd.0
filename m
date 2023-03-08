Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FF7C678D5
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q67aqAKG260sSKh+ZYHUacN74sXk3jez+JyxCmdtH+g=; b=TDumHS6Sq4jD1L
	LnpjmtSLtSQkIgyv6/KhNLw+VofwO6JfMkKsKeBgccPVMUbdRaYtNjbR76vPs1R/VxbYqq1z1ba0j
	ReEJzonqYk1KYJ0waqKiLL941GpZrc5aQsQoylYNMXMQ+Jfqrc6jHXNDafhs2zVKwHVQRXdBEy5Km
	y9ncdyKYPFgv4KDcE7qnMGgC6lFDDZ0zX5B42zFVcbv2OgXf3uaCmk7ttxW9KdeI2oDIBZ34MWBM0
	AExXo8Kbw4UafSNWfsajkM8UC8r8OuReGq0/T3e92auu/xFPRY3EbhhLERMhtPOlaDyF4mXJlw9hp
	PCeE6sjoZcN41E6y3zOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZp2O-003wB9-5Z; Wed, 08 Mar 2023 08:20:40 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZp2I-003w9O-Qp
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2023 08:20:36 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id EC788164F;
	Wed,  8 Mar 2023 09:20:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678263631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yET4dLTaObig7qd5g7VQ441qs/AE4iGVqJGo9VFvELM=;
	b=Yw7ZU0D5aF0J5rT2eBxLrjCuBMRUKxNw2f+XWYKNJolrx44g2bHUFHE8p3PGmKRaiK3NjO
	EhKRVtHDeFCLbpwJ0BLElXf5IF0cet5xBPnWy7122aUZap0x1redtfRJOvsND7Wv70hYMs
	z3u4FPQfw/s9iHjZvkskAPldMNDfByx9nA5lbmlUpZJz+K1MyELdIVxqVhPtCfdrnscyHl
	Vq/j/WslG4eHXZn0QuLaq+t8Uwcks9Uuu80N4RltNqlA/MhnFm4/wtSEgUIxbNicOewKZu
	a3oTbl6c89VhTkeHI70u/KeKpPvxxMaUdL4bhyfhr3Zxmlfm3+ajcskYaf3M4A==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <michael@walle.cc>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] mtd: core: provide unique name for nvmem device, take two
Date: Wed,  8 Mar 2023 09:20:18 +0100
Message-Id: <20230308082021.870459-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_002035_041874_7DCC802A 
X-CRM114-Status: GOOD (  14.14  )
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

Commit c048b60d39e1 ("mtd: core: provide unique name for nvmem device")
tries to give the nvmem device a unique name, but fails badly if the mtd
device doesn't have a "struct device" associated with it, i.e. if
CONFIG_MTD_PARTITIONED_MASTER is not set. This will result in the name
"(null)-user-otp", which is not unique. It seems the best we can do is
to use the compatible name together with a unique identifier added by
the nvmem subsystem by using NVMEM_DEVID_AUTO.

Fixes: c048b60d39e1 ("mtd: core: provide unique name for nvmem device")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Walle <michael@walle.cc>
---
v2:
 - actually use NVMEM_DEVID_AUTO as described in the commit message

 drivers/mtd/mtdcore.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 0feacb9fbdac..8fc66cda4a09 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -888,8 +888,8 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 
 	/* OTP nvmem will be registered on the physical device */
 	config.dev = mtd->dev.parent;
-	config.name = kasprintf(GFP_KERNEL, "%s-%s", dev_name(&mtd->dev), compatible);
-	config.id = NVMEM_DEVID_NONE;
+	config.name = compatible;
+	config.id = NVMEM_DEVID_AUTO;
 	config.owner = THIS_MODULE;
 	config.type = NVMEM_TYPE_OTP;
 	config.root_only = true;
@@ -905,7 +905,6 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 		nvmem = NULL;
 
 	of_node_put(np);
-	kfree(config.name);
 
 	return nvmem;
 }
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
