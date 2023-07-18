Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDC9EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 08:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uJUcNaYg1/bUHBmfIRxLERuciXdjlXjRThG79vAv/QY=; b=lY5ENMxppVlgGC
	eFnD96HMby0qgnrv23TeR3cQN6/9sGtdyMuRfvOYPTPBI6ekQs8g7+aKDq/qSAm79cYA/wqK4Jiq2
	pJl1PQDhwAhZR7GH26IQYBm7GRUz28ulCVjpQMyjGAX7o6+nBO3O75AjlYueYc7Zh5numu3Ai0Z8H
	tEBsZQdydLvhTHdJGzsmRWhzV0vfId20RXy0bSMjJnmVvXP0l3Wym8S+9Rct36HnFpWhbzlxNyFvb
	M52/a/VuqCiEgUmF1e5339YIjElLDns+TpBVH1r149m8G8jMhbkb8fOmbS6a+8JDSDYLzlDaLsJQe
	WDICG1PG/uz2ENXahyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2TL-006K7M-35;
	Wed, 19 Jul 2023 08:23:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2TK-006K6o-2o
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KMzinQMKyKIwtRw7NQG9E41OoGTOq4vi6G8oOZH5iIM=; b=a+AZ+iaowX2JlMgt8v9jZrCRUJ
	zB5rWJbmbCIf59cnqjoqcdrsFHMD0i0Wm4GJkqLiqHEKCSBmFtsfcvUfpGQfzxxPBgaUcUK1nuoIw
	YFDYHm0zRjYf6npLaEwVBmxJmo6MWz2aoeNHeHwQZ62v6MBQrU2E5zkP2XFlUnTNHmfhoOm809NPH
	aDrq9jB0zwU0k3ZLcsEkG0tc/dxYXDlYTKZkll/BvrRO7ikHeOnceoRgiDWNwyLUWDgQm3OloespY
	NQmlmyxS+HYPn8zM/eMlGqRhDFBDA64e3egnoBQ8JldmINZgG4HvfglU9F43Qz72tVSsrTlH9NRjb
	9abLcywA==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgTg-00BK27-1j
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 08:54:42 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R4t4y1wXVzVjHh;
	Tue, 18 Jul 2023 16:52:50 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 16:54:11 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH V2 0/5] ubi: Enhanced fault injection capability for the UBI driver
Date: Tue, 18 Jul 2023 16:51:14 +0800
Message-ID: <20230718085119.3885747-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_095441_113203_2A010CE7 
X-CRM114-Status: UNSURE (   9.39  )
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

This series of patches enhance the existing fault injection interface
and retain the old debugfs interface, and add some fault injection types
to help testers and developers Look for potential problems in the code.

ZhaoLong Wang (5):
  ubi: Use the fault injection framework to enhance the fault injection
    capability
  ubi: Split io_failures into write_failure and erase_failure
  ubi: Add six fault injection type for testing
  ubi: Reserve sufficient buffer length for the input mask
  mtd: Add several functions to the fail_function list

 drivers/mtd/mtdcore.c   |   6 +-
 drivers/mtd/ubi/Kconfig |   9 ++
 drivers/mtd/ubi/debug.c | 107 ++++++++++++++--
 drivers/mtd/ubi/debug.h | 264 ++++++++++++++++++++++++++++++++++++----
 drivers/mtd/ubi/io.c    |  85 ++++++++++++-
 drivers/mtd/ubi/ubi.h   |  46 +++----
 6 files changed, 458 insertions(+), 59 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
