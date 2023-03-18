Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB214C6FD1D
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Mar 2023 01:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2gQvQzFADsA2MjCg2fa81yH9AQj0ihAQ48lh8bNsxv8=; b=VIiSkfhd3GNCbv
	plkUzvPD6W9jfqfBAj3ftnvqzoBuS1TKvqSx4Ole1nMXubgKpqGj6I8ZVuOGVh62/cTqwqyx5Ekzq
	ziWGdzjApW5E53o8Lh1o+qMbQXVzFkaemGcsMOacOdWxpO+c1v7aWOdu99rNh2fsy67rYwj0+opXF
	shq5rfG5S3e1z1U2CEAbGMddniyYon5/rU0GTkkn96s+oZ4QXspzAvW8zpVUryJWETGCRlTt//YYj
	/7fr+xGpFuPpGKGoTQNDlO81PRCgRi9ln8xt22IR9tYTcQvz+PVPuIS0ocmBKA+hdi56glaQjn8SD
	bBU2KCEFMTl17B4j/0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdLp3-003th3-2p;
	Sat, 18 Mar 2023 01:57:29 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdLoz-003tdV-0E
	for linux-mtd@lists.infradead.org;
	Sat, 18 Mar 2023 01:57:28 +0000
Received: from dggpemm100009.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Pdkb741ZMzHwhh;
	Sat, 18 Mar 2023 09:54:59 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Sat, 18 Mar
 2023 09:57:12 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 0/5] ubi: Enhanced fault injection capability for the UBI driver
Date: Sat, 18 Mar 2023 09:56:16 +0800
Message-ID: <20230318015621.1408243-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_185725_297525_5D3A48DF 
X-CRM114-Status: UNSURE (   8.98  )
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

The existing fault injection capability of UBI is too simple.
It uses hard-coded fault probability values and lacks other
configurable options. As a result, these interfaces are difficult
to use when digging defects in the abnormal path of code and
reproducing some problems.

The kernel provides a powerful fault injection framework, which
provides rich configurable fault injection attributes during runtime.
So it can be used to improve the fault injection capability of the 
UBI driver.

This series of patches refactor the existing fault injection interface
and add some fault injection types to help testers and developers
find potential problems in the code.

ZhaoLong Wang (5):
  ubi: Using the Fault Injection Framework to refactor the debugfs
    interface
  ubi: Split io_failures into write_failure and erase_failure
  ubi: Add six fault injection type for testing
  ubi: Reserve sufficient buffer length for the input mask
  mtd: Add several functions to the fail_function list

 drivers/mtd/mtdcore.c   |   6 +-
 drivers/mtd/ubi/Kconfig |   8 ++
 drivers/mtd/ubi/debug.c | 185 +++++++++++++++++++-------------------
 drivers/mtd/ubi/debug.h | 190 ++++++++++++++++++++++++++++++++++++----
 drivers/mtd/ubi/io.c    | 101 ++++++++++++++++++---
 drivers/mtd/ubi/ubi.h   |  68 +++++---------
 6 files changed, 390 insertions(+), 168 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
