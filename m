Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084DDEB64DC
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 10:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z6kBccaIrHotbNMEqNaVDB21cPHmH09UpLWTlw/PSVU=; b=fyVyuQfGZj25fu
	JHRIDrWDopAY1ibZ8v68Rr645tQtEfRoCPys6H6uLj0/b0iG1QlCL2muVO0Gl3cyEGEIvjWyV3ngx
	oUB7kydNaC8CCi7BH7smmspC5ZoPmdeZvgApcP1nVu6tM/sbD3Rrwqno/PyyirXq/GL0cxS1x2n10
	xJg7d4M4JV8VRX34rAAzZ5hc6y8zRzH3jEs587V1J/tVtjbOF/p5Q/FZwdg61bzx9/OgOYWpBSpww
	wfh8U/lPIXivlWZiIgdCS+CBwulsHJyoI+7nhL/qJkXacFjC9C4wWFoFX/vTZP+/DUPvNJWAN5MF7
	ffddH+49G5F3C3frIjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN9oX-00GMsq-37;
	Sat, 22 Jul 2023 10:26:17 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN9oU-00GMqR-0z
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 10:26:16 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4R7Mvl6WNKzHqXC;
	Sat, 22 Jul 2023 18:23:31 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 22 Jul
 2023 18:26:02 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [RFC 0/1] ubi: An interface for dump the mapping between LEBs and PEBs
Date: Sat, 22 Jul 2023 18:23:01 +0800
Message-ID: <20230722102302.1848135-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_032614_539257_E8CAE767 
X-CRM114-Status: GOOD (  11.09  )
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

When a metadata exception occurs on a device using UBIFS, we can easily
obtain the LEB number of the data exception from the log, but the PEB
number corresponding to the LEB cannot be obtained.

In some production lines, the NAND flash produced by the NAND flash
cannot provide reliable ECC error correction capabilities. The file
system damage is always related to the flash eraseblock exception.
Therefore, I hope that there is a way to quickly obtain the mapping
between LEBs and PEBs in the user space. In this way, the tool of 
user mode can be used to debug possible faulty physical blocks
more conveniently.

Currently, the implementation of this interface is rough. It does
not obtain necessary locks when traversing the entire eba_tbl. Therefore,
this operation race with the volume update process (such as resize and
wear-leveling). As a result, the user mode obtains incorrect mapping
information. However, in practice, when the development and O&M need
to use this interface, frequent volume management operations do not
occur. Therefore, this problem may be tolerated.

I hope the experts will give valuable comments on this patch. If this
interface is acceptable, I'll make it perform as well as I can.

ZhaoLong Wang (1):
  ubi: An interface is added for dump the mapping between LEBs and PEBs

 drivers/mtd/ubi/debug.c | 104 ++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/eba.c   |  24 ----------
 drivers/mtd/ubi/ubi.h   |  24 ++++++++++
 3 files changed, 128 insertions(+), 24 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
