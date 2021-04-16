Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE4DC43461
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:54:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911E161184
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911E161184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QU0F9xOodUDMr+On6u/Ln9uJx4IPxRlW1K7tGBf5NkI=; b=Z+UpTQIh7LFV+AnXNhwuHdnT9
	8OwQw3fHzyl0ems61cymhF/nQ/sXUwtpvAwdsfBX8NMU9XwGLwHcgzjHn5hWvmpx32oRt+roe/VGM
	yRodt9WvHZC/ShRMUE59y5Cj/LVAUK9Jq1FoQ57JfHOT4lJ5ONYLC9uquh3Hw41zFzkhTIqdzRD4k
	9yB2CGNhh0fLSvr3gZCIaoeSA9n1FsTgfBKCw4lmDGgKBqfWwbh80DP4FJNTJYW12NYcYMHB+kVnf
	y9Z2DEwrCLGsCL5utbkE2yKf5mIINrM0mvR2dX4zhxyqGsiG3hO6BoBtBx/A9dxlFg1kgMohGna3G
	5OWDPWQtg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXN2G-001zOG-8m; Fri, 16 Apr 2021 11:53:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyn-001yf1-JW
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 11:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=fy2TknQelkaWAwih3c9RX3wpYmd2fHGk991OFZfGCJM=; b=32ek/OfeRkIC+hzwsYGYMV3gJt
 aPV59W/YaehSKdsmiBljEmdNOMS6Pjtm5ZNhYn94N35TSBWdS2sVxShCeiMog3CuyuJ1CSen0k9jd
 bAzL384XeDaT3Jt1oPN42VB/vxicKzEJTo8S5nUHJeLbY/B9wBnKqIOtDUsAQAEUbyuosg3GaIu8N
 flHhtA77hmMonLYBlDR2EmwbCP/VYLzSN75NiOiJSjEH5vh3wl2fLc9RSBJ0yttn85WL8FK5f6HbZ
 qM1ee+ty5xTItQeNKI4gbmaCq1lcbUWtZ67dE4eh3UwAwNIlXutYUS4iQ+DN02YwNWTu/LviX3s+N
 A9aMVkTQ==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyk-009KhA-Hg
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 11:49:44 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 82CA22225B;
 Fri, 16 Apr 2021 13:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618573777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fy2TknQelkaWAwih3c9RX3wpYmd2fHGk991OFZfGCJM=;
 b=oXp2i9LZdX2yzA+AUKE7tvvA1Y1K16AoWOPdzbBpYp8Os1DqaGzfYuIgE36ROugCU5nNOr
 xKF+Eyqbq/Zgs8hqJ+SImSaBaqAXSeUlAmRMO0Wks1HsbdjXrz9imK2lHuQ6/MrumVVIOu
 mmWA3HNCRLqMfby8TQ6r2CMaHDjdLX8=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 5/5] mtd: core: add OTP nvmem provider support
Date: Fri, 16 Apr 2021 13:49:28 +0200
Message-Id: <20210416114928.27758-6-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416114928.27758-1-michael@walle.cc>
References: <20210416114928.27758-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_044942_912996_2E61165C 
X-CRM114-Status: GOOD (  20.84  )
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

Flash OTP regions can already be read via user space. Some boards have
their serial number or MAC addresses stored in the OTP regions. Add
support for them being a (read-only) nvmem provider.

The API to read the OTP data is already in place. It distinguishes
between factory and user OTP, thus there are up to two different
providers.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Changes since RFC:
 - none

 drivers/mtd/mtdcore.c   | 149 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |   2 +
 2 files changed, 151 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 0bc6871c3863..92201e3d187a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -777,6 +777,147 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	mutex_init(&mtd->master.chrdev_lock);
 }
 
+static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
+{
+	struct otp_info *info = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	ssize_t size = 0;
+	unsigned int i;
+	size_t retlen;
+	int ret;
+
+	if (is_user)
+		ret = mtd_get_user_prot_info(mtd, PAGE_SIZE, &retlen, info);
+	else
+		ret = mtd_get_fact_prot_info(mtd, PAGE_SIZE, &retlen, info);
+	if (ret)
+		goto err;
+
+	for (i = 0; i < retlen / sizeof(*info); i++) {
+		size += info->length;
+		info++;
+	}
+
+	kfree(info);
+	return size;
+
+err:
+	kfree(info);
+	return ret;
+}
+
+static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
+						   const char *name, int size,
+						   nvmem_reg_read_t reg_read,
+						   const char *compatible)
+{
+	struct nvmem_device *nvmem = NULL;
+	struct nvmem_config config = {};
+	struct device_node *np;
+
+	/* DT binding is optional */
+	np = of_get_compatible_child(mtd->dev.of_node, compatible);
+
+	/* OTP nvmem will be registered on the physical device */
+	config.dev = mtd->dev.parent;
+	config.name = name;
+	config.id = NVMEM_DEVID_NONE;
+	config.owner = THIS_MODULE;
+	config.type = NVMEM_TYPE_OTP;
+	config.root_only = true;
+	config.reg_read = reg_read;
+	config.size = size;
+	config.of_node = np;
+	config.priv = mtd;
+
+	nvmem = nvmem_register(&config);
+	/* Just ignore if there is no NVMEM support in the kernel */
+	if (IS_ERR(nvmem) && PTR_ERR(nvmem) == -EOPNOTSUPP)
+		nvmem = NULL;
+
+	of_node_put(np);
+
+	return nvmem;
+}
+
+static int mtd_nvmem_user_otp_reg_read(void *priv, unsigned int offset,
+				       void *val, size_t bytes)
+{
+	struct mtd_info *mtd = priv;
+	size_t retlen;
+	int ret;
+
+	ret = mtd_read_user_prot_reg(mtd, offset, bytes, &retlen, val);
+	if (ret)
+		return ret;
+
+	return retlen == bytes ? 0 : -EIO;
+}
+
+static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
+				       void *val, size_t bytes)
+{
+	struct mtd_info *mtd = priv;
+	size_t retlen;
+	int ret;
+
+	ret = mtd_read_fact_prot_reg(mtd, offset, bytes, &retlen, val);
+	if (ret)
+		return ret;
+
+	return retlen == bytes ? 0 : -EIO;
+}
+
+static int mtd_otp_nvmem_add(struct mtd_info *mtd)
+{
+	struct nvmem_device *nvmem;
+	ssize_t size;
+	int err;
+
+	if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
+		size = mtd_otp_size(mtd, true);
+		if (size < 0)
+			return size;
+
+		if (size > 0) {
+			nvmem = mtd_otp_nvmem_register(mtd, "user-otp", size,
+						       mtd_nvmem_user_otp_reg_read,
+						       "mtd-user-otp");
+			if (IS_ERR(nvmem)) {
+				dev_err(&mtd->dev, "Failed to register OTP NVMEM device\n");
+				return PTR_ERR(nvmem);
+			}
+			mtd->otp_user_nvmem = nvmem;
+		}
+	}
+
+	if (mtd->_get_fact_prot_info && mtd->_read_fact_prot_reg) {
+		size = mtd_otp_size(mtd, false);
+		if (size < 0) {
+			err = size;
+			goto err;
+		}
+
+		if (size > 0) {
+			nvmem = mtd_otp_nvmem_register(mtd, "factory-otp", size,
+						       mtd_nvmem_fact_otp_reg_read,
+						       "mtd-factory-otp");
+			if (IS_ERR(nvmem)) {
+				dev_err(&mtd->dev, "Failed to register OTP NVMEM device\n");
+				err = PTR_ERR(nvmem);
+				goto err;
+			}
+			mtd->otp_factory_nvmem = nvmem;
+		}
+	}
+
+	return 0;
+
+err:
+	if (mtd->otp_user_nvmem)
+		nvmem_unregister(mtd->otp_user_nvmem);
+	return err;
+}
+
 /**
  * mtd_device_parse_register - parse partitions and register an MTD device.
  *
@@ -852,6 +993,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		register_reboot_notifier(&mtd->reboot_notifier);
 	}
 
+	ret = mtd_otp_nvmem_add(mtd);
+
 out:
 	if (ret && device_is_registered(&mtd->dev))
 		del_mtd_device(mtd);
@@ -873,6 +1016,12 @@ int mtd_device_unregister(struct mtd_info *master)
 	if (master->_reboot)
 		unregister_reboot_notifier(&master->reboot_notifier);
 
+	if (master->otp_user_nvmem)
+		nvmem_unregister(master->otp_user_nvmem);
+
+	if (master->otp_factory_nvmem)
+		nvmem_unregister(master->otp_factory_nvmem);
+
 	err = del_mtd_partitions(master);
 	if (err)
 		return err;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 4aac200ca8b5..71e751d18c22 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -379,6 +379,8 @@ struct mtd_info {
 	int usecount;
 	struct mtd_debug_info dbg;
 	struct nvmem_device *nvmem;
+	struct nvmem_device *otp_user_nvmem;
+	struct nvmem_device *otp_factory_nvmem;
 
 	/*
 	 * Parent device from the MTD partition point of view.
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
