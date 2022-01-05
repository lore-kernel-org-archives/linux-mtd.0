Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3EEC433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 13:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qblzmhn1vnzaE8ICtqasA2Y+JJDqFd3qxwKUX+MbwsE=; b=W+CkWmiYsRXSkl
	dEseuVuYah1owwqWx0lY8vl3UiMkbEY/QgZklV0+cxfKCRhQqSCuxB67Yhh6+LEA2cUIr3FbuW3ip
	rSIqorXycYZJGW5c91SwxaNv7hDTKN+gY0UnQxcj80ksAkAPVsf5qtqyKm3fPWQSu++vYxBFQinhD
	cg5Djgu08NeGLkUW2gzzg9lJkW/GGLwujBh98e3myBsBXfvF6CSjmGSjWZ7O2yDIfOOYfTPd3/qP4
	fDcBmvNiRgeJ9F+9GdglHX/q2B6y5vnfotnRxpwi/ziegYnBZrdEtfuV1jEXFP13LXdgcoemPvyIp
	LnqzosdHFVt/IwzRpjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n56op-00Eunu-Dm; Wed, 05 Jan 2022 13:59:11 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n56oL-00EuhG-00
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 13:58:42 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205DZlXo029770;
 Wed, 5 Jan 2022 14:58:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=b2QtnpBRp8GE7sHRapXD2hk9YOIR7UgiHUfPszc4l5g=;
 b=TNgRx0obmM99wWVIIMiAt3ibXzjWkNF/ajUqhY81tN8RxT/BrgZszac4WnqXfPn612vn
 UNL5Z61bitNi9+NNwqNolBW74A1CNEzg/2fmIGn0WBNcItINfSIKZwivI3znL4VPBIRK
 oLEXDvMBuU+OK7z3ag/kgCqA4VOTEImUWmVCztpZw2SWAUWs5UGL17KtcFjkUam89/2w
 4da36dSJ2tOK+dWSLAdRe3dfbqlr0KPw3YLExeeIxKYC5anXItnImEFM9Xd3gsa0zFHb
 XPNRMR5f1Pd0w6nLeV94isl8JKux0iV2YZ0jToq7iOk22QuVwoGj6vEx4P0f6f4yxrH0 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dd7k91mcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 14:58:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 519A8100034;
 Wed,  5 Jan 2022 14:58:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4918524D5F4;
 Wed,  5 Jan 2022 14:58:35 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 5 Jan 2022 14:58:34
 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <srinivas.kandagatla@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <chenshumin86@sina.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [PATCH 3/3] nvmem: core: Fix a conflict between MTD and NVMEM on
 wp-gpios property
Date: Wed, 5 Jan 2022 14:57:34 +0100
Message-ID: <20220105135734.271313-4-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105135734.271313-1-christophe.kerello@foss.st.com>
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_03,2022-01-04_01,2021-12-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_055841_441803_CE7D7F1D 
X-CRM114-Status: GOOD (  22.82  )
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

Wp-gpios property can be used on NVMEN nodes and the same property can
be also used on MTD NAND nodes. In case of the wp-gpios property is
defined at NAND level node, the GPIO management is done at NAND driver
level. Write protect is disabled when the driver is probed or resumed
and is enabled when the driver is released or suspended.

When no partitions are defined in the NAND DT node, then the NAND DT node
will be passed to NVMEM framework. If wp-gpios property is defined in
this node, the GPIO resource is taken twice and the NAND controller
driver fails to probe.

It would be possible to set config->wp_gpio at MTD level before calling
nvmem_register function but NVMEM framework will toggled this GPIO on
each write when this GPIO should only be controlled at NAND level driver
to ensure that the Write Protect has not been enabled.

As MTD framework is only using NVMEN framework in read only, a way to fix
this conflict is to get the GPIO resource at NVMEM level only if reg_write
API is defined. This GPIO is only toggled if reg_write ops is defined.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 drivers/nvmem/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index e765d3d0542e..e11c74db64f9 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -769,7 +769,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	if (config->wp_gpio)
 		nvmem->wp_gpio = config->wp_gpio;
-	else
+	else if (config->reg_write)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(nvmem->wp_gpio)) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
