Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6647DC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 14:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnap/i+/DaB4QGWvL0UZ2OxYIBY3XQsL7fjaJ6F4yGc=; b=zXt58kS237UbZq
	/tJzSv+cyQz8lvki/iPNkNfNtNeYFH7sGg6gu04IMSTzRaugqJUcmoCUTDrI2gr8jP198SANHOnRl
	HcmaW02QiK8oFaYxoGcOj3y6hzENKlSScEmWwrS6QGiF4966/QezEFxk2UEw2Vh04Ne5Efs+FIy0w
	8iVFrmwH+wLDFUosKzTBoB+KRsHOf0AtWyWxGm0lZYLWL41tgV3r4NvwY4JXCLaEmZg7AczR8rCaI
	8Gv9Gjp4FkSSktW6AJOp4yhRaeL97Ce2CDAsVgLtjsaUa09Jqp5BkKSMCzfu00ICo48wa1cyJuHQq
	xWiiJy2H2Ip4aiP1vW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKi6D-00B8AB-MI; Thu, 17 Feb 2022 14:49:37 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKi5i-00B7yv-Qg
 for linux-mtd@lists.infradead.org; Thu, 17 Feb 2022 14:49:09 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21HAK9gJ028528;
 Thu, 17 Feb 2022 15:49:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=kYD9rw2kRCOk8Aef1j/TpzyzE4pAyUy0OYixSyHot+g=;
 b=k8dbUHzheAW3Y+P/qGOB8DJUBGxWWXDjx7Ccfk+YgThWQ/1yj97TtpzXrNrmRN9GU+XB
 Zg9X5ko+f/QQfY53SOnASPBy/l0S2sMqzOef0HP11k8y4AyhmP0AITD4SIZikD5DDrSJ
 IKkOssrl9qfLQMM0xt3oSUzrPmBTLrtlKQ7lhSgXE+iSzodAC2h/uQoFpkEtDuEvAo7r
 o31QfqHaaGJwiSqD3gZIFmLTrxlQkjzvJY6+CjbcDAZLaMgHzhoudj7RLrTDU43svTm8
 YHoMJC00okPY7HOK+wcFRJm0tGz8t/W6kC7aUB+qr1/I5LST/w5N+GMYR6F4wHscvXHs 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e9gkeb4nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 15:49:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9CD4D10002A;
 Thu, 17 Feb 2022 15:48:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93A022278A1;
 Thu, 17 Feb 2022 15:48:59 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 17 Feb 2022 15:48:59
 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <srinivas.kandagatla@linaro.org>, <p.yadav@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <chenshumin86@sina.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 <stable@vger.kernel.org>
Subject: [PATCH v3 3/4] nvmem: core: Fix a conflict between MTD and NVMEM on
 wp-gpios property
Date: Thu, 17 Feb 2022 15:47:54 +0100
Message-ID: <20220217144755.270679-4-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217144755.270679-1-christophe.kerello@foss.st.com>
References: <20220217144755.270679-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_05,2022-02-17_01,2021-12-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_064907_176842_610020BB 
X-CRM114-Status: GOOD (  24.09  )
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

Wp-gpios property can be used on NVMEM nodes and the same property can
be also used on MTD NAND nodes. In case of the wp-gpios property is
defined at NAND level node, the GPIO management is done at NAND driver
level. Write protect is disabled when the driver is probed or resumed
and is enabled when the driver is released or suspended.

When no partitions are defined in the NAND DT node, then the NAND DT node
will be passed to NVMEM framework. If wp-gpios property is defined in
this node, the GPIO resource is taken twice and the NAND controller
driver fails to probe.

It would be possible to set config->wp_gpio at MTD level before calling
nvmem_register function but NVMEM framework will toggle this GPIO on
each write when this GPIO should only be controlled at NAND level driver
to ensure that the Write Protect has not been enabled.

A way to fix this conflict is to add a new boolean flag in nvmem_config
named ignore_wp. In case ignore_wp is set, the GPIO resource will
be managed by the provider.

Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: stable@vger.kernel.org
---
Changes in v3:
 - add a fixes tag.
 - rename skip_wp_gpio by ignore_wp in nvmen_config.

Changes in v2:
 - rework the proposal done to fix a conflict between MTD and NVMEM on
   wp-gpios property.

 drivers/nvmem/core.c           | 2 +-
 include/linux/nvmem-provider.h | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 23a38dcf0fc4..9fd1602b539d 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -771,7 +771,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	if (config->wp_gpio)
 		nvmem->wp_gpio = config->wp_gpio;
-	else
+	else if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(nvmem->wp_gpio)) {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 98efb7b5660d..c9a3ac9efeaa 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -70,7 +70,8 @@ struct nvmem_keepout {
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.
  * @priv:	User context passed to read/write callbacks.
- * @wp-gpio:   Write protect pin
+ * @wp-gpio:	Write protect pin
+ * @ignore_wp:  Write Protect pin is managed by the provider.
  *
  * Note: A default "nvmem<id>" name will be assigned to the device if
  * no name is specified in its configuration. In such case "<id>" is
@@ -92,6 +93,7 @@ struct nvmem_config {
 	enum nvmem_type		type;
 	bool			read_only;
 	bool			root_only;
+	bool			ignore_wp;
 	struct device_node	*of_node;
 	bool			no_of_node;
 	nvmem_reg_read_t	reg_read;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
