Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B3AC52D7C
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2024 03:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aoVxc97hffAZCD71nuSUi1WJS8dqW2wW9BOwJwelwgs=; b=t3yhAPo2T9h8Pv
	xTgzGVwEtb1g0UXK4o1LIr6RMuEWLbgYX3rcLiqguRtYRHTWan8H1CN08V0QLevY3a+/ToykANSff
	jc6gtin0vZO+o1c7uNltigSLoLkBTdgzkj6FIlR1T5jCbyGIe3sxTWnRQG3chpCS0iGZLLcdV8R7r
	GeLghWtqmwZsrQCU5v31hvQG9ekyfWV82fJ8y2sCDuuk5u8o1oLKs+xW3BwrlXr38TGjfAxkldQ3l
	6e2q7bgqVWmErPMLXPMwgImDBo+Z4HD843FhId9FUFsexjivqsVSjfzn7KNeIR5ivMKH0SRkmEZB7
	cMkttKcKGZSnNH45Y2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sft6u-00000000DMT-1XU7;
	Mon, 19 Aug 2024 03:31:12 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sft6q-00000000DIc-1rgZ
	for linux-mtd@lists.infradead.org;
	Mon, 19 Aug 2024 03:31:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WnJ566TmYz13TWc;
	Mon, 19 Aug 2024 11:30:18 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id CDD00180064;
	Mon, 19 Aug 2024 11:30:54 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 19 Aug
 2024 11:30:54 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] ubi: Two small bugfixs for wear-leveling
Date: Mon, 19 Aug 2024 11:26:20 +0800
Message-ID: <20240819032622.2241165-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_203108_780172_C5842BC4 
X-CRM114-Status: UNSURE (   6.05  )
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

The mtd-utils/ubi-tests and ubifs-xfstests are passed.
The life time of the flash is slightly improved:
Config:
x86_64 qemu
flash: nandsim(1024 PEBs, pool=50, wl_pool=25, without pool reservation)
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_WL_THRESHOLD=50
CONFIG_MTD_UBI_FASTMAP=y
running fsstress for 1h:

Before applying patches (PEB erase counters Histogram):
=========================================================
from              to     count      min      avg      max
---------------------------------------------------------
0        ..        9:        0        0        0        0
10       ..       99:        0        0        0        0
100      ..      999:     1024      646      684      988
1000     ..     9999:        0        0        0        0
10000    ..    99999:        0        0        0        0
100000   ..      inf:        0        0        0        0
---------------------------------------------------------
Total               :     1024      646      684      988

After applying patches (PEB erase counters Histogram):
=========================================================
from              to     count      min      avg      max
---------------------------------------------------------
0        ..        9:        0        0        0        0
10       ..       99:        0        0        0        0
100      ..      999:     1024      629      666      960
1000     ..     9999:        0        0        0        0
10000    ..    99999:        0        0        0        0
100000   ..      inf:        0        0        0        0
---------------------------------------------------------
Total               :     1024      629      666      960 (0~64)

Zhihao Cheng (2):
  ubi: wl: Put source PEB into correct list if trying locking LEB failed
  ubi: fastmap: wl: Schedule fm_work if wear-leveling pool is empty

 drivers/mtd/ubi/fastmap-wl.c | 19 ++++++++++++++++---
 drivers/mtd/ubi/wl.c         | 11 +++++++++--
 drivers/mtd/ubi/wl.h         |  3 ++-
 3 files changed, 27 insertions(+), 6 deletions(-)

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
