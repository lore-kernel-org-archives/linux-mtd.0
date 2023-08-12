Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACD2C41513
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Aug 2023 08:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aiBC2INpKtBq8OTdVFcMalBJ0PhZ/YZFLk0c2N0iqmU=; b=M2VLvq/TVbQwZa
	L6nza6MZ5ACKaSopFofDNmjgVpZH1arjpg2vQiH1GcBSQOMWJZuASe+PLwKnbkV6zPBfSCSnbNBtQ
	l0zTKYEeCK+KaFfRKCgnovzfHlwjuiR4OESPuocj0B9A4/QHuCEJ/D1rTlm0OEF/wkALfORFDyaIG
	J8UbNXjxWpbYUW6EIcRnTTQdfnD3AvhkrtI+C1R7QtIhn+QZn6g8jdZCuXmwK4A/1+JR5fEDqVQ7z
	K1zH/IemD3KOd1yFFGTx1335DA6mula9xc0l05KIO79sYgsNFQ5hY/yMsD+bLY061HtwrpdHLCheY
	8lxajdfGGN2gYip0uJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjbC-00Ctpc-1M;
	Sat, 12 Aug 2023 08:03:50 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjb3-00Ctk4-2M
	for linux-mtd@lists.infradead.org;
	Sat, 12 Aug 2023 08:03:45 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RNClH1SvVz2Bd1Z;
	Sat, 12 Aug 2023 16:00:43 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 12 Aug
 2023 16:03:35 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/12] ubi: fastmap: Fix a series of wear leveling problems
Date: Sat, 12 Aug 2023 15:59:53 +0800
Message-ID: <20230812080005.3162125-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_010341_962123_A6ED1107 
X-CRM114-Status: UNSURE (   7.79  )
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

This series of patches fix three problems:
1. Inconsistent erase counter from wl entry and disk, for patches 1~4.
2. Same PEB is always resued for fastmap data, for patches 5~9.
3. First 64 PEBs have large erase counter than others, for patches 10~12.

Besides, patches 4/5 bring an improvement of the UBI service life.

Regression tests are in https://bugzilla.kernel.org/show_bug.cgi?id=217787.


Zhihao Cheng (12):
  ubi: fastmap: Fix missed ec updating after erasing old fastmap data
    block
  ubi: fastmap: erase_block: Get erase counter from wl_entry rather than
    flash
  ubi: fastmap: Allocate memory with GFP_NOFS in ubi_update_fastmap
  ubi: Replace erase_block() with sync_erase()
  ubi: fastmap: Use free pebs reserved for bad block handling
  ubi: fastmap: Wait until there are enough free PEBs before filling
    pools
  ubi: fastmap: Remove unneeded break condition while filling pools
  ubi: fastmap: may_reserve_for_fm: Don't reserve PEB if fm_anchor
    exists
  ubi: fastmap: Get wl PEB even ec beyonds the 'max' if free PEBs are
    run out
  ubi: fastmap: Fix lapsed wear leveling for first 64 PEBs
  ubi: fastmap: Add module parameter to control reserving filling pool
    PEBs
  ubi: fastmap: Add control in 'UBI_IOCATT' ioctl to reserve PEBs for
    filling pools

 drivers/mtd/ubi/build.c      |  25 +++++++-
 drivers/mtd/ubi/cdev.c       |   3 +-
 drivers/mtd/ubi/eba.c        |   3 -
 drivers/mtd/ubi/fastmap-wl.c | 113 ++++++++++++++++++++++++++++-------
 drivers/mtd/ubi/fastmap.c    |  66 +++-----------------
 drivers/mtd/ubi/ubi.h        |  10 +++-
 drivers/mtd/ubi/wl.c         |  34 ++++++-----
 drivers/mtd/ubi/wl.h         |   6 +-
 include/uapi/mtd/ubi-user.h  |   4 +-
 9 files changed, 156 insertions(+), 108 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
