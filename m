Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B5CC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/3+fZ2mf9qAmSMf3RyVqY3UzOQzqxL0k4IDlMbKHRMA=; b=R6qjQLJFYq8zCF
	SGj0M0rVUnOp6jnyd26YLJK3fCGJxbk4R+HjNVvLoYN063YKMAW7684ex1Vusbuu53kWRVnzx9fze
	RunlQGtlphGjV48JkkZNvw2rV4Q1AzwPrTz7hZHU6rKdkXD3dNvLher7bTSisuIbXz5+x22bLslS1
	lKCV0iugUDOvmvqKjKShELwMgvewSqS0KyhU9Wbc72R3pttvQbei2XxJG9HDnlOLZUssesbes32Hk
	SVAsylc0DXXeWKAZQ37g7E68l+A2YUX2dQUf2d6+XJ0X2YCQb+IIMBD4ih+4o+TdnziAGjKsgku3r
	0u4ZyZqjR42p+OoHpCNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKi5Z-00B7wr-K5; Thu, 17 Feb 2022 14:48:57 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKi5W-00B7vy-8h
 for linux-mtd@lists.infradead.org; Thu, 17 Feb 2022 14:48:56 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21HDWGou030634;
 Thu, 17 Feb 2022 15:48:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=K9MokaFQtygzcbXppLJ7tFspICKX7gd0wQACWAjKNl4=;
 b=dTqmL9bvvhzqzivf+1XK3Pwbg/5YgFSToXeKGNzWkyOebaz4LqykTnMQm86I/ljuiA4g
 Jrg6jm37OrjQKUZjxQUNCFR0Y/9vgGNdtWvMZxryNKCPTi/87atNCb8/thFqCTX2GCm1
 /Dm2UfWVhPVKzjNxaGDdZyzyb3UI+EQw0sAij5LI46irzTKlw4wsnSQmy0VDm4w+5gVQ
 1NIe+pjcsQnepl8C5cvmApr41NIdsHnVyzyYp/vxXfMD4xnBgmrtvuY89ANTmyZCfT/W
 17d9wgkVtEUxmSbHS/yprUirP3q+8U7lB2b8e3mnK8p0yk12fQc5M4jp2/ylTpGsGaGn 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e9k06a45f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 15:48:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5701C10002A;
 Thu, 17 Feb 2022 15:48:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E2C22278AB;
 Thu, 17 Feb 2022 15:48:45 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 17 Feb 2022 15:48:44
 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <srinivas.kandagatla@linaro.org>, <p.yadav@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <chenshumin86@sina.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [PATCH v3 0/4] mtd: rawnand: stm32_fmc2: Add NAND Write Protect
 support
Date: Thu, 17 Feb 2022 15:47:51 +0100
Message-ID: <20220217144755.270679-1-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_05,2022-02-17_01,2021-12-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_064854_797304_093AE1A5 
X-CRM114-Status: GOOD (  13.19  )
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

This patchset adds the management of the WP# signal in FMC2 driver.
WP will be disabled in probe/resume callbacks and will be enabled
in remove/suspend callbacks.

This patchset also fixes a conflict on wp-gpios property between
MTD and NVMEM.

Changes in v3:
 - add a fixes tag in patches 3 and 4.
 - rename skip_wp_gpio by ignore_wp in nvmen_config.

Changes in v2:
 - add Rob Acked-by for the bindings part.
 - rework the proposal done to fix a conflict between MTD and NVMEM on
   wp-gpios property.

Christophe Kerello (4):
  dt-binding: mtd: nand: Document the wp-gpios property
  mtd: rawnand: stm32_fmc2: Add NAND Write Protect support
  nvmem: core: Fix a conflict between MTD and NVMEM on wp-gpios property
  mtd: core: Fix a conflict between MTD and NVMEM on wp-gpios property

 .../bindings/mtd/nand-controller.yaml         |  7 ++++
 drivers/mtd/mtdcore.c                         |  2 +
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        | 40 ++++++++++++++++++-
 drivers/nvmem/core.c                          |  2 +-
 include/linux/nvmem-provider.h                |  4 +-
 5 files changed, 52 insertions(+), 3 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
