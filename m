Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A9DC4706F
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Dec 2023 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Py1R9ipG9oHTQ/hOB7oPcVbFSFMY3T8DNPUA9LyxhNc=; b=irEkNAVH6lf6oQ
	y0+j30Xh4z6MRo1R21bdtgkVGlGVEiSdjvtkSn9WGuqNU5GaEogeMbG8mHm4lsXyoNPDAKDO1HGWn
	2rWSvsxDKc7j474l/xT7iRos3gtxd027+p5ohopI9ucusmUx+iyNbtoJniNjUdZhyhY8f/5RQTpAf
	iCf+HU1NLdnV729iVHn+oaSaVjn8kAeSW/OnxKKSFJ+2/OyPvvv3t/EeieHTOyhsWQ7DhVM+sVTbr
	kDTTh9B1PD4VoWOIs73LCJ5a9pltFflSts4f/+f52hVoBoQ/IDYsKw23lFybQYiL0v08t7FiwD+F5
	I7hn5NlFsrmtmvHWHOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHf9d-00AK9P-0w;
	Mon, 25 Dec 2023 07:13:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHf9X-00AK4i-2F
	for linux-mtd@lists.infradead.org;
	Mon, 25 Dec 2023 07:13:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Sz8H354KVzvSYb;
	Mon, 25 Dec 2023 15:12:15 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id 5F0541402E0;
	Mon, 25 Dec 2023 15:13:15 +0800 (CST)
Received: from huawei.com (10.175.104.67) by dggpemd200001.china.huawei.com
 (7.185.36.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1258.28; Mon, 25 Dec
 2023 15:13:14 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [PATCH v5 0/5] ubi: Enhanced fault injection capability for the UBI driver
Date: Mon, 25 Dec 2023 15:10:50 +0800
Message-ID: <20231225071055.1721000-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_231331_914719_035AA713 
X-CRM114-Status: GOOD (  13.44  )
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

V2:
 - Retain the old fault injection interface.

v3:
 1. Corrects the initialization of the error mask, which should start at 1.
 2. Change the read format of the mask value to readable hexadecimal.
 3. The interface definition style is consistent when the new interface is added.
 4. Redundant CONFIG_MTD_UBI_FAULT_INJECTION macro are removed.
 5. Correct the fault injection hook position error: ubi_io_read_data -> ubi_io_write_data.
 6. UBI_IO_BITFLIPS is returned in ubi_io_read() in advance to prevent the 
    return value from being overwritten.
 7. In the last commit, example of the use of fail_function is given.

v4:
 - Delete redundant space characters.

v5:
 - Delete the redundant semicolon of the first patch.

ZhaoLong Wang (5):
  ubi: Use the fault injection framework to enhance the fault injection
    capability
  ubi: Split io_failures into write_failure and erase_failure
  ubi: Add six fault injection type for testing
  ubi: Reserve sufficient buffer length for the input mask
  mtd: Add several functions to the fail_function list

 drivers/mtd/mtdcore.c   |   5 +
 drivers/mtd/ubi/Kconfig |   9 ++
 drivers/mtd/ubi/debug.c | 107 ++++++++++++--
 drivers/mtd/ubi/debug.h | 304 +++++++++++++++++++++++++++++++++++++---
 drivers/mtd/ubi/io.c    |  86 +++++++++++-
 drivers/mtd/ubi/ubi.h   |  45 +++---
 6 files changed, 497 insertions(+), 59 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
