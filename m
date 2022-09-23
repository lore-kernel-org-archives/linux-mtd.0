Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83161C6FA82
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Sep 2022 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HHApFUlSFKcrP6Wk3HnqywJQh80AroNTOJ8MVYfNR14=; b=vfzij3q7Bm6Sra
	3nsE5tO7T0kiMzjuX+fQesfuDWE1Zm86HcJODXDGjgogEvjZYggNVsdE3ZVzlZ9ybRXwDnsP142Hv
	E/Bg8tQzKLRS084XMDreUs0LqdFhrIqRl4nMuQONRG7k3wULtCrfT89pRzlr4uKR3yrrszcgxppjF
	r9x5183/BJGdWMa6Esu7EmdftwXWYVriPQ4T8EoaMxLCGypvSMEME2V64zbyOQLxeUQLv0vNkWA6n
	hCg/yFMyetw+/9NcJYRi0OJaiYJ+rjJvzIbrwMITtzibq/o3gKIA2GsVjVaLeGQepjPTh1nwPNW+e
	sVPHSi4WQphhrWkAQ/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeHq-0031uB-Sv; Fri, 23 Sep 2022 08:43:54 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obeHn-0031ss-Vy
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2022 08:43:53 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MYlvH3sKqz1P6sP;
	Fri, 23 Sep 2022 16:39:39 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 16:43:48 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <tudor.ambarus@microchip.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<boris.brezillon@collabora.com>
CC: <linux-mtd@lists.infradead.org>, <liwei391@huawei.com>,
	<zengheng4@huawei.com>
Subject: [PATCH v2 -next] mtd: spi-nor: fix artificial warning when CONFIG_MTD_CFI_Ix disable
Date: Fri, 23 Sep 2022 16:50:41 +0800
Message-ID: <20220923085041.1035139-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_014352_214293_E6899A90 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
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

When CONFIG_SPI_INTEL is selected without
CONFIG_MTD_CFI_I[1,2,4,8] enabled, it would raise
compile warning as below:

In file included from ./include/linux/mtd/spi-nor.h:10,
                 from drivers/spi/spi-intel.c:13:
./include/linux/mtd/cfi.h:62:2:
error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]
   62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
      |  ^~~~~~~

"mtd/cfi.h" is introduced into "mtd/spi-nor.h" by
commit db4745edb282 ("mtd: spi-nor: add SPI NOR manufacturer IDs"),
which was already removed out since from the commit
d3c4bb31bf62 ("mtd: spi-nor: Drop the MFR definitions").

After above, mtd/cfi.h is not more needed by mtd/spi-nor.h,
so detach the dependence.

Fixes: d3c4bb31bf62 ("mtd: spi-nor: Drop the MFR definitions")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 include/linux/mtd/spi-nor.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 42218a1164f6..f92bf7f7a754 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -7,7 +7,6 @@
 #define __LINUX_MTD_SPI_NOR_H
 
 #include <linux/bitops.h>
-#include <linux/mtd/cfi.h>
 #include <linux/mtd/mtd.h>
 #include <linux/spi/spi-mem.h>
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
